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
	coord_event 10, 24, 0, Route43UrsalunaScene

	def_bg_events
	bg_event 13,  3, BGEVENT_JUMPTEXT, Route43Sign2Text
	bg_event 11, 49, BGEVENT_JUMPTEXT, Route43Sign2Text
	bg_event 16, 38, BGEVENT_JUMPTEXT, Route43TrainerTipsText

	def_object_events
	object_event  12,  20, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, H__URSALUNA, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_43_HURSALUNA 


	; officerf jamie, pokemaniac  larry, andrew, brent, sightseerm jaska, sightseerf rosie 
	object_event 0, 0,  SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSightseerFRosie, -1
	object_event 0, 0,  SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSightseerMJaska, -1
	object_event 0, 0,  SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPokemaniacBrent, -1
	object_event 0, 0,  SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPokemaniacAndrew, -1
	object_event 0, 0,  SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerPokemaniacLarry, -1	
	object_event  9,  47, SPRITE_OFFICERF, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerOfficerFJamie, -1
	fruittree_event  1, 26, FRUITTREE_ROUTE_43, LUM_BERRY, PAL_NPC_RED
	itemball_event 12, 32, MAX_ETHER, 1, EVENT_ROUTE_43_MAX_ETHER
	itemball_event  5, 15, ULTRA_BALL, 1, EVENT_ROUTE_43_ULTRA_BALL

	object_const_def
	const ROUTE_43_HURSALUNA



GenericTrainerOfficerFJamie:
	generictrainer OFFICERF, JAMIE, EVENT_BEAT_OFFICERF_JAMIE, .SeenText1, .BeatenText1

.BeatenText2:
	text "Carry on."
	line "But be careful,"
	para "I'm tracking a"
	line "powerful Ursaring"
	cont "that's stalking"
	cont "Mahogany Town."
	done

.SeenText1:
	text "Hey, kid! Should"
	line "you even be here?"
	done

Route43UrsalunaScene:
	pause 30
	showemote EMOTE_SHOCK, PLAYER, 10
	applymovement ROUTE_43_HURSALUNA, Route43HursalunaMove1
	cry URSARING
	earthquake 30
	applyonemovement PLAYER, fast_step_down
	applyonemovement PLAYER, fast_step_down
	pause 30
	disappear ROUTE_43_HURSALUNA
	setevent EVENT_ROUTE_43_HURSALUNA
	setscene $1
	end

Route43HursalunaMove1:
	fix_facing
	fast_jump_step_down
	step_end



Route43Sign2Text:
	text "Route 43"

	para "Danger:"
	line "Strong #mon"
	cont "found here"
	done

Route43TrainerTipsText:
	text "Silph Spr__gs"
	line "Check___ ga__"
	done
