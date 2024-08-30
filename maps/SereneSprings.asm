SereneSprings_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  0, GAULDENROD_SERENE_SPRINGS_GATE, 3
	warp_event  5,  0, GAULDENROD_SERENE_SPRINGS_GATE, 4
	warp_event 20, 38, STADIUM_GROUNDS, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8,  6, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBrigaderNAME1, -1
	object_event 14, 12, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBrigaderNAME2, -1
	object_event  9, 19, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBrigaderNAME3, -1
	object_event 16, 25, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBrigaderNAME4, -1
	object_event 11, 32, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBrigaderNAME5, -1

GenericTrainerBrigaderNAME1:
	generictrainer BRIGADERS, NAME1, EVENT_BEAT_BRIGADER_NAME1, BrigaderNAME1SeenText, BrigaderNAME1BeatenText

	text "I think I'd be a"
	line "pretty strong"
	cont "fighter in the"
	cont "stadium."
	done

BrigaderNAME1SeenText:
	text "Stop right there!"
	line "No one is allowed"
	cont "into the stadium"
	cont "at the moment!"
	done

BrigaderNAME1BeatenText:
	text "You'd make a good"
	line "candidate at the"
	cont "arena."
	done

GenericTrainerBrigaderNAME2:
	generictrainer BRIGADERS, NAME2, EVENT_BEAT_BRIGADER_NAME2, BrigaderNAME2SeenText, BrigaderNAME2BeatenText

	text "My boss will be"
	line "so mad at me."
	done

BrigaderNAME2SeenText:
	text "The stadium isn't"
	line "open! Turn back!"
	done

BrigaderNAME2BeatenText:
	text "I wish I could"
	line "stop you…"
	done

GenericTrainerBrigaderNAME3:
	generictrainer BRIGADERS, NAME3, EVENT_BEAT_BRIGADER_NAME3, BrigaderNAME3SeenText, BrigaderNAME3BeatenText

	text "There's a lot of"
	line "hot springs in"
	cont "this area. I"
	cont "wonder if there's"
	cont "any under the"
	cont "stadium."
	done

BrigaderNAME3SeenText:
	text "I'll shock you if"
	line "you come any"
	cont "closer!"
	done

BrigaderNAME3BeatenText:
	text "Lost my potential."
	done

GenericTrainerBrigaderNAME4:
	generictrainer BRIGADERS, NAME4, EVENT_BEAT_BRIGADER_NAME4, BrigaderNAME4SeenText, BrigaderNAME4BeatenText

	text "Want to know a"
	line "secret? Sometimes"
	cont "we inflict a"
	cont "fighter's #MON"
	cont "with status before"
	cont "they have to"
	cont "battle."
	done

BrigaderNAME4SeenText:
	text "Focus, tightening…"
	done

BrigaderNAME4BeatenText:
	text "Mind blown."
	done

GenericTrainerBrigaderNAME5:
	generictrainer BRIGADERS, NAME5, EVENT_BEAT_BRIGADER_NAME5, BrigaderNAME5SeenText, BrigaderNAME5BeatenText

	text "There used to be"
	line "Slugma here,"
	cont "before we drained"
	cont "these hot springs."
	done

BrigaderNAME5SeenText:
	text "Begone!"
	done

BrigaderNAME5BeatenText:
	text "I need to alert"
	line "the stadium"
	cont "brigade."
	done
