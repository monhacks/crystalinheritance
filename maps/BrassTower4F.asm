BrassTower4F_MapScriptHeader: 
	def_scene_scripts


	def_callbacks
	callback MAPCALLBACK_TILES, BrassTower4FCallback

	def_warp_events
	warp_event 9, 3, BRASS_TOWER_3F, 3
	warp_event 2, 9, BRASS_TOWER_4F_WARP, 1
	warp_event 2, 4, BRASS_TOWER_ROOF, 1


	def_coord_events



	def_bg_events



	def_object_events



	object_const_def


BrassTower4FCallback:
	checkevent EVENT_BEAT_ADRINNA_TOWER
	iffalse .Done
	changeblock 2, 4, $20
.Done:
	endcallback	
