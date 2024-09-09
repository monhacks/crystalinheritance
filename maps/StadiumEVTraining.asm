EVTrainingGym_MapScriptHeader: ; this file is not yet connected to anything yet. 
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0, 0, STADIUM_GROUNDS, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  6, SPRITE_ATTENDANT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EVTrainingAttendantScript, -1

EVTrainingAttendantScript:
	faceplayer
	opentext
	writetext EVTrainingIntroText
	promptbutton
	loadmenu EVTrainingMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .TrainAttack
	ifequal 2, .TrainDefense
	ifequal 3, .TrainSpAttack
	ifequal 4, .TrainSpDefense
	ifequal 5, .TrainSpeed
	jumptext EVTrainingCancelText

.TrainAttack:
	writetext EVTrainingConfirmText
	yesorno
	iffalse EVTrainingAttendantScript
	loadtrainer DRAGON_TAMER, EV_TRAINER_ATTACK
	startbattle
	reloadmapafterbattle
	jumptext EVTrainingFinishText

.TrainDefense:
	writetext EVTrainingConfirmText
	yesorno
	iffalse EVTrainingAttendantScript
	loadtrainer HIKER, EV_TRAINER_DEFENSE
	startbattle
	reloadmapafterbattle
	jumptext EVTrainingFinishText

.TrainSpAttack:
	writetext EVTrainingConfirmText
	yesorno
	iffalse EVTrainingAttendantScript
	loadtrainer PSYCHIC_T, EV_TRAINER_SP_ATTACK
	startbattle
	reloadmapafterbattle
	jumptext EVTrainingFinishText

.TrainSpDefense:
	writetext EVTrainingConfirmText
	yesorno
	iffalse EVTrainingAttendantScript
	loadtrainer HEX_MANIAC, EV_TRAINER_SP_DEFENSE
	startbattle
	reloadmapafterbattle
	jumptext EVTrainingFinishText

.TrainSpeed:
	writetext EVTrainingConfirmText
	yesorno
	iffalse EVTrainingAttendantScript
	loadtrainer BIRD_KEEPER, EV_TRAINER_SPEED
	startbattle
	reloadmapafterbattle
	jumptext EVTrainingFinishText

EVTrainingMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 6 ; items
	db "Atk@"
	db "Def@"
	db "SAk@"
	db "SDf@"
	db "Spd@"
	db "Cancel@"

EVTrainingIntroText:
	text "Welcome to the EV"
	line "Training Gym!"

	para "Which stat would"
	line "you like to train?"
	done

EVTrainingConfirmText:
	text "Are you ready to"
	line "start training?"
	done

EVTrainingCancelText:
	text "Come back when"
	line "you're ready to"
	cont "train!"
	done

EVTrainingFinishText:
	text "Great job! Your"
	line "#mon should be"
	cont "stronger now."

	para "Come back anytime"
	line "for more training!"
	done
