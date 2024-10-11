KajoCabin_MapScriptHeader: ;	def_scene_scripts
	def_scene_scripts

	def_callbacks


	def_warp_events
    warp_event 2, 7, ROUTE_KAJO, 7
    warp_event 3, 7, ROUTE_KAJO, 7

	def_coord_events


	def_bg_events
	bg_event  0,  4, BGEVENT_READ, KajoCabinBed
	bg_event  0,  5, BGEVENT_READ, KajoCabinBed

	def_object_events
    object_event 2, 3, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, KajoCabinSchoolgirlScript, EVENT_VISITED_NAVEL_ROCK ; should be disappeared until you talk to her dad
    object_event 5, 3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, KajoCabinDadScript, EVENT_TALKED_TO_LOST_KAJO_GIRL ; 	


	object_const_def
	const CABIN_SCHOOLGIRL
	
	

KajoCabinCallback_GirlAppears: ; shouldn't appear until you talk to the dad in the cabin
	checkevent EVENT_TALKED_TO_LOST_KAJO_GIRL
	iftrue .Skip
	disappear KAJO_SCHOOLGIRL
	endcallback

.Skip:
	endcallback

KajoCabinDadScript:
    faceplayer
    opentext
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
	
KajoCabinBed:
	showtext CabinBedText1
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	special HealParty
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	special Special_FadeInQuickly
	showtext CabinBedText2
	end

CabinBedText1:
	text "A comfy bed!"
	line "Time to sleep…"
	done

CabinBedText2:
	text "Ah, refreshed and"
	line "restored!"
	done
