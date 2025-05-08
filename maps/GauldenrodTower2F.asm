GauldenrodTower2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 11,  1, GAULDENROD_TOWER_1F, 3
	warp_event  1, 11, GAULDENROD_TOWER_1F, 4
	warp_event  7,  3, GAULDENROD_TOWER_1F, 5


	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  0, SPRITE_AROMA_LADY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerAromaLadyBryony, EVENT_BEAT_SANDRA
	object_event  4,  2, SPRITE_AROMA_LADY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerAromaLadyRosa, EVENT_BEAT_SANDRA
	object_event  6,  2, SPRITE_AROMA_LADY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerAromaLadyPeony, EVENT_BEAT_SANDRA

GenericTrainerAromaLadyBryony:
	generictrainer AROMA_LADY, BRYONY, EVENT_BEAT_AROMA_LADY_BRYONY, AromaLadyBryonySeenText, AromaLadyBryonyBeatenText

	text "I don't see how"
	line "this tower could"
	cont "be demolished."
	done

AromaLadyBryonySeenText:
	text "Welcome to our"
	line "tower. We honor"
	cont "the hearts of"
	cont "#mon here."
	done

AromaLadyBryonyBeatenText:
	text "Respectable…"
	done

GenericTrainerAromaLadyRosa:
	generictrainer AROMA_LADY, ROSA, EVENT_BEAT_AROMA_LADY_ROSA, AromaLadyRosaSeenText, AromaLadyRosaBeatenText

	text "This tower is how"
	line "people learn to"
	cont "connect with"
	cont "#mon. How will"
	cont "they connect if"
	cont "it is gone?"
	done

AromaLadyRosaSeenText:
	text "Have you come to"
	line "see the Rainbow"
	cont "bird #mon?"
	done

AromaLadyRosaBeatenText:
	text "I see something"
	line "in you…"
	done

GenericTrainerAromaLadyPeony:
	generictrainer AROMA_LADY, PEONY, EVENT_BEAT_AROMA_LADY_PEONY, AromaLadyPeonySeenText, AromaLadyPeonyBeatenText

	text "A contribution can"
	line "be made by even"
	cont "the smallest"
	cont "Jigglypuff."
	done

AromaLadyPeonySeenText:
	text "We find dignity in"
	line "all #mon."
	cont "Do you?"
	done

AromaLadyPeonyBeatenText:
	text "You have great"
	line "trust in your"
	cont "#mon."
	done
