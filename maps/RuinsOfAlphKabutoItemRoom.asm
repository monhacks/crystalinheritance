RuinsOfAlphKabutoItemRoom_MapScriptHeader:
	def_scene_scripts ; this is the celebi room. 

	def_callbacks

	def_warp_events
	warp_event  3,  9, RUINS_OF_ALPH_KABUTO_WORD_ROOM, 3
	warp_event  4,  9, RUINS_OF_ALPH_KABUTO_WORD_ROOM, 4

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  5,  1, BGEVENT_JUMPTEXT, RuinsofAlphStatueText

	def_object_events
	itemball_event  2,  6, SITRUS_BERRY, 1, EVENT_PICKED_UP_SITRUS_BERRY_FROM_KABUTO_ITEM_ROOM
	itemball_event  5,  6, LUM_BERRY, 1, EVENT_PICKED_UP_LUM_BERRY_FROM_KABUTO_ITEM_ROOM
	itemball_event  2,  4, LIECHI_BERRY, 1, EVENT_PICKED_UP_HEAL_POWDER_FROM_KABUTO_ITEM_ROOM
	itemball_event  5,  4, PETAYA_BERRY, 1, EVENT_PICKED_UP_ENERGYPOWDER_FROM_KABUTO_ITEM_ROOM
