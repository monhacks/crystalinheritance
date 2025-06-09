WhispersWay_MapScriptHeader: 
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 0, 0, WHISPERS_TAPESTRY_GATE, 1
	warp_event 0, 0, WHISPERS_TAPESTRY_GATE, 1

	def_coord_events



	def_bg_events
	bg_event 2, 7, BGEVENT_ITEM + FULL_RESTORE, EVENT_WISHERS_HIDDEN_FULL_RESTORE
	bg_event 17, 5, BGEVENT_ITEM + PETAYA_BERRY, EVENT_WISHERS_HIDDEN_BERRY_1
	bg_event 17, 27, BGEVENT_ITEM + SALAC_BERRY, EVENT_WISHERS_HIDDEN_BERRY_2
	bg_event  3, 24, BGEVENT_ITEM + BIG_NUGGET, EVENT_WISHERS_HIDDEN_BIG_NUGGET
	bg_event 17, 30, BGEVENT_ITEM + MAX_REVIVE, EVENT_WISHERS_HIDDEN_MAX_REVIVE

	def_object_events
	object_event 9, 18, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WhispersKurtScript, -1 ;


	object_const_def


WhispersKurtScript: 
	faceplayer
	opentext
	writetext KurtWWText
	yesorno
	iffalse .KurtPC
	winlosstext WWKurtBattleText, WWKurtBattleText
	loadtrainer KURT, 12
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmapafterbattle
	opentext
	jumpopenedtext WWKurtBattleText2

.KurtPC
	writetext KurtWWText2
	promptbutton
	special PokemonCenterPC
	endtext
	end

KurtWWText:
	text "This path is so"
	line "beautiful!"
	
	para "We are getting"
	line "close to taking"
	cont "down Urgaust."
	
	para "Want to battle,"
	line "a quick spar?"
	done
	
KurtWWText2:
	text "I can run back"
	line "to manage your"
	cont "party."
	done

WWKurtBattleText:
	text "You've grown so"
	line "much!"	
	done

WWKurtBattleText2:
	text "We can battle as"
	line "many times as"
	cont "you like."
	done
