GauldenrodSereneSpringsGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  0, GAULDENROD, 7
	warp_event  5,  0, GAULDENROD, 7
	warp_event  4,  7, SERENE_SPRINGS, 1
	warp_event  5,  7, SERENE_SPRINGS, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GauldenrodSereneSpringsGateNPCScript, -1

GauldenrodSereneSpringsGateNPCScript:
	jumptextfaceplayer GauldenrodSereneSpringsGateNPCText

GauldenrodSereneSpringsGateNPCText:
	text "Did you know there's"
	line "an old myth about"
	cont "the Serene Springs"
	cont "just ahead?"

	para "They say that when-"
	line "ever there's seis-"
	cont "mic activity in"
	cont "the area, the"
	cont "springs bubble up"
	cont "more vigorously."

	para "Some believe it's"
	line "the earth's way of"
	cont "relieving pressure."

	para "Others think it's"
	line "caused by ancient"
	cont "#mon stirring"
	cont "deep underground."

	para "Whatever the cause,"
	line "it's a fascinating"
	cont "phenomenon!"
	done
