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
	turnobject WESTERN_CAPITAL_MEJIMI, LEFT
	turnobject WESTERN_CAPITAL_ADRINNA, LEFT

	opentext
	writetext Prologue_Text3 ; HOW ARE THINGS 
	waitbutton
	closetext
	
    applymovement WESTERN_CAPITAL_KENSEY, WC_KenseyMovement2
    playsound SFX_ENTER_DOOR
	disappear WESTERN_CAPITAL_KENSEY
	turnobject WESTERN_CAPITAL_ADRINNA, DOWN
	turnobject WESTERN_CAPITAL_MEJIMI, UP
	
	opentext
	writetext Prologue_Text4 ; KENSEY DECEIVES!
	waitbutton
	closetext	
	

    playsound SFX_EXIT_BUILDING
    appear WESTERN_CAPITAL_BOBESH
    waitsfx
    applymovement WESTERN_CAPITAL_BOBESH, WC_BobeshMovement1
	turnobject WESTERN_CAPITAL_MEJIMI, LEFT

	opentext
	writetext Prologue_Text5 ; eh adrinna?
	waitbutton
	closetext	

	turnobject WESTERN_CAPITAL_ADRINNA, DOWN

	opentext
	writetext Prologue_Text6 ; BUT,,, YOU STILL HAVE NOT! 
	waitbutton
	closetext	

    applymovement WESTERN_CAPITAL_BOBESH, WC_BobeshMovement2
    playsound SFX_ENTER_DOOR
	disappear WESTERN_CAPITAL_BOBESH
	applyonemovement WESTERN_CAPITAL_MEJIMI, step_left
	applyonemovement WESTERN_CAPITAL_MEJIMI, step_left
	applyonemovement WESTERN_CAPITAL_ADRINNA, step_down
	turnobject WESTERN_CAPITAL_MEJIMI, RIGHT
	turnobject WESTERN_CAPITAL_ADRINNA, LEFT

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
	
WC_pkmn_text:
	text "null"
	done

Prologue_Text0:
	text "Meanwhile, at the"
	line "Western Capital:"
	done


Prologue_Text1:
	text "Emperor Mejimi:"
	line "Guide me father."
	para "How would you"
	line "deal with the"
	cont "outsiders?"
	para "... Are your"
	line "ways still"
	cont "enough?"
	done

Prologue_Text2:
	text "Mejimi: General"
	line "Adrinna! I have"
	para "three meetings"
	line "before yours."
	
	para "Adrinna: It's"
	line "urgent. Your"
	para "strata-Um, the"
	line "other strageies."
	
	para "The other cities"
	line "resist us, des-"
	cont "pite the prot-"
	para "ection we would"
	line "offer against"
	cont "the outsiders."
	
	para "Mejimi: We've"
	line "never coerced."
	
	para "That's how my"
	line "father handled"
	cont "the famine."
	done

Prologue_Text3:
	text "General Kensey:"
	line "Adrinna, why"
	cont "are you here?"

	para "Mejimi: never"
	line "mind her."
	
	para "How are things"
	line "with the out-"
	cont "siders at the"
	cont "Western Port?"

	para "Kensey: their"
	line "#balls are..."
	para "Barbaric! But"
	cont "incredible."
	para "We must produce"
	line "our own."
	
	para "Mejimi: Very"
	line "well."
	done

Prologue_Text4:
	text "Adrinna: Kensey"
	line "deceives! The"
	cont "coast nomads"

	para "will never fol-"
	line "low bean counters"
	cont "like Kensey."

	para "His plan is a"
	line "farce!"
	done

Prologue_Text5:
	text "General Bobesh:"
	line "Eh, Adrinna?"
	para "Don't you know"
	line "your place?"

	para "Mejimi: Bobesh,"
	line "you address me."

	para "Please, tell me"
	line "about the South."

	para "Bobesh: the"
	line "stadium shows"
	cont "our strength."

	para "Anarres can be"
	line "brought in soon."

	para "Mejimi: ..."
	line "Very well..."
	done

Prologue_Text6:
	text "Mejimi: But..."
	line "the instigator"
	
	para "Amos is still"
	line "on the loose!"
	
	para "If you do not"
	line "find him soon,"

	para "you may be the"
	line "one fighting"
	cont "feral pokemon"
	cont "in your stad-"
	cont "ium."
	done

Prologue_Text7:
	text "Adrinna: now,"
	line "that evoked an"
	cont "Aeroblast or"
	cont "Sacred Fire!"
	
	para "Mejimi: Oh,"
	line "here's priestess"
	cont "Samsara."
	done

Prologue_Text8:
	text "Samsara:"
	line "Adrinna? This"
	cont "site is holy."
	para "How did you get"
	line "back here?"
	
	para "Mejimi: Quickly."
	line "How go the"
	cont "towers' const-"
	cont "ruction?"

	para "Samsara: the"
	line "Hisuians have"
	cont "blessed the" 
	para "Tin Tower, but"
	line "they need more"
	para "time for the"
	line "Brass Tower."
	done
	
Prologue_Text9:
	text "Mejimi: I am"
	line "the emperor!"
	
	para "My presence"
	line "is holy enough!"

	para "Samsara: Your"
	line "majesty, that"
	cont "is a novel idea."

	para "Would your Father"
	line "condone it?"
	done
	
Prologue_Text10:
	text "Mejimi: how"
	line "dare you."
	
	para "My father was"
	line "stagnant with"
	cont "his inheritance."
	
	para "I will trans-"
	line "form mine."
	
	para "From the west-"
	line "ern islands to"
	
	para "the eastern"
	line "mountains and"

	para "the southern"
	cont "forests,"

	para "I will remake Jo-"
	line "hto in my image!"
	done

WC_AdrinnaMovement1:
	step_up
	step_up
	step_up
	step_up
	step_right
	turn_head_down
	step_end
	
WC_KenseyMovement1:
	step_up
	step_up
	turn_head_right
	step_end

WC_KenseyMovement2:
	step_down
	step_down
	step_end

WC_BobeshMovement1:
	step_up
	step_up
	turn_head_right
	step_end

WC_BobeshMovement2:
	step_down
	step_down
	step_end
	
WC_SamsaraMovement1:
	step_up
	step_up
	step_end
