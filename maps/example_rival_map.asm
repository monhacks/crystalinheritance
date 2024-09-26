	def_coord_events
	coord_event 19,  4, 0, RadioTowerRivalTrigger1

	object_event 23,  3, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_UNDERGROUND_PATH

	object_const_def
	const UNDERGROUNDPATHSWITCHROOMENTRANCES_SILVER

RadioTowerRivalTrigger1:
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	playsound SFX_EXIT_BUILDING
	appear UNDERGROUNDPATHSWITCHROOMENTRANCES_SILVER
	waitsfx
	applymovement UNDERGROUNDPATHSWITCHROOMENTRANCES_SILVER, UndergroundSilverApproachMovement1
	turnobject PLAYER, RIGHT
	scall UndergroundSilverBattleScript
	applymovement UNDERGROUNDPATHSWITCHROOMENTRANCES_SILVER, UndergroundSilverRetreatMovement1
	playsound SFX_EXIT_BUILDING
	disappear UNDERGROUNDPATHSWITCHROOMENTRANCES_SILVER
	setscene 1
	waitsfx
	playmapmusic
	end


UndergroundSilverBattleScript:
	checkevent EVENT_RIVAL_BURNED_TOWER
	iftrue .Continue
	setevent EVENT_RIVAL_BURNED_TOWER
	setmapscene BURNED_TOWER_1F, 1
.Continue:
	playmusic MUSIC_RIVAL_ENCOUNTER
	showtext UndergroundSilverBeforeText
	setevent EVENT_RIVAL_UNDERGROUND_PATH
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext UndergroundSilverWinText, UndergroundSilverLossText
	setlasttalked UNDERGROUNDPATHSWITCHROOMENTRANCES_SILVER
	loadtrainer RIVAL1, RIVAL1_12
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishRivalBattle

.Totodile:
	winlosstext UndergroundSilverWinText, UndergroundSilverLossText
	setlasttalked UNDERGROUNDPATHSWITCHROOMENTRANCES_SILVER
	loadtrainer RIVAL1, RIVAL1_10
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishRivalBattle

.Chikorita:
	winlosstext UndergroundSilverWinText, UndergroundSilverLossText
	setlasttalked UNDERGROUNDPATHSWITCHROOMENTRANCES_SILVER
	loadtrainer RIVAL1, RIVAL1_11
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishRivalBattle

.FinishRivalBattle:
	special DeleteSavedMusic
	playmusic MUSIC_RIVAL_AFTER
	jumptext UndergroundSilverAfterText
