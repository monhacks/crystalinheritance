StadiumGrounds_MapScriptHeader: ; todo make everything happen once you talk to Bobesh - a scene_script rather than various coord_events, and making sandra2 only visible once the scene is over. 
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, StadiumGroundsFloodCallback

	
	def_warp_events
	warp_event  4, 23, STADIUM_UNDERGROUND, 1
	warp_event 26,  5, STADIUM_BOX, 1
	warp_event  8, 39, SERENE_SPRINGS, 3
	warp_event  7, 39, SERENE_SPRINGS, 4
	
	def_coord_events
	coord_event 26,  6, 0, StadiumGroundsBobeshScene

	def_bg_events
	bg_event  6, 34, BGEVENT_JUMPTEXT, Text_StadiumSign1;
	bg_event 20, 32, BGEVENT_JUMPTEXT, Text_StadiumSign2;


	def_object_events
	object_event 31,  9, SPRITE_BOBESH, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StadiumGroundsBobeshScript, EVENT_BEAT_BOBESH_STADIUM
	object_event 32,  10, SPRITE_SANDRA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StadiumGroundsSandraScript, EVENT_BEAT_BOBESH_STADIUM
	pokemon_event  30, 10, TOXICROAK, -1, -1, PAL_NPC_BLUE, ToxicroakChallengeText, EVENT_BEAT_BOBESH_STADIUM
	object_event 46, 28, SPRITE_SANDRA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StadiumGroundsSandra2Script, EVENT_NO_EVENT	
	object_event 48, 18, SPRITE_BRIGADER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBrigader8, EVENT_BEAT_BOBESH_STADIUM
	object_event 48,  9, SPRITE_BRIGADER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBrigader9, EVENT_BEAT_BOBESH_STADIUM
	object_event 42,  5, SPRITE_BRIGADER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBrigader10, EVENT_BEAT_BOBESH_STADIUM
	object_event 34, 37, SPRITE_BRIGADER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBrigader11, EVENT_BEAT_BOBESH_STADIUM
	object_event  7,  9, SPRITE_BRIGADER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBrigader12, EVENT_BEAT_BOBESH_STADIUM
	tmhmball_event 53, 35, TM_FLAME_CHARGE, EVENT_BURNED_TOWER_B1F_TM_FLAME_CHARGE
	itemball_event 14,  8, BLACK_BELT, 1, EVENT_GOT_BLACK_BELT_FROM_WESLEY

	
	object_const_def
	const STADIUMGROUNDS_BOBESH
	const STADIUMGROUNDS_SANDRA
	const STADIUMGROUNDS_TOXICROAK
	const STADIUMGROUNDS_SANDRA_2


StadiumGroundsFloodCallback:
	checkevent EVENT_STADIUM_GROUNDS_FIRST_FLOOD
	iffalse .Done
	changeblock 26, 10, $35
	changeblock 26, 14, $35
	changeblock 24, 12, $35	
	changeblock 28, 12, $35
	changeblock 26, 12, $86
	checkevent EVENT_STADIUM_GROUNDS_SECOND_FLOOD
	iffalse .Done
	changeblock 28, 10, $35
	changeblock 24, 10, $35
	changeblock 22, 12, $35
	changeblock 30, 12, $35
	changeblock 24, 14, $35
	changeblock 28, 14, $35	
.Done:
	endcallback

StadiumGroundsBobeshScene:
	applymovement PLAYER, PlayerWalksDownMovement
	pause 15
	showemote EMOTE_SHOCK, STADIUMGROUNDS_BOBESH, 10
	turnobject STADIUMGROUNDS_BOBESH, RIGHT
	turnobject PLAYER, LEFT
	turnobject STADIUMGROUNDS_SANDRA, UP
	refreshscreen
	trainerpic BOBESH
	waitbutton
	closepokepic
	opentext
	writetext BobeshIntroText
	waitbutton
	closetext
	applymovement PLAYER, PlayerMovesToToxicroak
	opentext
	writetext ToxicroakChallengeText
	waitbutton
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon TOXICROAK, 20
	startbattle
	ifequal $1, .Continue
.Continue:
	setevent EVENT_STADIUM_GROUNDS_FIRST_FLOOD
	disappear STADIUMGROUNDS_TOXICROAK
	reloadmapafterbattle
	applymovement STADIUMGROUNDS_BOBESH, BobeshBlocksStairs
	opentext
	turnobject STADIUMGROUNDS_SANDRA, DOWN
	opentext
	writetext SandraThankYouText
	verbosegivetmhm TM_DAZZLINGLEAM
	waitbutton
	special HealParty
	writetext SandraNegotiateText
	waitbutton
	closetext
	applymovement PLAYER, PlayerWalkToBobeshMovement
	applymovement STADIUMGROUNDS_SANDRA, SandraWalkToBobeshMovement
	opentext
	writetext BobeshBattleText
	waitbutton
	closetext
	winlosstext BobeshWinText, 0
	loadtrainer BOBESH, 1
	startbattle
	ifequal $1, .Continue2
