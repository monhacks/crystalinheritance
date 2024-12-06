Route39_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  1,  3, ROUTE_39_BARN, 1
	warp_event  5,  3, ROUTE_39_FARMHOUSE, 1

	def_coord_events

	def_bg_events
	bg_event  5, 31, BGEVENT_JUMPTEXT, Route39TrainerTipsText
	bg_event  9,  5, BGEVENT_JUMPTEXT, MoomooFarmSignText
	bg_event 15,  7, BGEVENT_JUMPTEXT, Route39SignText
	bg_event  5, 13, BGEVENT_ITEM + NUGGET, EVENT_ROUTE_39_HIDDEN_NUGGET

	def_object_events
	pokemon_event  3, 12, MILTANK, -1, -1, PAL_NPC_RED, Route39MiltankText, -1
	pokemon_event  6, 11, MILTANK, -1, -1, PAL_NPC_RED, Route39MiltankText, -1
	pokemon_event  4, 15, MILTANK, -1, -1, PAL_NPC_RED, Route39MiltankText, -1
	pokemon_event  8, 13, MILTANK, -1, -1, PAL_NPC_RED, Route39MiltankText, -1
	fruittree_event  9,  3, FRUITTREE_ROUTE_39, CHESTO_BERRY, PAL_NPC_PURPLE

	object_const_def


Route39SignText:
	text "Route 39"

	para "Olivine City -"
	line "Ecruteak City"
	done

MoomooFarmSignText:
	text "Moomoo Farm"

	para "Enjoy Our Fresh"
	line "and Tasty Milk"
	done

Route39TrainerTipsText:
	text "Trainer Tips"

	para "Use Headbutt on"
	line "trees to shake"
	cont "#mon out."

	para "Different kinds of"
	line "#mon drop out"
	cont "of trees."

	para "Use Headbutt on"
	line "any tree you see!"
	done

Route39MiltankText:
	text "Miltank: Moo!"
	done
	
	