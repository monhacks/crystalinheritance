Gauldenrod_MapScriptHeader: ; TODO: ADD A WANTED POSTER FOR AMOS
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 18, 27, GAULDENROD_DORMS, 1
	warp_event 27, 13, GAULDENROD_STOCKROOM, 1
	warp_event 28, 7, GAULDENROD_GUILD, 1
	warp_event  9, 31, GAULDENROD_HOUSE, 1  ; TRADE QUEST
	warp_event 11, 25, GAULDENROD_UNDERGROUND_SOUTH, 1
	warp_event 13,  7, GAULDENROD_UNDERGROUND_NORTH, 1
	warp_event 23, 3, GAULDENROD_SERENE_SPRINGS_GATE, 1
	warp_event 24, 3, GAULDENROD_SERENE_SPRINGS_GATE, 2
	warp_event  9, 15, GAULDENROD_TOWER_1F, 1

	def_coord_events

	def_bg_events
	bg_event 15, 15, BGEVENT_READ, GauldenrodTowerSign
	bg_event 26, 16, BGEVENT_READ, GauldenrodCitySign
	bg_event 28, 22, BGEVENT_READ, GauldenrodBazaarSign
	bg_event 21, 31, BGEVENT_READ, AmosWantedSign
	bg_event 32,  6, BGEVENT_READ, GauldenrodGuildSign

	def_object_events
	object_event 24, 22, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GauldenrodNPC1Script, -1
	
	object_event 31, 25, SPRITE_VETERAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GauldenrodBerrySalesmanScript, -1
	object_event 31, 20, SPRITE_VETERAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GauldenrodApricornSalesScript, -1
	object_event 34, 22, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GauldenrodTMSalesScript, -1
	object_event 28, 20, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GauldenrodHisuiTraderScript, -1

	mart_clerk_event  31, 25, MARTTYPE_STANDARD, MART_GAULDENROD_1	
	mart_clerk_event  31, 20, MARTTYPE_STANDARD, MART_GAULDENROD_2	
	mart_clerk_event  34, 22, MARTTYPE_STANDARD, MART_GAULDENROD_3	
	
	object_event 23, 6, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GauldenrodNPC2Script, -1
	object_event 23, 29, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GauldenrodNPC3Script, -1
	object_event 17,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_SLOW_RANDOM_WALK, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GauldenrodNPC4Script, -1
	object_event 23, 12, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GauldenrodNPC5Script, -1
	object_event 13,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GauldenrodNPC6Script, -1
	object_event 19, 17, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GauldenrodNPC7Script, -1
	object_event 12, 17, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GauldenrodNPC8Script, -1
	fruittree_event  36, 7, FRUITTREE_GAULDENROD, RADIANT_OPAL, PAL_NPC_RED
	object_event 22, 4, SPRITE_BRIGADER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BrigaderScript, EVENT_BEAT_SANDRA
	object_event 25, 4, SPRITE_BRIGADER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BrigaderScript, EVENT_BEAT_SANDRA

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
	refreshscreen
	trainerpic BOBESH
	waitbutton
	closepokepic
	jumpthistext

	text "Gauldenrod City"
	line "Overseen by"
	cont "General Bobesh"
	done

GauldenrodBazaarSign:
	jumptext GauldenrodBazaarSignText

GauldenrodBazaarSignText:
	text "Gauldenrod Bazaar"
	done

AmosWantedSign:
	refreshscreen
	trainerpic AMOS
	waitbutton
	closepokepic
	jumpthistext

	text "WANTED: This man"
	line "is wanted for"
	cont "crimes against"
	cont "the emperor."

	para "If you see him,"
	line "please notify a"
	cont "brigader"
	cont "immediately."

	para "Known alias:"
	line "Amos."
	done

GauldenrodGuildSign:
	text "Gauldenrod Guild"
	line "What's old is"
	cont "new again"
	done

BrigaderScript:
	jumptextfaceplayer GauldenrodBrigaderText
	
GauldenrodBrigaderText:
	text "Stay out of"
	line "trouble."
