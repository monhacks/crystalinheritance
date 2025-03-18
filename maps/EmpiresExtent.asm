EmpiresExtent_MapScriptHeader:
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 6, 39, EMPIRES_EXTENT_CAVERN, 1
	warp_event 9, 49, EMPIRES_EXTENT_EERIE_HAMLET_GATE, 1
	warp_event 10, 49, EMPIRES_EXTENT_EERIE_HAMLET_GATE, 2


	def_coord_events



	def_bg_events
	bg_event 10, 44, BGEVENT_JUMPTEXT, ExtentSignText


	def_object_events
;a few hisuians who are going to join adrinna's army 
	object_event 0, 0, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, 0, ExtentNPCText1, EVENT_BEAT_AMOS ; HANK 
	object_event 0, 0, SPRITE_RUIN_MANIAC, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, 0, ExtentNPCText2, EVENT_BEAT_AMOS ; JONES 
	object_event 0, 0, SPRITE_RUIN_MANIAC, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, 0, ExtentNPCText3, EVENT_BEAT_AMOS ; LELAND 
; ninjas	
	object_event  0,  0, SPRITE_NINJA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerNinja1, EVENT_BEAT_AMOS;shadow
	object_event  0,  0, SPRITE_NINJA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerNinja2, EVENT_BEAT_AMOS;mist
	object_event  0,  0, SPRITE_NINJA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerNinja3, EVENT_BEAT_AMOS;twilight
	object_event  0,  0, SPRITE_NINJA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerNinja4, EVENT_BEAT_AMOS;shimmer
	object_event  0,  0, SPRITE_NINJA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerNinja5, EVENT_BEAT_AMOS;echo
	object_event  0,  0, SPRITE_NINJA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerNinja6, EVENT_BEAT_AMOS;dusk 
;items 
	itemball_event 0, 0, REVIVE,		1,	EXTENT_ITEM_1
	itemball_event 0, 0, FULL_RESTORE, 	1,	EXTENT_ITEM_2
	itemball_event 0, 0, BIG_NUGGET, 	1,	EXTENT_ITEM_3

	object_const_def

GenericTrainerNinja1: ;
	generictrainer NINJA, NINJA1, EVENT_BEAT_NINJA1, .SeenText1, .BeatenText1  

.BeatenText1:
	text "..."
	done

.SeenText1:
	text "..."
	done

GenericTrainerNinja2: ; 
	generictrainer NINJA, NINJA2, EVENT_BEAT_NINJA2, .SeenText2, .BeatenText2  

.BeatenText2:
	text "..."
	done

.SeenText2:
	text "..."
	done
	
GenericTrainerNinja3: ; 
	generictrainer NINJA, NINJA3, EVENT_BEAT_NINJA3, .SeenText3, .BeatenText3  

.BeatenText3:
	text "..."
	done

.SeenText3:
	text "..."
	done


GenericTrainerNinja4: ; 
	generictrainer NINJA, NINJA4, EVENT_BEAT_NINJA4, .SeenText4, .BeatenText4  

.BeatenText4:
	text "..."
	done

.SeenText4:
	text "..."
	done

GenericTrainerNinja5: ; 
	generictrainer NINJA, NINJA5, EVENT_BEAT_NINJA5, .SeenText5, .BeatenText5  

.BeatenText5:
	text "..."
	done

.SeenText5:
	text "..."
	done
	
GenericTrainerNinja6: ; 
	generictrainer NINJA, NINJA6, EVENT_BEAT_NINJA6, .SeenText6, .BeatenText6 

.BeatenText6:
	text "..."
	done

.SeenText6:
	text "..."
	done

ExtentNPCText1:
	text "Hank: The Gyara-"
	line "dos were out of"
	cont "control - "
	
	para "But there was a"
	line "beauty in it."
	
	para "I'm following the"
	line "Brigaders to have"
	cont "that power for"
	cont "myself."
	done

ExtentNPCText2:
	text "Jones: History"
	line "belongs to those"
	cont "who take it!"
	
	para "Adrinna inspires"
	line "me."
	done

ExtentNPCText3:
	text "Leland: Sooner or"
	line "later, might will"
	cont "make right."
	
	para "I'm not going to"
	line "impotently stand"
	cont "in the way - "
	
	para "I'm going to be"
	line "a part of it!"
	done

ExtentSignText:
	text "Imperial Mandate:"
	line "Mejimi's Ceremony"
	para "All citizens must"
	line "attend!"
	done
