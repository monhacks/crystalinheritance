DayCare_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, DayCareEggCheckCallback

	def_warp_events
	warp_event  0,  4, ROUTE_34, 3
	warp_event  0,  5, ROUTE_34, 4
	warp_event  2,  7, ROUTE_34, 5
	warp_event  3,  7, ROUTE_34, 5

	def_coord_events

	def_bg_events
	bg_event  5,  1, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  5,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DayCareLadyScript, -1
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareManScript_Inside, EVENT_DAYCARE_MAN_IN_DAYCARE

	object_const_def
	const DAYCARE_GRANNY

DayCareEggCheckCallback:
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .PutDayCareManOutside
	clearevent EVENT_DAYCARE_MAN_IN_DAYCARE
	setevent EVENT_DAYCARE_MAN_ON_ROUTE_34
	endcallback

.PutDayCareManOutside:
	setevent EVENT_DAYCARE_MAN_IN_DAYCARE
	clearevent EVENT_DAYCARE_MAN_ON_ROUTE_34
	endcallback

DayCareManScript_Inside:
	faceplayer
	opentext
	checkevent EVENT_GOT_ODD_EGG
	iftrue .AlreadyHaveOddEgg
	writetext DayCareManText_GiveOddEgg
	promptbutton
	special GiveOddEgg
	iffalse_jumpopenedtext DayCareText_PartyAndBoxFull
	writetext DayCareText_GotOddEgg
	playsound SFX_GET_EGG_FROM_DAYCARE_LADY
	waitsfx
	ifequal 1, .InParty
	special Special_CurBoxFullCheck
	iffalse .BoxNotFull
	farwritetext _CurBoxFullText
.BoxNotFull
	special GetCurBoxName
	farwritetext _EggSentToPCText
	promptbutton
.InParty:
	writetext DayCareText_DescribeOddEgg
	setevent EVENT_GOT_ODD_EGG
	waitendtext

.AlreadyHaveOddEgg:
	special Special_DayCareMan
	waitendtext

DayCareLadyScript:
	faceplayer
	opentext
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue_jumpopenedtext Text_GrampsLookingForYou
	special Special_DayCareLady
	waitendtext

DayCareMovementData_LyraApproachesGrandma:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_end

Text_GrampsLookingForYou:
	text "Gramps was looking"
	line "for you."
	done

DayCareManText_GiveOddEgg:
	text "I'm the Day-Care"
	line "Man."

	para "Do you know about"
	line "Eggs?"

	para "I was raising"
	line "#mon with my"
	cont "wife, you see."

	para "We were shocked to"
	line "find an Egg!"

	para "How incredible is"
	line "that?"

	para "Well, wouldn't you"
	line "like this Egg?"

	para "Then fine, this is"
	line "yours to keep!"
	done

DayCareText_GotOddEgg:
	text "<PLAYER> received"
	line "the Odd Egg!"
	done

DayCareText_DescribeOddEgg:
	text "I found that when"
	line "I was caring for"

	para "someone's #mon"
	line "before."

	para "But the trainer"
	line "didn't want the"

	para "Egg, so I'd kept"
	line "it around."
	done

DayCareLadyText_GiveLyrasEgg:
	text "Hello, dear."

	para "Lyra told me this"
	line "Egg was a gift for"
	cont "you. Here you go!"
	done

DayCareLadyText_DescribeLyrasEgg:
	text "That Egg came from"
	line "her first #mon."

	para "She must really"
	line "trust you as a"
	cont "trainer."
	done

DayCareText_PartyAndBoxFull:
	text "You have no room"
	line "for this, even in"
	cont "your box."
	done
