EmpiresExtent_MapScriptHeader:
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 6, 39, EMPIRES_EXTENT_CAVERN, 1
	warp_event 9, 49, EMPIRES_EXTENT_EERIE_HAMLET_GATE, 1
	warp_event 10, 49, EMPIRES_EXTENT_EERIE_HAMLET_GATE, 2


	def_coord_events



	def_bg_events
	bg_event 10, 44, BGEVENT_JUMPTEXT, ExtentSignText


	def_object_events
;a few hisuians who are going to join adrinna's army 
	object_event 0, 0, SPRITE_???, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, 0, ExtentNPCText1, -1
	object_event 0, 0, SPRITE_???, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, 0, ExtentNPCText2, -1
	object_event 0, 0, SPRITE_???, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, 0, ExtentNPCText3, -1
;items 
	itemball_event 0, 0, REVIVE, EXTENT_ITEM_1
	itemball_event 0, 0, FULL_RESTORE, EXTENT_ITEM_2
	itemball_event 0, 0, NUGGET, EXTENT_ITEM_3

	object_const_def


ExtentSignText:
	text "Imperial Mandate:"
	line "Mejimi's Ceremony"
	para "All citizens must"
	line "attend!"
	done
