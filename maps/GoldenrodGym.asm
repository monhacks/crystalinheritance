GoldenrodGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2, 17, GOLDENROD_CITY, 1
	warp_event  3, 17, GOLDENROD_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  1, 15, BGEVENT_READ, GoldenrodGymStatue
	bg_event  4, 15, BGEVENT_READ, GoldenrodGymStatue

	def_object_events
	object_event  9,  6, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSrandjrJoandcath1, -1
	object_event  9, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerLassCathy, -1
	object_event  9,  7, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSrandjrJoandcath2, -1
	object_event  0,  2, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBeautyVictoria, -1
	object_event 19,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBeautySamantha, -1
	object_event  5, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGymGuyScript, -1

	object_const_def
	const GOLDENRODGYM_LASS2

GenericTrainerLassCathy:
	generictrainer LASS, CATHY, EVENT_BEAT_LASS_CATHY, LassCathySeenText, LassCathyBeatenText

	text "Do my #mon"
	line "think I'm cute?"
	done

GenericTrainerSrandjrJoandcath1:
	generictrainer SR_AND_JR, JOANDCATH1, EVENT_BEAT_SR_AND_JR_JO_AND_CATH, SrandjrJoandcath1SeenText, SrandjrJoandcath1BeatenText

	text "Jo: I'm helping my"
	line "junior Cath to"

	para "earn a badge"
	line "from Whitney."

	para "She's improving"
	line "gradually."
	done

GenericTrainerSrandjrJoandcath2:
	generictrainer SR_AND_JR, JOANDCATH2, EVENT_BEAT_SR_AND_JR_JO_AND_CATH, SrandjrJoandcath2SeenText, SrandjrJoandcath2BeatenText

	text "Cath: I keep on"
	line "losing to Whitney."
	cont "It's depressing."

	para "I'm OK! If I lose,"
	line "I'll just try"
	cont "harder next time!"
	done

GenericTrainerBeautyVictoria:
	generictrainer BEAUTY, VICTORIA, EVENT_BEAT_BEAUTY_VICTORIA, BeautyVictoriaSeenText, BeautyVictoriaBeatenText

	text "Wow, you must be"
	line "good to beat me!"
	cont "Keep it up!"
	done

GenericTrainerBeautySamantha:
	generictrainer BEAUTY, SAMANTHA, EVENT_BEAT_BEAUTY_SAMANTHA, BeautySamanthaSeenText, BeautySamanthaBeatenText

	text "I taught Meowth"
	line "moves for taking"
	cont "on any type…"
	done

GoldenrodGymGuyScript:
	jumpthistextfaceplayer

	text "Yo! Champ in"
	line "making!"

	para "This Gym is home"
	line "to Normal-type"
	cont "#mon trainers."

	para "I recommend you"
	line "use Fighting-type"
	cont "#mon."

	para "But be careful--"
	line "Fairy #mon"

	para "resist Fighting-"
	line "type moves,"

	para "and they're used"
	line "here too!"
	done

GoldenrodGymStatue:
	gettrainername WHITNEY, 1, $1
	checkflag ENGINE_PLAINBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	readvar VAR_BADGES
	ifgreater 10, .LyraToo
	jumpstd gymstatue2
.LyraToo
	jumpstd gymstatue3

LassCathySeenText:
	text "Don't let my"
	line "#mon's cute"

	para "looks fool you."
	line "They can whip you!"
	done

LassCathyBeatenText:
	text "Darn… I thought"
	line "you were weak…"
	done

SrandjrJoandcath1SeenText:
	text "Jo: If you want to"
	line "face Whitney,"

	para "you'll have to go"
	line "through me!"

	para "Cath, did that"
	line "sound cool?"
	done

SrandjrJoandcath1BeatenText:
	text "Jo: Losing isn't"
	line "cool at all!"
	done

SrandjrJoandcath2SeenText:
	text "Cath: I'm trying"
	line "to beat Whitney,"
	cont "but my senior and"

	para "I can beat you"
	line "first!"
	done

SrandjrJoandcath2BeatenText:
	text "Cath: Oh, no,"
	line "no, no!"
	done

JoWhitneyCriesText:
	text "Oh, no. You made"
	line "Whitney cry."

	para "It's OK. She'll"
	line "stop soon. She"

	para "always cries when"
	line "she loses."
	done

BeautyVictoriaSeenText:
	text "Oh, you are a cute"
	line "little trainer! ♥"

	para "I like you, but I"
	line "won't hold back!"
	done

BeautyVictoriaBeatenText:
	text "Let's see… Oops,"
	line "it's over?"
	done

BeautySamanthaSeenText:
	text "Give it your best"
	line "shot, or I'll take"
	cont "you down!"
	done

BeautySamanthaBeatenText:
	text "No! Oh, Meowth,"
	line "I'm so sorry!"
	done

GoldenrodGymGuyWinText:
	text "You won? Great! I"
	line "was busy admiring"
	cont "the ladies here."
	done
