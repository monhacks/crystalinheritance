BrassTower15F_MapScriptHeader: 
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 0, 14, BRASS_TOWER_16F, 1
	warp_event 12, 12, BRASS_TOWER_16F, 2
	warp_event 6, 1, BRASS_TOWER_13F, 3 ; good 



	def_coord_events



	def_bg_events
;switch 


	def_object_events
	object_event  0, 0, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerElderAkira, -1 ; bright


	object_const_def

GenericTrainerElderAkira:
    generictrainer ELDER, AKIRA, EVENT_BEAT_ELDER_AKIRA, AkiraSeenText, AkiraBeatenText


AkiraBeatenText:
	text "Oh, but I sense a"
	line "stormcloud in"
	cont "Mejimi's heart..."
	done
	
AkiraSeenText:
    text "The emperor will"
	line "clear the sky, a"
	cont "bright new dawn!"
    done

