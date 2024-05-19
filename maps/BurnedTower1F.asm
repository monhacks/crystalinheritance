BurnedTower1F_MapScriptHeader:
	def_scene_scripts
	

	def_callbacks


	def_warp_events
	warp_event  7, 15, ECRUTEAK_CITY, 13
	warp_event  8, 15, ECRUTEAK_CITY, 13
	warp_event  8,  9, BURNED_TOWER_B1F, 1
	warp_event  5, 15, BURNED_TOWER_B1F, 2

	def_coord_events

	def_bg_events
	bg_event  6,  7, BGEVENT_ITEM + ETHER, EVENT_BURNED_TOWER_1F_HIDDEN_ETHER
	bg_event 11, 11, BGEVENT_ITEM + ULTRA_BALL, EVENT_BURNED_TOWER_1F_HIDDEN_ULTRA_BALL

	def_object_events
	smashrock_event 13, 4
	itemball_event 13,  1, HP_UP, 1, EVENT_BURNED_TOWER_1F_HP_UP

	object_const_def

