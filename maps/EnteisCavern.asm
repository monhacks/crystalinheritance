EnteisCavern_MapScriptHeader: ;	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 11, 17,  ROUTE_42, 1


	def_coord_events



	def_bg_events



	def_object_events
	object_event  10, 5, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, ENTEI, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EnteiCavernScript, EVENT_FOUGHT_ENTEI


	object_const_def
	const ENTEIS_CAVERN_ENTEI

TinTowerHoOh:
	opentext
	writetext EnteiText
	cry HO_OH
	pause 15
	closetext
	setevent EVENT_FOUGHT_ENTEI
	loadvar VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	loadwildmon HO_OH, 50
	startbattle
	disappear TINTOWERROOF_HO_OH
	reloadmapafterbattle
	end

EnteiText:
	text "Errruuu!"
	done
