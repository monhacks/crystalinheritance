ClastsCradle2F_MapScriptHeader: 
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 9, 3, CLASTS_CRADLE_3F, 2
	warp_event 17, 11, CLASTS_CRADLE_1F, 1

	def_coord_events



	def_bg_events



	def_object_events
; switch at 17, 6 changeds block at 16, 8 to $C9 and 4, 8 to $B9
 ;check which sound effects would be best? 
	tmhmball_event 9, 6, TM_EXPLOSION, EVENT_GOT_TM_EXPLOSION
; ENGINEERS FACE AWAY FROM YOU BUT WILL BATTLE YOU 
	object_event  16,  6, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPokefanMRobert, -1

	object_const_def
