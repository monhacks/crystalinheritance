AnarresHoltGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 4, 0, ANARRES_TOWN, 0
	warp_event 5, 0, ANARRES_TOWN, 0
	warp_event 4, 7, HOLLYS_HOLT, 0
	warp_event 5, 7, HOLLYS_HOLT, 0

	def_coord_events

	def_bg_events

	def_object_events
	object_event 3, 4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AnarresHoltGateNPCScript, -1

AnarresHoltGateNPCScript:
	jumptextfaceplayer AnarresHoltGateNPCText

AnarresHoltGateNPCText:
	text "When the Hisuians"
	line "visited, they"
	cont "brought the most"
	cont "incredible"
	cont "#MON!"

	para "I saw one that"
	line "looked like a"
	cont "Voltorb, but made"
	cont "of wood!"

	para "I wonder what"
	line "other amazing"
	cont "#MON exist in"
	cont "far-off regions?"
	done
