StadiumGrounds_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, StadiumGroundsFloodCallback
	callback MAPCALLBACK_OBJECTS, StadiumGroundsSandraAppears
	callback MAPCALLBACK_OBJECTS, StadiumGroundsAdrinnaDisappears
	
	def_warp_events
	warp_event 13, 27, SERENE_SPRINGS, 3
	warp_event 14, 27, SERENE_SPRINGS, 3
	warp_event 13,  2, STADIUM_BOX, 1

	def_coord_events
	coord_event 13, 12, 0, StadiumGroundsBobeshScene
	coord_event 13,  7, 1, StadiumGroundsSandraScene
	coord_event 10, 15, 2, StadiumGroundsAdrinnaScene

	def_bg_events

	def_object_events
	object_event 13, 11, SPRITE_BOBESH, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StadiumGroundsBobeshScript, EVENT_BEAT_BOBESH_STADIUM
	object_event 13,  6, SPRITE_SANDRA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StadiumGroundsSandraScript, EVENT_BEAT_BOBESH_STADIUM
	object_event 13,  9, SPRITE_TOXICROAK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, StadiumGroundsToxicroakScript, EVENT_TOXICROAK_STADIUM
	object_event 20, 30, SPRITE_SANDRA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StadiumGroundsSandra2Script, -1	
	object_event 10, 15, SPRITE_ADRINNA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StadiumGroundsAdrinnaScript, EVENT_STADIUM_ADRINNA
	object_event  8, 20, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBrigaderNAME1, -1
	object_event 18, 16, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBrigaderNAME2, -1
	object_event 10, 12, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBrigaderNAME3, -1
	object_event 16,  8, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBrigaderNAME4, -1
	object_event 12,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBrigaderNAME5, -1


	object_const_def
	const STADIUMGROUNDS_BOBESH
	const STADIUMGROUNDS_SANDRA
	const STADIUMGROUNDS_TOXICROAK
	const STADIUMGROUNDS_SANDRA_2
	const STADIUMGROUNDS_ADRINNA

StadiumGroundsFloodCallback:
	checkevent EVENT_STADIUM_GROUNDS_FIRST_FLOOD
	iffalse .Done
	changeblock 12, 10, $2c
	changeblock 14, 10, $2c
	checkevent EVENT_STADIUM_GROUNDS_SECOND_FLOOD
	iffalse .Done
	changeblock 12, 12, $2c
	changeblock 14, 12, $2c
.Done:
	endcallback

StadiumGroundsSandraAppears:
	checkevent EVENT_STADIUM_BOX_SANDRA
	iffalse .Sandra2Disappears
	appear STADIUMGROUNDS_SANDRA_2
	endcallback

.Sandra2Disappears:
	disappear STADIUMGROUNDS_SANDRA_2
	endcallback

StadiumGroundsAdrinnaDisappears:
	disappear STADIUMGROUNDS_ADRINNA
	endcallback

StadiumGroundsBobeshScene:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	turnobject STADIUMGROUNDS_BOBESH, DOWN
	opentext
	writetext BobeshIntroText
	waitbutton
	closetext
	special Special_FadeInMusic
	applymovement PLAYER, PlayerMovesToToxicroak
	turnobject STADIUMGROUNDS_TOXICROAK, DOWN
	setscene SCENE_STADIUM_GROUNDS_TOXICROAK_BATTLE
	end

StadiumGroundsToxicroakScript:
	faceplayer
	opentext
	writetext ToxicroakChallengeText
	waitbutton
	closetext
	loadwildmon TOXICROAK, 30
	startbattle
	reloadmapafterbattle
	setevent EVENT_STADIUM_GROUNDS_FIRST_FLOOD
	setscene SCENE_STADIUM_GROUNDS_TOXICROAK_DEFEATED
	end

StadiumGroundsSandraScene:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement STADIUMGROUNDS_BOBESH, BobeshBlocksStairs
	turnobject STADIUMGROUNDS_SANDRA, DOWN
	opentext
	writetext SandraThankYouText
	waitbutton
	special HealParty
	writetext SandraNegotiateText
	waitbutton
	closetext
	end

