MahoganyTown_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, MahoganyTownFlyPoint 

	def_warp_events
	warp_event 11,  7, MAHOGANY_MART_1F, 1
	warp_event 17,  7, MAHOGANY_RED_GYARADOS_SPEECH_HOUSE, 1
	warp_event  6, 13, MAHOGANY_GYM, 1
	warp_event 15, 13, MAHOGANY_POKECENTER_1F, 1
	warp_event  9,  1, ROUTE_43_MAHOGANY_GATE, 3

	def_coord_events
	coord_event 9, 2, 0, MahoganyTradeQuestTrigger

	def_bg_events
	bg_event  1,  5, BGEVENT_JUMPTEXT, MahoganyTownSignText
	bg_event  9,  7, BGEVENT_READ, MahoganyTownSouvenirShopSign
	bg_event  3, 13, BGEVENT_JUMPTEXT, MahoganyGymSignText
	bg_event  8,  2, BGEVENT_JUMPTEXT, SilphSpringsAheadText

	def_object_events
	object_event  11,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MahoganyTownGrampsScript, -1 ; trade quest 
	object_event  6,  7, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MahoganyTownFisherText, -1
	object_event 12,  8, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, MahoganyTownLassText, -1
	object_event  7, 14, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyKurtScript, EVENT_LISTENED_TO_KURT_4 ; 
	object_event 10,  9, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MahoganyTownGrannyText, -1
	object_event  9, 3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MahoganyTownOfficerText, EVENT_BEAT_PRYCE
	
	object_const_def
	const MAHOGANY_TOWN_GRAMPS

MahoganyTradeQuestTrigger:
	showemote EMOTE_SAD, MAHOGANY_TOWN_GRAMPS, 30
	end

MahoganyTownFlyPoint:
	setflag ENGINE_FLYPOINT_MAHOGANY
	endcallback

MahoganyTownSouvenirShopSign:
	jumpthistext

	text "Grandma's"
	line "Souvenir Shop"
	done

MahoganyTownGrannyText:
	text "I hear that at"
	line "night, an enorm-"
	cont "ous Ursaring goes"
	
	para "around, looking"
	line "for scraps."
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
	setscene $1
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
	text "How'd they build"
	line "such a complex"
	cont "ninja hideout,"
	para "underground, so"
	line "many years ago?"
	done

MahoganyTownLassText:
	text "We have to ration"
	line "water, now that"
	cont "the lake is dry."
	done

MahoganyTownSignText:
	text "Mahogany Town"

	para "Welcome to the"
	line "Home of the Ninja"
	done


MahoganyGymSignText:
	text "Mahogany Town"
	line "#mon Gym"
	cont "Leader: Pryce"

	para "The Teacher of"
	line "Winter's Harshness"
	done


MahoganyKurtScript: 
	faceplayer
	opentext
	writetext KurtHearAStoryQuestionMahogany
	yesorno
	iffalse_jumpopenedtext MahoganyDeclineKurtStoryText
	writetext MahoganyKurtStoryText
	setevent EVENT_LISTENED_TO_KURT_4
	waitbutton
	end

KurtHearAStoryQuestionMahogany:
	text "Would you like"
	line "to hear a story?"
	
	para "When I was here,"
	line "with your dad?"
	done
	
MahoganyDeclineKurtStoryText:
	text "Some other time."
	done
	
MahoganyKurtStoryText:
	text "I invited your"
	line "dad to celebrate"
	cont "winter festival,"

	para "but he couldn't"
	line "make it. We'd met"
	cont "up to walk his"

	para "#mon every"
	line "month, but this"
	cont "was the first he"
	cont "couldn't make."

	para "When I got home,"
	line "I noticed some "
	cont "paint was wearing"
	cont "off the apricorn."
	done

MahoganyTownOfficerText:
	text "There's a report"
	line "of an aggressive"
	para "#mon ahead."
	line "Only those with a"
	para "Mahogany Badge"
	line "can pass."
	done	

SilphSpringsAheadText:
	text "Silph Springs:"
	line "Sustainable water"
	para "for all of Johto"
	line "and beyond!"
	done
