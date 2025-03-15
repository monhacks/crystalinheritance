ClastsCradleB1F_MapScriptHeader: 
	def_scene_scripts
	scene_script ClastsCradleScene1

	def_callbacks

; SQUARES OF 14, 6; 14, 26;  TURN INTO $5D DEPENDING ON EVENT_CRADLE_BOULDER_1,  _3
; SQUARES OF 18, 14;  TURN INTO $5F DEPENDING ON EVENT_CRADLE_BOULDER_2


	def_warp_events
	warp_event 3, 3, CLASTS_CRADLE_1F, 2
; HOLE DROP 
	warp_event 12, 7, CLASTS_CRADLE_1F, 2


	def_coord_events
	coord_event 21, 12, CradleScene1_Mejimi, 0; first scene
	coord_event  5, 26, CradleScene2_Heatran, 0; first scene

	def_bg_events



	def_object_events
; cutscene 1 objects, PLAYER AT 21, 12
	object_event 21, 8, SPRITE_ADRINNA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CRADLE_CUTSCENE
	object_event 22, 8, SPRITE_BRIGADER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CRADLE_CUTSCENE
	object_event 27, 14, SPRITE_MEJIMI, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CRADLE_CUTSCENE
; CUTSCENE 2
	object_event   5,  17, SPRITE_ADRINNA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPokefanMRobert, EVENT_BEAT_ADRINNA_MINE
	object_event   5,  15, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, HEATRAN, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CC_HEATRAN
; KURT TO HEAL YOU 
	object_event   5,  17, SPRITE_KURT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPokefanMRobert, EVENT_BEAT_ADRINNA_MINE
; TRAINERS
	object_event  16,  6, SPRITE_BRIGADER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBrigader18, EVENT_BEAT_ADRINNA_MINE
	object_event  22,  20, SPRITE_BRIGADER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBrigader19, EVENT_BEAT_ADRINNA_MINE
	object_event  17,  24, SPRITE_BRIGADER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBrigader20, EVENT_BEAT_ADRINNA_MINE

	tmhmball_event 25, 23, TM_FOCUS_BLAST, EVENT_GOT_TM_FOCUS_BLAST 


	object_const_def
	const CRADLE_CUTSCENE_ADRINNA
	const CRADLE_CUTSCENE_WORKER
	const CRADLE_CUTSCENE_MEJIMI


ClastsCradleScene1:	
;cf western capital
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear PLAYER
	opentext
	writetext CradleCutscene_Text0 ; MEANWHILE, 
	waitbutton
	closetext
	pause 10
	special Special_FadeInQuickly

	opentext
	showemote EMOTE_BOLT, CRADLE_CUTSCENE_ADRINNA, 10
	writetext CradleCutscene_Text1
	waitbutton
	writetext CradleCutscene_Text2
	waitbutton
	closetext
	turnobject CRADLE_CUTSCENE_ADRINNA, DOWN
	showtext CradleCutscene_Text3 
	closetext

    applymovement CRADLE_CUTSCENE_MEJIMI, CC_MejimiMoves1
	
	refreshscreen
	trainerpic MEJIMI
	waitbutton
	closepokepic
	
	showtext CradleCutscene_Text4 ; shoo worker

	applymovement CRADLE_CUTSCENE_WORKER, CC_WorkerMoves1 ; 2 d 1 l 3 d 5 r
	
	showtext CradleCutscene_Text5 ; hello adrinna
	waitbutton
	showtext CradleCutscene_Text6 ; how is kensey?
	waitbutton
	turnobject CRADLE_CUTSCENE_ADRINNA, LEFT
	showtext CradleCutscene_Text7 ; how unfortunate	
	turnobject CRADLE_CUTSCENE_ADRINNA, DOWN
	showtext CradleCutscene_Text8 
	turnobject CRADLE_CUTSCENE_MEJIMI, LEFT
	pause 20
	waitbutton	
	showemote EMOTE_QUESTION, CRADLE_CUTSCENE_ADRINNA, 10
	applymovement CRADLE_CUTSCENE_ADRINNA, CC_AdrinnaMoves2; left down face right
	showtext CradleCutscene_Text9 ; I thought we were done?
	waitbutton
	showtext CradleCutscene_Text10 ; repurposed
	applymovement CRADLE_CUTSCENE_ADRINNA, step_left
	showtext CradleCutscene_Text11
	turnobject CRADLE_CUTSCENE_MEJIMI, DOWN
	showtext CradleCutscene_Text12
	applymovement CC_MejimiMoves2 ; 4 D 5 raw
	pause 20
	showtext CradleCutscene_Text13
	pause 20
	applymovement CRADLE_CUTSCENE_WORKER, CC_MejimiMoves1 ; comes back from mejimi tile 
	turnobject CRADLE_CUTSCENE_WORKER, LEFT
	showtext CradleCutscene_Text14
	turnobject CRADLE_CUTSCENE_ADRINNA, RIGHT
	showtext CradleCutscene_Text15
	pause 15
	cry GYARADOS
	pause 15
	special Special_FadeBlackQuickly
	setevent EVENT_CRADLE_CUTSCENE
	setscene $1
	warp OLIVINE_CITY,  19, 22
	end

