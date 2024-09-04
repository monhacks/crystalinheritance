AnarresHoltGate_MapScriptHeader:
	def_scene_scripts
	scene_script AnarresHoltGateHollisScene

	def_callbacks

	def_warp_events
	warp_event 4, 0, ANARRES_TOWN, 1
	warp_event 5, 0, ANARRES_TOWN, 2
	warp_event 4, 7, HOLLYS_HOLT, 1
	warp_event 5, 7, HOLLYS_HOLT, 2

	def_coord_events


	def_bg_events

	def_object_events
	object_event 3, 4, SPRITE_TAMMY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AnarresHoltGateTammyScript, EVENT_ANARRES_HOLT_GATE
	object_event 5, 4, SPRITE_HOLLIS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AnarresHoltGateHollisScript, EVENT_ANARRES_HOLT_GATE
	object_event 3, 6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AnarresHoltGateNPCScript, -1

	object_const_def
	const ANARRESHOLTGATE_TAMMY
	const ANARRESHOLTGATE_HOLLIS

AnarresHoltGateHollisScene:
	pause 15
	opentext
	writetext TammyDialogue1
	waitbutton
	writetext HollisDialogue1
	waitbutton
	writetext TammyDialogue2
	waitbutton
	closetext
	applymovement ANARRESHOLTGATE_HOLLIS, HollisTurnDown
	opentext
	writetext HollisDialogue2
	waitbutton
	closetext
	applymovement ANARRESHOLTGATE_HOLLIS, HollisExitMovement
	turnobject ANARRESHOLTGATE_TAMMY, RIGHT
	disappear ANARRESHOLTGATE_HOLLIS
	pause 15
	opentext
	writetext TammyDialogue3
	waitbutton
	closetext
	disappear ANARRESHOLTGATE_TAMMY
	setevent EVENT_ANARRES_HOLT_GATE
	setscene $1
	end

HollisTurnDown:
	turn_head DOWN
	step_end

HollisExitMovement:
	step_down
	step_down
	step_down
	step_end

TammyDialogue1:
	text "TAMMY: Now, Hollis,"
	line "don't you see? The"
	cont "Pineco are getting"
	cont "worse and worse."
	done

HollisDialogue1:
	text "HOLLIS: Of course"
	line "I see. That's why"
	cont "it's important for"
	cont "the most experi-"
	cont "enced members of"
	cont "the village to"
	cont "take action. We"
	cont "can't afford any"
	cont "mistakes."
	done

TammyDialogue2:
	text "TAMMY: The mistake"
	line "you're making is"
	cont "holing up in your"
	cont "tower. It's OK to"
	cont "admit you made an"
	cont "error – it would"
	cont "prove you are"
	cont "human, just like"
	cont "the rest of us."
	done

HollisDialogue2:
	text "HOLLIS: Such"
	line "disrespect! I"
	cont "won't hear any"
	cont "more of this!"
	cont "Out of my way!"
	done

TammyDialogue3:
	text "TAMMY: I'm trying"
	line "to help you. I'm"
	cont "trying to show"
	cont "you that we can"
	cont "all work together"
	cont "to restore the"
	cont "forest!"
	done

AnarresHoltGateTammyScript:
	end

AnarresHoltGateHollisScript:
	end

AnarresHoltGateNPCScript:
	jumptextfaceplayer AnarresHoltGateNPCText

AnarresHoltGateNPCText:
	text "When the Hisuians"
	line "visited, they"
	cont "brought the most"
	cont "incredible"
	cont "#MON!"

	para "I saw one that"
	line "looked like a"
	cont "Voltorb, but made"
	cont "of wood!"

	para "I wonder what"
	line "other amazing"
	cont "#MON exist in"
	cont "far-off regions?"
	done
