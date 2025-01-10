TinTowerOld1F_MapScriptHeader: ;	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 7, 15, WESTERN_CAPITAL, 9
	warp_event 8, 15, WESTERN_CAPITAL, 9
	warp_event 8, 3, TIN_TOWER_OLD_3F, 1
	warp_event 2, 12, TIN_TOWER_OLD_2F, 1
	warp_event 2, 3, TIN_TOWER_OLD_2F, 2	


	def_coord_events



	def_bg_events



	def_object_events
	object_event 7, 12, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, TinTowerOld1FNPC1Text, EVENT_WESTERN_CAPITAL_CIVILIAN ; done
	object_event 11, 12, SPRITE_SAGE, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, TinTowerOld1FNPC2Text, EVENT_WESTERN_CAPITAL_CIVILIAN ; done
	object_event 13, 2, SPRITE_GRANNY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, TinTowerOld1FNPC3Text, EVENT_WESTERN_CAPITAL_CIVILIAN ; done

	object_const_def


TinTowerOld1FNPC1Text:
	text "This tower was"
	line "modernized with"
	cont "metals thanks to"
	cont "Hisui crafters."
	done

TinTowerOld1FNPC2Text:
	text "The towers are a"
	line "veritable maze"
	cont "from Samsara's"
	cont "#mon powers."
	done

TinTowerOld1FNPC3Text:
	text "Samsara is the"
	line "chief priestess."
	
	para "She determines "
	line "who is worthy"
	cont "to cross the"
	cont "Capital's moat."
	done
