AnarresTown_MapScriptHeader: 
	def_scene_scripts


	def_callbacks
	callback MAPCALLBACK_NEWMAP, AnarresTownFlypointCallback

	def_warp_events
	warp_event  2, 10, ANARRES_HOLT_GATE, 1 ;DONE
	warp_event  2, 11, ANARRES_HOLT_GATE, 2 ;DONE
	warp_event  9,  3, ANARRES_HOUSE, 1 ;DONE
	warp_event 21, 15, ANARRES_CHARCOAL_KILN, 1 ;DONE
	warp_event 11, 13, ANARRES_TOWER_1F, 1
	warp_event 17, 9, ANARRES_DORMS, 1 ;DONE
	warp_event 21, 5, ANARRES_STOCKROOM, 1 ;DONE
	warp_event 30, 9, MISTY_BASIN, 1

	def_coord_events


	def_bg_events
	bg_event 27,  5, BGEVENT_ITEM + ETHER, EVENT_ANARRES_ETHER ;ok
	bg_event 28, 10, BGEVENT_ITEM + PP_UP, EVENT_ANARRES_PPUP ;ok
	bg_event 13, 15, BGEVENT_JUMPTEXT, AnarresTowerSignText
	bg_event 22,  6, BGEVENT_JUMPTEXT, AnarresStockroomSignText
	bg_event 16, 10, BGEVENT_JUMPTEXT, AnarresDormsSignText

	def_object_events
	object_event  5,  9, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AnarresNPC1Text, -1 
	object_event 17, 14, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AnarresNPC2Text, -1 
	object_event 12,  6, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AnarresNPC3Text, -1 
	object_event 15, 13, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AnarresNPC4Text, -1 
	object_event 11, 15, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AnarresNPC5Text, EVENT_BEAT_TAMMY
	fruittree_event  6,  3, FRUITTREE_AZALEA_TOWN, PNK_APRICORN, PAL_NPC_RED

	object_const_def



AnarresTownFlypointCallback:
	setflag ENGINE_FLYPOINT_ANARRES 
	endcallback


AnarresNPC1Text:
	text "Elder Hollis"
	line "strictly"
	cont "controls how"
	cont "much is cut. To"
	cont "cut down a tree"
	cont "you must ask"
	cont "permission."
	done

AnarresNPC2Text:
	text "We work from"
	line "sunrise until"
	cont "noon, when it"
	cont "gets too hot."
	done

AnarresNPC3Text:
	text "The new guy from"
	line "the coast asked"
	cont"me for dinner."
	
	para "But his breath"
	line "smells so bad!"
	
	para "I would not"
	line "have an appetite."
	done

AnarresNPC4Text:
	text "North of here"
	line "they have their"
	cont "own temple, and"
	cont "honor their"
	cont "local ecology."
	done

AnarresNPC5Text:
	text "Hollis closed"
	line "the temple. He's"
	cont "worried about"
	cont "how some people"
	cont "are planning to"
	cont "address the"
	cont "problem in the"
	cont "forest."
	done 

AnarresTowerSignText:
	text "Anarres Tower"
	line "honors all types"
	cont "of #mon"
	done

AnarresStockroomSignText:
	text "Anarres Stockroom"
	done

AnarresDormsSignText:
	text "Anarres Dorms"
	done	
