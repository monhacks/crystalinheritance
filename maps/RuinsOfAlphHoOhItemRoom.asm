RuinsOfAlphHoOhItemRoom_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  9, RUINS_OF_ALPH_HO_OH_CHAMBER, 5
	warp_event  4,  9, RUINS_OF_ALPH_HO_OH_CHAMBER, 5
	warp_event  3,  1, RUINS_OF_ALPH_HO_OH_WORD_ROOM, 1
	warp_event  4,  1, RUINS_OF_ALPH_HO_OH_WORD_ROOM, 2

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  5,  1, BGEVENT_JUMPTEXT, RuinsofAlphStatueText

	def_object_events
	object_event  2,  5, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ROCK, OBJECTTYPE_SCRIPT, 0, PumiceHarpScript, EVENT_GOT_PUMICE_HARP
	itemball_event  2,  6, ODD_SOUVENIR, 1, EVENT_PICKED_UP_SUN_STONE_FROM_HO_OH_ITEM_ROOM
	itemball_event  5,  6, MOON_STONE, 1, EVENT_PICKED_UP_MOON_STONE_FROM_HO_OH_ITEM_ROOM
	itemball_event  2,  4, LIFE_ORB, 1, EVENT_PICKED_UP_LIFE_ORB_FROM_HO_OH_ITEM_ROOM
	itemball_event  5,  4, SACRED_ASH, 1, EVENT_PICKED_UP_CHARCOAL_FROM_HO_OH_ITEM_ROOM


	object_const_def
	const HOOH_ITEM_ROOM_STATUE


PumiceHarpScript:
	opentext
	writetext HoldingAHarpText
	promptbutton
	yesorno
	iffalse_jumpopenedtext .LeaveItAloneText
	verbosegivekeyitem PUMICE_HARP
	setevent EVENT_GOT_PUMICE_HARP
	disappear HOOH_ITEM_ROOM_STATUE
	jumpthisopenedtext
	
	text "The statue cru-"
	line "mbles, falling to"
	cont "the ground in a "
	cont "pile of ash."

.LeaveItAloneText:
	text "Better leave it"
	line "alone."
	done
	
	
HoldingAHarpText:
	text "It's a statue of"
	line "a Kimono girl."
	
	para "She's holding a"
	line "petrified harp,"
	cont "which has the"
	cont "outline of a "
	cont "volcano in its"
	cont "body."
	
	para "Take it?"
	done