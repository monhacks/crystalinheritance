Gauldenrod_MapScriptHeader: 
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 18, 27, GAULDENROD_DORMS, 1
	warp_event 27, 13, GAULDENROD_STOCKROOM, 1
	warp_event 28, 7, GAULDENROD_GUILD, 1
	warp_event  9, 31, GAULDENROD_HOUSE, 1  ; TRADE QUEST
	warp_event 11, 25, GAULDENROD_UNDERGROUND_SOUTH, 1
	warp_event 13,  7, GAULDENROD_UNDERGROUND_NORTH, 1
	warp_event 23, 3, GAULDENROD_SERENE_SPRINGS_GATE, 1
	warp_event 24, 3, GAULDENROD_SERENE_SPRINGS_GATE, 2
	warp_event  9, 15, GAULDENROD_TOWER_1F, 1

	def_coord_events
	coord_event 22, 35, 0, GauldenrodBobeshScene
	coord_event 23, 35, 0, GauldenrodBobeshScene
	coord_event 24, 35, 0, GauldenrodBobeshScene
	coord_event 25, 35, 0, GauldenrodBobeshScene
	
	def_bg_events
	bg_event 15, 15, BGEVENT_READ, GauldenrodTowerSign
	bg_event 26, 16, BGEVENT_READ, GauldenrodCitySign
	bg_event 28, 22, BGEVENT_READ, GauldenrodBazaarSign
	bg_event 21, 31, BGEVENT_READ, AmosWantedSign
	bg_event 32,  6, BGEVENT_READ, GauldenrodGuildSign
	bg_event 16,  6, BGEVENT_READ, GauldenrodTunnelSign
	bg_event 22, 22, BGEVENT_READ, GauldenrodNoFishingSign

	def_object_events
	object_event  23, 30, SPRITE_BOBESH, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0,  OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GAULDENROD_BOBESH
	pokemon_event 24, 32, FLAREON, -1, -1, PAL_NPC_RED, ObjectEvent, EVENT_GAULDENROD_FLAREON; DISAPPEARED UNTIL APPEARS
	object_event  23, 33, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PURPLE,  OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GAULDENROD_BRIGADER_CINDY
	object_event  24, 33, SPRITE_BRIGADER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GAULDENROD_BRIGADER_CINDY

	object_event 31, 24, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GauldenrodNPC1Script, EVENT_GAULDENROD_CIVILIANS
	object_event 34, 20, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GauldenrodHisuiTraderScript, EVENT_GAULDENROD_CIVILIANS
	mart_clerk_event  27, 25, MARTTYPE_STANDARD, MART_GAULDENROD_1	
	mart_clerk_event  27, 20, MARTTYPE_STANDARD, MART_GAULDENROD_2	
	object_event  34,  24, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_TM, MART_GAULDENROD_3, EVENT_GAULDENROD_CIVILIANS
	object_event 23, 6, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GauldenrodNPC2Script, EVENT_GAULDENROD_CIVILIANS
	object_event 23, 29, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GauldenrodNPC3Script, EVENT_GAULDENROD_CIVILIANS
	object_event 17,  9, SPRITE_MATRON, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GauldenrodNPC4Script, EVENT_GAULDENROD_CIVILIANS
	object_event 23, 12, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GauldenrodNPC5Script, EVENT_GAULDENROD_CIVILIANS
	object_event 13,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GauldenrodNPC6Script, EVENT_GAULDENROD_CIVILIANS
	object_event 19, 17, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GauldenrodNPC7Script, EVENT_GAULDENROD_CIVILIANS
	object_event 12, 17, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GauldenrodNPC8Script, EVENT_GAULDENROD_CIVILIANS

	fruittree_event  36, 7, FRUITTREE_GAULDENROD, RADIANT_OPAL, PAL_NPC_RED
	object_event 23, 4, SPRITE_BRIGADER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BrigaderScript, EVENT_GAULDENROD_TUNNELERS
	object_event 24, 4, SPRITE_BRIGADER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BrigaderScript, EVENT_GAULDENROD_TUNNELERS


	object_const_def
	const GAULDENROD_BOBESH
	const GAULDENROD_OCTILLERY
	const GAULDENROD_MATRON
	const GAULDENROD_BRIGADER