StadiumGroundsBobeshScript:
	faceplayer
	checkevent EVENT_STADIUM_GROUNDS_SECOND_FLOOD
	iftrue .Defeated
	opentext
	writetext BobeshBattleText
	waitbutton
	closetext
	winlosstext BobeshWinText, 0
	loadtrainer GENTLEMAN, BOBESH
	startbattle
	reloadmapafterbattle
	setevent EVENT_STADIUM_GROUNDS_SECOND_FLOOD
	opentext
	writetext BobeshDefeatText
	waitbutton
	closetext
	applymovement STADIUMGROUNDS_BOBESH, BobeshExitMovement
	disappear STADIUMGROUNDS_BOBESH
	applymovement STADIUMGROUNDS_SANDRA, SandraExitMovement
	disappear STADIUMGROUNDS_SANDRA
	setscene SCENE_FINISHED
	end

.Defeated:
	jumptext BobeshAfterText

StadiumGroundsSandraScript:
	end

PlayerMovesToToxicroak:
	step_up
	step_up
	step_end

BobeshBlocksStairs:
	step_right
	step_down
	step_end

BobeshExitMovement:
	step_left
	step_down
	step_down
	step_down
	step_end

SandraExitMovement:
	step_up
	step_up
	step_up
	step_up
	step_end

BobeshIntroText:
BobeshIntroText:
	text "Who let you in?..."

	para "I am General"
	line "Bobesh, sent by"
	cont "the emperor to"
	cont "bring order to"
	cont "this chaotic town."

	para "In nature, life"
	line "is 'nasty, brut-"
	cont "ish, and short.'"
	cont "Only a strong"
	cont "ruler can provide"
	cont "true peace."

	para "This woman, Sandra,"
	line "naively believes"
	cont "all #MON have"
	cont "equal value."

	para "But without a"
	line "hierarchy, without"
	cont "stronger #MON"
	cont "to aspire to, we'd"
	cont "remain in a state"
	cont "of anarchy."

	para "You're here to aid"
	line "her misguided"
	cont "cause? Fool."

	para "This Toxicroak,"
	line "brought from Hisui,"
	cont "will show the"
	cont "futility of her"
	cont "weak ideals."

	para "Her Fairy types"
	line "stand no chance."
	cont "She'll surrender"
	cont "the tower, and"
	cont "order will prevail!"
	done

ToxicroakChallengeText:
	text "Toxicroak: Croak!"
	done

SandraThankYouText:
	text "Thank you for"
	line "fighting the"
	cont "Toxicroak..."

	para "but I pack a few"
	line "psychic techniques"
	cont "and could have"
	cont "handled myself"
	cont "easily."
	done

SandraNegotiateText:
	text "Now, let's go"
	line "negotiate with"
	cont "Mr. Bobesh."
	done

BobeshBattleText:
	text "Hey! Where did"
	line "that water come"
	cont "from?"

	para "I'm not letting"
	line "you escape!"
	done

BobeshWinText:
	text "Impossible!"
	line "How could I lose?"
	done

BobeshDefeatText:
	text "Grr, I wish I"
	line "could battle you"
	cont "again, but my"
	cont "fire types don't"
	cont "like this water…"
	done

BobeshAfterText:
	text "You haven't seen"
	line "the last of me!"
	done

StadiumGroundsAdrinnaScript:
	end
	
StadiumGroundsAdrinnaScene:
	playsound SFX_WARP_TO
	applyonemovement STADIUMGROUNDS_ADRINNA, teleport_to
	appear STADIUMGROUNDS_ADRINNA
	opentext
	writetext AdrinnaDialogueStadium
	closetext
	applyonemovement CINNABARISLAND_BLUE, teleport_from
	disappear STADIUMGROUNDS_ADRINNA
	setevent EVENT_STADIUM_ADRINNA 
	end

AdrinnaDialogueStadium:
	text "<PLAYER>-"
	line "I've been watching"
	cont "you. I'm General"
	cont "Adrinna."

	para "Don't be alarmed,"
	line "I'm not here to"
	cont "fight."

	para "Your victory over"
	line "Bobesh was..."
	cont "extraordinary."

	para "You achieved it"
	line "through your own"
	cont "merit, not relying"
	cont "on those subpar"
	cont "minds cowering"
	cont "below."

	para "I see in you the"
	line "potential for"
	cont "greatness,"
	cont "unburdened by the"
	cont "misguided ideal of"
	cont "self-sacrifice."

	para "Remember, <PLAYER>:"
	line "The world is full"
	cont "of unrealized"
	cont "potential, waiting"
	cont "for those with the"
	cont "will to seize it."

	para "I'll be observing"
	line "your progress with"
	cont "great interest."
	done