CradleCutscene_Text0:
	text "Meanwhile, Mejimi"
	line "visits his mine:"
	done

CradleCutscene_Text1:
	text "Adrinna: Brigader"
	line "Tyson, update!"
	done

CradleCutscene_Text2:
	text "Tyson: There were"
	line "some unexpected"
	cont "toxic gases."
	
	para "Some Hisuians"
	line "lost #mon."
	
	para "Their engineers"
	line "want to give up"
	cont "on the mine."
	done
	
CradleCutscene_Text3:
	text "Adrinna: Those"
	line "Hisuians - they"
	cont "are so weak."
	
	para "I wonder if they"
	line "just need a taste"
	para "of raw power to"
	line "see what they're"
	cont "capable of..."
	done

CradleCutscene_Text4:
	text "Mejimi: Shoo,"
	line "soldier. Adrinna,"
	
	para "your soldiers are"
	line "so lively, unlike"
	cont "Kensey's."
	done

CradleCutscene_Text5:
	text "Adrinna: Hello,"
	line "Emperor."
	
	para "How is General"
	line "Kensey?"
	done
	
CradleCutscene_Text6:
	text "Mejimi: His port"
	line "was destroyed in"
	cont "a storm."
	
	para "He blames it on"
	line "a storm caused by"
	cont "my Lugia - Ha!"
	
	para "Lugia has been by"
	line "side dutifully!"
	
	para "What an absurd"
	line "excuse."
	done

CradleCutscene_Text7:
	text "Adrinna: How..."
	line "unfortunate..."
	done

CradleCutscene_Text8:
	text "Mejimi: Worse, I"
	line "was counting on"
	cont "the port for some"
	
	para "metals to build"
	line "my sculptures."
	
	para "Johto must be"
	line "united around me."
	done

CradleCutscene_Text9:
	text "Adrinna: I told-"
	line "you told me that"
	para "we were done with"
	line "traditions?"
	done

CradleCutscene_Text10:
	text "Mejimi: They'll"
	line "be repurposed."
	
	para "We need gold for"
	line "my coronation."
	done

CradleCutscene_Text11:
	text "Adrinna: We're so"
	line "close to a major"
	cont "iron ore vein!"
	
	para "One wrong move..."
	line "The mountain dies."
	done
	
CradleCutscene_Text12: ;  
	text "Mejimi: No, your"
	line "plan can wait."
	
	para "My coronation"
	line "plans will revive"
	cont "this region."
	
	para "See to it."
	done

CradleCutscene_Text13: ;  
	text "Adrinna: How I"
	line "misjudged you..."
	
	para "You don't end the"
	line "old ways, merely" 

	para "shape them to fit"
	line "your own legacy."
	done

CradleCutscene_Text14:	
	text "Tyson: General"
	line "Adrinna, what"
	cont "should we do?"
	done

CradleCutscene_Text15: ;  
	text "Adrinna: We will"
	line "temper ourselves-"
	
	para "not decorate with"
	line "gold leaf."
		
	para "I have a plan to"
	line "lure back the" 

	para "Hisuians with what"
	line "they can't resist."

	para "We'll reach the" 
	line "mine's iron heart"

	para "and forge a new"
	line "destiny for Johto."
	done

CC_MejimiMoves1: ;6left 5 UP
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

CC_WorkerMoves1 ; 2 d 1 l 3 d 5 r
	step_down
	step_down
	step_left
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

CC_AdrinnaMoves2; left down face right
	step_left
	step_down
	turn_head_right
	step_end

	
GenericTrainerBrigader19: ; bugs dark 
	generictrainer BRIGADER, 19, EVENT_BEAT_ROCKET_GRUNTM_19, Brigader19SeenText, Brigader19BeatenText  

Brigader19BeatenText:
	text "..."
	done

Brigader19SeenText:
	text "..."
	done
	
GenericTrainerBrigader20: ; tyson nidos steelix
	generictrainer BRIGADER, 20, EVENT_BEAT_ROCKET_GRUNTM_20, Brigader20SeenText, Brigader20BeatenText  

Brigader20BeatenText:
	text "..."
	done

Brigader20SeenText:
	text "..."
	done