GauldenrodNPC1Script:
	jumptextfaceplayer GauldenrodNPC1Text

GauldenrodNPC1Text:
	text "Have you tried"
	line "the new #-"
	cont "balls?"
	
	para "They're so much"
	line "more convenient"
	cont "than apricorns."
	done

GauldenrodBerrySalesmanScript:
	jumptextfaceplayer GauldenrodBerrySalesmanText

GauldenrodBerrySalesmanText:
	text "Berries berries!"
	done

GauldenrodApricornSalesScript:
	jumptextfaceplayer GauldenrodApricornSalesText

GauldenrodApricornSalesText:
	text "Need an apricorn?"
	done

GauldenrodTMSalesScript:
	jumptextfaceplayer GauldenrodTMSalesText

GauldenrodTMSalesText:
	text "Upgrade your"
	line "battle prowess"
	cont "for the stadium?"
	done

GauldenrodNPC2Script:
	jumptextfaceplayer GauldenrodNPC2Text

GauldenrodNPC2Text:
	text "If you need some"
	line "food, they offer"
	cont "it at the stadium."
	cont "The emperor"
	cont "provides for us"
	cont "that way."
	done

GauldenrodNPC3Script:
	jumptextfaceplayer GauldenrodNPC3Text

GauldenrodNPC3Text:
	text "Check out the"
	line "bazaar. Traveling"
	cont "traders might have"
	cont "something new for"
	cont "sale."
	done

GauldenrodNPC4Script:
	jumptextfaceplayer GauldenrodNPC4Text

GauldenrodNPC4Text:
	text "I used to resent"
	line "the emperor taking"
	cont "over the city, but"
	cont "I appreciate the"
	cont "stadium."
	done

GauldenrodNPC5Script:
	jumptextfaceplayer GauldenrodNPC5Text

GauldenrodNPC5Text:
	text "The stadium is so"
	line "fun. Some trainer"
	cont "drones against the"
	cont "emperor, and then"
	cont "their #mon get"
	cont "stomped."
	done

GauldenrodNPC6Script:
	jumptextfaceplayer GauldenrodNPC6Text

GauldenrodNPC6Text:
	text "I stay away from"
	line "the stadium. It"
	cont "gets people so"
	cont "riled up."
	done

GauldenrodNPC7Script:
	jumptextfaceplayer GauldenrodNPC7Text

GauldenrodNPC7Text:
	text "I always forget my"
	line "worries watching"
	cont "some battles at"
	cont "the stadium."
	done

GauldenrodNPC8Script:
	jumptextfaceplayer GauldenrodNPC8Text

GauldenrodNPC8Text:
	text "The Tower has work"
	line "for all sorts of"
	cont "people. After my"
	cont "dad broke his leg,"
	cont "they gave him a"
	cont "job cleaning"
	cont "statues."
	done

GauldenrodTowerSign:
	jumptext GauldenrodTowerSignText

GauldenrodTowerSignText:
	text "Gauldenrod Tower"
	line "Reaching for the"
	cont "Sky"
	done

GauldenrodCitySign:
	refreshscreen
	trainerpic BOBESH
	waitbutton
	closepokepic
	jumpthistext

	text "Gauldenrod City"
	line "Overseen by"
	cont "General Bobesh"
	done

GauldenrodBazaarSign:
	jumptext GauldenrodBazaarSignText

GauldenrodBazaarSignText:
	text "Gauldenrod Bazaar"
	done

AmosWantedSign:
	refreshscreen
	trainerpic AMOS
	waitbutton
	closepokepic
	jumpthistext

	text "WANTED: This man"
	line "is wanted for"
	cont "crimes against"
	cont "the emperor."

	para "If you see him,"
	line "please notify a"
	cont "brigader"
	cont "immediately."

	para "Known alias:"
	line "Amos."
	done

GauldenrodGuildSign:
	jumptext GauldenrodGuildSignText
	
