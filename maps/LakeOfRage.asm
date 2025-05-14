LakeOfRage_MapScriptHeader:
	def_scene_scripts


	def_callbacks
	callback MAPCALLBACK_NEWMAP, LakeOfRageFlyPoint


	def_warp_events
	warp_event  7,  3, LAKE_OF_RAGE_HIDDEN_POWER_HOUSE, 1 ; pryce's cabin 
	warp_event 27, 31, LAKE_OF_RAGE_MAGIKARP_HOUSE, 1

	def_coord_events
	coord_event 16, 18, 0, LakeHursalunaScript
	coord_event 17, 4, 1, LakeRivalScript

	def_bg_events
	bg_event 21, 27, BGEVENT_JUMPTEXT, LakeOfRageSignText
	bg_event  9,  4, BGEVENT_JUMPTEXT, LakeOfRageSignPryceText
	bg_event 35,  2, BGEVENT_ITEM + ULTRA_BALL, EVENT_LAKE_OF_RAGE_HIDDEN_RARE_CANDY
	bg_event 10, 13, BGEVENT_ITEM + MAX_POTION, EVENT_LAKE_OF_RAGE_HIDDEN_MAX_POTION
	bg_event 11, 28, BGEVENT_ITEM + FULL_RESTORE, EVENT_LAKE_OF_RAGE_HIDDEN_FULL_RESTORE


	def_object_events
	object_event 17, 3, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT,0, LakePryceScript, -1 ;
	object_event 12, 4, SPRITE_KURT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LAKE_KURT ; INITIALIZE 
	object_event 23, 3, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LAKE_RIVAL ; INITIALIZE 
;HURSALUNA
	object_event  16,  13, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, H__URSALUNA, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LAKE_HURSALUNA 
;trainers
	object_event  4,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WesleyScript, -1
	pokemon_event 3,  4, MEOWTH, -1, -1, PAL_NPC_BROWN, WesleyMeowthText, -1
	object_event  5, 23, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSightseerMBlaise, -1
	object_event  3, 14, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSightseerMGareth, -1
	object_event  23, 29, SPRITE_PICNICKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSightseerFKamila, -1
	object_event  28, 26, SPRITE_PICNICKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSightseerFNoelle, -1
	object_event  18, 30,  SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPokemaniacCalvin, -1
	object_event  33, 22,  SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPokemaniacShane, -1
;itemballs
	itemball_event  7,  10, ELIXIR, 1, EVENT_LAKE_OF_RAGE_ELIXIR
	itemball_event 38,  14, ULTRA_BALL, 1, EVENT_LAKE_OF_RAGE_MAX_REVIVE
	tmhmball_event 31, 3, TM_WILD_CHARGE, EVENT_GOT_TM_WILD_CHARGE 

	object_const_def
	const LAKEOFRAGE_PRYCE
	const LAKEOFRAGE_KURT
	const LAKEOFRAGE_RIVAL 
	const LAKEOFRAGE_HURSALUNA

LakeOfRageFlyPoint:
	setflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	endcallback


LakeHursalunaScript:
	turnobject PLAYER, UP
	earthquake 30
	cry URSARING
	pause 20
	showemote PLAYER, EMOTE_SHOCK, 20
	pause 20
	applymovement LAKEOFRAGE_HURSALUNA, LakeHursalunaApproachesMovement
	earthquake 20
	applymovement LAKEOFRAGE_HURSALUNA, LakeHursalunaApproachesMovement2
	earthquake 20	
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon URSALUNA, 45
	startbattle
	disappear LAKEOFRAGE_HURSALUNA
	reloadmapafterbattle
	setevent EVENT_LAKE_HURSALUNA
	setscene $1
	end

LakeHursalunaApproachesMovement:
	fix_facing
	fast_jump_step_down
	fast_jump_step_down
	step_end

LakeHursalunaApproachesMovement2:
	fix_facing
	fast_jump_step_down
	fast_jump_step_down
	step_end

LakeOfRageSignText:
	text "Sil__ _pring_"
	
	para "Form___y kn__n"
	line "L___ __ _a_e"
	
	para "The paint on the"
	line "sign is faded."
	done

LakeOfRageSignPryceText:
	text "Pryce's Cabin"
	done