.Continue2:
	setevent EVENT_STADIUM_GROUNDS_SECOND_FLOOD
	reloadmapafterbattle
	opentext
	writetext BobeshDefeatText
	waitbutton
	closetext
	applyonemovement STADIUMGROUNDS_BOBESH, teleport_from
	disappear STADIUMGROUNDS_BOBESH
	turnobject STADIUMGROUNDS_SANDRA, RIGHT
	turnobject PLAYER, LEFT	
	opentext
	writetext SandraInvitesToBoxText
	waitbutton
	closetext	
	setevent EVENT_BEAT_BOBESH_STADIUM
	clearevent EVENT_STADIUM_BOX_ADRINNA ; now she should show up in the box
	setscene $1
	end

StadiumGroundsBobeshScript:
	end ; unable to talk to 

StadiumGroundsSandraScript:
	faceplayer
	opentext
	writetext SandraInvitesToBoxText
	waitbutton
	closetext
	end 

PlayerMovesToToxicroak:
	step_down
	step_down
	step_left
	step_left
	step_left
	turn_head_up
	step_end

BobeshBlocksStairs:
	step_up
	step_right
	step_right
	turn_head_down
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
	text "Bobesh: Eh? Who"
	line "are you, and how"
	cont "did you get past"
	cont "the guards?"
	
	para "No matter."

	para "I am General"
	line "Bobesh, sent by"
	cont "the emperor to"
	cont "bring order to"
	cont "this chaotic town."

	para "In nature, life"
	line "is nasty, brut-"
	cont "ish, and short."
	cont "Only a strong"
	cont "ruler can provide"
	cont "true peace."

	para "This woman - she"
	line "naively believes"
	cont "all #mon have"
	cont "equal value."

	para "But without a"
	line "hierarchy, without"
	cont "stronger #mon"
	cont "to aspire to, we'd"
	cont "remain in a state"
	cont "of anarchy."

	para "You're here to aid"
	line "her misguided"
	cont "cause? Fool."

	para "This Toxicroak,"
	line "from Hisui,"
	cont "will show the"
	cont "futility of her"
	cont "weak ideals."

	para "Her Fairy types"
	line "stand no chance."
	cont "She'll surrender"
	cont "the tower, and"
	cont "order will "
	cont "prevail!"
	done

ToxicroakChallengeText:
	text "Toxicroak:"
	line "Croak!"
	done

SandraThankYouText:
	text "Sandra:"
	line "Thank you for"
	cont "fighting the"
	cont "Toxicroak..."

	para "But I pack a few"
	line "psychic techniques"
	cont "and could have"
	cont "handled myself"
	cont "easily."
	
	para "Still, it was"
	line "dazzling to"
	cont "witness."
	
	para "Oh, and I see"
	line "that my friends"
	cont "have made some"
	cont "renovations to"
	cont "the acquifer be-"
	cont "neath us."
	done

SandraNegotiateText:
	text "Now, let's go"
	line "negotiate with"
	cont "Mr. Bobesh."
	done

BobeshBattleText:
	text "Grr, I thought"
	line "that feral Toxi-"
	cont "croak would rip"
	cont "you both to"
	cont "shreds." 

	para "And whoa- where"
	line "did that water"
	cont "come from?"

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

	para "You haven't seen"
	line "the last of me!"
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
	text "Battle Tower:"
	
	para "Coming soon"
	done

SandraInvitesToBoxText:
	text "<PLAYER>. Excel-"
	line "lent battle"
	cont "against General"
	cont "Bobesh."

	para "I have much admir-"
	line "ation for your"
	cont "bond with your"
	cont "#mon."

	para "Please, meet me in"
	line "the Stadium Box"
	cont "above, and we can"
	cont "discuss your"
	cont "journey."
	done

StadiumGroundsSandra2Script:
	faceplayer
	opentext
	writetext StadiumGroundsSandraAsksToTimeTravel
	yesorno
	iffalse_jumpopenedtext StadiumGroundsNoTimeTravel
	writetext StadiumGroundsTimeTravel
	waitbutton
	closetext
	playsound SFX_WARP_TO
	setevent EVENT_SANDRA_WARPED
	setevent EVENT_WHITNEY_GYM
	special FadeOutPalettes
	waitsfx
	warp ROUTE_36, 22, 4
	end

StadiumGroundsSandraAsksToTimeTravel:
	text "<PLAYER>. You seek"
	line "entrance to the"
	cont "Trader's Landing"
	cont "port to block"
	cont "Steel types, but"
	cont "you cannot find a"
	cont "path there from"
	cont "here."

	para "Would you like to"
	line "summon Celebi to"
	cont "bring you forward"
	cont "to your time?"
	done


StadiumGroundsNoTimeTravel:
	text "I see. Please take"
	line "your time and"
	cont "return if you"
	cont "would like to"
	cont "honor Celebi."
	done

StadiumGroundsTimeTravel:
	text "Celebi, in this"
	line "place of super-"
	cont "iority, help us to"
	cont "be humble and"
	cont "recognize that the"
	cont "highest branch and"
	cont "deepest roots are"
	cont "each important."

	para "We wish that the"
	line "wind will blow the"
	cont "clouds to see more"
	cont "clearly how we"
	cont "depend on each"
	cont "other."
	done

PlayerWalksDownMovement:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_down
	step_down
	step_down
	
	step_end
	
PlayerWalkToBobeshMovement:
	step_right
	step_right
	step_right
	step_up
	step_up	
	step_end
	
SandraWalkToBobeshMovement:
	step_up
	step_end

