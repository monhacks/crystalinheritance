ROUTE43GATE_TOLL EQU 1000

Route43Gate_MapScriptHeader:
	def_scene_scripts


	def_callbacks

	def_warp_events
	warp_event  4,  0, ROUTE_43, 4
	warp_event  5,  0, ROUTE_43, 5
	warp_event  4,  7, ROUTE_43, 3
	warp_event  5,  7, ROUTE_43, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OfficerScript_GuardWithSludgeBomb, EVENT_LAKE_OF_RAGE_CIVILIANS

	object_const_def



OfficerScript_GuardWithSludgeBomb:
	checkevent EVENT_GOT_TM36_SLUDGE_BOMB
	iftrue_jumptextfaceplayer OfficerText_AvoidGrass
	faceplayer
	opentext
	writetext OfficerText_FoundTM
	promptbutton
	verbosegivetmhm TM_SLUDGE_BOMB
	setevent EVENT_GOT_TM36_SLUDGE_BOMB
	endtext

OfficerText_FoundTM:
	text "I got chased from"
	line "my post by these"
	cont "thugs in black."

	para "They left this"
	line "behind."

	para "It makes me uncom-"
	line "fortable. Could"
	cont "you take it away?"
	done

OfficerText_AvoidGrass:
	text "Use this gate to"
	line "avoid walking in"
	cont "the grass."
	done
