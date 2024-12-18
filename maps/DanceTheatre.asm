DanceTheatre_MapScriptHeader:
	def_scene_scripts

	def_callbacks


	def_warp_events
	warp_event  5, 13, ECRUTEAK_CITY, 8
	warp_event  6, 13, ECRUTEAK_CITY, 8

	def_coord_events

	def_bg_events


	def_object_events
	object_event  5,  9, SPRITE_OSTENE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DanceTheatreOstene2Script, EVENT_DANCE_THEATRE_OSTENE ; end 
	object_event  6,  9, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, DanceTheatreKimono2Script, EVENT_DANCE_THEATRE_OSTENE ; end
	object_event  0,  3, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TheatreElderScript, EVENT_BEAT_RIVAL_ROUTE_42
	object_event  3,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerKimono_girlSayo, EVENT_BEAT_RIVAL_ROUTE_42 ; FLAREON, kimono girl 1 -- DONE 
	object_event  7,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerKimono_girlKuni, EVENT_BEAT_RIVAL_ROUTE_42 ; GLACEON, kimono girl 4 -- DONE
	object_event  3, 10, SPRITE_OSTENE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, DanceTheatreOstene1Text, EVENT_BEAT_RIVAL_ROUTE_42;
	pokemon_event  4, 10, PORYGON_Z, -1, -1, PAL_NPC_RED, PorygonZText, EVENT_BEAT_RIVAL_ROUTE_42;
	object_event 10,  8, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, DanceTheatreKurtText, EVENT_BEAT_KIMONO_GIRL_EMI ; 
	object_event  1, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, DanceTheatreSilphText, EVENT_BEAT_RIVAL_ROUTE_42 ; SILPH 
	object_event  3,  8, SPRITE_LADY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, DanceTheatreNPC1Text, EVENT_BEAT_RIVAL_ROUTE_42


	object_const_def
	const THEATRE_OSTENE_1
	const THEATRE_KIMONO_GIRL
	const THEATRE_ELDER

PorygonZText:
	text "Porygon-Z:"
	line "Zoop zoop!"
	done

DanceTheatreOstene2Script: ; to add later
	end

DanceTheatreKimono2Script:
	end 

DanceTheatreOstene1Text:
	text "Ostene: Oh, hi… "
	line "isn't this show"
	cont "boring?"
	
	para "It needs to be"
	line "brought back "
	cont "to life."
	done

DanceTheatreSilphText:
	text "We at Silph"
	line "think Ostene"
	cont "can draw some"
	cont "big crowds."
	done
	
DanceTheatreKurtText:
	text "<PLAYER> - "
	line "maybe the Kimono"
	cont "girls have an"
	cont "idea how to go"
	cont "back in time."
	
	para "You should see"
	line "if they will"
	cont "help us!"
	done

DanceTheatreNPC1Text:
	text "This show is so"
	line "immersive!"
	done



TheatreElderScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_KIMONO_GIRL_AKARI
	iftrue_jumpopenedtext TheatreElderThanksYou
	writetext TheatreElderExplainsText
	yesorno
	iffalse_jumpopenedtext DanceTheatre_MaybeLater
	writetext DanceTheatre_GoodLuck
	waitbutton
	closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	clearevent EVENT_BEAT_KIMONO_GIRL_NAOKO
	clearevent EVENT_BEAT_KIMONO_GIRL_SAYO
	clearevent EVENT_BEAT_KIMONO_GIRL_ZUKI
	clearevent EVENT_BEAT_KIMONO_GIRL_IZUMI
	clearevent EVENT_BEAT_KIMONO_GIRL_KUNI
	clearevent EVENT_BEAT_KIMONO_GIRL_MIKI
	warp DANCE_THEATRE_2F, 0, 2
	end	

DanceTheatre_MaybeLater:
	text "Some other time."
	done

DanceTheatre_GoodLuck:
	text "Enjoy the show!"
	done

TheatreElderThanksYou:
	text "Congratulations!"
	
	para "Akari invites you"
	line "to an epilogue at"
	cont "Bellchime Trail."
	done
	
TheatreElderExplainsText:
	text "We have a very"
	line "immersive dance"
	cont "these days."
	
	para "The Kimono Girls"
	line "battle you back"
	cont "to back, "
	
	para "delivering the "
	line "story of how a"
	cont "young child kept"
	cont "Johto from being"
	cont "ruled by an evil"
	cont "emperor!"
	done
