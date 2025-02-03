WhirlIsland1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  3, WHIRL_ISLAND_NW, 2 ; ok 
	warp_event 15, 13, WHIRL_ISLAND_NE, 2 ; ok
	warp_event  7, 23, WHIRL_ISLAND_SW, 2 ; ok 
	warp_event 23, 23, WHIRL_ISLAND_SE, 2 ; ok 
	warp_event 21, 11, WHIRL_ISLAND_B1F, 1
	warp_event 11,  5, WHIRL_ISLAND_B1F, 2
	warp_event 25, 13, WHIRL_ISLAND_B1F, 3
	warp_event  5, 19, WHIRL_ISLAND_B1F, 4

	def_coord_events

	def_bg_events
	bg_event 26, 24, BGEVENT_ITEM + GEODE, EVENT_WHIRL_ISLAND_B1F_HIDDEN_RARE_CANDY
	bg_event  6, 12, BGEVENT_ITEM + ULTRA_BALL, EVENT_WHIRL_ISLAND_B1F_HIDDEN_ULTRA_BALL
	bg_event 22,  6, BGEVENT_ITEM + FULL_RESTORE, EVENT_WHIRL_ISLAND_B1F_HIDDEN_FULL_RESTORE

	def_object_events
	itemball_event 15, 18, FULL_RESTORE, 1, EVENT_WHIRL_ISLAND_B1F_FULL_RESTORE
	itemball_event 21, 26, CARBOS, 1, EVENT_WHIRL_ISLAND_B1F_CARBOS
	itemball_event 13,  5, CALCIUM, 1, EVENT_WHIRL_ISLAND_B1F_CALCIUM
	itemball_event 12, 23, BIG_NUGGET, 1, EVENT_WHIRL_ISLAND_B1F_BIG_NUGGET
	itemball_event 15, 16, ESCAPE_ROPE, 1, EVENT_WHIRL_ISLAND_B1F_ESCAPE_ROPE
;	strengthboulder_event 23, 26
