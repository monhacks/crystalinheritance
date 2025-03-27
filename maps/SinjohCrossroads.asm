SinjohCrossroads_MapScriptHeader: 
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 11, 19, SINJOH_DORMS, 1;
	warp_event 19, 11, SINJOH_STOCKROOM, 1;	
	warp_event 21, 17, SINJOH_ELDERS_HOUSE, 1;
	warp_event 13, 5, GROTTOED_GLACIER_1F, 1;
	warp_event 4, 7, WESTERN_GLACIER_1F, 1;

	def_coord_events



	def_bg_events
	bg_event  18, 12, BGEVENT_JUMPTEXT, SinjohSign1TextStockroom
	bg_event  20, 18, BGEVENT_JUMPTEXT, SinjohSign2TextElder
	bg_event  20, 18, BGEVENT_JUMPTEXT, SinjohSign2TextDorms
	bg_event  10, 20, BGEVENT_ITEM + FULL_HEAL, EVENT_SINJOH_HIDDEN_ITEM ; hidden item

	def_object_events
	object_event 0, 0, SPRITE_BRIGADER,		SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SinjohBrigader1Script, -1
	object_event 0, 0, SPRITE_BRIGADER,		SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SinjohBrigader2Script, -1
	object_event 0, 0, SPRITE_NINJA, 		SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, SinjohNinjaText, EVENT_BEAT_KANNA
	object_event 0, 0, SPRITE_AROMA_LADY, 	SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, SinjohNPC1Text, EVENT_BEAT_KANNA
	object_event 0, 0, SPRITE_HIKER, 		SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, SinjohNPC2Text, EVENT_BEAT_KANNA
	object_event 0, 0, SPRITE_SAGE, 		SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, SinjohNPC3Text, EVENT_BEAT_KANNA
	itemball_event 0, 0, FULL_RESTORE, 1, EVENT_SINJOH_ITEM
	
	object_const_def

SinjohBrigader1Script:
	faceplayer
	checkevent EVENT_BEAT_KANNA
	iftrue_jumptext Brigader1Text1
	jumpthistext
	
	text "..."
	done

Brigader1Text1:
	text "..."
	done

SinjohBrigader2Script:
	faceplayer
	checkevent EVENT_BEAT_KANNA
	iftrue_jumptext Brigader2Text1
	jumpthistext
	
	text "..."
	done

Brigader2Text1:
	text "..."
	done

SinjohNinjaText:
	text "..."
	done

SinjohNPC1Text:
	text "...:
	done
	

SinjohNPC2Text:
	text "...:
	done
	

SinjohNPC3Text:
	text "...:
	done
	
SinjohSign1Text:
	text "..."
	done

SinjohSign2Text:
	text "..."
	done
