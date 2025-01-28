CianwoodGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 17, CIANWOOD_CITY, 2
	warp_event  5, 17, CIANWOOD_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, CianwoodGymStatue
	bg_event  6, 15, BGEVENT_READ, CianwoodGymStatue

	def_object_events
	; NPC TO RESET THE TRAINERS TODO 
	object_event  0, 0, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPIN_CLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBlackbeltYoshi, -1
	object_event  0, 0, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBlackbeltLao, -1
	object_event  0, 0, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBlackbeltNob, -1
	object_event  0, 0, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBlackbeltLung, -1
	strengthboulder_event  0, 0
	strengthboulder_event  0, 0
	strengthboulder_event  0, 0
	strengthboulder_event  0, 0
	tmhmball_event 0, 0, TM_DYNAMICPUNCH, EVENT_GOT_TM01_DYNAMICPUNCH
	itemball_event 0, 0, CHOICE_BAND, 1, EVENT_GOT_CHOICE_BAND

	object_const_def


CianwoodGymStatue:
	jumpthistext
	
	text "Cianwood Gym"
	line "Never stop fight-"
	cont "ing for your home"
	done


GenericTrainerBlackbeltYoshi:
	generictrainer BLACKBELT_T, YOSHI, EVENT_BEAT_BLACKBELT_YOSHI, BlackbeltYoshiSeenText, BlackbeltYoshiBeatenText

	text "You seem to have a"
	line "strong bond with"
	cont "your #mon too!"
	done

GenericTrainerBlackbeltLao:
	generictrainer BLACKBELT_T, LAO, EVENT_BEAT_BLACKBELT_LAO, BlackbeltLaoSeenText, BlackbeltLaoBeatenText

	text "Fighting #mon"
	line "are afraid of psy-"
	cont "chics…"
	done

GenericTrainerBlackbeltNob:
	generictrainer BLACKBELT_T, NOB, EVENT_BEAT_BLACKBELT_NOB, BlackbeltNobSeenText, BlackbeltNobBeatenText

	text "I lost!"
	line "I'm speechless!"
	done

GenericTrainerBlackbeltLung:
	generictrainer BLACKBELT_T, LUNG, EVENT_BEAT_BLACKBELT_LUNG, BlackbeltLungSeenText, BlackbeltLungBeatenText

	text "My #mon lost…"
	line "My… my pride is"
	cont "shattered…"
	done


BlackbeltYoshiSeenText:
	text "My #mon and I"
	line "are bound togeth-"
	cont "er by friendship."

	para "Our bond will"
	line "never be broken!"
	done

BlackbeltYoshiBeatenText:
	text "This isn't real!"
	done

BlackbeltLaoSeenText:
	text "We martial artists"
	line "fear nothing!"
	done

BlackbeltLaoBeatenText:
	text "That's shocking!"
	done

BlackbeltNobSeenText:
	text "Words are useless."
	line "Let your fists do"
	cont "the talking!"
	done

BlackbeltNobBeatenText:
	text "…"
	done

BlackbeltLungSeenText:
	text "My raging fists"
	line "will shatter your"
	cont "#mon!"
	done

BlackbeltLungBeatenText:
	text "I got shattered!"
	done
