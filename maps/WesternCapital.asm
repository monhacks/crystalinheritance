WesternCapital_MapScriptHeader: ;	def_scene_scripts
	def_scene_scripts
	scene_script WesternCapitalCemeteryScene

	def_callbacks


	def_warp_events
	warp_event 17, 11, EMPERORS_GARDEN, 1
	warp_event 18, 11, EMPERORS_GARDEN, 2


	def_coord_events



	def_bg_events



	def_object_events
	object_event 11, 21, SPRITE_MEJIMI, 	SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_PROLOGUE_MEJIMI ; need to put all these in the event flags file
	object_event  9, 24, SPRITE_ADRINNA, 	SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_PROLOGUE_ADRINNA ; disappeared at start
	object_event  9, 24, SPRITE_KENSEY, 	SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_PROLOGUE_KENSEY; disappeared at start
	object_event  9, 24, SPRITE_BOBESH, 	SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_PROLOGUE_BOBESH; disappeared at start
	object_event  9, 24, SPRITE_SAMSARA, 	SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_PROLOGUE_SAMSARA; disappeared at start
	pokemon_event  10, 19, LUGIA, -1, -1, PAL_NPC_BLUE, WC_pkmn_text, EVENT_PROLOGUE_MEJIMI ; by tammy  ;;;; 
	pokemon_event  12, 19, HO_OH, -1, -1, PAL_NPC_RED, WC_pkmn_text, EVENT_PROLOGUE_MEJIMI ; by tammy  ;;;; 

	object_const_def
	const WESTERN_CAPITAL_MEJIMI
	const WESTERN_CAPITAL_ADRINNA
	const WESTERN_CAPITAL_KENSEY
	const WESTERN_CAPITAL_BOBESH
	const WESTERN_CAPITAL_SAMSARA


WesternCapitalCemeteryScene: ; SOME OF THIS C.F. MRPOKEMONSHOUSE.ASM IN POLISHED 
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear PLAYER
	opentext
	writetext Prologue_Text0 ; MEANWHILE, 
	waitbutton
	closetext
	pause 10
	special Special_FadeInQuickly

	opentext
	writetext Prologue_Text1 ; FATHER, WHAT 
	waitbutton
	closetext

    playsound SFX_EXIT_BUILDING
    appear WESTERN_CAPITAL_ADRINNA
    waitsfx
    applymovement WESTERN_CAPITAL_ADRINNA, WC_AdrinnaMovement1
	applyonemovement WESTERN_CAPITAL_MEJIMI, step_left
	turnobject WESTERN_CAPITAL_MEJIMI, UP
	showemote WESTERN_CAPITAL_MEJIMI, WESTERN_CAPITAL_MEJIMI, 15
	
	opentext
	writetext Prologue_Text2 ; YOUR STRATEGIES... 
	waitbutton
	closetext
	
    playsound SFX_EXIT_BUILDING
    appear WESTERN_CAPITAL_KENSEY
    waitsfx
    applymovement WESTERN_CAPITAL_KENSEY, WC_KenseyMovement1
	turnobject WESTERN_CAPITAL_MEJIMI, DOWN
	turnobject WESTERN_CAPITAL_ADRINNA, DOWN

	opentext
	writetext Prologue_Text3 ; HOW ARE THINGS 
	waitbutton
	closetext
	
    applymovement WESTERN_CAPITAL_KENSEY, WC_KenseyMovement2
    playsound SFX_ENTER_DOOR
	disappear WESTERN_CAPITAL_KENSEY
	turnobject WESTERN_CAPITAL_ADRINNA, LEFT
	turnobject WESTERN_CAPITAL_MEJIMI, RIGHT
	
	opentext
	writetext Prologue_Text4 ; KENSEY DECEIVES!
	waitbutton
	closetext	
	

    playsound SFX_EXIT_BUILDING
    appear WESTERN_CAPITAL_BOBESH
    waitsfx
    applymovement WESTERN_CAPITAL_BOBESH, WC_BobeshMovement1
	turnobject WESTERN_CAPITAL_MEJIMI, DOWN

	opentext
	writetext Prologue_Text5 ; eh adrinna?
	waitbutton
	closetext	

	turnobject WESTERN_CAPITAL_ADRINNA, LEFT

	opentext
	writetext Prologue_Text6 ; BUT,,, YOU STILL HAVE NOT! 
	waitbutton
	closetext	

    applymovement WESTERN_CAPITAL_BOBESH, WC_BobeshMovement2
    playsound SFX_ENTER_DOOR
	disappear WESTERN_CAPITAL_BOBESH
	applyonemovement WESTERN_CAPITAL_MEJIMI, step_left
	turnobject WESTERN_CAPITAL_MEJIMI, RIGHT

	opentext
	writetext Prologue_Text7 ; now that evoked! 
	waitbutton
	closetext	

    playsound SFX_EXIT_BUILDING
    appear WESTERN_CAPITAL_SAMSARA
    waitsfx
    applymovement WESTERN_CAPITAL_SAMSARA, WC_SamsaraMovement1
	turnobject WESTERN_CAPITAL_MEJIMI, DOWN
	showemote EMOTE_SHOCK, WESTERN_CAPITAL_SAMSARA, 10 
	
	opentext
	writetext Prologue_Text8 ; THIS SITE IS HOLY 
	waitbutton
	closetext
	
	showemote EMOTE_BOLT, WESTERN_CAPITAL_MEJIMI, 20 

	pause 10
	
	refreshscreen
	trainerpic MEJIMI
	waitbutton
	closepokepic

	opentext
	writetext Prologue_Text9 ; I AM THE EMPEROR 
	waitbutton
	closetext	

	applymovement WESTERN_CAPITAL_MEJIMI, step_left
	
	opentext
	writetext Prologue_Text10 ; how dare you 
	waitbutton
	closetext	

	special Special_FadeBlackQuickly

	setscene $1
	warp HOLT_COAST_GATE,  3, 3
	end
	
	
Prologue_Text_MeanwhileAtWC:
	text "Meanwhile, at the"
	line "Western Capital"
	done
	
	
	
WC_pkmn_text:
	text "null"
	done
