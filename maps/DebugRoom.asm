DebugRoom_MapScriptHeader: ; should be like  "BurnedTowerB1F_MapScriptHeader"
	def_scene_scripts


	def_callbacks


	def_warp_events



	def_coord_events



	def_bg_events
	bg_event  1,  2, BGEVENT_READ, DebugCPU ; check the items are all there 
	bg_event  5,  2, BGEVENT_READ, DebugCPU2

	def_object_events
	object_event  4,  3, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE,  OBJECTTYPE_SCRIPT, 0, dwgDebugScript, -1
	object_event  2,  3, SPRITE_TAMER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE,  OBJECTTYPE_SCRIPT, 0, Breeder1Script, EVENT_KURT_HEARS_LOGGERS
	object_event  7,  8, SPRITE_BREEDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE,  OBJECTTYPE_SCRIPT, 0, Breeder2Script, -1 ; gives lots of mons
	object_event  6,  8, SPRITE_BREEDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE,  OBJECTTYPE_SCRIPT, 0, Breeder3Script, -1 ; gives lots of mons
	object_event  5,  8, SPRITE_BREEDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE,  OBJECTTYPE_SCRIPT, 0, Breeder4Script, -1 ; gives lots of mons
	object_event  4,  8, SPRITE_BREEDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE,  OBJECTTYPE_SCRIPT, 0, Breeder5Script, -1 ; gives lots of mons
	object_event  3,  8, SPRITE_BREEDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE,  OBJECTTYPE_SCRIPT, 0, Breeder6Script, -1 ; gives lots of mons
	object_event  6,  4, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE,  OBJECTTYPE_SCRIPT, 0, DebugWonderTradeScript, -1 ; wonder trade
	object_event  3,  3, SPRITE_PSYCHIC_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE,  OBJECTTYPE_SCRIPT, 0, DebugTimeTravelerScript, -1 ; wonder trade
	
	object_const_def
	const DEBUG_DWG




DebugCPU:
	opentext
	writetext DebugCPUText
	; time
	special Special_SetDayOfWeek
	special Special_InitialClearDSTFlag
	; full pokegear
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	setflag ENGINE_MAP_CARD
	setflag ENGINE_RADIO_CARD
	setflag ENGINE_EXPN_CARD
	; pokedex
	setflag ENGINE_POKEDEX
	; all key items
for x, NUM_KEY_ITEMS
if x != MACHINE_PART
	givekeyitem x
endc
endr
	; all tms+hms
for x, NUM_TMS + NUM_HMS
	givetmhm x
endr
	; useful items
for x, POKE_BALL, CHERISH_BALL + 1
if x != PARK_BALL && x != SAFARI_BALL
	giveitem x, 99
endc
endr
	giveitem MAX_POTION, 99
	giveitem FULL_RESTORE, 99
	giveitem MAX_REVIVE, 99
	giveitem MAX_ELIXIR, 99
	giveitem HP_UP, 99
	giveitem PROTEIN, 99
	giveitem IRON, 99
	giveitem CARBOS, 99
	giveitem CALCIUM, 99
	giveitem ZINC, 99
	giveitem RARE_CANDY, 99
	giveitem PP_UP, 99
	giveitem PP_MAX, 99
	giveitem SACRED_ASH, 99
	giveitem MAX_REPEL, 99
	giveitem MAX_REPEL, 99
	giveitem ESCAPE_ROPE, 99
	giveitem ABILITY_CAP, 99
	giveitem LEAF_STONE, 99
	giveitem FIRE_STONE, 99
	giveitem WATER_STONE, 99
	giveitem THUNDERSTONE, 99
	giveitem MOON_STONE, 99
	giveitem SUN_STONE, 99
	giveitem DUSK_STONE, 99
	giveitem DAWN_STONE, 99
	giveitem SHINY_STONE, 99
	giveitem EXP_SHARE, 99
	giveitem LEFTOVERS, 99
	giveitem BIG_NUGGET, 99
	giveitem SILVER_LEAF, 99
	giveitem GOLD_LEAF, 99
	giveitem ODD_SOUVENIR, 10
	; max money
	givemoney $0, 1000000
	givemoney $0, 1000000
	givemoney $0, 1000000
	givemoney $0, 1000000
	givemoney $0, 1000000
	givemoney $0, 1000000
	givemoney $0, 1000000
	givemoney $0, 1000000
	givemoney $0, 1000000
	givemoney $0, 999999
	givecoins 50000
	loadmem wBattlePoints+0, 0
	loadmem wBattlePoints+1, 250
	; all badges
	setflag ENGINE_ZEPHYRBADGE
	setflag ENGINE_HIVEBADGE
	setflag ENGINE_PLAINBADGE
	setflag ENGINE_FOGBADGE
	setflag ENGINE_STORMBADGE
	setflag ENGINE_MINERALBADGE
	setflag ENGINE_GLACIERBADGE
	setflag ENGINE_RISINGBADGE
	setflag ENGINE_BOULDERBADGE
	setflag ENGINE_CASCADEBADGE
	setflag ENGINE_THUNDERBADGE
	setflag ENGINE_RAINBOWBADGE
	setflag ENGINE_MARSHBADGE
	setflag ENGINE_SOULBADGE
	setflag ENGINE_VOLCANOBADGE
	setflag ENGINE_EARTHBADGE
	; fly anywhere
	setflag ENGINE_FLYPOINT_NEW_BARK
	setflag ENGINE_FLYPOINT_CHERRYGROVE
	setflag ENGINE_FLYPOINT_VIOLET
	setflag ENGINE_FLYPOINT_UNION_CAVE
	setflag ENGINE_FLYPOINT_AZALEA
	setflag ENGINE_FLYPOINT_GOLDENROD
	setflag ENGINE_FLYPOINT_ECRUTEAK
	setflag ENGINE_FLYPOINT_OLIVINE
	setflag ENGINE_FLYPOINT_CIANWOOD
	setflag ENGINE_FLYPOINT_YELLOW_FOREST
	setflag ENGINE_FLYPOINT_MAHOGANY
	setflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	setflag ENGINE_FLYPOINT_BLACKTHORN
	setflag ENGINE_FLYPOINT_SILVER_CAVE
	setflag ENGINE_FLYPOINT_INDIGO_PLATEAU
	setflag ENGINE_FLYPOINT_PALLET
	setflag ENGINE_FLYPOINT_VIRIDIAN
	setflag ENGINE_FLYPOINT_PEWTER
	setflag ENGINE_FLYPOINT_MT_MOON
	setflag ENGINE_FLYPOINT_CERULEAN
	setflag ENGINE_FLYPOINT_CERULEAN_CAPE
	setflag ENGINE_FLYPOINT_VERMILION
	setflag ENGINE_FLYPOINT_CELADON
	setflag ENGINE_FLYPOINT_ROCK_TUNNEL
	setflag ENGINE_FLYPOINT_LAVENDER
	setflag ENGINE_FLYPOINT_FUCHSIA
	setflag ENGINE_FLYPOINT_SAFFRON
	setflag ENGINE_FLYPOINT_CINNABAR
	setflag ENGINE_HAVE_SHINY_CHARM
	callasm FillPokedex
	closetext
	end


