MahoganyTown_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, MahoganyTownFlyPoint ;TODO NEED TO ADD THE OLD JOHTO TOWNS AS FLYPOINTS

	def_warp_events
	warp_event 11,  7, MAHOGANY_MART_1F, 1
	warp_event 17,  7, MAHOGANY_RED_GYARADOS_SPEECH_HOUSE, 1
	warp_event  6, 13, MAHOGANY_GYM, 1
	warp_event 15, 13, MAHOGANY_POKECENTER_1F, 1
	warp_event  9,  1, ROUTE_43_MAHOGANY_GATE, 3

	def_coord_events


	def_bg_events
	bg_event  1,  5, BGEVENT_JUMPTEXT, MahoganyTownSignText
	bg_event  9,  7, BGEVENT_READ, MahoganyTownSouvenirShopSign
	bg_event  3, 13, BGEVENT_JUMPTEXT, MahoganyGymSignText

	def_object_events
	object_event  6,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MahoganyTownGrampsScript, -1
	object_event  6, 14, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MahoganyTownFisherText, -1
	object_event 12,  8, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, MahoganyTownLassText, -1

	object_const_def
	const MAHOGANYTOWN_POKEFAN_M

MahoganyTownFlyPoint:
	setflag ENGINE_FLYPOINT_MAHOGANY
	endcallback

MahoganyTownSouvenirShopSign:
	jumpthistext

	text "Grandma's"
	line "Souvenir Shop"
	done

MahoganyTownGrampsScript:
	faceplayer
	opentext	
	writetext NeedASurfMailText
	waitbutton
	checkitem SURF_MAIL
	iffalse_jumpopenedtext Text_NoSurfMail
	writetext Text_SurfMailQuestion ;;
	yesorno
	iffalse_jumpopenedtext Text_NoSurfMail
	takeitem SURF_MAIL
	verbosegiveitem OLD_AMBER
	iffalse_endtext
	jumpopenedtext GiveOldAmberText 

NeedASurfMailText: 
	text "Oh, the sea. How"
	line "I miss my days on"
	cont "the water."
	
	para "I wish I could"
	line "see it once more,"
	
	para "as when I was a"
	line "spry fisher,"
	
	para "but Olivine is"
	line "too far away."
	
	para "Now, all I fish"
	line "for are fossils"
	cont "from the mud at"
	cont "the quarry."
	
	para "Sigh... "	
	done

Text_SurfMailQuestion:
	text "Wait - what're"
	line "those doodles?"
	
	para "They look like"
	line "the view from the"
	cont "Olivine Pier."
	
	para "Could... Could I"
	line "have it? I will"
	cont "give you a fossil"
	cont "I found."
	done

	
GiveOldAmberText: 
	text "That fossil was"
	line "dug out of the"
	cont "ground. It took a"
	cont "lot of work!"
	done

Text_NoSurfMail:
	text "Oh, I only have"
	line "my memories to"
	cont "see it by..."
	done




MahoganyTownFisherText:
	text "Since you came"
	line "this far, take the"

	para "time to do some"
	line "sightseeing."

	para "You should head"
	line "north and check"

	para "out Lake of Rage"
	line "right now."
	done

MahoganyTownLassText:
	text "Visit Grandma's"
	line "shop. She sells"

	para "stuff that nobody"
	line "else has."
	done

MahoganyTownSignText:
	text "Mahogany Town"

	para "Welcome to the"
	line "Home of the Ninja"
	done

MahoganyTownSouvenirShopSignText1:
	text "Just a Souvenir"
	line "Shop"

	para "Nothing Suspicious"
	line "About It"

	para "No Need to Be"
	line "Alarmed"
	done

MahoganyGymSignText:
	text "Mahogany Town"
	line "#mon Gym"
	cont "Leader: Pryce"

	para "The Teacher of"
	line "Winter's Harshness"
	done
