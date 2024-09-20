GauldenrodUnderground_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  2, GAULDENROD_UNDERGROUND_NORTH, 3
	warp_event  3, 32, GAULDENROD_UNDERGROUND_SOUTH, 3

	def_coord_events

	def_bg_events


	def_object_events
	object_event  1, 15, SPRITE_AROMA_LADY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerAromaLadyDahlia, EVENT_GOT_HM04_STRENGTH
	object_event  2, 17, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFirebreatherDick, EVENT_GOT_HM04_STRENGTH
	object_event  1, 20, SPRITE_TAMER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTamerBrett, EVENT_GOT_HM04_STRENGTH
	object_event  2, 25, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCooltrainerFBeth, EVENT_GOT_HM04_STRENGTH
	object_event  1, 26, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, GauldenrodUndergroundNPC5Script, EVENT_GOT_HM04_STRENGTH
	itemball_event 1,  7, BIG_ROOT, 1, EVENT_UNDERGROUND_BIG_ROOT

	object_const_def
	const GAULDENRODUNDERGROUND_NPC1
	const GAULDENRODUNDERGROUND_NPC2
	const GAULDENRODUNDERGROUND_NPC3
	const GAULDENRODUNDERGROUND_NPC4
	const GAULDENRODUNDERGROUND_NPC5

GenericTrainerAromaLadyDahlia:
	generictrainer AROMA_LADY, DAHLIA, EVENT_BEAT_AROMA_LADY_DAHLIA, AromaLadyDahliaSeenText, AromaLadyDahliaBeatenText

	text "The elders have"
	line "been trying to"
	cont "talk the emperor"
	cont "out of tearing"
	cont "down their tower."

	para "I don't think"
	line "it's working."
	done

AromaLadyDahliaSeenText:
	text "Are you from"
	line "Hisui?"
	done

AromaLadyDahliaBeatenText:
	text "You look so"
	line "different."
	done

GenericTrainerFirebreatherDick:
	generictrainer FIREBREATHER, DICK, EVENT_BEAT_FIREBREATHER_DICK, FirebreatherDickSeenText, FirebreatherDickBeatenText

	text "There's an aquifer"
	line "under the stadium."
	cont "That's all I'll"
	cont "say."
	done

FirebreatherDickSeenText:
	text "Let's see if my"
	line "techniques will"
	cont "work!"
	done

FirebreatherDickBeatenText:
	text "Needs some"
	line "refinement…"
	done

GenericTrainerTamerBrett:
	generictrainer TAMER, BRETT, EVENT_BEAT_TAMER_BRETT, TamerBrettSeenText, TamerBrettBeatenText

	text "I was supposed to"
	line "take these on my"
	cont "quest but the"
	cont "mountain pass was"
	cont "closed."
	done

TamerBrettSeenText:
	text "My dad gave me"
	line "these #mon!"
	done

TamerBrettBeatenText:
	text "Maybe I don't know"
	line "enough about them"
	cont "yet."
	done

GenericTrainerCooltrainerFBeth:
	generictrainer COOLTRAINERF, BETH1, EVENT_BEAT_COOLTRAINERF_BETH, CooltrainerFBethSeenText, CooltrainerFBethBeatenText

	text "You might teach"
	line "the younger ones"
	cont "a few things."
	done

CooltrainerFBethSeenText:
	text "Are you a new"
	line "recruit?"
	done

CooltrainerFBethBeatenText:
	text "You might teach"
	line "the younger ones"
	cont "a few things."
	done

GauldenrodUndergroundNPC5Script:
	opentext
	writetext GauldenrodUndergroundNPC4Text
	promptbutton
	verbosegivetmhm HM_STRENGTH
	setevent EVENT_GOT_HM04_STRENGTH
	writetext GauldenrodUndergroundNPC4AfterText
	waitbutton
	closetext
	applymovement GAULDENRODUNDERGROUND_NPC3, GauldenrodUndergroundNPC5Movement
	opentext
	writetext GauldenrodUndergroundNPC5Text
	waitbutton
	closetext
	applymovement GAULDENRODUNDERGROUND_NPC3, GauldenrodUndergroundNPCLeaveMovement
	applymovement GAULDENRODUNDERGROUND_NPC4, GauldenrodUndergroundNPCLeaveMovement
	disappear GAULDENRODUNDERGROUND_NPC3
	disappear GAULDENRODUNDERGROUND_NPC4
	applymovement GAULDENRODUNDERGROUND_NPC1, GauldenrodUndergroundNPCLeaveMovement
	applymovement GAULDENRODUNDERGROUND_NPC2, GauldenrodUndergroundNPCLeaveMovement
	disappear GAULDENRODUNDERGROUND_NPC1
	disappear GAULDENRODUNDERGROUND_NPC2
	opentext
	writetext GauldenrodUndergroundNPC5Text2
	closetext
	applymovement GAULDENRODUNDERGROUND_NPC5, GauldenrodUndergroundNPC5LeaveMovement
	disappear GAULDENRODUNDERGROUND_NPC5
	end

GauldenrodUndergroundNPC4Text:
	text "We're digging a"
	line "tunnel underneath"
	cont "the tower in case"
	cont "Sandra ever needs"
	cont "a quick escape."
	
	para "Please, take a"
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
	cont "stadium!"
	
	para "Whatever it is,"
	line "we have to stop"
	cont "General Bobesh"
	cont "and the brig-"
	cont "aders!"
	done
	
GauldenrodUndergroundNPC5Text2:
	text "You were pretty"
	line "tough. We could"
	cont "use someone like"
	cont "you."
	
	para "Remember, you"
	line "need Sandra's"
	cont "blessing to use"
	cont "Strength out of"
	cont "battle."
	
	para "You can find her"
	line "at the top of"
	cont "the tower."
	done

GauldenrodUndergroundNPC5Movement:
	step_down
	step_down
	step_down
	step_end

GauldenrodUndergroundNPCLeaveMovement:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end
	
GauldenrodUndergroundNPC5LeaveMovement:
	step_right
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up	
	step_end
	