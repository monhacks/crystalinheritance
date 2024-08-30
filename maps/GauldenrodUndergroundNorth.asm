GauldenrodUndergroundNorth_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  2, GAULDENROD, 9
	warp_event  6,  2, GAULDENROD, 9
	warp_event  5, 14, GAULDENROD_UNDERGROUND, 1
	warp_event  6, 14, GAULDENROD_UNDERGROUND, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GauldenrodUndergroundNorthGateScript, -1

	object_const_def
	const GAULDENRODUNDERGROUNDNORTH_OFFICER

GauldenrodUndergroundNorthGateScript:
	faceplayer
	opentext
	writetext GauldenrodUndergroundNorthGateText1
	waitbutton
	closetext
	applymovement GAULDENRODUNDERGROUNDNORTH_OFFICER, GauldenrodUndergroundNorthGateMovement
	opentext
	writetext GauldenrodUndergroundNorthGateText2
	waitbutton
	closetext
	end

GauldenrodUndergroundNorthGateMovement:
	step_right
	step_right
	step_up
	step_end

GauldenrodUndergroundNorthGateText1:
	text "Nothing to see"
	line "here..."

	para "Oh, you're not a"
	line "brigader?"
	cont "Please pass."
	done

GauldenrodUndergroundNorthGateText2:
	text "We dug this tunnel"
	line "in secret."
	done
