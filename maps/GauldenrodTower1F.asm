GauldenrodTower1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7, 15, GAULDENROD, 13
	warp_event  8, 15, GAULDENROD, 13
	warp_event  7,  2, GAULDENROD_TOWER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GauldenrodTower1FBrigader1Script, EVENT_BEAT_SANDRA
	object_event 10,  9, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GauldenrodTower1FBrigader2Script, EVENT_BEAT_SANDRA

GauldenrodTower1FBrigader1Script:
	jumptextfaceplayer GauldenrodTower1FBrigader1Text

GauldenrodTower1FBrigader1Text:
	text "The emperor says"
	line "we'll tear down"
	cont "this tower and"
	cont "build a steel one"
	cont "in its place."
	done

GauldenrodTower1FBrigader2Script:
	jumptextfaceplayer GauldenrodTower1FBrigader2Text

GauldenrodTower1FBrigader2Text:
	text "What are you"
	line "looking at?"
	cont "Scram, before"
	cont "the rest of us"
	cont "get here."
	done
