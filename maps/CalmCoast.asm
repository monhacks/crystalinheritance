CalmCoast_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 0, 0, CALM_COAST_COTTAGE, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 0, 0, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerYoungsterNAME1, -1
	object_event 0, 0, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerCooltrainerMNAME2, -1
	object_event 0, 0, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerYoungsterNAME3, -1
	object_event 0, 0, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerSwimmerfNAME4, -1
	object_event 0, 0, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerCooltrainerFNAME5, -1
	object_event 0, 0, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerBlackbeltNAME6, -1
	object_event 0, 0, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerBrigaderNAME7, -1
	object_event 0, 0, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CalmCoastKurtScript, -1

	tmhmball_event 0, 0, TM_ROAR, EVENT_CALM_COAST_TM_ROAR

GenericTrainerYoungsterNAME1:
	generictrainer YOUNGSTER, NAME1, EVENT_BEAT_YOUNGSTER_NAME1, YoungsterNAME1SeenText, YoungsterNAME1BeatenText

	text "Can you tell the"
	line "old guy I'm ready"
	cont "to go home?"
	done

YoungsterNAME1SeenText:
	text "I'm on the lookout"
	line "for pidgeys!"
	done

YoungsterNAME1BeatenText:
	text "Gosh, it gets"
	line "boring standing"
	cont "here."
	done

GenericTrainerCooltrainerMNAME2:
	generictrainer COOLTRAINERM, NAME2, EVENT_BEAT_COOLTRAINER_M_NAME2, CooltrainerMNAME2SeenText, CooltrainerMNAME2BeatenText

CooltrainerMNAME2SeenText:
	text "I just got back"
	line "from the bazaar!"
	done

CooltrainerMNAME2BeatenText:
	text "I lost? Now that's"
	line "bizarre"
	done

GenericTrainerYoungsterNAME3:
	generictrainer YOUNGSTER, NAME3, EVENT_BEAT_YOUNGSTER_NAME3, YoungsterNAME3SeenText, YoungsterNAME3BeatenText

YoungsterNAME3SeenText:
	text "I'm trying to join"
	line "the brigaders!"
	done

YoungsterNAME3BeatenText:
	text "Now I'll never"
	line "make it as a"
	cont "brigadier."
	done

GenericTrainerSwimmerfNAME4:
	generictrainer SWIMMERF, NAME4, EVENT_BEAT_SWIMMERF_NAME4, SwimmerfNAME4SeenText, SwimmerfNAME4BeatenText

	text "Watch out for my"
	line "sisters."
	done

SwimmerfNAME4SeenText:
	text "Our secret hiding"
	line "spot! Get out!"
	done

SwimmerfNAME4BeatenText:
	text "Watch out for my"
	line "sisters."
	done

GenericTrainerCooltrainerFNAME5:
	generictrainer COOLTRAINERF, NAME5, EVENT_BEAT_COOLTRAINER_F_NAME5, CooltrainerFNAME5SeenText, CooltrainerFNAME5BeatenText

CooltrainerFNAME5SeenText:
	text "Let my rage flow"
	line "through me!"
	done

CooltrainerFNAME5BeatenText:
	text "Crashed and"
	line "burned."
	done

GenericTrainerBlackbeltNAME6:
	generictrainer BLACKBELT_T, NAME6, EVENT_BEAT_BLACKBELT_NAME6, BlackbeltNAME6SeenText, BlackbeltNAME6BeatenText

	text "This spot is so"
	line "quiet, it's good"
	cont "for training."
	done

BlackbeltNAME6SeenText:
	text "Kame-hame…"
	done

BlackbeltNAME6BeatenText:
	text "You got the last"
	line "laugh."
	done

GenericTrainerBrigaderNAME7:
	generictrainer BRIGADERS, NAME7, EVENT_BEAT_BRIGADER_NAME7, BrigaderNAME7SeenText, BrigaderNAME7BeatenText

	text "I'm on the lookout"
	line "for three women"
	cont "who stole some of"
	cont "the #mon from"
	cont "the stadium."
	done

BrigaderNAME7SeenText:
	text "Halt! Are you one"
	line "of those rebels?"
	done

BrigaderNAME7BeatenText:
	text "I see. Please, go"
	line "about your way."
	done

CalmCoastKurtScript:
	jumptextfaceplayer CalmCoastKurtText

CalmCoastKurtText:
	text "So this is how"
	line "Route 34 looked"
	cont "160 years ago."

	para "Your father helped"
	line "at the day care"
	cont "when he was young."

	para "Once, on the way"
	line "back to Azalea, he"
	cont "was playing with"
	cont "an apricorn and"
	cont "accidentally caught"
	cont "a Cyndaquil named"
	cont "Landyquac."

	para "His first #mon!"
	line "We took it to"
	cont "Goldenrod all the"
	cont "time to get"
	cont "haircuts."
	done