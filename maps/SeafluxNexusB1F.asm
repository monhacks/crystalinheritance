SeafluxNexusB1F_MapScriptHeader:
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 23, 5, SEAFLUX_NEXUS, 9
	warp_event 9, 19, SEAFLUX_NEXUS, 10
	warp_event 26, 26, SEAFLUX_NEXUS_B2F, 1
	warp_event 3, 13, SEAFLUX_NEXUS_B2F, 2
;HOLES 
	warp_event 4, 9, SEAFLUX_NEXUS_B2F, 3
	warp_event 8, 13, SEAFLUX_NEXUS_B2F, 3

	def_coord_events


	def_bg_events


	def_object_events
;STRENGTHBOULDERS todo add the table, etc 
	strengthboulder_event 16, 11, 6, EVENT_NEXUS_B1F_BOULDER_1
	strengthboulder_event 10, 3,  5, EVENT_NEXUS_B1F_BOULDER_2
;ITEMS 

	object_const_def


