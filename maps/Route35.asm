Route35_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 13, 31, ROUTE_35_GOLDENROD_GATE, 1
	warp_event 14, 31, ROUTE_35_GOLDENROD_GATE, 2
	warp_event  7,  5, ROUTE_35_NATIONAL_PARK_GATE, 3


	def_coord_events

	def_bg_events
	bg_event  5,  7, BGEVENT_JUMPTEXT, Route35SignText
	bg_event 15, 29, BGEVENT_JUMPTEXT, Route35SignText
	bg_event  4, 11, BGEVENT_ITEM + NUGGET, EVENT_ROUTE_35_HIDDEN_NUGGET

	def_object_events
	object_event  8, 19, SPRITE_CAMPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerCamperIvan, -1;
	object_event 12, 20, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCooltrainerMNick, -1;
	object_event 11, 20, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCooltrainerFGwen, -1;
	object_event 14, 26, SPRITE_PICNICKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPicnickerKim, -1
	object_event 18, 29, SPRITE_BREEDER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBreederTheresa, -1
	object_event  6, 10, SPRITE_FIREBREATHER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerFirebreatherWalt, -1
	object_event  9, 10, SPRITE_JUGGLER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerJugglerIrwin, -1
	fruittree_event  10, 26, FRUITTREE_ROUTE_35, SHORE_FOAM, PAL_NPC_BLUE
	tmhmball_event 11, 11, TM_DRAIN_PUNCH, EVENT_GOT_TM_DRAIN_PUNCH

GenericTrainerCamperIvan:
	generictrainer CAMPER, IVAN, EVENT_BEAT_CAMPER_IVAN, CamperIvanSeenText, CamperIvanBeatenText

	text "Oh cool, a fellow"
	line "Azalean!"
	para "I moved here to"
	line "Goldenrod. It's"
	cont "hard to be away"
	cont "from my family,"
	cont "though."
	done

CamperIvanSeenText:
	text "Oh cool, a fellow"
	line "Azalean!"
	done

CamperIvanBeatenText:
	text "You're as strong"
	line "as Bugsy."
	done

GenericTrainerCooltrainerMNick:
	generictrainer COOLTRAINERM, NICK, EVENT_BEAT_COOLTRAINERM_NICK, CooltrainerMCalSeenText, CooltrainerMCalBeatenText

	text "It's not really a"
	line "mystery why"
	cont "Whitney got a"
	cont "radio channel."
	para "She claims to"
	line "stick up for cute"
	cont "#mon, but she's"
	cont "just as menacing"
	cont "as Petrel."
	done

CooltrainerMCalSeenText:
	text "Are your #mon"
	line "cute or tough?"
	done

CooltrainerMCalBeatenText:
	text "Cute and tough!"
	done

GenericTrainerCooltrainerFGwen:
	generictrainer COOLTRAINERF, GWEN, EVENT_BEAT_COOLTRAINERF_GWEN, CooltrainerFGwenSeenText, CooltrainerFGwenBeatenText

	text "I'm training to be"
	line "as strong as"
	cont "Whitney."
	done

CooltrainerFGwenSeenText:
	text "Hustle!"
	done

CooltrainerFGwenBeatenText:
	text "Bustle…"
	done

GenericTrainerPicnickerKim:
	generictrainer CAMPER, ROLAND, EVENT_BEAT_CAMPER_ROLAND, RolandSeenText, RolandBeatenText

	text "Now, I have to"
	line "run back to the "
	cont "#center"
	cont "and it'll be too"
	cont "late to make any"
	cont "s'mores..."
	done

RolandSeenText:
	text "Excuse me, have"
	line "you seen my"
	cont "girlfriend Gina?"
	
	para "She promised me"
	line "that we would do"
	cont "s'mores tonight."
	done

RolandBeatenText:
	text "Thanks a lot."
	
	para "Now, I have to"
	line "run back to the "
	cont "#center"
	cont "and it'll be too"
	cont "late..."
	done

GenericTrainerBreederTheresa:
	generictrainer BREEDER, THERESA, EVENT_BEAT_BREEDER_THERESA, BreederTheresaSeenText, BreederTheresaBeatenText

	text "I love reading"
	line "about adventures"
	cont "outside. I wish I"
	cont "could go on an"
	cont "adventure."
	done

BreederTheresaSeenText:
	text "Oh, the great"
	line "outdoors!"
	done

BreederTheresaBeatenText:
	text "Now I'm not"
	line "feeling so good…"
	done

GenericTrainerFirebreatherWalt:
	generictrainer FIREBREATHER, WALT, EVENT_BEAT_FIREBREATHER_WALT, FirebreatherWaltSeenText, FirebreatherWaltBeatenText

	text "Museum maps show"
	line "there was a hot"
	cont "spring here. It"
	cont "must have dried up"
	cont "a long time ago."
	done

FirebreatherWaltSeenText:
	text "Did you know there"
	line "used to be a"
	cont "spring here?"
	done

FirebreatherWaltBeatenText:
	text "I'm all dry!"
	done

TrainerJugglerIrwin:
	generictrainer JUGGLER, IRWIN1, EVENT_BEAT_JUGGLER_IRWIN, JugglerIrwin1SeenText, JugglerIrwin1BeatenText

JugglerIrwinAfterBattleText:
	text "They're saying"
	line "that a new"
	cont "technique is"
	cont "going to bring"
	cont "rain."
	done

JugglerIrwin1SeenText:
	text "Have you heard"
	line "what they found"
	cont "in the ruins?"
	done

JugglerIrwin1BeatenText:
	text "I wish I could"
	line "have seen it."
	done


Route35SignText:
	text "Route 35"
	done
	