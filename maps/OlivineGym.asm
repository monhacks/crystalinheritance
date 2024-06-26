OlivineGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 15, OLIVINE_CITY, 2
	warp_event  5, 15, OLIVINE_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, OlivineGymStatue
	bg_event  6, 13, BGEVENT_READ, OlivineGymStatue

	def_object_events
	object_event  5,  3, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineGymJasmineScript, -1
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGymGuyScript, -1


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

	text "…You could use"
	line "that TM to teach"
	cont "Iron Tail."
	done

OlivineGymGuyScript:
	checkevent EVENT_BEAT_JASMINE
	iftrue_jumptextfaceplayer OlivineGymGuyWinText
	jumpthistextfaceplayer

	text "Jasmine uses the"
	line "newly discovered"
	cont "Steel-type."

	para "I don't know very"
	line "much about it."
	done


OlivineGymStatue:
	gettrainername JASMINE, 1, $1
	checkflag ENGINE_MINERALBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten
	jumpstd gymstatue2

Jasmine_SteelTypeIntro:
	text "…Thank you for"
	line "your help at the"
	cont "Lighthouse…"

	para "But this is dif-"
	line "ferent. Please"

	para "allow me to intro-"
	line "duce myself."

	para "I am Jasmine, a"
	line "Gym Leader. I use"
	cont "the Steel-type."

	para "…Do you know about"
	line "the Steel-type?"

	para "They are very"
	line "hard, cold, sharp,"
	cont "and really strong."

	para "…Um… May I begin?"
	done

Jasmine_BetterTrainer:
	text "…You are a better"
	line "trainer than me,"

	para "in both skill and"
	line "kindness."

	para "In accordance with"
	line "League rules, I"

	para "confer upon you"
	line "this Badge."
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

Jasmine_GoodLuck:
	text "Um… I don't know"
	line "how to say this,"
	cont "but good luck…"
	done

OlivineGymGuyWinText:
	text "That was awesome."

	para "The Steel-type,"
	line "huh?"

	para "That was a close"
	line "encounter of an"
	cont "unknown kind!"
	done

OlivineGymGuyPreText:
	text "Jasmine, the Gym"
	line "Leader, is at the"
	cont "Lighthouse."

	para "She's been tending"
	line "to a sick #mon."

	para "A strong trainer"
	line "has to be compas-"
	cont "sionate."
	done
