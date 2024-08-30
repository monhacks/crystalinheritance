GauldenrodTower4F_MapScriptHeader:
	def_scene_scripts
	scene_script GauldenrodTower4FTrigger0

	def_callbacks

	def_warp_events
	warp_event  7, 15, GAULDENROD_TOWER_3F, 2
	warp_event  7,  2, GAULDENROD_TOWER_ROOF, 1
	warp_event 16,  7, GAULDENROD_TOWER_4F, 4 ; side door for Amos

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7,  7, SPRITE_SANDRA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GauldenrodTower4FSandraScript, EVENT_GAULDENROD_TOWER_4F_AMOS
	object_event  7, 10, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GAULDENROD_TOWER_4F_BRIGADER
	object_event 15,  7, SPRITE_AMOS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GAULDENROD_TOWER_4F_AMOS
	tmhm 16, 2, TM_ROOST, 1, EVENT_GAULDENROD_TOWER_4F_TM_ROOST

	object_const_def
	const GAULDENRODTOWER4F_SANDRA
	const GAULDENRODTOWER4F_BRIGADER
	const GAULDENRODTOWER4F_AMOS

GauldenrodTower4FTrigger0:
	end

GauldenrodTower4FSandraScript:
	faceplayer
	opentext
	writetext SandraIntroText
	yesorno
	iffalse .Refused
	writetext SandraChallengeText
	waitbutton
	closetext
	winlosstext SandraWinText, 0
	loadtrainer SANDRA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SANDRA
	opentext
	writetext SandraAfterText
	waitbutton
	closetext
	setflag ENGINE_SANDRABADGE ; todo
	appear GAULDENRODTOWER4F_BRIGADER
	applymovement GAULDENRODTOWER4F_BRIGADER, BrigaderApproachMovement
	turnobject PLAYER, DOWN
	opentext
	writetext BrigaderInterruptText
	waitbutton
	writetext SandraResponseText
	waitbutton
	writetext BrigaderExplanationText
	waitbutton
	writetext SandraAgreementText
	waitbutton
	closetext
	applymovement GAULDENRODTOWER4F_SANDRA, SandraLeaveMovement
	applymovement GAULDENRODTOWER4F_BRIGADER, BrigaderLeaveMovement
	disappear GAULDENRODTOWER4F_SANDRA
	disappear GAULDENRODTOWER4F_BRIGADER
	pause 15
	appear GAULDENRODTOWER4F_AMOS
	applymovement GAULDENRODTOWER4F_AMOS, AmosEnterMovement
	opentext
	writetext AmosText
	waitbutton
	closetext
	applymovement GAULDENRODTOWER4F_AMOS, AmosLeaveMovement
	disappear GAULDENRODTOWER4F_AMOS
	end

.Refused:
	writetext SandraRefusedText
	waitbutton
	closetext
	end

SandraIntroText:
	text "Player, you have"
	line "shown your connec-"
	cont "tion to #MON."
	cont "Why are you here?"

	para "..."
	
	para "Ah, you seek"
	line "entrance to"
	cont "Trader's Landing"
	cont "to stop steel"
	cont "types from"
	cont "entering Johto."

	para "Tell me, is it the"
	line "steel types or"
	cont "something else"
	cont "that causes"
	cont "destruction?"

	para "Ha, you will learn"
	line "soon enough."

	para "Would you like"
	line "a lesson?"
	done

SandraChallengeText:
	text "Show me your"
	line "connection with"
	cont "your #MON!"
	done

SandraWinText:
	text "Magnificent"
	line "battle."
	done

SandraAfterText:
	text "With my blessing"
	line "you can use the"
	cont "HM Strength."

	para "I have much to"
	line "tell you."
	done

SandraRefusedText:
	text "I see. Perhaps"
	line "you're not ready"
	cont "yet."
	done

BrigaderInterruptText:
	text "Sandra! You must"
	line "come with us, now!"
	done

SandraResponseText:
	text "What's this about?"
	done

BrigaderExplanationText:
	text "You'll see! You are"
	line "summoned by"
	cont "General Bobesh to"
	cont "the stadium at"
	cont "once!"
	done

SandraAgreementText:
	text "Oh my… I have"
	line "wanted to talk to"
	cont "him for a while."
	done

AmosText:
	text "Hello, have you"
	line "seen Sandra?"

	para "Oh, the brigaders"
	line "just took her to"
	cont "the stadium?"

	para "Then I was just a"
	line "little too late..."

	para "Say, you look"
	line "familiar..."

	para "Oh, right, you"
	line "were in Anarres"
	cont "Town, interrupting"
	cont "my conversation"
	cont "with Hollis."

	para "Well, I'd better"
	line "get out of here,"
	cont "before any"
	cont "brigaders find me."

	para "Maybe that tunnel"
	line "under the city"
	cont "will have a way"
	cont "out..."
	done

BrigaderApproachMovement:
	step_up
	step_up
	step_up
	step_end

SandraLeaveMovement:
	step_down
	step_down
	step_down
	step_down
	step_end

BrigaderLeaveMovement:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

AmosEnterMovement:
	step_left
	step_left
	step_end

AmosLeaveMovement:
	step_right
	step_right
	step_right
	step_down
	step_down
	step_down
	step_end
