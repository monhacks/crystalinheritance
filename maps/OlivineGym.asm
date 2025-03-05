OlivineGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 15, OLIVINE_CITY, 2
	warp_event  5, 15, OLIVINE_CITY, 2

	def_coord_events

	def_bg_events


	def_object_events
	object_event  5,  3, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineGymJasmineScript, EVENT_JASMINE_GYM ; NOT HERE UNTIL AFTER BEATING CHUCK 



OlivineGymJasmineScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_JASMINE
	iftrue .FightDone
	writetext Jasmine_SteelTypeIntro
	waitbutton
	closetext
	winlosstext Jasmine_BetterTrainer, 0
	loadtrainer JASMINE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JASMINE
	opentext
	writetext Text_ReceivedMineralBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MINERALBADGE
.FightDone:
	checkevent EVENT_GOT_TM23_IRON_TAIL
	iftrue_jumpopenedtext Jasmine_GoodLuck
	writetext Jasmine_BadgeSpeech
	promptbutton
	verbosegivetmhm TM_IRON_TAIL
	setevent EVENT_GOT_TM23_IRON_TAIL
	jumpthisopenedtext

Jasmine_GoodLuck:
	text "Olivine will find"
	line "a way to persist."
	
	para "Though we were"
	line "corroded, we will"
	cont "polish ourselves"
	cont "and shine bright."	
	done


Jasmine_SteelTypeIntro:
	text "Thank you for"
	line "your help."

	para "I thought that I"
	line "was being kind,"
	
	para "but in being too"
	line "permissive, I"
	
	para "was derelict in"
	line "my duties. Now, "
	
	para "show me your"
	line "#mon!"

	done

Jasmine_BetterTrainer:
	text "Excellent battle,"
	line "finding even more"
	cont "weak spots in my"
	cont "style."
	done

Text_ReceivedMineralBadge:
	text "<PLAYER> received"
	line "the Mineral Badge."
	done

Jasmine_BadgeSpeech:
	text "With that Badge,"
	line "all #mon up"

	para "to <LV>70, even"
	line "traded ones, will"

	para "obey you without"
	line "question."

	para "…Um… Please take"
	line "this too…"
	done
