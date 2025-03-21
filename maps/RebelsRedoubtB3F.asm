RebelsRedoubtB3F_MapScriptHeader: 
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 3, 7, REBELS_REDOUBT_B2F, 2
	warp_event 21, 15, REBELS_REDOUBT_B2F, 3
	warp_event 27, 7, REBELS_REDOUBT_B2F, 4
;holes 
	warp_event 15, 2, REBELS_REDOUBT_B2F, 5
	warp_event 16, 2, REBELS_REDOUBT_B2F, 5


	def_coord_events



	def_bg_events



	def_object_events
	object_event 22, 11, SPRITE_HOLLIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 1, RedoubtHollisScript, EVENT_BEAT_AMOS
	object_event 19, 11, SPRITE_SANDRA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, RedoubtSandraScript, EVENT_BEAT_AMOS
	object_event  8,  7, SPRITE_BARBEAU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, RedoubtBarbeauScript, EVENT_BEAT_AMOS
	itemball_event 2, 15, MAX_POTION, 1, EVENT_REDOUBT_ITEM_3
	itemball_event 13, 15, ELIXIR, 1, EVENT_REDOUBT_ITEM_4
	itemball_event 15, 11, FULL_RESTORE, 1, EVENT_REDOUBT_ITEM_5

	object_const_def


