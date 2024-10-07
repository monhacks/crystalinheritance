GoldenrodDeptStoreB1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 17,  2, UNDERGROUND_WAREHOUSE, 3
	warp_event  9,  4, GOLDENROD_DEPT_STORE_ELEVATOR, 1
	warp_event 10,  4, GOLDENROD_DEPT_STORE_ELEVATOR, 2

	def_coord_events

	def_bg_events

	def_object_events
	itemball_event 10, 15, ETHER, 1, EVENT_GOLDENROD_DEPT_STORE_B1F_ETHER
	itemball_event 14,  2, MAX_REVIVE, 1, EVENT_GOLDENROD_DEPT_STORE_B1F_METAL_COAT
	itemball_event  6,  3, BURN_HEAL, 1, EVENT_GOLDENROD_DEPT_STORE_B1F_BURN_HEAL
	itemball_event 15, 15, ULTRA_BALL, 1, EVENT_GOLDENROD_DEPT_STORE_B1F_ULTRA_BALL
	object_event  9, 10, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStoreB1FBlackBelt1Text, -1
	object_event  4,  8, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStoreB1FBlackBelt2Text, -1
	object_event  6, 13, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStoreB1FBlackBelt3Text, -1
	pokemon_event  7,  7, MACHOKE, -1, -1, PAL_NPC_BLUE, GoldenrodDeptStoreB1FMachokeText, -1

GoldenrodDeptStoreB1FBlackBelt1Text:
	text "When my dad"
	line "worked this job,"
	cont "he was so strong"
	para "but his back is"
	line "wore out. Thank"
	cont "goodness for"
	cont "technology."
	para "Now, I can keep"
	line "at it until I'm"
	cont "ready to retire."
	done

GoldenrodDeptStoreB1FBlackBelt2Text:
	text "Want to know a"
	line "secret? There's"
	cont "a path from the"
	cont "underground to"
	cont "underneath the"
	cont "radio tower."
	para "But it was"
	line "blocked off and"
	cont "kept a secret."
	done

GoldenrodDeptStoreB1FBlackBelt3Text:
	text "I have to rent"
	line "this #mon"
	cont "from Silph."
	para "Some days, I"
	line "don't get out"
	cont "ahead."
	done

GoldenrodDeptStoreB1FMachokeText:
	text "Machoke: Maaacho!"
	done
