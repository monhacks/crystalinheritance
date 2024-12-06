AnarresHoltGate_MapScriptHeader: ; todo add a wram flag ?
	def_scene_scripts
	scene_script AnarresHoltGateHollisScene

	def_callbacks

	def_warp_events
	warp_event 7, 2, ANARRES_TOWN, 1
	warp_event 7, 3, ANARRES_TOWN, 2
	warp_event 0, 2, HOLLYS_HOLT, 1
	warp_event 0, 3, HOLLYS_HOLT, 2

	def_coord_events


	def_bg_events

	def_object_events
	object_event 3, 4, SPRITE_TAMMY, SPRITEMOVEDATA_STSANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AnarresHoltGateTammyScript, EVENT_ANARRES_HOLT_GATE
	object_event 4, 4, SPRITE_HOLLIS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AnarresHoltGateHollisScript, EVENT_ANARRES_HOLT_GATE
	object_event 3, 6, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AnarresHoltGateNPCScript, -1

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
	pause 10 
	
	applymovement ANARRESHOLTGATE_HOLLIS, HollisExitMovement
	disappear ANARRESHOLTGATE_HOLLIS
	pause 15

	opentext
	writetext TammyDialogue3
	waitbutton
	closetext
	applymovement ANARRESHOLTGATE_TAMMY, TammyExitMovement
	disappear ANARRESHOLTGATE_TAMMY
	setevent EVENT_ANARRES_HOLT_GATE
	setscene $1
	end

HollisTurnDown:
	turn_head_down
	step_end

HollisExitMovement:
	step_right
	step_right
	step_right
	step_end

TammyDialogue1:
	text "Tammy: Hollis,"
	line "don't you see? The"
	cont "Pineco get worse"
	cont "and worse."
	done

HollisDialogue1:
	text "Hollis: Of course"
	line "I see. But -- "

	para "The forest is"
	line "too sensitive!"
	
	para "We can't afford"
	line "any mistakes."
	done

TammyDialogue2:
	text "Tammy: The mist-"
	line "ake is not"
	cont "adapting!"

	para "Just admit your"
	line "mistake. You're"
	cont "human, like the"
	cont "rest of us."
	done

HollisDialogue2:
	text "Hollis: Such"
	line "disrespect!"
	done

TammyDialogue3:
	text "Tammy: Urrg!"
	done

AnarresHoltGateTammyScript:
	end

AnarresHoltGateHollisScript:
	end


TammyExitMovement:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end
	
	
AnarresHoltGateNPCScript:
    faceplayer
    opentext
    checkevent EVENT_GOT_MYSTIC_WATER_ANARRES
    iftrue .AlreadyGotItem
    writetext AnarresHoltGateNPCText
    promptbutton
    verbosegiveitem MYSTIC_WATER
    iffalse .BagFull
    setevent EVENT_GOT_MYSTIC_WATER_ANARRES
    writetext AnarresHoltGateNPCAfterText
    waitbutton
    closetext
    end

.AlreadyGotItem:
    writetext AnarresHoltGateNPCRepeatText
    waitbutton
    closetext
    end

.BagFull:
    writetext AnarresHoltGateNPCBagFullText
    waitbutton
    closetext
    end

AnarresHoltGateNPCText:
    text "When the Hisuians"
    line "visited, they"
    cont "brought the most"
    cont "incredible"
    cont "#mon!"
    para "I saw one that"
    line "looked like a"
    cont "Voltorb, but made"
    cont "of wood!"
    para "I wonder what"
    line "other mystical"
    cont "#mon exist in"
    cont "far-off regions?"
    para "Oh! Speaking of"
    line "mystical things,"
    cont "take this!"
    done

AnarresHoltGateNPCAfterText:
    text "That Mystic Water"
    line "will power up"
    cont "Water-type moves."
    para "Maybe it'll help"
    line "you discover some"
    cont "mystical #mon!"
    done

AnarresHoltGateNPCRepeatText:
    text "I hope that Mystic"
    line "Water helps you"
    cont "on your journey!"
    para "Keep an eye out"
    line "for mysterious"
    cont "#mon!"
    done

AnarresHoltGateNPCBagFullText:
    text "Oh! Your Bag is"
    line "full. Make some"
    cont "room and come"
    cont "back for this"
    cont "Mystic Water!"
    done
