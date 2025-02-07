BrassTower14F_MapScriptHeader: 
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 2, 1, BRASS_TOWER_17F, 4
	warp_event 0, 15, BRASS_TOWER_18F, 2

	def_coord_events



	def_bg_events



	def_object_events
	object_event  0, 0, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerElderHiroshi, -1 ; generous


	object_const_def

GenericTrainerElderHiroshi:
    generictrainer ELDER, HIROSHI, EVENT_BEAT_ELDER_HIROSHI, HiroshiSeenText, HiroshiBeatenText


HiroshiBeatenText:
	text "What goes around"
	line "will come around."
	done
	
HiroshiSeenText:
    text "Give yourself to"
	line "the emperor!"
    done
	