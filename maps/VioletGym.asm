VioletGym_MapScriptHeader:
	def_scene_scripts


	def_callbacks

	def_warp_events
	warp_event  4, 15, VIOLET_CITY, 2
	warp_event  5, 15, VIOLET_CITY, 2

	def_coord_events

	def_bg_events
;	bg_event  3, 13, BGEVENT_READ, VioletGymStatue
;	bg_event  6, 13, BGEVENT_READ, VioletGymStatue

	def_object_events
	object_event  4,  2, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, jumptextfaceplayer, VioletGymPryceText, -1

	object_const_def

VioletGymPryceText:
	text "Johto's Gyms once"
	line "shared wisdom like"
	cont "trees share fruit."

	para "Now Falkner hides"
	line "behind walls, his"
	cont "weather machines"
	cont "a smokescreen."

	para "He mystifies with"
	line "technology, when"
	cont "he should illumin-"
	cont "ate with knowledge."

	para "A Gym's strength"
	line "lies in nurturing"
	cont "trainers, not in"
	cont "baffling them."

	para "I hoped to remind"
	line "him, but his tower"
	cont "stands between us."

	done
