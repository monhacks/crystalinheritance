BrassTower17F_MapScriptHeader: 
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 13, 5, BRASS_TOWER_17F, 4
	warp_event 13, 9, BRASS_TOWER_17F, 5
	warp_event 2, 14, BRASS_TOWER_18F, 1
	warp_event 10, 15, BRASS_TOWER_14F, 1



	def_coord_events



	def_bg_events



	def_object_events
	object_event  0, 0, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerElderSatoru, -1 ; wise


	object_const_def


GenericTrainerElderSatoru:
    generictrainer ELDER, SATORU, EVENT_BEAT_ELDER_SATORU, SatoruSeenText, SatoruBeatenText


SatoruBeatenText:
	text "Hm, but why does"
	line "he act with such"
	cont "folly."	
	done
	
SatoruSeenText:
    text "Mejimi has the"
	line "wisdom of the"
	cont "ages!"	
    done
