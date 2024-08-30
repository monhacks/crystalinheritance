GauldenrodStockroom_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  7, GAULDENROD, 2
	warp_event  5,  7, GAULDENROD, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 2, 3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GauldenrodStockroomNPC1Script, -1
	object_event 5, 2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GauldenrodStockroomNPC2Script, -1
	object_event 3, 5, SPRITE_SAGE, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GauldenrodStockroomNPC3Script, -1
	object_event 7, 4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GauldenrodStockroomNPC4Script, -1
	object_event 1, 6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GauldenrodStockroomNPC5Script, -1

	object_const_def


GauldenrodStockroomNPC1Script:
	jumptextfaceplayer GauldenrodStockroomNPC1Text

GauldenrodStockroomNPC1Text:
	text "See that fence?"
	line "Long ago, I went"
	cont "on my quest through"
	cont "the pass beyond"
	cont "them."

	para "I think the emperor"
	line "will clear it out"
	cont "to make it easier."
	done

GauldenrodStockroomNPC2Script:
	faceplayer
	opentext
	writetext GauldenrodStockroomNPC2Text1
	promptbutton
	checkpoke UNOWN
	iftrue .GiveItem
	closetext
	end

.GiveItem
	writetext GauldenrodStockroomNPC2Text2
	promptbutton
	verbosegiveitem EXPERT_BELT
	iffalse .BagFull
	writetext GauldenrodStockroomNPC2Text3
	waitbutton
.BagFull:
	closetext
	end

GauldenrodStockroomNPC2Text1:
	text "When I was your"
	line "age, I went on my"
	cont "quest."

	para "We tell the"
	line "children, bring"
	cont "back something"
	cont "'unown' to the"
	cont "village…"
	done

GauldenrodStockroomNPC2Text2:
	text "Ah, you've done a"
	line "quest? Here, take"
	cont "this item…"
	done

GauldenrodStockroomNPC2Text3:
	text "Congratulations on"
	line "your quest. What"
	cont "will you do with"
	cont "your gifts?"
	done

GauldenrodStockroomNPC3Script:
	jumptextfaceplayer GauldenrodStockroomNPC3Text

GauldenrodStockroomNPC3Text:
	text "It was a rite of"
	line "passage to go on"
	cont "an adventure and"
	cont "bring back"
	cont "knowledge."

	para "I got to a cave"
	line "and had a fantastic"
	cont "vision, I saw the"
	cont "creator of the"
	cont "universe…"
	done

GauldenrodStockroomNPC4Script:
	jumptextfaceplayer GauldenrodStockroomNPC4Text

GauldenrodStockroomNPC4Text:
	text "We used to have a"
	line "thriving craft"
	cont "guild."

	para "But the emperor"
	line "ships cheap items,"
	cont "and the guild had"
	cont "to close."
	done

GauldenrodStockroomNPC5Script:
	jumptextfaceplayer GauldenrodStockroomNPC5Text

GauldenrodStockroomNPC5Text:
	text "Not everyone came"
	line "back from the"
	cont "quest."

	para "It was a dangerous"
	line "rite."
	done