GauldenrodGuildSignText:
	text "Gauldenrod Guild"
	line "What's old is"
	cont "new again"
	done

BrigaderScript:
	jumptextfaceplayer GauldenrodBrigaderText
	
GauldenrodBrigaderText:
	text "Stay out of"
	line "trouble."

GauldenrodTunnelSign:
	jumptext GauldenrodTunnelSignText
	
GauldenrodTunnelSignText:
	text "Just a humble"
	line "abode, nothing"
	cont "to see here."
	
GauldenrodNoFishingSign:
	jumptext GauldenrodNoFishingSignText
	
GauldenrodNoFishingSignText:
	text "Posted: No"
	line "Fishing!"
	
	
GauldenrodHisuiTraderScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_GAULDENROD_POKEMON
	iftrue .AlreadyGotPokemon
	writetext GauldenrodHisuiTraderText
	promptbutton
	loadmenu .HisuiPokemonMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .GiveLuxio
	ifequal 2, .GiveRoselia
	ifequal 3, .GiveStaravia
	ifequal 4, .GiveVespiquen
	jumptext GauldenrodHisuiTraderNoThanksText

.AlreadyGotPokemon
	writetext GauldenrodHisuiTraderRememberText
	waitbutton
	closetext
	end

.GiveLuxio:
	givepoke LUXIO, 20
	iffalse .PartyFull
	setevent EVENT_GOT_GAULDENROD_POKEMON
	writetext GauldenrodHisuiTraderLuxioText
	waitbutton
	closetext
	end

.GiveRoselia:
	givepoke ROSELIA, 20
	iffalse .PartyFull
	setevent EVENT_GOT_GAULDENROD_POKEMON
	writetext GauldenrodHisuiTraderRoseliaText
	waitbutton
	closetext
	end

.GiveStaravia:
	givepoke STARAVIA, 20
	iffalse .PartyFull
	setevent EVENT_GOT_GAULDENROD_POKEMON
	writetext GauldenrodHisuiTraderStaraviaText
	waitbutton
	closetext
	end

.GiveVespiquen:
	givepoke VESPIQUEN, 20
	iffalse .PartyFull
	setevent EVENT_GOT_GAULDENROD_POKEMON
	writetext GauldenrodHisuiTraderVespiquenText
	waitbutton
	closetext
	end


.PartyFull:
	writetext GauldenrodHisuiTraderPartyFullText
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
	db "LUXIO@"
	db "ROSELIA@"
	db "STARAVIA@"
	db "VESPIQUEN@"
	db "CANCEL@"

GauldenrodHisuiTraderRememberText:
	text "Hey, I remember"
	line "you. How is that"
	cont "#mon I gave you?"
	done

GauldenrodHisuiTraderText:
	text "Hello! Rare"
	line "#MON! Fresh"
	cont "from Hisui. Which"
	cont "one would you"
	cont "like?"
	done

GauldenrodHisuiTraderLuxioText:
	text "Ah, Luxio!"
	line "Its static dis-"
	cont "charge can light"
	cont "up any DARK area."
	done

GauldenrodHisuiTraderRoseliaText:
	text "Roselia, so love-"
	line "ly! This Grass and"
	cont "Poison-type will"
	cont "be a thorn in the"
	cont "side of your"
	cont "rivals!"
	done

GauldenrodHisuiTraderStaraviaText:
	text "Staravia, excel-"
	line "lent! If you get"
	cont "CLOSE enough, it"
	cont "will show you how"
	cont "BRAVE it can be!"
	done
	
GauldenrodHisuiTraderVespiquenText:
	text "Oh Vespiquen!"
	line "There's quite a"
	cont "BUZZ about its"
	cont "honey!"
	done

GauldenrodHisuiTraderPartyFullText:
	text "Oh! Your party is"
	line "full. Please make"
	cont "room and come"
	cont "back if you'd like"
	cont "a Hisui #MON."
	done

GauldenrodHisuiTraderNoThanksText:
	text "No problem! Feel"
	line "free to come back"
	cont "if you change"
	cont "your mind!"
	done

