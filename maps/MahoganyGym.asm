MahoganyGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 17, MAHOGANY_TOWN, 3
	warp_event  5, 17, MAHOGANY_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, MahoganyGymStatue
	bg_event  6, 15, BGEVENT_READ, MahoganyGymStatue

	def_object_events
	object_event  5,  3, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyGymPryceScript, -1
;trainers feel proud of pryce
	object_event  4,  6, SPRITE_SKIER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSkierRoxanne, -1
	object_event  9, 17, SPRITE_SKIER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSkierClarissa, -1
	
	object_event  0, 17, SPRITE_BOARDER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBoarderRonald, -1
	object_event  5,  9, SPRITE_BOARDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBoarderBrad, -1
	object_event  2,  4, SPRITE_BOARDER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBoarderDouglas, -1

MahoganyGymPryceScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .FightDone
	writetext PryceText_Intro
	waitbutton
	closetext
	winlosstext PryceText_Impressed, 0
	loadtrainer PRYCE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PRYCE
	opentext
	writetext Text_ReceivedGlacierBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_GLACIERBADGE
.FightDone:
	checkevent EVENT_GOT_TM_CALM_MIND
	iftrue_jumpopenedtext PryceText_CherishYourPokemon
	setevent EVENT_BEAT_SKIER_ROXANNE
	setevent EVENT_BEAT_SKIER_CLARISSA
	setevent EVENT_BEAT_BOARDER_RONALD
	setevent EVENT_BEAT_BOARDER_BRAD
	setevent EVENT_BEAT_BOARDER_DOUGLAS
	writetext PryceText_GlacierBadgeSpeech
	promptbutton
	verbosegivetmhm TM_CALM_MIND
	setevent EVENT_GOT_TM_CALM_MIND 
	writetext PryceText_CalmMindText
	writetext PryceText_ClearBell
	givekeyitem CLEAR_BELL
	closetext
	end

	
PryceText_CalmMindText: ; todo 
	text "That TM contains"
	line "Calm Mind."

	para "It embodies the"
	line "power that comes"
	cont "from honing your"
	
	para "mind on other 
	
	done


	


MahoganyGymStatue:
	gettrainername PRYCE, 1, $1
	checkflag ENGINE_GLACIERBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	readvar VAR_BADGES
	jumpstd gymstatue2


PryceText_Intro: ; todo 
	text "..."
	done

PryceText_Impressed: ; todo 
	text "..."

	para "You are worthy of"
	line "this Badge!"
	done

Text_ReceivedGlacierBadge:
	text "<PLAYER> received"
	line "the Glacier Badge."
	done

PryceText_GlacierBadgeSpeech: ; todo 
	text "These are gifts"
	line "from me."
	done

PryceText_CherishYourPokemon:
	text "..." ; todo 
	done



GenericTrainerSkierRoxanne:
	generictrainer SKIER, ROXANNE, EVENT_BEAT_SKIER_ROXANNE, SkierRoxanneSeenText, SkierRoxanneBeatenText

SkierRoxanneBeatenText:
	text "..."
	done

SkierRoxanneSeenText:
	text "..."
	done


GenericTrainerSkierClarissa:
	generictrainer SKIER, CLARISSA, EVENT_BEAT_SKIER_CLARISSA, SkierClarissaSeenText, SkierClarissaBeatenText

SkierClarissaBeatenText:
	text "No! You made me"
	line "wipe out!"
	done

SkierClarissaSeenText:
	text "Check out my"
	line "parallel turn!"
	done


GenericTrainerBoarderDouglas:
	generictrainer BOARDER, DOUGLAS, EVENT_BEAT_BOARDER_DOUGLAS, BoarderDouglasSeenText, BoarderDouglasBeatenText


BoarderDouglasBeatenText:
	text "..."
	done

BoarderDouglasSeenText:
	text "I know Pryce's"
	line "secret."
	done


GenericTrainerBoarderRonald:
	generictrainer BOARDER, RONALD, EVENT_BEAT_BOARDER_RONALD, BoarderRonaldSeenText, BoarderRonaldBeatenText

BoarderRonaldBeatenText:
	text "Darn. I couldn't"
	line "do a thing."
	done

BoarderRonaldSeenText:
	text "I'll freeze your"
	line "#mon, so you"
	cont "can't do a thing!"
	done


GenericTrainerBoarderBrad:
	generictrainer BOARDER, BRAD, EVENT_BEAT_BOARDER_BRAD, BoarderBradSeenText, BoarderBradBeatenText


BoarderBradBeatenText:
	text "Do you see how"
	line "serious we are?"
	done

BoarderBradSeenText:
	text "This Gym has a"
	line "slippery floor."

	para "It's fun, isn't"
	line "it?"

	para "But hey--we're"
	line "not playing games"
	cont "here!"
	done
