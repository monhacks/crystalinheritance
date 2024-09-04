GauldenrodUnderground_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  2, GAULDENROD_UNDERGROUND_NORTH, 3
	warp_event  6,  2, GAULDENROD_UNDERGROUND_NORTH, 4
	warp_event  5, 34, GAULDENROD_UNDERGROUND_SOUTH, 1
	warp_event  6, 34, GAULDENROD_UNDERGROUND_SOUTH, 2

	def_coord_events

	def_bg_events


	def_object_events
	object_event  7,  7, SPRITE_AROMA_LADY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerAromaLadyDahlia, EVENT_GOT_HM_STRENGTH
	object_event 12, 12, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerFirebreatherDick, EVENT_GOT_HM_STRENGTH
	object_event 17, 17, SPRITE_TAMER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerTamerBrett, EVENT_GOT_HM_STRENGTH
	object_event 22, 22, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerCooltrainerMNAME4, EVENT_GOT_HM_STRENGTH
	object_event 27, 27, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, GauldenrodUndergroundNPC5Script, EVENT_GOT_HM_STRENGTH
	itemball_event 16, 20, BIG_ROOT, 1, EVENT_UNDERGROUND_BIG_ROOT

	object_const_def
	const GAULDENRODUNDERGROUND_NPC1
	const GAULDENRODUNDERGROUND_NPC2
	const GAULDENRODUNDERGROUND_NPC3
	const GAULDENRODUNDERGROUND_NPC4
	const GAULDENRODUNDERGROUND_NPC5

GenericTrainerYoungsterNAME1:
	generictrainer YOUNGSTER, NAME1, EVENT_BEAT_GAULDENROD_UNDERGROUND_NAME1, YoungsterNAME1SeenText, YoungsterNAME1BeatenText

	text "The elders have"
	line "been trying to"
	cont "talk the emperor"
	cont "out of tearing"
	cont "down their tower."

	para "I don't think"
	line "it's working."
	done

YoungsterNAME1SeenText:
	text "Are you from"
	line "Hisui?"
	done

YoungsterNAME1BeatenText:
	text "You look so"
	line "different."
	done

GenericTrainerYoungsterNAME2:
	generictrainer YOUNGSTER, NAME2, EVENT_BEAT_GAULDENROD_UNDERGROUND_NAME2, YoungsterNAME2SeenText, YoungsterNAME2BeatenText

	text "There's an aquifer"
	line "under the stadium."
	cont "That's all I'll"
	cont "say."
	done

YoungsterNAME2SeenText:
	text "Let's see if my"
	line "techniques will"
	cont "work!"
	done

YoungsterNAME2BeatenText:
	text "Needs some"
	line "refinement…"
	done

GenericTrainerYoungsterNAME3:
	generictrainer YOUNGSTER, NAME3, EVENT_BEAT_GAULDENROD_UNDERGROUND_NAME3, YoungsterNAME3SeenText, YoungsterNAME3BeatenText

	text "I was supposed to"
	line "take these on my"
	cont "quest but the"
	cont "mountain pass was"
	cont "closed."
	done

YoungsterNAME3SeenText:
	text "My dad gave me"
	line "these #mon!"
	done

YoungsterNAME3BeatenText:
	text "Maybe I don't know"
	line "enough about them"
	cont "yet."
	done

GenericTrainerCooltrainerMNAME4:
	generictrainer COOLTRAINERM, NAME4, EVENT_BEAT_GAULDENROD_UNDERGROUND_NAME4, CooltrainerMNAME4SeenText, CooltrainerMNAME4BeatenText

	text "You'll need a"
	line "blessing from"
	cont "Sandra at the top"
	cont "of the tower to"
	cont "use it outside of"
	cont "battle."
	done

CooltrainerMNAME4SeenText:
	text "Are you a new"
	line "recruit?"
	done

CooltrainerMNAME4BeatenText:
	text "You might teach"
	line "the younger ones"
	cont "a few things."
	done

GauldenrodUndergroundNPC5Script:
	opentext
	writetext GauldenrodUndergroundNPC4Text
	promptbutton
	verbosegivetmhm HM_STRENGTH
	setevent EVENT_GOT_HM_STRENGTH
	writetext GauldenrodUndergroundNPC4AfterText
	waitbutton
	closetext
	applymovement GAULDENRODUNDERGROUND_NPC5, GauldenrodUndergroundNPC5Movement
	opentext
	writetext GauldenrodUndergroundNPC5Text
	waitbutton
	closetext
	applymovement GAULDENRODUNDERGROUND_NPC1, GauldenrodUndergroundNPCLeaveMovement
	applymovement GAULDENRODUNDERGROUND_NPC2, GauldenrodUndergroundNPCLeaveMovement
	applymovement GAULDENRODUNDERGROUND_NPC3, GauldenrodUndergroundNPCLeaveMovement
	applymovement GAULDENRODUNDERGROUND_NPC4, GauldenrodUndergroundNPCLeaveMovement
	applymovement GAULDENRODUNDERGROUND_NPC5, GauldenrodUndergroundNPCLeaveMovement
	disappear GAULDENRODUNDERGROUND_NPC1
	disappear GAULDENRODUNDERGROUND_NPC2
	disappear GAULDENRODUNDERGROUND_NPC3
	disappear GAULDENRODUNDERGROUND_NPC4
	disappear GAULDENRODUNDERGROUND_NPC5
	end

GauldenrodUndergroundNPC4Text:
	text "Please, take a"
	line "look around."

	para "Also, take this,"
	line "if you want to"
	cont "help us."
	done

GauldenrodUndergroundNPC4AfterText:
	text "You'll need a"
	line "blessing from"
	cont "Sandra at the top"
	cont "of the tower to"
	cont "use it outside of"
	cont "battle."
	done

GauldenrodUndergroundNPC5Text:
	text "Hey, we're getting"
	line "word that"
	cont "something is going"
	cont "to happen at the"
	cont "stadium! Let's go!"
	done

GauldenrodUndergroundNPC5Movement:
	step_right
	step_right
	step_end

GauldenrodUndergroundNPCLeaveMovement:
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	step_end

GauldenrodUndergroundHiddenBigRoot:
	hiddenitem BIG_ROOT, EVENT_GAULDENROD_UNDERGROUND_HIDDEN_BIG_ROOT
