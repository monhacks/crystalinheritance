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
	object_event  7,  3, SPRITE_TAMMY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AnarresTower3FTammyScript, EVENT_BEAT_TAMMY;EVENT_BEAT_TAMMY
	object_event  5,  6, SPRITE_AMOS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AnarresTower3FAmosScript, EVENT_BEAT_HOLLIS

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
	text "HOLLIS: Hmm?"
	done

TammyText3:
	text "The forest is a"
	line "shared resource"
	cont "for us all. It"
	cont "connects us to"
	cont "our past and our"
	cont "future. My"
	cont "technique will"
	cont "allow people to"
	cont "take part in"
	cont "managing it."
	done

HollisAbuse:
	text "But how can we"
	line "know that it"
	cont "will not be"
	cont "abused?"
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
	text "I appreciate"
	line "your idea. It"
	cont "may take years"
	cont "for the forest"
	cont "to grow back to"
	cont "its original"
	cont "size. My HM is"
	cont "still too"
	cont "powerful, but I"
	cont "will let you"
	cont "teach others"
	cont "your technique."
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
	line "on beating me in"
	cont "a battle. No one"
	cont "has done that in"
	cont "a long time. I"
	cont "need to learn to"
	cont "build other"
	cont "people up so"
	cont "that we can live"
	cont "as a community"
	cont "again. Oh, and"
	cont "you've earned"
	cont "the right to"
	cont "have this."
	done

AnarresTowerTammyScript:
	faceplayer
	jumpthisopenedtext

	text "Thanks for"
	line "your help!"
	done

TextHollisAfterBattle:
	text "You showed me"
	line "that might is"
	cont "not always"
	cont "right."

	para "The Cut HM is"
	line "is still too"
	cont "powerful to be"
	cont "used without"
	cont "recognizing its"
	cont "effects, but we"
	cont "can build a"
	cont "culture around"
	cont "talking through"
	cont "the tradeoffs"
	cont "before taking"
	cont "action."
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
	text "Another flunkie"
	line "to defend his"
	cont "cowardice?"
	
	para "..."
	line "No, you aren't"
	cont "dressed right."
	
	para "My name is Amos."
	line "I'm trying to"
	cont "convince Hollis"
	cont "to join in opp-"
	cont "osition to the"
	cont "Emperor's plan."
	
	para "If he wants to"
	line "stay the center"
	cont "of his universe,"
	cont "so be it."
	
	para "..."
	
	para "I must be going."
	done

AnarresTower3FHollisScript:
	faceplayer
	opentext
	writetext TextHollisAfterBattle
	waitbutton
	closetext
	end
