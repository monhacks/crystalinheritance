VioletGym_MapScriptHeader:
	def_scene_scripts


	def_callbacks

	def_warp_events
	warp_event  4, 15, VIOLET_CITY, 2
	warp_event  5, 15, VIOLET_CITY, 2

	def_coord_events

	def_bg_events


	def_object_events
	object_event  4,  2, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletGymPryceText, EVENT_BEAT_FALKNER  

	object_const_def

VioletGymPryceText:
	text "Johto's Gyms once"
	line "shared wisdom like"
	cont "fruitful trees."

	para "Now Falkner hides"
	line "behind walls."

	para "A Gym's strength"
	line "lies in nurturing"
	cont "trainers, not in"
	cont "baffling them."

	para "I hoped to remind"
	line "him, but he would"
	cont "rather rule over"
	para "sand than admit"
	line "his mistakes."
	
	para "Doesn't he know,"
	line "sand makes a bad"
	cont "foundation."

	done
