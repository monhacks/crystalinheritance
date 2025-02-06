SeafluxNexusB2F_MapScriptHeader:
	def_scene_scripts
; REVISE THE MAP SO THAT THERE IS WATERFALLS PUSHING YOU BACK TO THE CENTRAL WARP UNTIL YOU GET BOTH OF THEM 


	def_callbacks
	;CALLBACKS BASED ON EVENT_NEXUS_B1F_BOULDER_1, EVENT_NEXUS_B1F_BOULDER_2
	; solving the strength puzzles lets you access the fifth 

	def_warp_events
	warp_event 17, 21, SEAFLUX_NEXUS_B1F, 3 ; ladder 
	warp_event 9, 31, SEAFLUX_NEXUS_B1F, 4
; hole drop 
	warp_event 7, 27, SEAFLUX_NEXT_B3F, 1 ; to the bottom of the waterfall 
; northeast warp comes from the north warp from b3f


	def_coord_events


	def_bg_events


	def_object_events ; TODO, PLACE AND SET EVENTS PROPERLY 
	itemball_event 12, 25, GEODE, 1, EVENT_NEXUSB1F_HYPER_POTION
	itemball_event 12, 25, JEZE_BALL, 1, EVENT_NEXUSB1F_HYPER_POTION
	itemball_event 12, 25, CALCIUM, 1, EVENT_NEXUSB1F_HYPER_POTION
	itemball_event 12, 25, IRON, 1, EVENT_NEXUSB1F_HYPER_POTION
	itemball_event 12, 25, ZINC, 1, EVENT_NEXUSB1F_HYPER_POTION
	itemball_event 12, 25, HP_UP, 1, EVENT_NEXUSB1F_HYPER_POTION


	object_const_def