WesternCapitalStockroom_MapScriptHeader: ;	def_scene_scripts
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  7, WESTERN_CAPITAL, 6
	warp_event  4,  7, WESTERN_CAPITAL, 6

	def_coord_events

	def_bg_events
	bg_event  0,  2, BGEVENT_READ, WCApricornBenchScript

	def_object_events
	object_event 2, 3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WesternCapitalStockroomNPC1Script, -1
	object_event 5, 2, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, WesternCapitalStockroomNPC2Script, -1
	object_event 3, 5, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WesternCapitalStockroomNPC3Script, -1
	object_event  9,  0, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_STANDARD, MART_WESTERN_CAPITAL, -1
	object_event  9,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_TM, MART_WESTERN_CAPITAL_TM, -1

	object_const_def


WesternCapitalStockroomNPC1Script:
	jumptextfaceplayer WesternCapitalStockroomNPC1Text

WesternCapitalStockroomNPC1Text:

	done

WesternCapitalStockroomNPC2Script:
	faceplayer
	checkevent EVENT_GOT_EXPERT_BELT
	iftrue .GotBelt
	opentext
	writetext WesternCapitalStockroomNPC2Text1
	promptbutton
	checkpoke UNOWN
	iftrue .GiveItem
	closetext
	end

.GiveItem
	writetext WesternCapitalStockroomNPC2Text2
	promptbutton
	verbosegiveitem EXPERT_BELT
	iffalse .BagFull
	setevent EVENT_GOT_EXPERT_BELT
	writetext WesternCapitalStockroomNPC2Text3
	waitbutton
.BagFull:
	closetext
	end

.GotBelt
	opentext
	writetext WesternCapitalStockroomNPC2Text3
	waitbutton
	end

WesternCapitalStockroomNPC2Text1:
	text "When I was your"
	line "age, I went on my"
	cont "quest."

	para "We tell the"
	line "children, bring"
	cont "back something"
	cont "'unown' to the"
	cont "village…"
	done

WesternCapitalStockroomNPC2Text2:
	text "Ah, you've done a"
	line "quest? Here, take"
	cont "this item…"
	done

WesternCapitalStockroomNPC2Text3:
	text "Congratulations on"
	line "your quest. What"
	cont "will you do with"
	cont "your gifts?"
	done

WesternCapitalStockroomNPC3Script:
	jumptextfaceplayer WesternCapitalStockroomNPC3Text

WesternCapitalStockroomNPC3Text:
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

WesternCapitalStockroomNPC4Script:
	jumptextfaceplayer WesternCapitalStockroomNPC4Text

WesternCapitalStockroomNPC4Text:
	text "We used to have a"
	line "thriving craft"
	cont "guild."

	para "But the emperor"
	line "ships cheap items,"
	cont "and the guild had"
	cont "to close."
	done

WesternCapitalStockroomNPC5Script:
	jumptextfaceplayer WesternCapitalStockroomNPC5Text

WesternCapitalStockroomNPC5Text:
	text "Not everyone came"
	line "back from the"
	cont "quest."

	para "It was a dangerous"
	line "rite."
	done

WCApricornBenchScript:
	opentext
	writetext WCCheckForApricornsText
	promptbutton
.ApricornBenchScript2:
	opentext
	checkevent EVENT_GAVE_KURT_RED_APRICORN
	iftrue .GiveLevelBall
	checkevent EVENT_GAVE_KURT_BLU_APRICORN
	iftrue .GiveLureBall
	checkevent EVENT_GAVE_KURT_YLW_APRICORN
	iftrue .GiveMoonBall
	checkevent EVENT_GAVE_KURT_GRN_APRICORN
	iftrue .GiveFriendBall
	checkevent EVENT_GAVE_KURT_WHT_APRICORN
	iftrue .GiveFastBall
	checkevent EVENT_GAVE_KURT_BLK_APRICORN
	iftrue .GiveHeavyBall
	checkevent EVENT_GAVE_KURT_PNK_APRICORN
	iftrue .GiveLoveBall
	callasm .CheckHaveAnyApricorns
	iftrue .AskApricorn
	jumpopenedtext ASThatsALetdownText

.CheckHaveAnyApricorns:
	xor a
	ld hl, wApricorns
	or [hl]
rept NUM_APRICORNS - 1
	inc hl
	or [hl]
endr
	ldh [hScriptVar], a
	ret

.AskApricorn:
	writetext WCYouHaveAnApricornText
	promptbutton
	special Special_SelectApricornForKurt
	iffalse_jumpopenedtext WCThatsALetdownText
	ifequal SHORE_FOAM, .Blu
	ifequal FIXED_CHARGE, .Ylw
	ifequal TOUGH_LEAVES, .Grn
	ifequal WHT_APRICORN, .Wht
	ifequal HOLLOW_ROCK, .Blk
	ifequal PNK_APRICORN, .Pnk
;.Red yes this should be commented out
	setevent EVENT_GAVE_KURT_RED_APRICORN
	sjump .GaveKurtApricorns

.Blu:
	setevent EVENT_GAVE_KURT_BLU_APRICORN
	sjump .GaveKurtApricorns

.Ylw:
	setevent EVENT_GAVE_KURT_YLW_APRICORN
	sjump .GaveKurtApricorns

.Grn:
	setevent EVENT_GAVE_KURT_GRN_APRICORN
	sjump .GaveKurtApricorns

.Wht:
	setevent EVENT_GAVE_KURT_WHT_APRICORN
	sjump .GaveKurtApricorns

.Blk:
	setevent EVENT_GAVE_KURT_BLK_APRICORN
	sjump .GaveKurtApricorns

.Pnk:
	setevent EVENT_GAVE_KURT_PNK_APRICORN
.GaveKurtApricorns:
	writetext WCGetStartedText
	waitbutton
	closetext
	sjump .ApricornBenchScript2 ;Kurt1

.ThatTurnedOutGreat:
	jumpopenedtext WCTurnedOutGreatText

.GiveLevelBall:
	writetext WCJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar JEZE_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_RED_APRICORN
	sjump .ThatTurnedOutGreat

.GiveLureBall:
	writetext WCJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar BUB_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_BLU_APRICORN
	sjump .ThatTurnedOutGreat

.GiveMoonBall:
	writetext WCJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar DECI_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_YLW_APRICORN
	sjump .ThatTurnedOutGreat

.GiveFriendBall:
	writetext WCJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar HERB_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_GRN_APRICORN
	sjump .ThatTurnedOutGreat

.GiveFastBall:
	writetext WCJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar FAST_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_WHT_APRICORN
	sjump .ThatTurnedOutGreat

.GiveHeavyBall:
	writetext WCJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar GEODE, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_BLK_APRICORN
	sjump .ThatTurnedOutGreat

.GiveLoveBall:
	writetext WCJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar LOVE_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_PNK_APRICORN
	sjump .ThatTurnedOutGreat

WCGetStartedText:
	text "Time to work on"
	line "this."
	done

WCJustFinishedYourBallText:
	text "All done!"
	done

WCTurnedOutGreatText:
	text "Looks like a"
	line "good one!"
	done
	
WCThatsALetdownText:
	text "Too bad. Need"
	line "to find some!"
	done

WCYouHaveAnApricornText:
	text "Which one?"
	done

WCCheckForApricornsText:
	text "Any items"
	line "in the bag?"
	done
