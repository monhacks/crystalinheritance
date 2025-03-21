RebelsRedoubtB1F_MapScriptHeader: 
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 27, 3, REBELS_REDOUBT_1F, 3
	warp_event  4, 15, REBELS_REDOUBT_1F, 3 ; WARP 
	warp_event  2, 14, REBELS_REDOUBT_B2F, 1

	def_coord_events



	def_bg_events



	def_object_events
	object_event 23,  1, SPRITE_NINJA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerNinja7, EVENT_BEAT_AMOS;veil
	object_event 25, 15, SPRITE_NINJA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerNinja8, EVENT_BEAT_AMOS;shade 
	object_event  7, 15, SPRITE_NINJA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerNinja9, EVENT_BEAT_AMOS;haze 
	itemball_event 11, 7, MAX_POTION, 1, EVENT_REDOUBT_ITEM_1
	itemball_event 16, 9, LUM_BERRY, 3, EVENT_REDOUBT_ITEM_2


	object_const_def


GenericTrainerNinja7: ; 
	generictrainer NINJA, NINJA7, EVENT_BEAT_NINJA7, .SeenText7, .BeatenText7

.BeatenText7:
	text "..."
	done

.SeenText7:
	text "..."
	done

GenericTrainerNinja8: ; 
	generictrainer NINJA, NINJA8, EVENT_BEAT_NINJA8, .SeenText8, .BeatenText8

.BeatenText8:
	text "..."
	done

.SeenText8:
	text "..."
	done
	
GenericTrainerNinja9: ; 
	generictrainer NINJA, NINJA9, EVENT_BEAT_NINJA9, .SeenText9, .BeatenText9

.BeatenText9:
	text "..."
	done

.SeenText9:
	text "..."
	done
