KajoCabin_MapScriptHeader: ;	def_scene_scripts
	def_scene_scripts

	def_callbacks


	def_warp_events
    warp_event 2, 7, ROUTE_KAJO, 7
    warp_event 3, 7, ROUTE_KAJO, 7

	def_coord_events


	def_bg_events
	bg_event  6,  2, BGEVENT_READ, KaJoApricornBenchScript


	def_object_events
    object_event 2, 3, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, KajoCabinSchoolgirlScript, EVENT_KAJO_SCHOOLGIRL ; should be disappeared until you talk to her dad
    object_event 5, 3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, KajoCabinDadScript, -1 ; 	
	object_event 1, 5, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KajoHealerScript, -1

	object_const_def
	

KajoCabinDadScript:
    faceplayer
    opentext
	checkevent EVENT_GOT_BRIGHTPOWDER_KAJO
	iftrue_jumpopenedtext KajoCabinDadAfterText
    checkevent EVENT_TALKED_TO_CABIN_DAD
    iftrue .CheckLostGirl
    writetext KajoCabinDadIntroText
    waitbutton
    setevent EVENT_TALKED_TO_CABIN_DAD
    sjump .AskForHelp

.CheckLostGirl
    checkevent EVENT_TALKED_TO_LOST_KAJO_GIRL
    iftrue .GiveReward
.AskForHelp
    writetext KajoCabinDadAskHelpText
    waitbutton
    closetext
    end

.GiveReward
    writetext KajoCabinDadThankYouText
    promptbutton
    verbosegiveitem BRIGHTPOWDER
    iffalse .BagFull
    setevent EVENT_GOT_BRIGHTPOWDER_KAJO
    writetext KajoCabinDadAfterText
    waitbutton
    closetext
    end

.BagFull
    writetext KajoCabinDadBagFullText
    waitbutton
    closetext
    end

KajoCabinSchoolgirlScript:
    faceplayer
    opentext
    writetext KajoCabinSchoolgirlText
    waitbutton
    closetext
    end

KajoCabinDadIntroText:
    text "We moved to this"
    line "cabin to get away"
    cont "from it all."
    para "I sent my daughter"
    line "to the acquifer to"
    cont "gather water, but"
    cont "she's lost."
    para "Won't anyone go"
    line "out to look for"
    cont "her?"
    done

KajoCabinDadAskHelpText:
    text "Oh, won't someone"
    line "find my daughter?"
    para "She went out for"
    line "water."
    done

KajoCabinDadThankYouText:
    text "Oh, you're the one"
    line "that sent my"
    cont "daughter back!"
    para "Thank you so much."
    line "She made you a"
    cont "drawing... it has"
    cont "a lot of glitter"
    cont "on it."
    para "Please, take this."
    done

KajoCabinDadAfterText:
    text "Thanks again. Her"
    line "glitter might"
    cont "never come off,"
    para "but the bright-"
    line "powder will keep"
    cont "the hits off of"
    cont "you!"
    done

KajoCabinDadBagFullText:
    text "Oh, your Bag is"
    line "full. Please come"
    cont "back for this"
    cont "gift later!"
    done

KajoCabinSchoolgirlText:
    text "My dad won't let"
    line "me explore any"
    cont "more."
    para "But I want to play"
    line "with the baby"
    cont "Totodiles again!"
    done
	
KaJoApricornBenchScript:
	opentext
	writetext CheckForKaJoApricornsText
	promptbutton
.KaJoApricornBenchScript2:
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
	callasm .CheckHaveAnyKaJoApricorns
	iftrue .AskKaJoApricorn
	jumpopenedtext KurtsHouseKurtThatsALetdownText

.CheckHaveAnyKaJoApricorns:
	xor a
	ld hl, wApricorns
	or [hl]
rept NUM_APRICORNS - 1
	inc hl
	or [hl]
endr
	ldh [hScriptVar], a
	ret

.AskKaJoApricorn:
	writetext KurtsHouseKurtAskYouHaveAnKaJoApricornText
	promptbutton
	special Special_SelectApricornForKurt
	iffalse_jumpopenedtext KurtsHouseKurtThatsALetdownText
	ifequal SHORE_FOAM, .Blu
	ifequal FIXED_CHARGE, .Ylw
	ifequal TOUGH_LEAVES, .Grn
	ifequal WHT_APRICORN, .Wht
	ifequal HOLLOW_ROCK, .Blk
	ifequal PNK_APRICORN, .Pnk
;.Red yes this should be commented out
	setevent EVENT_GAVE_KURT_RED_APRICORN
	sjump .GaveKurtKaJoApricorns

.Blu:
	setevent EVENT_GAVE_KURT_BLU_APRICORN
	sjump .GaveKurtKaJoApricorns

.Ylw:
	setevent EVENT_GAVE_KURT_YLW_APRICORN
	sjump .GaveKurtKaJoApricorns

.Grn:
	setevent EVENT_GAVE_KURT_GRN_APRICORN
	sjump .GaveKurtKaJoApricorns

.Wht:
	setevent EVENT_GAVE_KURT_WHT_APRICORN
	sjump .GaveKurtKaJoApricorns

.Blk:
	setevent EVENT_GAVE_KURT_BLK_APRICORN
	sjump .GaveKurtKaJoApricorns

.Pnk:
	setevent EVENT_GAVE_KURT_PNK_APRICORN
.GaveKurtKaJoApricorns:
	writetext KurtsHouseKurtGetStartedText
	waitbutton
	closetext
	sjump .KaJoApricornBenchScript2 ;Kurt1

.ThatTurnedOutGreat:
	jumpopenedtext KurtsHouseKurtTurnedOutGreatText

.GiveLevelBall:
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar JEZE_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_RED_APRICORN
	sjump .ThatTurnedOutGreat

.GiveLureBall:
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar BUB_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_BLU_APRICORN
	sjump .ThatTurnedOutGreat

.GiveMoonBall:
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar DECI_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_YLW_APRICORN
	sjump .ThatTurnedOutGreat

.GiveFriendBall:
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar HERB_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_GRN_APRICORN
	sjump .ThatTurnedOutGreat

.GiveFastBall:
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar FAST_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_WHT_APRICORN
	sjump .ThatTurnedOutGreat

.GiveHeavyBall:
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar GEODE, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_BLK_APRICORN
	sjump .ThatTurnedOutGreat

.GiveLoveBall:
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar LOVE_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_PNK_APRICORN
	sjump .ThatTurnedOutGreat

KurtsHouseKurtGetStartedText:
	text "Time to work on"
	line "this."
	done

KurtsHouseKurtJustFinishedYourBallText:
	text "All done!"
	done

KurtsHouseKurtTurnedOutGreatText:
	text "Looks like a"
	line "good one!"
	done
	
KurtsHouseKurtThatsALetdownText:
	text "Too bad. Need"
	line "to find some!"
	done

KurtsHouseKurtAskYouHaveAnKaJoApricornText:
	text "Which one?"
	done

CheckForKaJoApricornsText:
	text "Any items"
	line "in the bag?"
	done
	
KaJoHealerScript:
	faceplayer
	opentext
	writetext KaJoWantToHeal
	waitbutton
	playmusic MUSIC_HEAL
	special HealParty
	special SaveMusic	
	writetext KaJoHealedPokemon
	waitbutton
	closetext
	playmusic MUSIC_NONE	
	special RestoreMusic
	end

KaJoWantToHeal:
	text "It's tough off"
	line "the grid. We have"
	cont "some healing"
	cont "items to share."
	done


KaJoHealedPokemon:
	text "Your #mon"
	line "were healed!"
	done
