StadiumBox_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, StadiumBoxSandraKurtCallback

	def_warp_events
	warp_event  3,  7, STADIUM_GROUNDS, 3
	warp_event  4,  7, STADIUM_GROUNDS, 3
	warp_event  3,  1, STADIUM_UNDERGROUND, 1
	warp_event  4,  1, STADIUM_UNDERGROUND, 1

	def_coord_events
	coord_event  3,  6, 0, StadiumBoxDialogueEvent
	coord_event  4,  6, 0, StadiumBoxDialogueEvent

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_SANDRA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StadiumBoxSandraScript, EVENT_STADIUM_BOX_SANDRA
	object_event  5,  4, SPRITE_KURT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StadiumBoxKurtScript, EVENT_STADIUM_BOX_SANDRA
	itemball_event  4,  4, SCOPE_LENS, 1, EVENT_STADIUM_BOX_SCOPE_LENS

	object_const_def
	const STADIUMBOX_SANDRA
	const STADIUMBOX_KURT

StadiumBoxSandraKurtCallback:
	checkevent EVENT_BEAT_BOBESH_STADIUM
	iftrue .SandraKurtAppear
	disappear STADIUMBOX_SANDRA
	disappear STADIUMBOX_KURT
	endcallback
.SandraKurtAppear:
	appear STADIUMBOX_SANDRA
	appear STADIUMBOX_KURT
	endcallback

StadiumBoxDialogueEvent:
	turnobject STADIUMBOX_KURT, DOWN
	turnobject STADIUMBOX_SANDRA, DOWN
	turnobject PLAYER, UP
	opentext
	writetext KurtDialogue
	waitbutton
	writetext SandraDialogue
	waitbutton
	writetext KurtDialogue2
	waitbutton
	writetext SandraDialogue2
	waitbutton
	closetext
	applymovement STADIUMBOX_SANDRA, SandraExitMovement
	disappear STADIUMBOX_SANDRA
	setevent EVENT_STADIUM_BOX_SANDRA
	setscene $1
	end

StadiumBoxSandraScript:
	end

StadiumBoxKurtScript:
	end

SandraExitMovement:
	step_down
	step_down
	step_down
	step_end

KurtDialogue:
	text "KURT: We need to"
	line "get to Olivine"
	cont "port, to stop the"
	cont "steel from enter-"
	cont "ing Johto. Is"
	cont "there any way to"
	cont "get there?"
	done

SandraDialogue:
	text "SANDRA: You mean"
	line "the Trader's"
	cont "Landing? You would"
	cont "have to get inside"
	cont "the capitol. I"
	cont "hear that there is"
	cont "a path that goes"
	cont "there."
	done

KurtDialogue2:
	text "KURT: <PLAYER>. If"
	line "we can find a way"
	cont "into Ecruteak, we"
	cont "can get to the"
	cont "port and stop the"
	cont "shipment. I wonder"
	cont "if we can ask"
	cont "Celebi for help?"
	done

SandraDialogue2:
	text "SANDRA: Celebi? We"
	line "used to build"
	cont "shrines from the"
	cont "blossom trees in"
	cont "this area."

	para "I think there is a"
	line "blossom tree"
	cont "around here. I"
	cont "will meet you"
	cont "there."
	done

StadiumBoxKurtScript:
	faceplayer
	opentext
	writetext KurtDialogue2
	waitbutton
	closetext
	end
