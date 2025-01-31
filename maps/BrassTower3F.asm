BrassTower3F_MapScriptHeader:
	def_scene_scripts


	def_callbacks
	callback MAPCALLBACK_TILES, BrassTower3FCallback

	def_warp_events
	warp_event 9, 3, BRASS_TOWER_2F, 3
	warp_event 2, 9, BRASS_TOWER_3F_WARP, 1
	warp_event 2, 4, BRASS_TOWER_4F, 1


	def_coord_events



	def_bg_events



	def_object_events



	object_const_def

BrassTower3FCallback:
	checkevent EVENT_BEAT_KENSEY_TOWER
	iffalse .Done
	changeblock 2, 4, $20
.Done:
	endcallback	
