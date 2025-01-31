WhispersWay_MapScriptHeader: 
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 0, 0, WHISPERS_TAPESTRY_GATE, 1
	warp_event 0, 0, WHISPERS_TAPESTRY_GATE, 1

	def_coord_events



	def_bg_events
	bg_event 0, 0, BGEVENT_ITEM + FULL_RESTORE, EVENT_WISHERS_HIDDEN_FULL_RESTORE
	bg_event 0, 0, BGEVENT_ITEM + PETAYA_BERRY, EVENT_WISHERS_HIDDEN_BERRY_1
	bg_event  0, 0, BGEVENT_ITEM + SALAC_BERRY, EVENT_WISHERS_HIDDEN_BERRY_2
	bg_event  0, 0, BGEVENT_ITEM + BIG_NUGGET, EVENT_WISHERS_HIDDEN_BIG_NUGGET
	bg_event  0, 0, BGEVENT_ITEM + MAX_REVIVE, EVENT_WISHERS_HIDDEN_MAX_REVIVE
	bg_event  0, 0, BGEVENT_ITEM + MAX_REVIVE, EVENT_WISHERS_HIDDEN_MAX_REVIVE_2

	def_object_events
; kurt to battle you 


	object_const_def
