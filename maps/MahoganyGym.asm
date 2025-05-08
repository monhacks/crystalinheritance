MahoganyGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 17, MAHOGANY_TOWN, 3
	warp_event  5, 17, MAHOGANY_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_JUMPTEXT, MahoganyGymStatue
	bg_event  6, 15, BGEVENT_JUMPTEXT, MahoganyGymStatue

	def_object_events
	object_event  5,  3, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyGymPryceScript, EVENT_GOT_TM_CALM_MIND
;trainers feel proud of pryce
	object_event  2, 16, SPRITE_SKIER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSkierRoxanne, -1
	object_event  8,  2, SPRITE_SKIER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSkierClarissa, -1
	
	object_event  2, 17, SPRITE_BOARDER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBoarderRonald, -1
	object_event  3, 12, SPRITE_BOARDER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBoarderBrad, -1
	object_event  0,  3, SPRITE_BOARDER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBoarderDouglas, -1

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
	iftrue_jumpopenedtext PryceText_MeetYouAtTheLake
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
	promptbutton
;	verbosegivekeyitem CLEAR_BELL ; morty gives it 
;	writetext PryceText_ClearBell
	promptbutton
	writetext PryceText_MeetYouAtTheLake
	closetext
	end

PryceText_Intro: ; done 
	text "<PLAYER>, Kurt"
	line "told me about the"
	cont "troubles you two"
	cont "faced together."
	para "I know his heart"
	line "was in the right"
	cont "place, but I hope"
	para "you will show"
	line "better judgement"
	cont "if you ever get"
	cont "the same choice."

	para "...So you want to"
	line "go to the Lake"
	cont "to finish your"
	cont "quest."
	
	para "I'm of two minds."
	para "Changing the past"
	line "to fix today..."
	cont "It's tempting."
	para "But what about"
	line "staying here to"
	cont "build a better"
	cont "future?"
	para "...I'll help you"
	line "on one condition:"
	para "Prove your #mon"
	line "have the spirit"
	cont "to inspire change"
	para "in the hearts of"
	line "others."
	para "Show me that"
	line "power!"
	done

PryceText_Impressed: ; todo 
	text "Your #mon"
	line "fight as a team!"

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

PryceText_CalmMindText: ; revise, fix  
	text "That TM contains"
	line "Calm Mind."

	para "Some meditation"
	line "before challenges"
	cont "will put you on"
	cont "firm ground!"	
	
	para "Oh, one more"
	line "thing for you."
	done

;PryceText_ClearBell:
;	text "Morty gave me"
;	line "those when he"
;	cont "left his gym."
;	
;	para "I think you are"
;	line "worthy to have"
;	cont "one."
;	done

PryceText_MeetYouAtTheLake:
	text "Now make haste!"
	line "Meet me on the"
	cont "north shore of"
	cont "the Lake."
	
	para "It's a long trek"
	line "so make sure you"
	cont "have supplies."
	done

GenericTrainerSkierRoxanne:
	generictrainer SKIER, ROXANNE, EVENT_BEAT_SKIER_ROXANNE, SkierRoxanneSeenText, SkierRoxanneBeatenText

SkierRoxanneBeatenText:
	text "You've got some"
	line "skills!"
	done

SkierRoxanneSeenText:
	text "This is no"
	line "bunny slope!"
	done


GenericTrainerSkierClarissa:
	generictrainer SKIER, CLARISSA, EVENT_BEAT_SKIER_CLARISSA, SkierClarissaSeenText, SkierClarissaBeatenText

SkierClarissaBeatenText:
	text "Don't let bumps"
	line "throw you off"
	cont "course."	
	done

SkierClarissaSeenText:
	text "Can you keep your"
	line "cool on moguls?"
	done


GenericTrainerBoarderDouglas:
	generictrainer BOARDER, DOUGLAS, EVENT_BEAT_BOARDER_DOUGLAS, BoarderDouglasSeenText, BoarderDouglasBeatenText


BoarderDouglasBeatenText:
	text "He meditated in"
	line "the lake in"
	cont "Winter."
	done

BoarderDouglasSeenText:
	text "I know Pryce's"
	line "secret."
	done


GenericTrainerBoarderRonald:
	generictrainer BOARDER, RONALD, EVENT_BEAT_BOARDER_RONALD, BoarderRonaldSeenText, BoarderRonaldBeatenText

BoarderRonaldBeatenText:
	text "Gyms are places"
	line "to learn. A shame"
	cont "they're nearly"
	cont "gone."
	done

BoarderRonaldSeenText:
	text "We're one of the"
	line "last Johto gyms-"
	
	para "Come to see what"
	line "we're about?"
	done


GenericTrainerBoarderBrad:
	generictrainer BOARDER, BRAD, EVENT_BEAT_BOARDER_BRAD, BoarderBradSeenText, BoarderBradBeatenText


BoarderBradBeatenText:
	text "Do you see how"
	line "serious we are?"
	done

BoarderBradSeenText:
	text "Watch out - I'm"
	line "vying to take the"
	cont "gym over after"
	cont "Pryce!"
	done


MahoganyGymStatue:
	text "Mahogany Gym"
	line "Leader: Pryce"
	
	para "Learn to keep"
	line "cool in heated"
	cont "situations"
	done