LakeRivalScript:
    showemote EMOTE_SHOCK, PLAYER, 15
    special Special_FadeOutMusic
    pause 15
	turnobject PLAYER, RIGHT
    appear LAKEOFRAGE_RIVAL
 	applymovement LAKEOFRAGE_RIVAL, LakeRivalToPlayer
	showtext LakeRivalText1
	appear LAKEOFRAGE_KURT
 	applymovement LAKEOFRAGE_KURT, LakeKurtToPlayer
	showtext LakeKurtText1
	turnobject LAKEOFRAGE_RIVAL, DOWN
	showtext LakeRivalText2
	showemote EMOTE_BOLT, LAKEOFRAGE_RIVAL, 10
	turnobject LAKEOFRAGE_RIVAL, LEFT
    scall LakeRivalBattleScript 
    applymovement LAKEOFRAGE_RIVAL, LakeRivalWalksAway
    setscene $2
    setevent EVENT_FOUGHT_LAKE_RIVAL
	disappear LAKEOFRAGE_RIVAL
    waitsfx
    playmapmusic
    end

LakeRivalBattleScript:
    playmusic MUSIC_RIVAL_ENCOUNTER
    setevent EVENT_LAKE_RIVAL
    checkevent EVENT_GOT_OSHAWOTT
    iftrue .Oshawott
    checkevent EVENT_GOT_ROWLET
    iftrue .Rowlet
    winlosstext LakeRivalWinText, 0
    setlasttalked LAKEOFRAGE_RIVAL
    loadtrainer RIVAL1, 12 
    startbattle
    dontrestartmapmusic
    reloadmapafterbattle
    sjump .FinishRivalBattle

.Oshawott:
    winlosstext LakeRivalWinText, 0
    setlasttalked LAKEOFRAGE_RIVAL
    loadtrainer RIVAL1, 10 
    startbattle
    dontrestartmapmusic
    reloadmapafterbattle
    sjump .FinishRivalBattle

.Rowlet:
    winlosstext LakeRivalWinText, 0
    setlasttalked LAKEOFRAGE_RIVAL
    loadtrainer RIVAL1, 11 
    startbattle
    dontrestartmapmusic
    reloadmapafterbattle
    sjump .FinishRivalBattle

.FinishRivalBattle:
    special DeleteSavedMusic
    playmusic MUSIC_RIVAL_AFTER
    jumptext LakeRivalAfterText

LakeRivalText1:
	text "What're you"
	line "doing here?"
	done
	
LakeKurtText1:
	text "Kurt: <RIVAL>,"
	line "here to destroy"
	cont "something else?"
	done

LakeRivalText2:
	text "<RIVAL>: Just"
	line "getting material"
	cont "for my distiller."
	
	para "I had to leave"
	line "Olivine."
	
	para "KURT: See your"
	line "inventions upset"
	cont "the balance! You"
	
	para "should go"
	line "home."
;	done
; fallthru 
;LakeRivalText3:
	text "You're the one"
	line "who is upsetting"
	cont "balance!"
	
	para "Your adherence to"
	line "tradition is like"
	
	para "a Pineco infest-"
	line "ation, unaware"
	
	para "that their insti-"
	line "ncts kill their"
	cont "own habitat."
	
	para "We are part of"
	line "nature. Our niche"
	cont "is to be reflect-"
	cont "ive stewards."
	
	para "I'll show you how"
	line "strong I am with-"
	cont "out you!"
	done

LakeRivalWinText:
	text "I wish I was an"
	line "entire region"
	cont "away from you."
	done

LakeRivalAfterText:
	text "You're only gett-"
	line "ing weaker, like"
	
	para "the shrine that"
	line "fades every 20"
	cont "years. Unlike a"
	
	para "Pineco in its"
	line "shell, or you hi-"
	para "ding behind self-"
	line "righteousness, or"
	para "Silph hiding beh-"
	line "ind a balance"
	cont "sheet, "

	para "I can see my eff-"
	line "ect. I walked aw-"
	para "ay when it wasn't"
	line "working."
	
	para "<PLAYER>, when"
	line "will you?"
	done

LakeRivalToPlayer:
	step_left
	step_left
	step_left
	step_down
	step_left
	step_left
	step_end

LakeKurtToPlayer:
	step_right
	step_right
	step_right
	step_right
	step_down
	step_right
	step_end

LakeRivalWalksAway:
	step_right
	step_right
	step_up
	step_right
	step_right	
	step_right
	step_end


LakePryceScript:
	showtext LakeShrineQuestion
	yesorno
	iffalse_jumptext LakeNoText
	showtext LakePrayerText
	waitbutton
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp TRANQUIL_TARN, 12, 4
	end

