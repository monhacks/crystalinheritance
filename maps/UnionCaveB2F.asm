UnionCaveB2F_MapScriptHeader: ; todo: text 
	def_scene_scripts

	def_callbacks


	def_warp_events
	warp_event  5,  3, UNION_CAVE_B1F_SOUTH, 2

	def_coord_events

	def_bg_events
	bg_event  12, 16, BGEVENT_ITEM + CALCIUM, EVENT_UNION_CAVE_B2F_HIDDEN_CALCIUM
	bg_event  8, 28, BGEVENT_ITEM + ELIXIR, EVENT_UNION_CAVE_B2F_HIDDEN_ULTRA_BALL

	def_object_events
	object_event  16, 29, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, BASTIODON, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, UnionCaveBastiodon, EVENT_UNION_CAVE_B2F_FOSSIL
	object_event  17, 29, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, RAMPARDOS, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, UnionCaveRampardos, EVENT_UNION_CAVE_B2F_FOSSIL	

;TODO change these to other trainers
	object_event  5,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerScientistLinden, EVENT_BEAT_RUIN_MANIAC_GLYNN ; 'LOWELL ' REMATCH 
	object_event  7,  6, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerFirebreatherJay, EVENT_BEAT_RUIN_MANIAC_GLYNN ; 'ray rematch
	object_event 12, 12, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerScientistOskar,EVENT_BEAT_RUIN_MANIAC_GLYNN	; PLACE 
	object_event  4, 22, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerHikerTimothy, EVENT_BEAT_RUIN_MANIAC_GLYNN ; PLACE 
	object_event 4, 30, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerFirebreatherOleg, EVENT_BEAT_RUIN_MANIAC_GLYNN ; PLACE 
	object_event 15, 29, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerRuin_maniacGlynn, EVENT_BEAT_RUIN_MANIAC_GLYNN; 'PETRY'

	itemball_event 15, 25, GEODE, 5, EVENT_UNION_CAVE_B2F_ELIXIR ; 
	itemball_event 14, 19, HYPER_POTION, 1, EVENT_UNION_CAVE_B2F_HYPER_POTION ; OK 

	object_const_def
	const UNIONCAVEB2F_BASTIODON
	const UNIONCAVEB2F_RAMPARDOS

UnionCaveBastiodon:
	faceplayer
	cry BASTIODON
	loadwildmon BASTIODON, 30
	startbattle
	disappear UNIONCAVEB2F_BASTIODON
	disappear UNIONCAVEB2F_RAMPARDOS
	setevent EVENT_UNION_CAVE_B2F_FOSSIL
	reloadmapafterbattle
	end
	
UnionCaveRampardos:
	faceplayer
	cry RAMPARDOS
	loadwildmon RAMPARDOS, 30
	startbattle
	disappear UNIONCAVEB2F_BASTIODON
	disappear UNIONCAVEB2F_RAMPARDOS
	setevent EVENT_UNION_CAVE_B2F_FOSSIL
	reloadmapafterbattle
	end

GenericTrainerCooltrainermNick:
	generictrainer COOLTRAINERM, NICK, EVENT_BEAT_COOLTRAINERM_NICK, CooltrainermNickSeenText, CooltrainermNickBeatenText

	text "Your #mon style"
	line "is stunning and"
	cont "colorful, I admit."

	para "You'll just keep"
	line "getting better!"
	done

GenericTrainerCooltrainerfGwen:
	generictrainer COOLTRAINERF, GWEN, EVENT_BEAT_COOLTRAINERF_GWEN, CooltrainerfGwenSeenText, CooltrainerfGwenBeatenText

	text "I'm going to train"
	line "by myself until I"
	cont "improve."
	done

GenericTrainerCooltrainerfEmma:
	generictrainer COOLTRAINERF, EMMA, EVENT_BEAT_COOLTRAINERF_EMMA, CooltrainerfEmmaSeenText, CooltrainerfEmmaBeatenText

	text "Just once a week,"
	line "a #mon comes to"
	cont "the water's edge."

	para "I wanted to see"
	line "that #mon…"
	done

CooltrainermNickSeenText:
	text "There are two"
	line "kinds of people."

	para "Those who have"
	line "style, and those"
	cont "who don't."

	para "What kind of"
	line "person are you?"
	done

CooltrainermNickBeatenText:
	text "You've got"
	line "dazzling style!"
	done

CooltrainerfGwenSeenText:
	text "I'm in training."
	line "Care for a round?"
	done

CooltrainerfGwenBeatenText:
	text "Aww, no! You're"
	line "too good for me."
	done

CooltrainerfEmmaSeenText:
	text "If the #mon I"
	line "liked were there,"
	cont "I'd go anywhere."

	para "That's what a real"
	line "trainer does."
	done

CooltrainerfEmmaBeatenText:
	text "I'd rather pet my"
	line "babies than this!"
	done