GauldenrodBobeshScene: ; todo, make 
	clearevent EVENT_GAULDENROD_BOBESH
    showemote GAULDENROD_BRIGADER, EMOTE_BOLT, 10
    showtext BrigaderText1
    showtext CindyText1
    appear GAULDENROD_BOBESH
	appear GAULDENROD_BOBESH
    applymovement GAULDENROD_BOBESH, BobeshWalksDown
	appear GAULDENROD_OCTILLERY
    showemote EMOTE_SHOCK, GAULDENROD_BOBESH, 10
    showtext BobeshText1
    showtext BrigaderText2
    showtext CindyText2
    applymovement BOBESH, BobeshMovesToCindy
    turnobject GAULDENROD_MATRON, LEFT
    showtext BobeshText2
    showtext CindyText3
    showtext BobeshText3
    turnobject GAULDENROD_MATRON, DOWN
    showtext CindyText4
    showtext BobeshText4
    showtext CindyText5
    showtext BobeshText5
    showtext CindyText6 ; crashed after this 
	
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
    disappear GAULDENROD_MATRON
    disappear GAULDENROD_BRIGADER
	disappear GAULDENROD_OCTILLERY
	disappear GAULDENROD_BOBESH
	setevent EVENT_GAULDENROD_BOBESH
	setevent EVENT_GAULDENROD_OCTILLERY
	setevent EVENT_GAULDENROD_BRIGADER_CINDY
	clearevent EVENT_GAULDENROD_CIVILIANS
	pause 10
	special Special_FadeInQuickly
	setscene $1
    end


BrigaderText1:
    text "Brigader: Where"
    line "is he?"
    done

CindyText1:
    text "Cindy: I told"
    line "you! I don't"
    cont "know!"
    done

BobeshText1:
    text "Bobesh: Order!"
    line "Order! What's"
    cont "going on here?"
    done

BrigaderText2:
    text "Brigader: General"
    line "Bobesh. She"
    cont "is harboring"
    cont "the anarchist"
    cont "Amos."
    done

CindyText2:
    text "Cindy: No!"
    done

BobeshText2:
    text "Bobesh: Such"
    line "claims against"
    cont "a respected"
    cont "matriarch."
	
	para "Tell me,"
    cont "how is your"
    cont "husband?"
    done

CindyText3:
    text "Cindy: He"
    cont "still gardens."
	
	para "By the tower."
    done

BobeshText3:
    text "Bobesh: What a"
    line "convenient"
    cont "vantage at the"
    cont "old religion's"
    cont "temple."
    done

CindyText4:
    text "Cindy: These"
    line "days he is busy"
    cont "pulling weeds"
    cont "that don't"
    cont "belong. We have"
    cont "some ugly"
    cont "red ones"
    cont "right now."
    done

BobeshText4:
    text "Bobesh: Soldiers"
    line "heard Amos at"
    cont "the tower. Your"
    cont "husband's silence"
    cont "damns you both."
	
    para "Cindy- Johto"
    line "faces threats."
	
    para "We can't allow"
    line "division."
	
	para "I'm in charge of"
	line "this city, and "
	cont "I'll make sure"
	cont "we don't fall"
	cont "to the brutes."
    done

CindyText5:
    text "Cindy: ..."
    done

BobeshText5:
    text "Bobesh: Brigader!"
    line "Take her away"
    cont "to the stadium."
    para "She will submit"
    line "to Levi, or be"
	
    para "returned to a"
    line "a state of"
    cont "nature."
    done

CindyText6:
    text "Cindy: No!"
    done

PlayerMovesToWatchScene:
    step_up
    step_up
    step_end

BobeshWalksDown:
    step_down
    step_down
    step_end

BobeshMovesToCindy:
    step_left
    step_down
	turn_head_right
    step_end

BrigaderTakesCindy:
    step_up
    step_up
    step_up
    step_up
    step_up
    step_up
    step_end

CindyTakenAway:
    step_up
    step_up
    step_up
    step_up
    step_up
    step_up
    step_end
	
BobeshWalksAway:
    step_up
    step_up
    step_up
    step_up
    step_up
    step_up
	step_end