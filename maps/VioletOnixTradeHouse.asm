VioletOnixTradeHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  7, VIOLET_CITY, 6
	warp_event  4,  7, VIOLET_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletKylesHousePokefanMText, -1
	object_event  6,  5, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletTraderScript, -1

VioletKylesHousePokefanMText:
	text "There's no substi-"
	line "tute for the smell"
	cont "of freshly fallen"
	cont "rain."

	done

VioletHisuiTraderScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_VIOLET_POKEMON
	iftrue .AlreadyGotPokemon
	writetext VioletHisuiTraderText
	promptbutton
	loadmenu .HisuiPokemonMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .GiveDusclops
	ifequal 2, .GiveKirlia
	ifequal 3, .GiveSnover
	ifequal 4, .GiveLapras
	jumptext VioletHisuiTraderNoThanksText

.AlreadyGotPokemon
	writetext VioletHisuiTraderRememberText
	waitbutton
	closetext
	end

.GiveDusclops:
	givepoke DUSCLOPS, 27
	iffalse .PartyFull
	setevent EVENT_GOT_VIOLET_POKEMON
	writetext VioletHisuiTraderDusclopsText
	waitbutton
	closetext
	end

.GiveKirlia:
	givepoke KIRLIA, 27
	iffalse .PartyFull
	setevent EVENT_GOT_VIOLET_POKEMON
	writetext VioletHisuiTraderKirliaText
	waitbutton
	closetext
	end

.GiveSnover:
	givepoke SNOVER, 27
	iffalse .PartyFull
	setevent EVENT_GOT_VIOLET_POKEMON
	writetext VioletHisuiTraderSnoverText
	waitbutton
	closetext
	end

.GiveLapras:
	givepoke LAPRAS, 27
	iffalse .PartyFull
	setevent EVENT_GOT_VIOLET_POKEMON
	writetext VioletHisuiTraderLaprasText
	waitbutton
	closetext
	end


.PartyFull:
	writetext VioletHisuiTraderPartyFullText
	waitbutton
	closetext
	end

.HisuiPokemonMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 5 ; items
	db "DUSCLOPS@"
	db "KIRLIA@"
	db "SNOVER@"
	db "LAPRAS@"
	db "CANCEL@"

VioletHisuiTraderRememberText:
	text "Heh, thanks for"
	line "supporting small"
	cont "business."
	done

VioletHisuiTraderText:
	text "Are you working"
	line "on a #dex?"
	
	para "I rescued these"
	line "#mon from bad"
	cont "situations, and"
	cont "can't take care"
	cont "of them all on"
	cont "my own."
	
	text "Would you take"
	line "one? Please?"
	
	done

VioletHisuiTraderDusclopsText:
	text "Ah, Dusclops!"
	
	para "It must have"
	line "beckoned to you."

	done

VioletHisuiTraderKirliaText:
	text "Kirlia, so grace-"
	line "ful!"
	
	para "Its power will"
	line "grow as it bonds"
	cont "to you."
	
	done

VioletHisuiTraderSnoverText:
	text "Snover, a most"
	line "curious #mon!"
	
	para "A great companion"
	line "in the winter."
	done
	
VioletHisuiTraderLaprasText:
	text "Oh Lapras!"

	para "It has such a"
	line "lovely song."
	
	done

VioletHisuiTraderPartyFullText:
	text "Oh! Your party is"
	line "full. Please make"
	cont "room and come"
	cont "back."
	done

VioletHisuiTraderNoThanksText:
	text "No problem! Feel"
	line "free to come back"
	cont "if you change"
	cont "your mind!"
	done