LakeShrineQuestion:
	text "Pryce: <PLAYER>,"
	line "would you like to"
	cont "pray to Celebi"
	cont "with me?"
	done

LakeNoText:
	text "Some other time."
	done

LakePrayerText:
	text "The flow of time"
	line "shapes us,"
	
	para "As a downpour or"
	line "a sprinkle,"
	
	para "Don't panic,"
	line "have prudence!"

	para "So we can choose"
	line "our wrinkles."
	done

WesleyScript:
	checkevent EVENT_GOT_BLACK_BELT_FROM_WESLEY
	iftrue_jumptextfaceplayer WesleyDynamicPunchText
	faceplayer
	opentext
	iftrue .MetWesley
	writetext MeetWesleyText
	promptbutton
	writetext WesleyGivesGiftText
	promptbutton
	verbosegivetmhm TM_DYNAMICPUNCH ; 
	iffalse_endtext
	setevent EVENT_GOT_BLACK_BELT_FROM_WESLEY
	jumpopenedtext WesleyDynamicPunchText


MeetWesleyText:
	text "I am Wesley"
	line "Wednesday."

	para "Wednesday is the"
	line "exact middle of"
	cont "the week."
	
	para "A day for the"
	line "uncertainties of"
	cont "the universe to"
	
	para "collapse into one"
	line "of two states."
	done

WesleyGivesGiftText:
	text "That's why I love"
	line "this technique."
	
	para "Dynamicpunch: it"
	line "will hit or miss,"
	
	para "But you won't"
	line "know which until"
	cont "you use it!"
	
	para "Exactly like the"
	line "famous experiment"
	cont "with the Meowth-"
	
	para "Oh, nevermind."
	done

WesleyDynamicPunchText:
	text "That move has a"
	line "lot of momentum"
	
	para "but the position"
	line "is unknown."	
	done

WesleyMeowthText:
	text "Meeeowww!"
	line "It's purring!"
	done

GenericTrainerSightseerFKamila:
	generictrainer SIGHTSEERF, KAMILA, EVENT_BEAT_SIGHTSEERF_KAMILA, .SeenText1, .BeatenText1

.BeatenText1:
	text "My #mon keep"
	line "my foold cold."
	
	para "So I can carry"
	line "whatever I like!"	
	done

.SeenText1:
	text "Want to know my"
	line "secret to carry"
	cont "less gear?"
	done

GenericTrainerSightseerFNoelle:
	generictrainer SIGHTSEERF, NOELLE, EVENT_BEAT_SIGHTSEERF_NOELLE, .SeenText2, .BeatenText2

.BeatenText2:
	text "You can find your"
	line "own way!"
	done

.SeenText2:
	text "Do you have a"
	line "map?"
	done
	
GenericTrainerSightseerMBlaise:
	generictrainer SIGHTSEERM, BLAISE, EVENT_BEAT_SIGHTSEERM_BLAISE, .SeenText3, .BeatenText3

.BeatenText3:
	text "You've got some"
	line "power!"
	done

.SeenText3:
	text "It's so nice to"
	line "unplug with a big"
	cont "hike."
	done

GenericTrainerSightseerMGareth:
	generictrainer SIGHTSEERM, GARETH, EVENT_BEAT_SIGHTSEERM_GARETH, .SeenText4, .BeatenText4

.BeatenText4:
	text "You never know"
	line "what will come"
	cont "out of the blue."
	done

.SeenText4:
	text "This quarry is"
	line "even wilder than"
	cont "I expected!"
	done

GenericTrainerPokemaniacCalvin:
	generictrainer POKEMANIAC, CALVIN, EVENT_BEAT_POKEMANIAC_CALVIN, .SeenText5, .BeatenText5

.BeatenText5:
	text "I wonder how the"
	line "draining of the"
	cont "Lake will be"
	cont "remembered."
	done

.SeenText5:
	text "Before Silph, the"
	line "Lake had Gyarados"
	cont "but now there's"
	para "so many rare"
	line "#mon!"
	done


GenericTrainerPokemaniacShane:
	generictrainer POKEMANIAC, SHANE, EVENT_BEAT_POKEMANIAC_SHANE, .SeenText6, .BeatenText6

.BeatenText6:
	text "The lakebed is a"
	line "perfect niche for"
	cont "Yanmega!"
	done

.SeenText6:
	text "Have you seen any"
	line "yanma evolution?"
	done
