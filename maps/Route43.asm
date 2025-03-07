Route43_MapScriptHeader:
	def_scene_scripts

	def_callbacks


	def_warp_events
	warp_event  9, 51, ROUTE_43_MAHOGANY_GATE, 1
	warp_event 10, 51, ROUTE_43_MAHOGANY_GATE, 2
	warp_event 17, 35, ROUTE_43_GATE, 3
	warp_event 17, 31, ROUTE_43_GATE, 1
	warp_event 18, 31, ROUTE_43_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 13,  3, BGEVENT_JUMPTEXT, Route43Sign1Text
	bg_event 11, 49, BGEVENT_JUMPTEXT, Route43Sign2Text
	bg_event 16, 38, BGEVENT_JUMPTEXT, Route43TrainerTipsText

	def_object_events
	; officerf jamie, pokemaniac  larry, andrew, brent, sightseerm jaska, sightseerf rosie 
	object_event 13,  5, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPokemaniacBen, -1
	fruittree_event  1, 26, FRUITTREE_ROUTE_43, LUM_BERRY, PAL_NPC_RED
	itemball_event 12, 32, MAX_ETHER, 1, EVENT_ROUTE_43_MAX_ETHER

	object_const_def


Route43Sign1Text:
	text "Route 43"

	para "Lake of Rage -"
	line "Mahogany Town"
	done

Route43Sign2Text:
	text "Route 43"

	para "Lake of Rage -"
	line "Mahogany Town"
	done

Route43TrainerTipsText:
	text "Trainer Tips"

	para "All #mon have"
	line "pros and cons"

	para "depending on their"
	line "types."

	para "If their types"
	line "differ, a higher-"

	para "level #mon may"
	line "lose in battle."

	para "Learn which types"
	line "are strong and"

	para "weak against your"
	line "#mon's type."
	done
