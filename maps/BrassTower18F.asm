BrassTower18F_MapScriptHeader: 
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 3,  3, BRASS_TOWER_17F, 3
	warp_event 6, 11, BRASS_TOWER_14F, 2


	def_coord_events



	def_bg_events



	def_object_events
; switch
; jolteon at 3, 9 
	object_event  0, 0, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerElderYoshi, -1 ; virtuous

	object_const_def


GenericTrainerElderYoshi:
    generictrainer ELDER, YOSHI, EVENT_BEAT_ELDER_YOSHI, YoshiSeenText, YoshiBeatenText

YoshiBeatenText:
	text "But who does he"
	line "follow?"	
	done
	
YoshiSeenText:
    text "We follow Mejimi,"
	line "our model of"
	cont "virtue!"
    done

