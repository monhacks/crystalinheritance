BrassTower2FWarp_MapScriptHeader: ;	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 3, 9, BRASS_TOWER_2F, 2
	warp_event 4, 9, BRASS_TOWER_2F, 2


	def_coord_events



	def_bg_events



	def_object_events
	object_event  4,  2, SPRITE_BOBESH, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BrassTowerBobesh, -1


	object_const_def
	
BrassTowerBobesh:
	checkevent EVENT_BEAT_BOBESH_TOWER
	iftrue_jumptextfaceplayer .AfterText
	showtextfaceplayer .SeenText
	winlosstext .BeatenText, 0
	loadtrainer BOBESH, 2
	startbattle
	reloadmapafterbattle
	showtext .AfterText
	setevent EVENT_BEAT_BOBESH_TOWER
	end


.SeenText:
	text "Oh? What are you"
	line "doing in my"
	cont "sanctum? Were my"
	cont "guards defeated?"
	
	para "You ruined my pl-"
	line "ans at the stad-"
	cont "ium. Gauldenrod:"
	
	para "Its chaos was"
	line "calmed by my pat-"
	cont "ernal hands!"
	
	para "Then you petulant"
	line "child and Samsara"
	cont "showed up. The"
	para "Emperor never"
	line "trusted me again."
	
	para "I'm not letting"
	line "you get away this"
	cont "time! I will have"
	cont "my revenge!"
	done

.BeatenText:
	text "Impossible... How"
	line "can disorder"
	cont "triumph over"
	cont "strength?"
	done

.AfterText:
	text "Perhaps I was"
	line "blind... But no-"

	para "Without absolute"
	line "power, society"
	cont "will crumble."
	
	para "I have no right"
	line "to history, now."
	cont "But Kensey will"
	cont "succeed where I"
	cont "failed."
	done
