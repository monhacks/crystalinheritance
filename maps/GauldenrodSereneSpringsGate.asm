GauldenrodSereneSpringsGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, GAULDENROD, 7
	warp_event  3,  7, GAULDENROD, 8
	warp_event  2,  0, SERENE_SPRINGS, 1
	warp_event  3,  0, SERENE_SPRINGS, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  4, SPRITE_VETERAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GauldenrodSereneSpringsGateNPCScript, -1

GauldenrodSereneSpringsGateNPCScript:
	jumptextfaceplayer GauldenrodSereneSpringsGateNPCText

GauldenrodSereneSpringsGateNPCText:
	text "Did you know an"
	line "old myth about"
	cont "Serene Springs?"

	para "They say when"
	line "there's seismic"
	cont "activity nearby,"

	para "the springs bubble"
	line "up more strongly."

	para "Some think it's"
	line "Earth relieving"
	cont "pressure."

	para "Others say it's"
	line "ancient #mon"
	cont "stirring deep"
	cont "underground."

	para "..."

	para "Say, I think I"
	line "smell sulfur."
	done
