Route38_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 35,  8, ROUTE_38_ECRUTEAK_GATE, 1
	warp_event 35,  9, ROUTE_38_ECRUTEAK_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 33,  7, BGEVENT_JUMPTEXT, Route38SignText
	bg_event  5, 13, BGEVENT_JUMPTEXT, Route38TrainerTipsText

	def_object_events
	object_event 12, 15, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBird_keeperToby, -1
	object_event 19,  9, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBeautyValencia, -1
	object_event 24,  5, SPRITE_SAILOR, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSailorHarry, -1
	fruittree_event 12, 10, FRUITTREE_ROUTE_38, SITRUS_BERRY, PAL_NPC_BROWN
	object_event  5,  8, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBeautyOlivia, -1

GenericTrainerBird_keeperToby:
	generictrainer BIRD_KEEPER, TOBY, EVENT_BEAT_BIRD_KEEPER_TOBY, Bird_keeperTobySeenText, Bird_keeperTobyBeatenText

	text "I plan to train in"
	line "the Yellow Forest"

	para "to teach my #-"
	line "mon how to Fly."
	done

GenericTrainerSailorHarry:
	generictrainer SAILOR, HARRY, EVENT_BEAT_SAILOR_HARRY, SailorHarrySeenText, SailorHarryBeatenText

	text "All kinds of peo-"
	line "ple around the"

	para "world live happily"
	line "with #mon."
	done

GenericTrainerBeautyValencia:
	generictrainer BEAUTY, VALENCIA, EVENT_BEAT_BEAUTY_VALENCIA, BeautyValenciaSeenText, BeautyValenciaBeatenText

	text "When I see #-"
	line "mon, it seems to"
	cont "soothe my nerves."
	done

GenericTrainerBeautyOlivia:
	generictrainer BEAUTY, OLIVIA, EVENT_BEAT_BEAUTY_OLIVIA, BeautyOliviaSeenText, BeautyOliviaBeatenText

	text "Moomoo Milk is"
	line "good for beauty"
	cont "and health."

	para "I like to buy a"
	line "dozen bottles at"
	cont "a time!"
	done

Bird_keeperTobySeenText:
	text "Fly high into the"
	line "sky, my beloved"
	cont "bird #mon!"
	done

Bird_keeperTobyBeatenText:
	text "I feel like just"
	line "flying away now."
	done

SchoolboyChad1SeenText:
	text "Let me try some-"
	line "thing I learned"
	cont "today."
	done

SchoolboyChad1BeatenText:
	text "I didn't study"
	line "enough, I guess."
	done

SchoolboyChadSoManyTestsText:
	text "I have to take so"
	line "many tests, I"

	para "don't have much"
	line "time for #mon."

	para "So when I do get"
	line "to play, I really"
	cont "concentrate."
	done

LassDana1SeenText:
	text "You seem to be"
	line "good at #mon."

	para "If you are, how"
	line "about giving me"
	cont "some advice?"
	done

LassDana1BeatenText:
	text "I see. So you can"
	line "battle that way."
	done

LassDanaMoomooMilkText:
	text "I know something"
	line "good!"

	para "Moomoo Farm's milk"
	line "is famous for its"
	cont "flavor."
	done

BeautyValenciaSeenText:
	text "Hi! Aren't you a"
	line "cute trainer!"

	para "May I see your"
	line "#mon?"
	done

BeautyValenciaBeatenText:
	text "I'm glad I got to"
	line "see your #mon!"
	done

SailorHarrySeenText:
	text "I've been over-"
	line "seas, so I know"

	para "about all sorts of"
	line "#mon!"
	done

SailorHarryBeatenText:
	text "Your skill is"
	line "world class!"
	done

BeautyOliviaSeenText:
	text "Don't you think my"
	line "#mon and I are"
	cont "beautiful?"
	done

BeautyOliviaBeatenText:
	text "We drink Moomoo"
	line "Milk every day."
	done

Route38SignText:
	text "Route 38"

	para "Olivine City -"
	line "Ecruteak City"
	done

Route38TrainerTipsText:
	text "Trainer Tips"

	para "If a #mon is"
	line "trying to evolve,"
	cont "you can stop it."

	para "Press the B But-"
	line "ton during evolu-"
	cont "tion."

	para "That startles the"
	line "#mon and stops"
	cont "its evolution."
	done
