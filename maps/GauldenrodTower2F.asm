GauldenrodTower2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7, 15, GAULDENROD_TOWER_1F, 3
	warp_event  7,  2, GAULDENROD_TOWER_3F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_SAGE_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSageFNAME1, -1
	object_event 10,  9, SPRITE_SAGE_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSageFNAME2, -1
	object_event  8,  5, SPRITE_SAGE_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSageFNAME3, -1

GenericTrainerSageFNAME1:
	generictrainer SAGE_F, NAME1, EVENT_BEAT_GAULDENROD_TOWER_2F_TRAINER_1, SageFNAME1SeenText, SageFNAME1BeatenText

	text "I don't see how"
	line "this tower could"
	cont "ever be demolished."
	done

SageFNAME1SeenText:
	text "Welcome to our"
	line "tower. We honor"
	cont "the hearts of"
	cont "#MON here."
	done

SageFNAME1BeatenText:
	text "Respectable…"
	done

GenericTrainerSageFNAME2:
	generictrainer SAGE_F, NAME2, EVENT_BEAT_GAULDENROD_TOWER_2F_TRAINER_2, SageFNAME2SeenText, SageFNAME2BeatenText

	text "This tower is how"
	line "people learn to"
	cont "connect with"
	cont "#MON. How will"
	cont "they connect if"
	cont "it is gone?"
	done

SageFNAME2SeenText:
	text "Have you come to"
	line "see the Rainbow"
	cont "bird #MON?"
	done

SageFNAME2BeatenText:
	text "I see something"
	line "in you…"
	done

GenericTrainerSageFNAME3:
	generictrainer SAGE_F, NAME3, EVENT_BEAT_GAULDENROD_TOWER_2F_TRAINER_3, SageFNAME3SeenText, SageFNAME3BeatenText

	text "A contribution can"
	line "be made by even"
	cont "the smallest"
	cont "JIGGLYPUFF."
	done

SageFNAME3SeenText:
	text "We find dignity in"
	line "all #MON. Do"
	cont "you?"
	done

SageFNAME3BeatenText:
	text "You have great"
	line "trust in your"
	cont "#MON."
	done
