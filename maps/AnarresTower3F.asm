AnarresTower3F_MapScriptHeader:  
	def_scene_scripts


	def_callbacks 


	def_warp_events
	warp_event  7,  3, ANARRES_TOWER_2F, 3


	def_coord_events
	coord_event 4,  4, 0, AnarresTower3FStepRight
	coord_event 5,  4, 0, AnarresTower3FEvent

	def_bg_events


	def_object_events
	object_event  6,  6, SPRITE_HOLLIS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AnarresTower3FHollisScript, -1
	object_event  7,  3, SPRITE_TAMMY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AnarresTower3FTammyScript, EVENT_BEAT_TAMMY
	object_event  5,  6, SPRITE_AMOS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AnarresTower3FAmosScript, EVENT_BEAT_HOLLIS
	pokemon_event  14, 19, KLEAVOR, -1, -1, PAL_NPC_RED, KleavorText, EVENT_BEAT_SANDRA

	object_const_def
	const ANARRES_TOWER_HOLLIS
	const ANARRES_TOWER_TAMMY
	const ANARRES_TOWER_AMOS

AnarresTower3FStepRight:
	applyonemovement PLAYER, step_right
AnarresTower3FEvent:	
	applyonemovement PLAYER, step_down
	turnobject ANARRES_TOWER_AMOS, UP
	opentext 
	writetext AmosSaysHelloText
	waitbutton
	closetext
	applymovement ANARRES_TOWER_AMOS, AmosWalksAwayMovement
	disappear ANARRES_TOWER_AMOS
	clearevent EVENT_BEAT_HOLLIS ; this flag randomly gets set somehow. This is a workaround, i think 
	setscene $1
	setevent EVENT_SAW_KLEAVOR
	pause 10
	appear ANARRES_TOWER_TAMMY
	applymovement ANARRES_TOWER_TAMMY, TammyMovesToHollis
	showemote EMOTE_SHOCK, ANARRES_TOWER_HOLLIS, 10
	turnobject ANARRES_TOWER_HOLLIS, LEFT
	opentext
	writetext HollisPastGuards
	waitbutton
	showemote EMOTE_SAD, ANARRES_TOWER_TAMMY, 10
	writetext TammyExplains
	waitbutton
	closetext
	applymovement ANARRES_TOWER_HOLLIS, HollisToYou
	turnobject PLAYER, RIGHT
	showtext HollisChallengesText
	winlosstext HollisBeatenText, 0
	loadtrainer HOLLIS, 1 ; WILL THIS FIND?
	startbattle
	reloadmapafterbattle ; is tammy still around? 
	opentext
	showemote EMOTE_HEART, ANARRES_TOWER_TAMMY, 10
	showtext TammyText2
;	waitbutton
	showemote EMOTE_QUESTION, ANARRES_TOWER_HOLLIS, 10
	showtext HollisHmm
;	waitbutton
	turnobject ANARRES_TOWER_TAMMY, DOWN
	pause 5
	showemote EMOTE_HAPPY, ANARRES_TOWER_TAMMY, 10
	showtext TammyText3
;	waitbutton
	showemote EMOTE_SHOCK, ANARRES_TOWER_HOLLIS, 10
	showtext HollisAbuse
	pause 5
	showtext TammyText4
	turnobject ANARRES_TOWER_HOLLIS, RIGHT
	applyonemovement ANARRES_TOWER_HOLLIS, step_right
	showtext HollisHM
	showemote EMOTE_HAPPY, ANARRES_TOWER_TAMMY, 15
	showtext TammyThanks
	closetext
	applymovement ANARRES_TOWER_TAMMY, TammyWalksOutMovement
	disappear ANARRES_TOWER_TAMMY
	applyonemovement ANARRES_TOWER_HOLLIS, step_left
	opentext
	writetext HollisCongratulates
	waitbutton
	verbosegivetmhm HM_CUT
	setevent EVENT_GOT_HM01_CUT
	setevent EVENT_BEAT_HOLLIS
	setflag ENGINE_BOULDERBADGE
	clearevent EVENT_TAMMY_HOLLYS_HOLT
	setevent EVENT_BEAT_BUG_CATCHER_WAYNE
	setevent EVENT_BEAT_BUG_CATCHER_KEN
	setevent EVENT_BEAT_BUG_CATCHER_AL
	setevent EVENT_BEAT_BUG_CATCHER_JOSH
	setevent EVENT_BEAT_BUG_CATCHER_DON
	setevent EVENT_BEAT_BUG_CATCHER_BENNY
	setscene $1
	jumpthisopenedtext

	text "You can use"
	line "that HM to clear"
	cont "trees in the"
	cont "forest."
	done

PlayerStepsToHollisMovement:
	step_left
	step_left
	step_down
	step_down
	step_end
	
PlayerStepsDownMovement:
	step_down
	step_end

