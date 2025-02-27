ClastsCradle3F_MapScriptHeader: 
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 5, 7, SULFUR_STY, 3
	warp_event 5, 5, CLASTS_CRADLE_2F, 1


	def_coord_events



	def_bg_events



	def_object_events
	; AMOS heals you 
	object_event 3, 3, SPRITE_AMOS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, 0, AmosScript, EVENT_BEAT_ADRINNA_MINE


	object_const_def
