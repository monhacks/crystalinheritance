SeafluxNexusB2F_MapScriptHeader:
	def_scene_scripts
; REVISE THE MAP SO THAT THERE IS WATERFALLS PUSHING YOU BACK TO THE CENTRAL WARP UNTIL YOU GET BOTH OF THEM 


	def_callbacks
	;CALLBACKS BASED ON EVENT_NEXUS_B1F_BOULDER_1, EVENT_NEXUS_B1F_BOULDER_2
	; solving the strength puzzles lets you access the fifth 

	def_warp_events
	warp_event 17, 19, SEAFLUX_NEXUS_B1F, 3
	warp_event 9, 31, SEAFLUX_NEXUS_B1F, 4
; hole drop 
	warp_event 17, 19, SEAFLUX_NEXUS_B2F, 1 ; hole drops and the stairs 
	warp_event 20, 3, SEAFLUX_NEXT_B3F, 2 ; FROM THE TOP OF THE WATEFALL 
; northeast warp comes from the north warp from b3f


	def_coord_events


	def_bg_events


	def_object_events



	object_const_def