Breeder1Script:
	opentext
	writetext Breeder1QuestionText
	yesorno
	iffalse_jumpopenedtext Breeder1SayNoText
	writetext Breeder1Text	
	; good party
	givepoke H__TYPHLOSION, NO_FORM, 100, LEFTOVERS
	loadmem wPartyMon2Moves+0, FLAMETHROWER
	loadmem wPartyMon2Moves+1, SHADOW_BALL
	loadmem wPartyMon2Moves+2, EARTHQUAKE
	loadmem wPartyMon2Moves+3, THUNDERPUNCH
	; hm mules
	givepoke H__SAMUROTT, NO_FORM, 100, LEFTOVERS
	givepoke H__DECIDUEYE, NO_FORM, 100, LEFTOVERS
	givepoke ALAKAZAM, NO_FORM, 100, LEFTOVERS
	loadmem wPartyMon2Moves+0, SURF
	loadmem wPartyMon2Moves+1, CRUNCH
	loadmem wPartyMon2Moves+2, STRENGTH
	loadmem wPartyMon2Moves+3, WATERFALL
	loadmem wPartyMon2PP+0, 15
	loadmem wPartyMon2PP+1, 15
	loadmem wPartyMon2PP+2, 15
	loadmem wPartyMon2PP+3, 30
	loadmem wPartyMon3Moves+0, ENERGY_BALL
	loadmem wPartyMon3Moves+1, ROCK_SMASH
	loadmem wPartyMon3Moves+2, CUT
	loadmem wPartyMon3Moves+3, FLY
	loadmem wPartyMon3PP+0, 20
	loadmem wPartyMon3PP+1, 15
	loadmem wPartyMon3PP+2, 15
	loadmem wPartyMon3PP+3, 15
	loadmem wPartyMon4Moves+0, FLASH
	loadmem wPartyMon4Moves+1, PSYCHIC
	loadmem wPartyMon4Moves+2, FOCUS_BLAST
	loadmem wPartyMon4Moves+3, CALM_MIND
	callasm FillPokedex
	closetext
	end

Breeder1QuestionText:
	text "I can give you four #mon that will defeat everything. This might work in unintended ways if you already have a #mon." 

Breeder1Text:
	text "Here's #mon"
	line "to stomp the"
	cont "game."
	done

Breeder1SayNoText:
	text "Just let me know if you change your mind."

dwgDebugScript:
	faceplayer
	opentext
	writetext DWGIntroText
	writetext DWGQuestionText
	yesorno
	iffalse_jumpopenedtext DWGRefusedText
	writetext DWGSeenText
	waitbutton
	closetext
	winlosstext DWGWinText, DWGLossText
	setlasttalked DEBUG_DWG
	loadtrainer ENGINEER, DWG
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmap
	showtext DWGTextAfter1
	special HealPartyEvenForNuzlocke
	end


