HoltCoastGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 4, 0, HOLLYS_HOLT, 1
	warp_event 5, 0, HOLLYS_HOLT, 2
	warp_event 4, 7, CALM_COAST, 1
	warp_event 5, 7, CALM_COAST, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 3, 4, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, HoltCoastGateNPCScript, -1

HoltCoastGateNPCScript:
	jumptextfaceplayer HoltCoastGateNPCText

HoltCoastGateNPCText:
	text "I've heard stories"
	line "about the emperor's"
	cont "brigaders."

	para "They say they're"
	line "keeping order in"
	cont "other towns."

	para "I wonder when"
	line "they'll come to"
	cont "Anarres Town?"
	done
