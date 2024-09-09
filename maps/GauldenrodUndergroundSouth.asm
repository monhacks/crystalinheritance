GauldenrodUndergroundSouth_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, GAULDENROD, 6
	warp_event  3,  7, GAULDENROD, 6
	warp_event  3,  3, GAULDENROD_UNDERGROUND, 1


	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  4, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GauldenrodUndergroundSouthGateScript, EVENT_GAULDENROD_UNDERGROUND_MOVED

	object_const_def
	const GAULDENRODUNDERGROUNDSOUTH_OFFICER

GauldenrodUndergroundSouthGateScript:
	faceplayer
	opentext
	writetext GauldenrodUndergroundSouthGateText1
	waitbutton
	closetext
	applymovement GAULDENRODUNDERGROUNDSOUTH_OFFICER, GauldenrodUndergroundSouthGateMovement
	opentext
	writetext GauldenrodUndergroundSouthGateText2
	setevent EVENT_GAULDENROD_UNDERGROUND_MOVED
	waitbutton
	closetext
	end

GauldenrodUndergroundSouthGateMovement:
	step_up
	step_left
	turn_head_right
	step_end

GauldenrodUndergroundSouthGateText1:
	text "Nothing to see"
	line "here..."

	para "Oh, you're not a"
	line "brigader?"
	cont "Please pass."
	
	para "There are some"
	line "trainers digging"
	cont "a tunnel."
	done

GauldenrodUndergroundSouthGateText2:
	text "We dug this"
	line "in secret."
	done
