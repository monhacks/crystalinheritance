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
	object_evet 11, 17, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, 	ObjectEvent, EVENT_KURT_LIGHTHOUSE_1; elec 


	object_event  0,  0, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, 	TrainerScientistJoseph, -1; elec
	object_event  0,  0, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, 	TrainerBlackBeltWai, -1
	object_event  0,  0, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, 	TrainerEngineerLang, -1

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
    applymovement Lighthouse_RIVAL, LighthouseRivalRetreatMovement
    playsound SFX_EXIT_BUILDING
    disappear Lighthouse_RIVAL
    setscene $1
    setevent EVENT_FOUGHT_RADIO_TOWER_RIVAL
    waitsfx
    playmapmusic
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
    setlasttalked Lighthouse_RIVAL
    loadtrainer RIVAL1, 6
    startbattle
    dontrestartmapmusic
    reloadmapafterbattle
    sjump .FinishRivalBattle

.Oshawott:
    winlosstext LighthouseRivalWinText, LighthouseRivalLossText
    setlasttalked Lighthouse_RIVAL
    loadtrainer RIVAL1, 4
    startbattle
    dontrestartmapmusic
    reloadmapafterbattle
    sjump .FinishRivalBattle

.Rowlet:
    winlosstext LighthouseRivalWinText, LighthouseRivalLossText
    setlasttalked Lighthouse_RIVAL
    loadtrainer RIVAL1, 5
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
    text "..."
    done

LighthouseRivalWinText:
    text "..."
    done

LighthouseRivalLossText:
    text "..."
    done

LighthouseRivalAfterText:
    text "..."
    done

Kurt_LighthouseMove1:
	step_up
	step_up
	step_up
	step_right
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
