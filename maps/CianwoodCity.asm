CianwoodCity_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CianwoodCityFlyPointAndSuicune

	def_warp_events
	warp_event  5, 27, MANIAS_HOUSE, 1 ; empty 
	warp_event  8, 43, CIANWOOD_GYM, 1
	warp_event  15, 47, MOVE_MANIACS_HOUSE, 1
	warp_event 7, 7, CIANWOOD_CAVE, 1

	def_coord_events


	def_bg_events
	bg_event 20, 34, BGEVENT_JUMPTEXT, CianwoodCitySignText
	bg_event  6, 44, BGEVENT_JUMPTEXT, CianwoodGymSignText
	bg_event 19, 47, BGEVENT_JUMPTEXT, CianwoodPharmacySignText
	bg_event  5, 19, BGEVENT_ITEM + REVIVE, EVENT_CIANWOOD_CITY_HIDDEN_REVIVE
	bg_event 17, 35, BGEVENT_ITEM + MAX_ETHER, EVENT_CIANWOOD_CITY_HIDDEN_MAX_ETHER
	bg_event 10, 24, BGEVENT_READ, CianwoodCityShrineScript

	def_object_events
	object_event 14, 20, SPRITE_EUSINE, 	SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodEusineScript, EVENT_CIANWOODCITY_EUSINE	
	object_event 11, 25, SPRITE_KURT, 	SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CIANWOODCITY_KURT ; INITIALIZE THIS EVENT
	pokemon_event 14, 22, LUGIA, -1, -1, PAL_NPC_BLUE, ObjectEvent, EVENT_CIANWOODCITY_LUGIA ; INITIALIZE 
	smashrock_event 17, 44
	smashrock_event 15, 40
	smashrock_event 13, 32
	smashrock_event 13, 35
	smashrock_event 11, 28
	strengthboulder_event 13, 39
	strengthboulder_event 15, 42

	object_const_def
	const CIANWOODCITY_EUSINE
	const CIANWOODCITY_KURT
	const CIANWOODCITY_LUGIA

CianwoodCityFlyPointAndSuicune:
	setflag ENGINE_FLYPOINT_CIANWOOD
	endcallback

CianwoodCitySignText:
	text "Cianwood City"

	para "A Port Surrounded"
	line "by Rough Seas"
	done

CianwoodGymSignText:
	text "Cianwood City"
	line "#mon Gym"

	para "Leader: Chuck"

	para "His Roaring Fists"
	line "Do the Talking"
	done

CianwoodPharmacySignText:
	text "500 Years of"
	line "Tradition"

	para "Cianwood City"
	line "Pharmacy"

	para "We Await Your"
	line "Medicinal Queries"
	done

CianwoodPhotoStudioSignText:
	text "Cianwood City"
	line "Photo Studio"

	para "Take a Snapshot as"
	line "a Keepsake!"
	done

CianwoodCliffEdgeGateSignText:
	text "Cliff Edge Gate"

	para "Yellow Forest is"
	line "just ahead!"
	done

CianwoodMoveManiacSignText:
	text "The Move Maniac"
	line "Ahead"
	done


CianwoodEusineScript:
	faceplayer
	checkevent EVENT_HEARD_CIANWOOD_SHPEEL
	iftrue .HeardShpeel
	showtext CianwoodShpeelText
.HeardShpeel	
	checkpoke LUGIA
	iffalse_jumpopenedtext CianwoodEusineNoLugiaText
	; music 
	closetext
	appear CIANWOODCITY_KURT
	applymovement CIANWOODCITY_KURT, CC_Move_Kurt
	appear CIANWOODCITY_LUGIA
	applymovement PLAYER, CC_Move_PlayerStepsDown
	applyemote EMOTE_SHOCK, CIANWOODCITY_EUSINE, 10
	showtext CC_KurtText1
	applymovement CIANWOODCITY_EUSINE, CC_Move_Eusine_1
	showtext CC_EusineText1
	turnobject CIANWOODCITY_KURT, LEFT
	showtext CC_KurtText2	
	disappear CIANWOODCITY_LUGIA
	turnobject CIANWOODCITY_EUSINE, LEFT
	follow CIANWOODCITY_KURT, PLAYER
	applymovement CIANWOODCITY_KURT, CC_Move_Kurt_2
	turnobject CIANWOODCITY_EUSINE, UP
	showtext CC_KurtPrayer
	refreshscreen
	paintingpic LUGIA_PAINTING
	waitbutton
	closepokepic
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	setevent EVENT_CIANWOODCITY_LUGIA
	setevent EVENT_CIANWOODCITY_KURT
	setevent EVENT_CIANWOODCITY_EUSINE
	warp CIANWOOD_COVE, 11, 15
	end
	
CianwoodShpeelText:
	text "Eusine: The storm"
	line "was a malevolent"
	cont "force of nature."
	
	para "In a few short"
	line "hours, its anger"
	cont "grew from a tant-"
	cont "rum to a terror."
	
	para "I spent my life"
	line "chasing nature's"
	cont "beauty, but she"
	
	para "spurned this idy-"
	line "llic city for no"
	cont "good reason."
	
	para "Chuck tried to"
	line "save it, but they"
	cont "couldn't raise a"
	cont "seawall."
	
	para "I've sought only"
	line "beauty in nature."
	cont "Perhaps I've been"
	cont "blind all along."
	
	para "I long to see the"
	line "divine, the pure."
	cont "Show me there's"
	cont "still hope here."
	done

	
CianwoodEusineNoLugiaText:
	text "Perhaps we don't"
	line "deserve nature's"
	cont "beauty."
	done

CC_Move_Kurt:
	step_up
	step_up
	step_up
	step_right
	step_right
	step_up
	step_end
	
CC_Move_PlayerStepsDown:
	step_down
	step_down
	step_left
	step_down
	turn_head_right
	step_end

CC_Move_Eusine_1:
	step_left
	step_down
	step_down
	step_right
	turn_head_down
	step_end

CC_Move_Kurt_2:
	step_up
	step_up

CC_KurtText1:
	text "Kurt: I felt a"
	line "similar cynicism,"
	cont "but now, I feel"
	para "empowered. Like"
	line "I'm fulfilling my"
	cont "destiny."
	done
	
CC_EusineText1	
	text "Eusine: Lugia!"
	line "What majesty!"

	para "The glyphs on the"
	line "rock showed her"
	cont "awesome power."
	done
	
CC_KurtText2:
	text "Kurt: <PLAYER>,"
	line "we should pray."
	para "It may cause us"
	line "to go backwards"
	cont "in time."
	done
	
CC_KurtPrayer:
	text "So this is my"
	line "guardian of the"
	cont "sea."
	
	para "Lugia: In this"
	line "darkest hour,"
	
	para "upon this"
	line "tattered atoll,"
	
	para "Bring a cleansing"
	line "shower,"
	
	para "Make what's broken"
	line "whole!"
	done
	
CianwoodCityShrineScript: ; revise: show painting of lugia
	refreshscreen
	paintingpic LUGIA_PAINTING
	waitbutton
	closepokepic
	showtext CC_AskToTimeTravelText
	yesorno
	iffalse_jumpopenedtext CC_NoTimeTravelText
	writetext CC_YesTimeTravelText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp CIANWOOD_COVE, 10, 14
	end

CC_AskToTimeTravelText:
	text "It's a shrine to"
	line "Lugia."
	
	para "Travel back in"
	line "time?"
	done

CC_NoTimeTravelText:
	text "Maybe later."
	done

CC_YesTimeTravelText:
	text "..."
	done
