RebelsRedoubtB2F_MapScriptHeader: 
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 2, 14, REBELS_REDOUBT_B1F, 3 
	warp_event 3, 7, REBELS_REDOUBT_B3F, 1
	warp_event 21, 15, REBELS_REDOUBT_B3F, 2
	warp_event 27, 7, REBELS_REDOUBT_B3F, 3
;HOLES 
	warp_event 14, 1, REBELS_REDOUBT_B3F, 4
	warp_event 15, 1, REBELS_REDOUBT_B3F, 5


	def_coord_events



	def_bg_events



	def_object_events
	object_event  0,  0, SPRITE_NINJA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerNinja10, EVENT_BEAT_AMOS;wraith
	object_event  0,  0, SPRITE_NINJA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerNinja11, EVENT_BEAT_AMOS;vapor
	object_event  0,  0, SPRITE_NINJA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerNinja12, EVENT_BEAT_AMOS;mirage



	object_const_def

GenericTrainerNinja10: ; 
	generictrainer NINJA, NINJA10, EVENT_BEAT_NINJA10, .SeenText10, .BeatenText10

.BeatenText10:
	text "..."
	done

.SeenText10:
	text "..."
	done

GenericTrainerNinja11: ; 
	generictrainer NINJA, NINJA11, EVENT_BEAT_NINJA11, .SeenText11, .BeatenText11

.BeatenText11:
	text "..."
	done

.SeenText11:
	text "..."
	done
	
GenericTrainerNinja12: ; 
	generictrainer NINJA, NINJA12, EVENT_BEAT_NINJA12, .SeenText12, .BeatenText12

.BeatenText12:
	text "..."
	done

.SeenText12:
	text "..."
	done