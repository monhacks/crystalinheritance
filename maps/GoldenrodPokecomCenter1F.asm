GoldenrodPokecomCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6, 15, GOLDENROD_CITY, 15
	warp_event  7, 15, GOLDENROD_CITY, 15
	warp_event  1,  6, GOLDENROD_POKECOM_CENTER_OFFICE, 2

	def_coord_events

	def_bg_events
	bg_event 11,  7, BGEVENT_READ, PokemonJournalWhitneyScript
	bg_event 24,  5, BGEVENT_RIGHT, JudgeMachineScript
	bg_event 24,  6, BGEVENT_RIGHT, JudgeMachineScript
	bg_event 24,  7, BGEVENT_RIGHT, JudgeMachineScript
	bg_event 24,  8, BGEVENT_RIGHT, JudgeMachineScript
	bg_event 24,  9, BGEVENT_RIGHT, JudgeMachineScript
	bg_event 24, 10, BGEVENT_RIGHT, JudgeMachineScript
	bg_event 25, 11, BGEVENT_UP, JudgeMachineScript
	bg_event 26, 11, BGEVENT_UP, JudgeMachineScript
	bg_event 27, 11, BGEVENT_UP, JudgeMachineScript
	bg_event 28, 11, BGEVENT_UP, JudgeMachineScript
	bg_event 29,  5, BGEVENT_LEFT, JudgeMachineScript
	bg_event 29,  6, BGEVENT_LEFT, JudgeMachineScript
	bg_event 29,  7, BGEVENT_LEFT, JudgeMachineScript
	bg_event 29,  8, BGEVENT_LEFT, JudgeMachineScript
	bg_event 29,  9, BGEVENT_LEFT, JudgeMachineScript
	bg_event 29, 10, BGEVENT_LEFT, JudgeMachineScript
	bg_event 24,  3, BGEVENT_ITEM + RARE_CANDY, EVENT_GOLDENROD_POKECOM_CENTER_1F_HIDDEN_RARE_CANDY

	def_object_events
;	object_event 16,  8, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, WonderTradeReceptionistScript, -1
;	object_event  3,  9, SPRITE_ICE_BOULDER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, InfoSignScript, -1
;	object_event 23,  3, SPRITE_ICE_BOULDER, SPRITEMOVEDATA_POKECOM_NEWS, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, end, NULL, -1

	object_const_def


GoldenrodPokecenter1FNurseScript:
	setevent EVENT_WELCOMING_TO_POKECOM_CENTER
	jumpstd pokecenternurse


InfoSignScript:
	jumpthistext

	text "#Com Center"
	line "1F Information"

	para "Left:"
	line "Administration"

	para "Center:"
	line "Wonder Trade Hub"

	para "Right:"
	line "<PK><MN> Judge Machine"
	done

PokemonJournalWhitneyScript:
	setflag ENGINE_READ_WHITNEY_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Special Feature:"
	line "Leader Whitney!"

	para "Whitney is said to"
	line "admire Bruno of"
	cont "the Elite Four."
	done

JudgeMachineScript:
	opentext
	special JudgeMachine
	waitendtext
