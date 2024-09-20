GauldenrodGuild_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 3, 7, GAULDENROD, 3
	warp_event 4, 7, GAULDENROD, 3

	def_coord_events

	def_bg_events


	def_object_events
	object_event 5, 3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GauldenrodGuildNPC1Script, -1
	object_event 2, 4, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GauldenrodGuildNPC2Script, -1
	object_event 7, 5, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GauldenrodGuildNPC3Script, -1

GauldenrodGuildNPC1Script:
	jumptextfaceplayer GauldenrodGuildNPC1Text

GauldenrodGuildNPC1Text:
	text "I used to get a"
	line "lot of business"
	cont "helping people"
	cont "repair their wood"
	cont "houses."

	para "If the emperor's"
	line "plan to import"
	cont "Steel goes through,"
	cont "then I'll be out"
	cont "of work when"
	cont "everything is built"
	cont "out of metal."
	done

GauldenrodGuildNPC2Script:
	jumptextfaceplayer GauldenrodGuildNPC2Text

GauldenrodGuildNPC2Text:
	text "Some of the guild"
	line "members here are"
	cont "able to take"
	cont "something old and"
	cont "make it look"
	cont "fresh."
	done

GauldenrodGuildNPC3Script:
	jumptextfaceplayer GauldenrodGuildNPC3Text

GauldenrodGuildNPC3Text:
	text "We used to live a"
	line "lot like Anarres."
	
	para "But now we have to"
	line "pay taxes to the"
	cont "emperor."
	
	para "The brigade makes"
	line "sure no one tries"
	cont "to talk about"
	cont "that, though."
	done
