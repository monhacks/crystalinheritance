GoldenrodDeptStore2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 12,  0, GOLDENROD_DEPT_STORE_3F, 1
	warp_event 15,  0, GOLDENROD_DEPT_STORE_1F, 3
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_JUMPTEXT, GoldenrodDeptStore2FDirectoryText

	def_object_events
	object_event 13,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_STANDARD, MART_GOLDENROD_2F_1, -1
	object_event 13,  6, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore2FClerk2Script, -1
	object_event  9,  6, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStore2FYoungsterText, -1
	object_event  6,  2, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStore2FCooltrainerFText, -1
	object_event  2,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStore2FGentlemanText, -1

GoldenrodDeptStore2FClerk2Script:
;	checkevent EVENT_GOT_EEVEE
;	iftrue .eevee
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_2F_2

;.eevee
;	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_2F_2_EEVEE

GoldenrodDeptStore2FYoungsterText:
	text "I tossed out my"
	line "#gear phone."
	
	para "Too many calls!"
	done

GoldenrodDeptStore2FGentlemanText:
	text "I've got a two-day"
	line "trip to the park."
	
	para "So I need potions"
	line "and antidotes and"
	para "a sleeping bag,"
	line "a toaster oven,"
	para "a generator, a"
	line "folding table…"
	done

GoldenrodDeptStore2FCooltrainerFText:
	text "When I'm older I'm"
	line "going to get a"
	cont "credit card."
	
	para "As long as I don't"
	line "lose any battles"
	cont "I'll be OK."
	done

GoldenrodDeptStore2FDirectoryText:
	text "Your Travel"
	line "Companion"

	para "2F Trainer's"
	line "   Market"
	done
