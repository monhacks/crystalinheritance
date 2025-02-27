ShelteredShores_MapScriptHeader: 
	def_scene_scripts


	def_callbacks
	callback MAPCALLBACK_TILES, ShelteredShoresOpenCallback

	def_warp_events
	warp_event 8, 17, SEAFLUX_NEXUS, 1
	warp_event 34, 19, SEAFLUX_NEXUS, 2
	warp_event 12, 37, SEAFLUX_NEXUS, 3
	warp_event 36, 43, SEAFLUX_NEXUS, 4


	def_coord_events



	def_bg_events



	def_object_events
; ADD A FEW ITEMS TODO
; ADD A FEW NOMAD_M TODO 
; ADD A FEW SAILORS? TODO 
	itemball_event 17, 17, REVIVE, 1, EVENT_SHORES_ITEM_1 ;ok
	itemball_event 17, 32, HYPER_POTION, 1, EVENT_SHORES_ITEM_2
	itemball_event 40, 38, MAX_REPEL, 1, EVENT_SHORES_ITEM_3 ;ok
	itemball_event 43, 16, PETAYA_BERRY, 1, EVENT_SHORES_ITEM_4

	object_const_def



StadiumGroundsFloodCallback:
	checkevent EVENT_BEAT_EUSINE ; need to open up the whirl islands so you don't black out and get stuck 
	iffalse .Done
	changeblock 12, 24, $35
	changeblock 36, 26, $35
	changeblock 10, 46, $35	
	changeblock 36, 50, $35
.Done:
	endcallback
	
	