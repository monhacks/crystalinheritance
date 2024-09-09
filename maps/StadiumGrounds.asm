StadiumGrounds_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, StadiumGroundsFloodCallback
	callback MAPCALLBACK_OBJECTS, StadiumGroundsSandraAppears
	callback MAPCALLBACK_OBJECTS, StadiumGroundsAdrinnaDisappears
	
	def_warp_events
	warp_event  5, 41, SERENE_SPRINGS, 3
	warp_event  6, 41, SERENE_SPRINGS, 3
	warp_event  4, 23, STADIUM_UNDERGROUND, 1
	warp_event 26,  5, STADIUM_BOX, 1
	
	def_coord_events
	coord_event 32,  3, 0, StadiumGroundsBobeshScene
	coord_event 33,  8, 1, StadiumGroundsSandraScene
	coord_event 20,  3, 2, StadiumGroundsAdrinnaScene

	def_bg_events
	bg_event  8, 36, BGEVENT_JUMPTEXT, Text_StadiumSign1;
	bg_event 20, 32, BGEVENT_JUMPTEXT, Text_StadiumSign2;


	def_object_events
	object_event 29,  6, SPRITE_BOBESH, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StadiumGroundsBobeshScript, EVENT_BEAT_BOBESH_STADIUM
	object_event 30,  6, SPRITE_SANDRA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StadiumGroundsSandraScript, EVENT_BEAT_BOBESH_STADIUM
	object_event 30, 10, SPRITE_TOXICROAK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, StadiumGroundsToxicroakScript, EVENT_TOXICROAK_STADIUM
	object_event 46, 28, SPRITE_SANDRA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StadiumGroundsSandra2Script, -1	
	object_event 21,  3, SPRITE_ADRINNA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StadiumGroundsAdrinnaScript, EVENT_STADIUM_ADRINNA
	object_event 48, 18, SPRITE_BRIGADER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBrigader8, EVENT_BEAT_BOBESH_STADIUM
	object_event 48,  9, SPRITE_BRIGADER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBrigader9, EVENT_BEAT_BOBESH_STADIUM
	object_event 42,  5, SPRITE_BRIGADER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBrigader10, EVENT_BEAT_BOBESH_STADIUM
	object_event 46,  6, SPRITE_BRIGADER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBrigader11, EVENT_BEAT_BOBESH_STADIUM
	object_event  7,  9, SPRITE_BRIGADER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBrigader12, EVENT_BEAT_BOBESH_STADIUM
;	object_event 22, 30, SPRITE_BRIGADER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 3, StadiumClosedScript, -1
;	object_event 21, 30, SPRITE_BRIGADER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 3, StadiumClosedScript, -1

	object_const_def
	const STADIUMGROUNDS_BOBESH
	const STADIUMGROUNDS_SANDRA
	const STADIUMGROUNDS_TOXICROAK
	const STADIUMGROUNDS_SANDRA_2
	const STADIUMGROUNDS_ADRINNA

StadiumGroundsFloodCallback:
	checkevent EVENT_STADIUM_GROUNDS_FIRST_FLOOD
	iffalse .Done
	changeblock 13,  5, $35
	changeblock 13,  7, $35
	changeblock 12,  6, $35	
	changeblock 14,  6, $35
	changeblock 13,  6, $86
	checkevent EVENT_STADIUM_GROUNDS_SECOND_FLOOD
	iffalse .Done
	changeblock 14,  5, $35
	changeblock 12,  5, $35
	changeblock 11,  6, $35
	changeblock 15,  6, $35
	changeblock 12,  7, $35
	changeblock 14,  7, $35	
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

GenericTrainerBrigader8:
	generictrainer BRIGADER, 8, EVENT_BEAT_ROCKET_GRUNTM_8, Brigader8SeenText, Brigader8BeatenText

	text "This place was a"
	line "haven for bug"
	cont "#mon."
	done

Brigader8SeenText:
	text "We drained a marsh"
	line "to make this. We"
	cont "can take on a"
	cont "pesky kid like"
	cont "you!"
	done

Brigader8BeatenText:
	text "Swamped."
	done

GenericTrainerBrigader9:
	generictrainer BRIGADER, 9, EVENT_BEAT_ROCKET_GRUNTM_9, Brigader9SeenText, Brigader9BeatenText

	text "General Bobesh has"
	line "a plan to change"
	cont "Gauldenrod tradi-"
	cont "tions to favor the"
	cont "emperor."
	done

Brigader9SeenText:
	text "Intruder!"
	done

Brigader9BeatenText:
	text "Your elder is in"
	line "the stadium. I"
	cont "don't think she's"
	cont "going back…"
	done

GenericTrainerBrigader10:
	generictrainer BRIGADER, 10, EVENT_BEAT_ROCKET_GRUNTM_10, Brigader10SeenText, Brigader10BeatenText

	text "We find really"
	line "strong wild"
	cont "#mon to battle"
	cont "trainers at the"
	cont "stadium."
	done

Brigader10SeenText:
	text "Don't mess with"
	line "me, I got mine"
	cont "from the stadium!"
	done

Brigader10BeatenText:
	text "Now I'm seeing"
	line "red."
	done

GenericTrainerBrigader11:
	generictrainer BRIGADER, 11, EVENT_BEAT_ROCKET_GRUNTM_11, Brigader11SeenText, Brigader11BeatenText

	text "The gladiators are"
	line "usually rebels"
	cont "against the"
	cont "emperor. We make"
	cont "sure they're tired,"
	cont "so that they just"
	cont "sound crazy to the"
	cont "crowd in battle."
	done

Brigader11SeenText:
	text "Are you an escapee"
	line "from the stadium?"
	done

Brigader11BeatenText:
	text "No, you don't look"
	line "like it."
	done

GenericTrainerBrigader12:
	generictrainer BRIGADER, 12, EVENT_BEAT_ROCKET_GRUNTM_12, Brigader12SeenText, Brigader12BeatenText

	text "Why do I smell"
	line "sulfur?"
	done

Brigader12SeenText:
	text "I'm the last one!"
	line "You won't get"
	cont "past!"
	done

Brigader12BeatenText:
	text "I've been hearing"
	line "some strange sounds"
	cont "from underground."
	done

Text_StadiumSign1:
	text "National Stadium"
	done
	
Text_StadiumSign2:
	text "EV Training"
	line "Facility:"
	
	para "Coming soon"
	done


