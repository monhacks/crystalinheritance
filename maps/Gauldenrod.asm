Gauldenrod_MapScriptHeader: ; TODO: ADD A WANTED POSTER FOR AMOS
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 10, 5, GAULDENROD_DORMS, 1
	warp_event 15, 9, GAULDENROD_STOCKROOM, 1
	warp_event 20, 7, GAULDENROD_GUILD, 1
	warp_event 25, 11, GAULDENROD_HOUSE, 1
	warp_event 8, 15, GAULDENROD_UNDERGROUND_SOUTH, 1
	warp_event 22, 15, GAULDENROD_UNDERGROUND_NORTH, 1
	warp_event 0, 9, GAULDENROD_SERENE_SPRINGS_GATE, 1
	warp_event 11, 0, GAULDENROD_TOWER_1F, 1

	def_coord_events

	def_bg_events
	bg_event 12, 2, BGEVENT_READ, GauldenrodTowerSign
	bg_event 18, 8, BGEVENT_READ, GauldenrodCitySign
	bg_event 21, 13, BGEVENT_READ, GauldenrodStadiumSign

	def_object_events
	object_event  5,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GauldenrodNPC1Script, -1
	object_event 12, 10, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GauldenrodBerrySalesmanScript, -1
	object_event 14, 10, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GauldenrodApricornSalesScript, -1
	object_event 13, 12, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GauldenrodTMSalesScript, -1
	object_event 16, 11, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GauldenrodHisuiTraderScript, -1
	object_event 19, 6, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GauldenrodNPC2Script, -1
	object_event  8, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GauldenrodNPC3Script, -1
	object_event 22,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_SLOW_RANDOM_WALK, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GauldenrodNPC4Script, -1
	object_event 17, 15, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GauldenrodNPC5Script, -1
	object_event  6, 11, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GauldenrodNPC6Script, -1
	object_event 24,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GauldenrodNPC7Script, -1
	object_event 13,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GauldenrodNPC8Script, -1

GauldenrodNPC1Script:
	jumptextfaceplayer GauldenrodNPC1Text

GauldenrodNPC1Text:
	text "We can buy so many"
	line "items now! So"
	cont "convenient."
	done

GauldenrodBerrySalesmanScript:
	jumptextfaceplayer GauldenrodBerrySalesmanText

GauldenrodBerrySalesmanText:
	text "Berries berries!"
	done

GauldenrodApricornSalesScript:
	jumptextfaceplayer GauldenrodApricornSalesText

GauldenrodApricornSalesText:
	text "Need an apricorn?"
	done

GauldenrodTMSalesScript:
	jumptextfaceplayer GauldenrodTMSalesText

GauldenrodTMSalesText:
	text "Upgrade your"
	line "battle prowess"
	cont "for the stadium?"
	done

GauldenrodHisuiTraderScript:
	jumptextfaceplayer GauldenrodHisuiTraderText

GauldenrodHisuiTraderText:
	text "Hello! Rare"
	line "#mon! Fresh"
	cont "from Hisui. Which"
	cont "one would you"
	cont "like?"
	done

GauldenrodNPC2Script:
	jumptextfaceplayer GauldenrodNPC2Text

GauldenrodNPC2Text:
	text "If you need some"
	line "food, they offer"
	cont "it at the stadium."
	cont "The emperor"
	cont "provides for us"
	cont "that way."
	done

GauldenrodNPC3Script:
	jumptextfaceplayer GauldenrodNPC3Text

GauldenrodNPC3Text:
	text "Check out the"
	line "bazaar. Traveling"
	cont "traders might have"
	cont "something new for"
	cont "sale."
	done

GauldenrodNPC4Script:
	jumptextfaceplayer GauldenrodNPC4Text

GauldenrodNPC4Text:
	text "I used to resent"
	line "the emperor taking"
	cont "over the city, but"
	cont "I appreciate the"
	cont "stadium."
	done

GauldenrodNPC5Script:
	jumptextfaceplayer GauldenrodNPC5Text

GauldenrodNPC5Text:
	text "The stadium is so"
	line "fun. Some trainer"
	cont "drones against the"
	cont "emperor, and then"
	cont "their #mon get"
	cont "stomped."
	done

GauldenrodNPC6Script:
	jumptextfaceplayer GauldenrodNPC6Text

GauldenrodNPC6Text:
	text "I stay away from"
	line "the stadium. It"
	cont "gets people so"
	cont "riled up."
	done

GauldenrodNPC7Script:
	jumptextfaceplayer GauldenrodNPC7Text

GauldenrodNPC7Text:
	text "I always forget my"
	line "worries watching"
	cont "some battles at"
	cont "the stadium."
	done

GauldenrodNPC8Script:
	jumptextfaceplayer GauldenrodNPC8Text

GauldenrodNPC8Text:
	text "The Tower has work"
	line "for all sorts of"
	cont "people. After my"
	cont "dad broke his leg,"
	cont "they gave him a"
	cont "job cleaning"
	cont "statues."
	done

GauldenrodTowerSign:
	jumptext GauldenrodTowerSignText

GauldenrodTowerSignText:
	text "Gauldenrod Tower"
	line "Reaching for the"
	cont "Sky"
	done

GauldenrodCitySign:
	jumptext GauldenrodCitySignText

GauldenrodCitySignText:
	text "Gauldenrod City"
	line "The Emperor's"
	cont "Jewel"
	done

GauldenrodStadiumSign:
	jumptext GauldenrodStadiumSignText

GauldenrodStadiumSignText:
	text "Gauldenrod Stadium"
	line "Where Legends"
	cont "are Born"
	done