TammyMovesToHollis:
	step_left
	step_left
	step_left
	step_down
	step_down
	step_down
	turn_head_right
	step_end

HollisPastGuards:
	text "HOLLIS: Tammy-"
	line "how are you here?"
	
	para "We have been"
	line "through this."
	
	para "My watch has kept"
	line "us safe so far."
	
	para "And why is"
	line "<PLAYER> here?"
	done

HollisChallengesText:
	text "No one else has"
	line "my experience!"

	para "I'm taking total"
	line "control!"
	
	para "<PLAYER>, I'll"
	line "start with you!"
	done

TammyExplains:
	text "TAMMY: Won't"
	line "you just listen?"
	
	para "<PLAYER> and I"
	line "both think that"
	cont "you need help."
	
	para "The problems in"
	line "the Holt require"
	cont "more than one"
	cont "perspective to"
	cont "solve, and the"
	cont "Hisuians say the"
	cont "Emperor will"
	cont "soon bring us in"
	cont "to the Empire."
	done

HollisToYou:
	step_up
	turn_head_left
	step_end

HollisBeatenText:
	text "Fine. I'll listen"
	line "to what you have"
	cont "to say."
	done
	
TammyText2:
	text "I've been"
	line "thinking about"
	cont "the forest."
	cont "You've managed"
	cont "it well, but the"
	cont "situation may"
	cont "get out of"
	cont "hand."
	done

HollisHmm:
	text "HOLLIS: I..."
	line "I'm listening."
	done

TammyText3:
	text "The forest binds"
	line "us all. Past,"
	cont "present, future."

	para "My technique lets"
	line "everyone be a"
	cont "guardian."
	done

HollisAbuse:
	text "But what if"
	line "people misuse"
	cont "this power?"
	done
	
TammyText4:
	text "People will learn"
	line "how to use it"
	cont "from those who"
	cont "are responsible."
	
	para "We will review"
	line "at yearly"
	cont "rituals."
	done

HollisHM:
	text "I... I see your"
	line "point. My method"
	cont "is too harsh."

	para "We'll try your"
	line "way, carefully."

	para "It's time I"
	line "learned to trust"
	cont "others again."
	done

TammyThanks:
	text "Thank you! I'll"
	line "begin at once."
	done

TammyWalksOutMovement:
	step_up
	step_up
	step_up
	step_right
	step_right
	step_right
	step_end

HollisCongratulates:
	text "Congratulations"
	line "on your victory."

	para "It's been a long"
	line "time since I've"
	cont "faced defeat."

	para "Perhaps it's"
	line "time I learned"
	cont "from others,"
	cont "not just teach."

	para "Together, we"
	line "might build"
	cont "something"
	cont "greater than"
	cont "I imagined."

	para "You've proven"
	line "yourself worthy."

	para "Please, accept"
	line "this as a token"
	cont "of my respect."
	done

AnarresTowerTammyScript:
	faceplayer
	jumpthisopenedtext

	text "Thanks for"
	line "your help!"
	done

TextHollisAfterBattle:
	text "You've opened"
	line "my eyes."

	para "I thought I was"
	line "protecting us,"
	cont "but I was just"
	cont "holding us back."

	para "This HM... it's"
	line "powerful, but"
	cont "it needs wisdom"
	cont "to use right."

	para "Maybe together,"
	line "we can find that"
	cont "wisdom. And heal"
	cont "more than just"
	cont "the forest."
	done


AnarresTower3FTammyScript:
	faceplayer
	opentext
	writetext .TammyAfterBattleText 
	waitbutton
	closetext
	end

.TammyAfterBattleText:
	text "Thanks for"
	line "your help!"
	done

AnarresTower3FAmosScript: ; shouldn't be able to talk to him. 
	end

AmosWalksAwayMovement:
	step_left
	step_up
	step_up
	step_up
	step_right
	step_right
	step_right
	step_end

AmosSaysHelloText:
	text "A flunkie to"
	line "throw me out?"

	para "..."

	para "Oh, you're not--"
	line "Never mind."

	para "I'm Amos. I've"
	line "been trying to"
	cont "get Hollis to"
	cont "see reason about"
	cont "the Emperor's"
	cont "threat."

	para "But he'd rather"
	line "hide in his"
	cont "tower than help"
	cont "his neighbors"
	cont "prepare."

	para "..."

	para "Fine. Let him"
	line "cling to what"
	cont "remains of the"
	cont "forest, while"
	cont "the rest of us"
	cont "fight for our"
	cont "future."

	para "I've wasted"
	line "enough time"
	cont "here."
	done

AnarresTower3FHollisScript:
	faceplayer
	opentext
	writetext TextHollisAfterBattle
	waitbutton
	closetext
	end

KleavorText:
	text "Kleavor:"
	line "Klava Klava!"
	end
