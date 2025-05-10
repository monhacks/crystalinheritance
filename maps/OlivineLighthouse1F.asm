OlivineLighthouse1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 10, 17, OLIVINE_CITY, 8
	warp_event 11, 17, OLIVINE_CITY, 8
	warp_event  3, 11, OLIVINE_LIGHTHOUSE_2F, 1


	def_coord_events
    coord_event 11, 15, 0, LighthouseRivalTrigger1 ; step up, fallthru 
    coord_event 11, 14, 0, LighthouseRivalTrigger2

	def_bg_events


	def_object_events ; black belts 
	object_event 14, 9, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, 	ObjectEvent, EVENT_RIVAL_LIGHTHOUSE; elec 
	object_event 11, 17, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, 	ObjectEvent, EVENT_KURT_LIGHTHOUSE_1; elec 

	object_event  5,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, 	TrainerScientistJoseph, -1; elec
	object_event 13,  5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, 	TrainerBlackBeltWai, -1
	object_event  2,  4, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, 	TrainerEngineerLang, -1

	object_const_def 
	const LIGHTHOUSE_RIVAL
	const LIGHTHOUSE_KURT




LighthouseRivalTrigger1:
	applyonemovement PLAYER, step_up
LighthouseRivalTrigger2:
	applyonemovement PLAYER, step_right
	applyonemovement PLAYER, step_right
	appear LIGHTHOUSE_KURT
	applymovement LIGHTHOUSE_KURT, Kurt_LighthouseMove1
	turnobject PLAYER, LEFT
	showtext Kurt_LighthouseText1
    showemote EMOTE_SHOCK, PLAYER, 15
    special Special_FadeOutMusic
    pause 15
    appear LIGHTHOUSE_RIVAL
    waitsfx
    applymovement LIGHTHOUSE_RIVAL, LighthouseRivalApproachMovement
	turnobject KURT, UP
	turnobject PLAYER, UP
    scall LigthouseRivalBattleScript
	; after the battle
    applymovement LIGHTHOUSE_RIVAL, LighthouseRivalRetreatMovement
    playsound SFX_EXIT_BUILDING
    disappear LIGHTHOUSE_RIVAL
    setscene $1
    setevent EVENT_FOUGHT_RADIO_TOWER_RIVAL
    waitsfx
    playmapmusic
	showemote EMOTE_SHOCK, LIGHTHOUSE_KURT, 10
	showtext LighthouseKurtEndText
	applymovement LIGHTHOUSE_KURT, LighthouseKurtGoesUpMovement
	disappear LIGHTHOUSE_KURT
	setevent EVENT_KURT_LIGHTHOUSE_1
    end

LigthouseRivalBattleScript:
    playmusic MUSIC_RIVAL_ENCOUNTER
    showtext LighthouseRivalBeforeText
    setevent EVENT_RIVAL_RADIO_TOWER
    checkevent EVENT_GOT_OSHAWOTT
    iftrue .Oshawott
    checkevent EVENT_GOT_ROWLET
    iftrue .Rowlet
    winlosstext LighthouseRivalWinText, LighthouseRivalLossText
    setlasttalked LIGHTHOUSE_RIVAL
    loadtrainer RIVAL1, 9
    startbattle
    dontrestartmapmusic
    reloadmapafterbattle
    sjump .FinishRivalBattle

.Oshawott:
    winlosstext LighthouseRivalWinText, LighthouseRivalLossText
    setlasttalked LIGHTHOUSE_RIVAL
    loadtrainer RIVAL1, 7
    startbattle
    dontrestartmapmusic
    reloadmapafterbattle
    sjump .FinishRivalBattle

.Rowlet:
    winlosstext LighthouseRivalWinText, LighthouseRivalLossText
    setlasttalked LIGHTHOUSE_RIVAL
    loadtrainer RIVAL1, 8
    startbattle
    dontrestartmapmusic
    reloadmapafterbattle
    sjump .FinishRivalBattle

.FinishRivalBattle:
    special DeleteSavedMusic
    playmusic MUSIC_RIVAL_AFTER
    jumptext LighthouseRivalAfterText

LighthouseRivalApproachMovement:
	step_down
	step_down
	step_down
	step_down
	step_left
	step_end

LighthouseRivalRetreatMovement:
    step_end

LighthouseRivalBeforeText:
    text "<RIVAL>: Oh, it's"
	line "you two."

	para "Kurt: <RIVAL>,"
	line "you're polluting"
	cont "the sea with your"
	cont "distiller!"
	
	para "<RIVAL>: I didn't"
	line "know Silph would"
	cont "do it like this!"
	para "I wanted to bring"
	line "us back into bal-"
	cont "ance with nature."
	para "Whil you looked"
	line "back, I looked"
	cont "forward!"
    done

LighthouseRivalWinText:
    text "All my plans..."
    done

LighthouseRivalLossText:
    text "..."
    done

LighthouseRivalAfterText:
    text "<RIVAL>: I didn't"
	line "want to be their"
	cont "pawn. And I had"
	para "no idea what they"
	line "were doing on the"
	cont "top floor..."

	para "Don't follow me"
	line "any more."
    done

LighthouseKurtEndText:
	text "Kurt: What's that"
	line "about the top"
	cont "floor?..."
	
	para "We have to get"
	line "up there!"
	done

Kurt_LighthouseMove1:
	step_up
	step_up
	step_up
	step_right
	step_end

LighthouseKurtGoesUpMovement:
	step_up
	step_up
	step_right
	step_right
	step_up
	step_up
	step_up
	step_end

Kurt_LighthouseText1:	
	text "Kurt: <PLAYER>, I"
	line "have learned that"
	para "Chuck is doing"
	line "something awful"
	para "to a Slowking on"
	line "the top floor of"
	cont "the lighthouse."
	
	para "We must confront"
	line "him to end it!"
	
	para "He uses #mon"
	line "brutally, for his" ; brutal 
	cont "own plans!"
	done

TrainerScientistJoseph:
	generictrainer SCIENTIST, JOSEPH, EVENT_BEAT_ENGINEER_JOSEPH, .SeenText1, .BeatenText1

.BeatenText1:
	text "..." ; todo 
	done

.SeenText1:
	text "..." ; todo 
	done


TrainerBlackBeltWai:
	generictrainer BLACKBELT, WAI, EVENT_BEAT_BLACKBELT_WAI, .SeenText2, .BeatenText2
	
.BeatenText2:
	text "..." ; todo 
	done

.SeenText2:
	text "..." ; todo 
	done

TrainerEngineerLang:
	generictrainer ENGINEER, LANG, EVENT_BEAT_ENGINEER_JOSEPH, .SeenText3, .BeatenText3

.BeatenText3:
	text "..." ; todo 
	done

.SeenText3:
	text "..." ; todo 
	done

