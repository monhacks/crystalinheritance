WesternCapitalDanceTheatre_MapScriptHeader: ;	def_scene_scripts
	def_scene_scripts

	def_callbacks


	def_warp_events
	warp_event  5, 13, WESTERN_CAPITAL, 4
	warp_event  6, 13, WESTERN_CAPITAL, 4

	def_coord_events

	def_bg_events


	def_object_events


	object_event  3,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerKimono_girlRed, EVENT_BEAT_ADRINNA_MOUNT_MORTAR ; 
	object_event  3,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerKimono_girlBlue, EVENT_BEAT_ADRINNA_MOUNT_MORTAR ; FLAREON, kimono girl 1 -- DONE 
	object_event  7,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerKimono_girlBrown, EVENT_BEAT_ADRINNA_MOUNT_MORTAR ; GLACEON, kimono girl 4 -- DONE


	object_event  1, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WC_DanceTheatreNPC1Script, -1 ; SILPH 
	object_event  3,  8, SPRITE_LADY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WC_DanceTheatreNPC2Script, -1

	object_event  9,  7, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_STANDARD, MART_WESTERN_CAPITAL_MON, -1

	object_const_def

Kimono1: With my kimono, I dance like tongues of fire! Sizzling. Watching a fire burn can be enchanting. Make sure you don’t get burned.  Monferno, Magmar, HArcanine
Kimono2: With enough water, you could grow a whole new world. Ethereal. Remember – too much water, and any plant will drown.  Prinplup, Fegatr, Jynx
Kimono3: Feel your hairs rise, compelled by the static charge! Magnificent conduction. When the lightning strikes, you must ground yourself. Luxio, Ebuzz, HElectrode


GenericTrainerKimono_girlRed:
	generictrainer KIMONO_GIRL_1, SAYO, EVENT_BEAT_KIMONO_GIRL_SAYO, Kimono_girl_1SayoSeenText, Kimono_girl_1SayoBeatenText

	text "When the nearby"
	line "town of Gauld-"
	cont "enrod was cast"
	cont "into pieces by"
	cont "the power-"
	cont "hungry emperor,"

	para "the hero showed"
	line "them their"
	cont "similar needs."
	done

Kimono_girl_1SayoSeenText:
	text "Trial by fire!"
	done

Kimono_girl_1SayoBeatenText:
	text "When the nearby"
	line "town of Gauld-"
	cont "enrod was cast"
	cont "into pieces by"
	cont "the power-"
	cont "hungry emperor,"

	para "the hero showed"
	line "them their"
	cont "similar needs."
	done


GenericTrainerKimono_girlBlue:
	generictrainer KIMONO_GIRL_4, IZUMI, EVENT_BEAT_KIMONO_GIRL_IZUMI, Kimono_girl_1IzumiSeenText, Kimono_girl_1IzumiBeatenText
	text "At that time, a"
	line "harsh storm kept"
	cont "boats out of"
	cont "the harbor."
	para "Now, the emperor"
	line "could only"
	cont "expand to the"
	cont "east."
	done

Kimono_girl_1IzumiSeenText:
	text "Strike like a"
	line "hurricane!"
	done

Kimono_girl_1IzumiBeatenText:
	text "At that time, a"
	line "harsh storm kept"
	cont "boats out of"
	cont "the harbor."
	para "Now, the emperor"
	line "could only"
	cont "expand to the"
	cont "east."
	done




WC_DanceTheatreNPC1IntroText
	text "The Generals are"
	line "frequent visitors"
	cont "to the theatre."
	
	para "I can't seem to"
	line "get past their"
	cont "flashy robes."
	done

WC_DanceTheatreNPC1Text2:
	text "Oh! You beat all"
	line "three of them!"
	
	para "Please, take this"
	line "for showing me"
	cont "such pizzazz."
	done

WC_DanceTheatreNPC2Text:
	text "I wonder where"
	line "the other Kimono"
	cont "Girls went?"
	done
	


GenericTrainerKimono_gir1Brown: ; BROWN 
	generictrainer KIMONO_GIRL_5, MIKI, EVENT_BEAT_KIMONO_GIRL_MIKI, Kimono_girl_1MikiSeenText, Kimono_girl_1MikiBeatenText
	text "Back then, Mount"
	line "Mortar's volcan-"
	cont "ic activity was"

	para "a lightningrod"
	line "for the emper-"
	cont "or's self-"
	cont "aggrandizing."

	para "So the emperor's"
	line "reach was cut"
	cont "off from the"

	para "south, the west,"
	line "and the east."
	done

Kimono_girl_1MikiSeenText:
	text "Strike in the"
	line "dark!"
	done

Kimono_girl_1MikiBeatenText:
	text "Back then, Mount"
	line "Mortar's volcan-"
	cont "ic activity was"

	para "a lightningrod"
	line "for the emper-"
	cont "or's self-"
	cont "aggrandizing."

	para "So the emperor's"
	line "reach was cut"
	cont "off from the"

	para "south, the west,"
	line "and the east."
	done