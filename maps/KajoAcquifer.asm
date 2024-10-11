KajoAcquifer_MapScriptHeader: ;	def_scene_scripts
	def_scene_scripts

	def_callbacks


	def_warp_events
    warp_event 5, 7, ROUTE_KAJO, 3
    warp_event 13, 15, ROUTE_KAJO, 4 ; this one doesn't work?


	def_coord_events



	def_bg_events



	def_object_events
	itemball_event 11,  2, REVIVE, 1, EVENT_KAJO_REVIVE ;ok
	itemball_event 13,  5, SUPER_POTION, 1, EVENT_KAJO_POTION ;ok
	itemball_event  3, 12, ODD_SOUVENIR, 1, EVENT_KAJO_SOUVENIR ;ok

	object_const_def