DWGIntroText:
Oh! You made it to the debug room. I hope you're enjoying the game! You can talk to the patrons below to get a solid team, wonder trade, or get all the base forms of pokemon. The generator to the left has all the items and flags if you want them. The computer next to me works to access your boxes.  If you ever encounter issues, you can contact me on reddit, u/dwg6m9. 

DWGQuestionText: 
I could use a break from writing code. Want to battle?

DWGRefusedText:
Sigh... OK, back to work for me. 

DWGSeenText:
Here we go!

DWGWinText:
Wow! Nice team!

DWGLossText:
gg

DWGTextAfter1:
Thanks for playing!



DebugCPU2:
	opentext
	special PokemonCenterPC ; per engine/events/std_scripts.asm this is how it should be done. 
	endtext
	end

DebugCPUText:
	text "Debug CPU"
	done

Breeder2Script:
	opentext
	writetext BreederQuestionText
	yesorno
	iffalse_jumpopenedtext BreederSayNoText
	writetext BreederText	
	; a buncha mons
	givepoke CYNDAQUIL, 5
	givepoke ROWLET, 5	
	givepoke OSHAWOTT, 5	
	givepoke BUTTERFREE, 5	
	givepoke BEEDRILL, 5	
	givepoke PIDGEY, 5	
	givepoke EKANS, 5	
	givepoke PIKACHU, 5	
	givepoke NIDORINA, 5	
	givepoke NIDORINO, 5	
	givepoke CLEFAIRY, 5	
	givepoke VULPIX, 5	
	givepoke JIGGLYPUFF, 5	
	givepoke ZUBAT, 5	
	givepoke GLOOM, 5	
	givepoke PARAS, 5	
	givepoke VENONAT, 5	
	givepoke DIGLETT, 5	
	givepoke MEOWTH, 5
	givepoke MANKEY, 5
	closetext
	end


Breeder3Script:
	opentext
	writetext BreederQuestionText
	yesorno
	iffalse_jumpopenedtext BreederSayNoText
	writetext BreederText	
	; a buncha mons
	givepoke GROWLITHE, 5
	givepoke POLIWAG, 5	
	givepoke ABRA, 5	
	givepoke MACHOP, 5	
	givepoke WEEPINBELL, 5	
	givepoke TENTACRUEL, 5	
	givepoke GEODUDE, 5	
	givepoke PONYTA, 5	
	givepoke SLOWPOKE, 5	
	givepoke MAGNEMITE, 5	
	givepoke FARFETCH_D, 5	
	givepoke GRIMER, 5	
	givepoke CLOYSTER, 5	
	givepoke GASTLY, 5	
	givepoke ONIX, 5	
	givepoke VOLTORB, 5	
	givepoke EXEGGCUTE, 5	
	givepoke HITMONLEE, 5	
	givepoke HITMONCHAN, 5
	givepoke HITMONTOP, 5
	closetext
	end

Breeder4Script:
	opentext
	writetext BreederQuestionText
	yesorno
	iffalse_jumpopenedtext BreederSayNoText
	writetext BreederText	
	; a buncha mons
	givepoke WEEZING, 5
	givepoke MR__MIME, 5	
	givepoke RHYHORN, 5	
	givepoke CHANSEY, 5	
	givepoke TANGELA, 5	
	givepoke KANGASKHAN, 5	
	givepoke SEADRA, 5	
	givepoke STARYU, 5	
	givepoke SCYTHER, 5	
	givepoke JYNX, 5	
	givepoke FARFETCH_D, 5	
	givepoke MAGMAR, 5	
	givepoke PINSIR, 5	
	givepoke TAUROS, 5	
	givepoke MAGIKARP, 5	
	givepoke LAPRAS, 5	
	givepoke EEVEE, 5	
	givepoke PORYGON, 5	
	givepoke SNORLAX, 5
	givepoke CHIKORITA, 5
	closetext
	end
	
Breeder5Script:
	opentext
	writetext BreederQuestionText
	yesorno
	iffalse_jumpopenedtext BreederSayNoText
	writetext BreederText	
	; a buncha mons
	givepoke TOTODILE, 5
	givepoke FURRET, 5	
	givepoke LEDIAN, 5	
	givepoke ARIADOS, 5	
	givepoke CHINCHOU, 5	
	givepoke TOGETIC, 5	
	givepoke NATU, 5	
	givepoke MAREEP, 5	
	givepoke MARILL, 5	
	givepoke SUDOWOODO, 5	
	givepoke SKIPLOOM, 5	
	givepoke SUNFLORA, 5	
	givepoke WOOPER, 5	
	givepoke MURKROW, 5	
	givepoke MISDREAVUS, 5	
	givepoke YANMA, 5	
	givepoke UNOWN, 5	
	givepoke GIRAFARIG, 5	
	givepoke PINECO, 5
	givepoke DUNSPARCE, 5
	closetext
	end
	


BreederQuestionText:
text "Hi! I've bred a lot of #mon. You can have them. But make sure your current box is empty, otherwise your game may crash. Is your current box empty?"

BreederSayNoText:
text "If you come back with your current box empty, I can give you some."

BreederText:
text "Here you go! 20 #mon, injected to your current box."



;	givepoke GROWLITHE, 5