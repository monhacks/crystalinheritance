SecondClassCabin_MapScriptHeader: ;	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event  8,  5, MAGNET_TRAIN_TUNNEL, 3 ;ok
	warp_event  9,  5, MAGNET_TRAIN_TUNNEL, 3 ;ok

	def_coord_events



	def_bg_events



	def_object_events
	object_event  4,  4, SPRITE_JUGGLER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, trade, NPC_TRADE_KYLE, -1
	object_event  1,  4, SPRITE_JUGGLER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SecondClassCabinJuggler2, -1
	object_event  8,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SecondClassCabinYoungster, -1
	object_event  8,  2, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SecondClassCabinMatron, -1

	object_const_def


SecondClassCabinMatron:
	opentext
	writetext MatronSoothesSecondClass
	promptbutton
	closetext
	faceplayer
	opentext
	writetext MatronSoothesSecondClass2
	promptbutton
	closetext
	end
	
MatronSoothesSecondClass:
	text "There, there..."
	
	para "It'll be OK."
	
	para "There's nothing"
	line "to be afraid"
	cont "of."
	
	done
	
MatronSoothesSecondClass2:
	text "It was bad en-"
	line "ough when the"
	cont "train stopped,"
	cont "but then that"
	cont "clown scared my"
	cont "son by doing a"
	cont "routine."

	done

SecondClassCabinYoungster:
	faceplayer
	opentext
	writetext YoungsterIsScaredText
	promptbutton
	closetext
	end
	
YoungsterIsScaredText:
	text "Snivel..."
	
	para "Waaa!"
	
	done
	
SecondClassCabinJuggler2:
	faceplayer
	opentext
	writetext SecondClassCabinJuggler2Text
	promptbutton
	closetext
	end

SecondClassCabinJuggler2Text:
	text "My buddy wants"
	line "to be a clown"
	cont "so bad."
	
	para "He really wants"
	line "to make a ball-"
	cont "oon animal for"
	cont "that kid, but"
	cont "we don't have"
	cont "any helium to"
	cont "fill 'em up."
	done

