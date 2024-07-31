AnarresTower3F_MapScriptHeader:  ; not sure why this isn't working.... 
	def_scene_scripts


	def_callbacks 


	def_warp_events
	warp_event  7,  3, ANARRES_TOWER_2F, 3


	def_coord_events


	def_bg_events


	def_object_events
	object_event  6,  6, SPRITE_HOLLIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AnarresTowerHollisScript, -1
	object_event  7,  3, SPRITE_TAMMY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AnarresTowerTammyScript, EVENT_BEAT_TAMMY

	object_const_def
	const ANARRES_TOWER_HOLLIS
	const ANARRES_TOWER_TAMMY

AnarresTower3FHollisScript:
	faceplayer
	checkevent EVENT_BEAT_HOLLIS
	iftrue HollisAfterBattleText
	appear ANARRES_TOWER_TAMMY
	applymovement ANARRES_TOWER_TAMMY, TammyMovesToHollis
	showemote EMOTE_SHOCK, ANARRES_TOWER_HOLLIS, 10
	turnobject ANARRES_TOWER_HOLLIS, LEFT
	opentext
	writetext HollisPastGuards
	writetext TammyExplains
	closetext
	applymovement ANARRES_TOWER_HOLLIS, HollisToYou
	showtext HollisChallengesText
	winlosstext HollisBeatenText, 0
	loadtrainer HOLLIS, 1 ; WILL THIS FIND?
	startbattle
	reloadmapafterbattle ; is tammy still around? 
	opentext
	showemote EMOTE_HEART, ANARRES_TOWER_TAMMY, 10
	showtext TammyText2
	promptbutton
	showemote EMOTE_QUESTION, ANARRES_TOWER_HOLLIS, 10
	showtext HollisHm
	promptbutton
	turnobject ANARRES_TOWER_TAMMY, DOWN
	pause 5
	showtext TammyText3
	promptbutton
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
	verbosegivetmhm HM_CUT
	setevent EVENT_GOT_HM01_CUT
	setevent EVENT_BEAT_HOLLIS
	setflag ENGINE_BOULDERBADGE
	clearevent EVENT_TAMMY_HOLLYS_HOLT
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
	text "HOLLIS: You made"
	line "it past the guards?"
	cont "Do I have to do it"
	cont "all by myself?"
	done

HollisChallengesText:
	text "I'm taking total"
	line "control!"
	
	para "No one else has"
	line "my experience!"
	done

TammyExplains:
	text "TAMMY: Won't"
	line "you just listen?"
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

HollisHm:
	text "Hm?"
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

AnarresTowerHollisScript:
	faceplayer
	opentext
	writetext HollisAfterBattleText
	closetext
	end

HollisAfterBattleText:
	faceplayer
	opentext
	writetext HollisAfterText
	waitbutton
	closetext
	end

HollisAfterText:
	text "You showed me"
	line "that might is"
	cont "not always"
	cont "right."
	done
;	para "The Cut HM is"
;	line "is still too"
;	cont "powerful to be"
;	cont "used without"
;	cont "recognizing its"
;	cont "effects, but we"
;	cont "can build a"
;	cont "culture around"
;	cont "talking through"
;	cont "the tradeoffs"
;	cont "before taking"
;	cont "action."
;	done 
