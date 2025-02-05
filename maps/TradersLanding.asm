TradersLanding_MapScriptHeader: 

	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 11, 6, LANDING_BARBEAU, 1
	warp_event 13, 11, LANDING_STOCKROOM, 1
	warp_event 15, 16, LANDING_DORMS, 1
	warp_event 9, 16, LANDING_TAVERN, 1
	warp_event 25, 7, LANDING_HOUSE_1, 1
	warp_event 29, 7, LANDING_HOUSE_2, 1
;	warp_event 20, 7, LANDING_DOCKS, 1 INACCESSIBLE
;	warp_event 29, 7, LANDING_DOCKS, 1 INACCESSIBLE


	def_coord_events
	coord_event 18, 3, 0, TL_Scene_Part_1_Script
	coord_event 19, 3, 0, TL_Scene_Part_1_Script
	coord_event 20, 3, 0, TL_Scene_Part_1_Script


	def_bg_events
	bg_event 21, 4, BGEVENT_JUMPTEXT, TL_ReportForWorkSign
	bg_event 37, 7, BGEVENT_JUMPTEXT, TL_OpenForBusinessSign
;SHRINE


	def_object_events
	object_event 19, 4, SPRITE_BARBEAU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANDING_SCENE_1 ; ADD TO EVENTS
	object_event 20, 4, SPRITE_KENSEY, 	SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANDING_SCENE_1
	object_event 19, 4, SPRITE_BARBEAU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANDING_SHRINE_BARBEAU ; ADD TO INITIALIZE EVENTS

	object_event 20, 26, SPRITE_BRIGADER, 	SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, jumptextfaceplayer, TL_Brigader_Script, -1 
	object_event 21, 26, SPRITE_BRIGADER, 	SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, jumptextfaceplayer, TL_Brigader_Script, -1 

	object_event 10, 19, SPRITE_FIREBREATHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LandingEggScript, EVENT_BEAT_KENSEY_PORT


	object_const_def
	const TRADERS_LANDING_BARBEAU_1
	const TRADERS_LANDING_KENSEY
	const TRADERS_LANDING_BARBEAU_2

TL_ReportForWorkSign:
	text "Coastal Nomads:"
	line "Report for work"
	cont "at lighthouse!"
	para "-General Kensey"
	done

TL_OpenForBusinessSign:
	text "Trader's Landing!"
	line "Open for business!"
	done

TL_Brigader_Script:
	checkevent EVENT_BEAT_KENSEY_PORT ; ADD TO EVENTS 
	iftrue_jumptextfaceplayer TL_Brigader_AfterKenseyText
	jumpthisopenedtext
	
	text "Port is open only"
	line "to workers."
	
	para "Go see Barbeau"
	line "for assignment."
	done

TL_Brigader_AfterKenseyText:
	text "The port will"
	line "take some time"
	cont "to rebuild after"
	cont "that nasty storm."
	done


LandingEggScript: ;cf the cafe script 
	checkevent EVENT_GOT_HSLIGGOO_EGG
	iftrue_jumptextfaceplayer GotHSliggooEggText
	faceplayer
	opentext
	writetext GivingHSliggooEggText
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext NoMoneyText
	checkmoney $0, 10000
	ifequal $2, jumpopenedtext NoMoneyText
	promptbutton
	giveegg H__SLIGGOO
	iffalse_jumpopenedtext NoRoomText
	playsound SFX_TRANSACTION
	takemoney $0, 10000
	special PlaceMoneyTopRight
	setevent EVENT_GOT_HSLIGGOO_EGG
	writetext GotHSliggooEggText
	waitbutton
	closetext
	end


GivingHSliggooEggText:
	text "Nedry: Hey, are"
	line "you my contact?"
	
	para "I gotta pass on"
	line "this smuggled egg"
	cont "like we agreed."
	
	para "No need to act"
	line "suspect."
	
	para "Chill out. I must"
	line "have done a mill-"
	cont "ion steps, no wo-"
	cont "nder it's nearly"
	cont "extinct."
	
	para "10k, like your"
	line "side agreed?"
	done
	
GotHSliggooEggText:
	text "Now, I just need"
	line "to escape back on"
	cont "the Sailor's boat"
	cont "and it's a big"
	cont "score."
	
	para "Hopefully it's"
	line "smooth sailing."
	done

NoMoneyText:
	text "Getting cheap on"
	line "me now?"
	done

NoRoomText:
	text "Oh! You won't"
	line "take it?"
	done
