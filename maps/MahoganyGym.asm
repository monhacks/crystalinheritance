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
;trainers feel... how? 
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
	line "Avalanche."

	para "It deals more"
	line "damage if the user"
	cont "was hurt first."

	para "It demonstrates"
	line "the harshness of"
	cont "winter."
	done

GenericTrainerSkierRoxanne:
	generictrainer SKIER, ROXANNE, EVENT_BEAT_SKIER_ROXANNE, SkierRoxanneSeenText, SkierRoxanneBeatenText

	text "If you don't skate"
	line "with precision,"

	para "you won't get far"
	line "in this Gym."
	done

GenericTrainerSkierClarissa:
	generictrainer SKIER, CLARISSA, EVENT_BEAT_SKIER_CLARISSA, SkierClarissaSeenText, SkierClarissaBeatenText

	text "I shouldn't have"
	line "been bragging"
	cont "about my skiing…"
	done

GenericTrainerBoarderRonald:
	generictrainer BOARDER, RONALD, EVENT_BEAT_BOARDER_RONALD, BoarderRonaldSeenText, BoarderRonaldBeatenText

	text "I think there's a"
	line "move a #mon"

	para "can use while it's"
	line "frozen."
	done

GenericTrainerBoarderBrad:
	generictrainer BOARDER, BRAD, EVENT_BEAT_BOARDER_BRAD, BoarderBradSeenText, BoarderBradBeatenText

	text "This Gym is great."
	line "I love boarding"
	cont "with my #mon!"
	done

GenericTrainerBoarderDouglas:
	generictrainer BOARDER, DOUGLAS, EVENT_BEAT_BOARDER_DOUGLAS, BoarderDouglasSeenText, BoarderDouglasBeatenText

	text "The secret behind"
	line "Pryce's power…"

	para "He meditates under"
	line "a waterfall daily"

	para "to strengthen his"
	line "mind and body."
	done

MahoganyGymStatue:
	gettrainername PRYCE, 1, $1
	checkflag ENGINE_GLACIERBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	readvar VAR_BADGES
	ifgreater 14, .LyraToo
	jumpstd gymstatue2
.LyraToo
	jumpstd gymstatue3

PryceText_Intro:
	text "#mon have many"
	line "experiences in"

	para "their lives, just"
	line "like we do."

	para "I, too, have seen"
	line "and suffered much"
	cont "in my life."

	para "Since I am your"
	line "elder, let me show"
	cont "you what I mean."

	para "I have been with"
	line "#mon since"

	para "before you were"
	line "born."

	para "I do not lose"
	line "easily."

	para "I, Pryce--the"
	line "winter trainer--"

	para "shall demonstrate"
	line "my power!"
	done

PryceText_Impressed:
	text "Ah, I am impressed"
	line "by your prowess."

	para "With your strong"
	line "will, I know you"

	para "will overcome all"
	line "life's obstacles."

	para "You are worthy of"
	line "this Badge!"
	done

Text_ReceivedGlacierBadge:
	text "<PLAYER> received"
	line "the Glacier Badge."
	done

PryceText_GlacierBadgeSpeech:
	text "That Badge will"
	line "let your #mon"

	para "use Whirlpool to"
	line "cross whirlpools."

	para "And this… This is"
	line "a gift from me!"
	done

PryceText_CherishYourPokemon:
	text "When the ice and"
	line "snow melt, spring"
	cont "arrives."

	para "You and your #-"
	line "mon will be to-"

	para "gether for many"
	line "years to come."

	para "Cherish your time"
	line "together!"
	done

BoarderRonaldSeenText:
	text "I'll freeze your"
	line "#mon, so you"
	cont "can't do a thing!"
	done

BoarderRonaldBeatenText:
	text "Darn. I couldn't"
	line "do a thing."
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

BoarderBradBeatenText:
	text "Do you see how"
	line "serious we are?"
	done

BoarderDouglasSeenText:
	text "I know Pryce's"
	line "secret."
	done

BoarderDouglasBeatenText:
	text "OK. I'll tell you"
	line "Pryce's secret."
	done

SkierRoxanneSeenText:
	text "To get to Pryce,"
	line "our Gym Leader,"

	para "you need to think"
	line "before you skate."
	done

SkierRoxanneBeatenText:
	text "I wouldn't lose to"
	line "you in skiing!"
	done

SkierClarissaSeenText:
	text "Check out my"
	line "parallel turn!"
	done

SkierClarissaBeatenText:
	text "No! You made me"
	line "wipe out!"
	done
