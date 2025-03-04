ClastsCradleB1F_MapScriptHeader: 
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 3, 3, CLASTS_CRADLE_1F, 2
; HOLE DROP 
	warp_event 12, 7, CLASTS_CRADLE_1F, 2


	def_coord_events
	coord_event 21, 12, CradleScene1_Mejimi, 0; first scene
	coord_event  5, 26, CradleScene2_Heatran, 0; first scene

	def_bg_events



	def_object_events
; cutscene 1 objects
	object_event 21, 8, ADRINNA 
	object_event 22, 8, BRIGADER 
	object_event 27, 14, MEJIMI 
; CUTSCENE 2
	object_event   5,  17, SPRITE_ADRINNA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPokefanMRobert, EVENT_BEAT_ADRINNA_MINE
	object_event   5,  15, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, HEATRAN, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EnteiCavernScript, EVENT_FOUGHT_ENTEI
; KURT TO HEAL YOU 
	object_event   5,  17, SPRITE_KURT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPokefanMRobert, EVENT_BEAT_ADRINNA_MINE
; TRAINERS
	object_event  16,  6, SPRITE_BRIGADER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPokefanMRobert, EVENT_BEAT_ADRINNA_MINE
	object_event  22,  20, SPRITE_BRIGADER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPokefanMRobert, EVENT_BEAT_ADRINNA_MINE
	object_event  17,  24, SPRITE_BRIGADER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPokefanMRobert, EVENT_BEAT_ADRINNA_MINE

	tmhmball_event 25, 23, TM_FOCUS_BLAST, EVENT_GOT_TM_FOCUS_BLAST 


	object_const_def


; SQUARES OF 14, 6; 14, 26;  TURN INTO $5D DEPENDING ON EVENT_CRADLE_BOULDER_1,  _3
; SQUARES OF 18, 14;  TURN INTO $5F DEPENDING ON EVENT_CRADLE_BOULDER_2