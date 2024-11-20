EmperorsGarden_MapScriptHeader: ;	def_scene_scripts
	def_scene_scripts
	scene_script EmperorsGardenMejimiScene

	def_callbacks


	def_warp_events
	warp_event 20, 30, WESTERN_CAPITAL, 1
	warp_event 20, 31, WESTERN_CAPITAL, 2


	def_coord_events ; td set these 
;	coord_event  28, 28, 	0, EmperorsGardenMejimiScene;
	coord_event  29, 14, 	1, EmperorsGardenBobeshScene;
	coord_event  21, 11, 	2, EmperorsGardenKenseyScene;
	coord_event  13, 14, 	3, EmperorsGardenAdrinnaScene;

	def_bg_events
; add some items to the top of the spines 


	def_object_events
	object_event  	22,	30, 	SPRITE_MEJIMI, 	SPRITEMOVEDATA_STANDING_DOWN, 	0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_EMPERORS_GARDEN_MEJIMI ;
	object_event  	29,	31, 	SPRITE_BOBESH, 	SPRITEMOVEDATA_STANDING_UP, 	0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_EMPERORS_GARDEN_MEJIMI ;
	object_event  	28,	31,	 	SPRITE_KENSEY, 	SPRITEMOVEDATA_STANDING_UP, 	0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_EMPERORS_GARDEN_MEJIMI ;
	object_event  	27,	31,	 	SPRITE_ADRINNA, SPRITEMOVEDATA_STANDING_UP, 	0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_EMPERORS_GARDEN_MEJIMI ;
	
	object_event  	26,	12,		SPRITE_BOBESH, 	SPRITEMOVEDATA_STANDING_RIGHT, 	0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_EMPERORS_GARDEN_BOBESH ;
	object_event  	20,	6,	 	SPRITE_KENSEY, 	SPRITEMOVEDATA_STANDING_RIGHT, 	0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_EMPERORS_GARDEN_KENSEY ;
	object_event  	27,	12,	 	SPRITE_ADRINNA, SPRITEMOVEDATA_STANDING_LEFT, 	0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_EMPERORS_GARDEN_BOBESH ;	
	object_event  	21,	6,	 	SPRITE_ADRINNA, SPRITEMOVEDATA_STANDING_LEFT, 	0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_EMPERORS_GARDEN_KENSEY ;	
	object_event  	13,	10,	 	SPRITE_ADRINNA, SPRITEMOVEDATA_STANDING_UP, 	0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_EMPERORS_GARDEN_ADRINNA ;	

	object_event	22,	30, 	SPRITE_BRIGADER, SPRITEMOVEDATA_STANDING_DOWN, 	0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptext, EG_Brigader_Text1, -1 ;
	object_event	22,	31, 	SPRITE_BRIGADER, SPRITEMOVEDATA_STANDING_UP, 	0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptext, EG_Brigader_Text2, -1 ;

	fruittree_event  2, 21, FRUITTREE_EMPERORS_GARDEN_1, WHT_APRICORN, PAL_NPC_SILVER
	fruittree_event  5, 24, FRUITTREE_EMPERORS_GARDEN_2, LUM_BERRY, PAL_NPC_RED
	fruittree_event  6, 23, FRUITTREE_EMPERORS_GARDEN_3, SITRUS_BERRY, PAL_NPC_RED

	object_event 	27, 28, SPRITE_KURT, SPRITEMOVEDATA_STANDING_RIGHT, 	0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EG_KurtText, EVENT_EMPERORS_GARDEN_ADRINNA ;

	itemball_event  27,  9, PROTEIN, 1, EVENT_EMPERORS_GARDEN_PROTEIN
	itemball_event  21,  3, CALCIUM, 1, EVENT_EMPERORS_GARDEN_CALCIUM
	itemball_event  13,  9, CARBOS, 1, EVENT_EMPERORS_GARDEN_CARBOS

	object_event	 2,	14, 	SPRITE_BRIGADER, SPRITEMOVEDATA_SPINRANDOM_FAST, 	0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EG_SeedBombMT, -1 ;	
	
	object_const_def
	const EMPERORS_GARDEN_MEJIMI
	const EMPERORS_GARDEN_BOBESH
	const EMPERORS_GARDEN_KENSEY
	const EMPERORS_GARDEN_ADRINNA
	
	const EMPERORS_GARDEN_BOBESH_2
	const EMPERORS_GARDEN_KENSEY_2
	const EMPERORS_GARDEN_ADRINNA_2
	const EMPERORS_GARDEN_ADRINNA_3
	const EMPERORS_GARDEN_ADRINNA_4

EG_Brigader_Text2:
	text "Brigader: No, I"
	line "say that BOBESH"
	cont "has the best"
	cont "vision!"
	done
	
EG_Brigader_Text1:
	text "Brigader: No, I"
	line "say that KENSEY"
	cont "has the best"
	cont "vision!"
	done
	
EG_KurtText:
	text "Kurt: Sh! We"
	line "gotta find a "
	cont "way out of here."
	
	para "Then, we can get"
	line "to the port, to"
	cont "stop that steel"
	cont "from arriving!"
	done

EmperorsGardenMejimiScene:
	applymovement EMPERORS_GARDEN_MEJIMI, MejimiWalksInMovement
	refreshscreen
	trainerpic MEJIMI
	waitbutton
	closepokepic
	pause 30
	showemote EMOTE_QUESTION, EMPERORS_GARDEN_MEJIMI, 10
	showtext EG_Text1
	waitbutton
	applyonemovement EMPERORS_GARDEN_MEJIMI, step_right ; in front of bobesh
	turnobject EMPERORS_GARDEN_MEJIMI, DOWN
	showtext EG_Text11
	showemote EMOTE_SAD, EMPERORS_GARDEN_BOBESH, 10
	showtext EG_Text2
	showemote EMOTE_SHOCK, EMPERORS_GARDEN_MEJIMI, 10
	showtext EG_Text3
	applyonemovement EMPERORS_GARDEN_MEJIMI, step_left ; in front of kensey 
	turnobject EMPERORS_GARDEN_MEJIMI, DOWN
	showtext EG_Text4
	waitbutton
	showtext EG_Text5
	applyonemovement EMPERORS_GARDEN_MEJIMI, step_left ; in front of adrinna
	turnobject EMPERORS_GARDEN_MEJIMI, DOWN
	showtext EG_Text6
	applymovement EMPERORS_GARDEN_MEJIMI, MejimiLeavesMovement
	disappear EMPERORS_GARDEN_MEJIMI
	applymovement EMPERORS_GARDEN_BOBESH, GeneralsLeaveMovement
	disappear EMPERORS_GARDEN_BOBESH
	applymovement EMPERORS_GARDEN_KENSEY, GeneralsLeaveMovement
	disappear EMPERORS_GARDEN_KENSEY
	applymovement EMPERORS_GARDEN_ADRINNA, GeneralsLeaveMovement
	disappear EMPERORS_GARDEN_ADRINNA
	setevent EVENT_EMPERORS_GARDEN_MEJIMI
	setscene $1
	end

MejimiWalksInMovement:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	turn_head_down
	step_end


EG_Text1:
	text "Emperor Mejimi:"
	line "Ah, my generals."
	para "Less disappointing"
	line "than usual, I"
	cont "trust?"
	done

EG_Text11:
	text "Mejimi: How"
	line "goes it in"
	cont "Gauldenrod,"
	cont "Bobesh?"
	done

EG_Text2:
	text "Bobesh: My"
	line "liege - our"
	cont "stadium... it..."
	para "fell into a"
	line "sinkhole."
	done

EG_Text3:
	text "Mejimi: A"
	line "sinkhole?"
	para "Bobesh: Yes. No"
	line "soldiers were"
	cont "lost."
	para "Mejimi: I see."
	line "It will take"
	cont "time to"
	cont "restore order."
	done

EG_Text4:
	text "And how are"
	line "things at the"
	cont "port? We need"
	cont "those metals."
	para "Kensey: We have"
	line "traded for one"
	cont "hundred tons"
	cont "of Tin."
	para "The Hisuians"
	line "will teach us"
	cont "to smelt it."
	done
	
EG_Text5:
	text "Mejimi: And in"
	line "the mine?"
	para "Kensey: All are"
	line "still unaware"
	cont "of our plans."
	done

EG_Text6:
	text "Mejimi: Good."
	line "General"
	cont "Adrinna,"
	para "please review"
	line "their plans."
	done

MejimiLeavesMovement:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

GeneralsLeaveMovement:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

EmperorsGardenBobeshScene:
	showemote EMOTE_BOLT, EMPERORS_GARDEN_ADRINNA_2, 10
	showtext EG_Bobesh_Text1
	closetext
	applymovement EMPERORS_GARDEN_ADRINNA_2, AdrinnaMoves2
	disappear EMPERORS_GARDEN_ADRINNA_2
	applyonemovement EMPERORS_GARDEN_BOBESH_2, teleport_from
	disappear EMPERORS_GARDEN_BOBESH_2
	setevent EVENT_EMPERORS_GARDEN_BOBESH
	setscene $2
	end	

EG_Bobesh_Text1:
	text "Adrinna: You"
	line "lied to the"
	cont "emperor."
	
	para "Bobesh: A white"
	line "lie."

	para "Adrinna: Your"
	line "venue was a"
	cont "place for"
	cont "minds to rot,"

	para "and yours did"
	line "too."

	para "We need to fend"
	line "off the"
	cont "outsiders."

	para "We need strong"
	line "individuals,"
	cont "not drones!"
	
	para "Pray you get"
	line "another chance."
	done

AdrinnaMoves2:
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

EmperorsGardenKenseyScene:
	showemote EMOTE_SHOCK, PLAYER, 5
	applymovement PLAYER, PlayerHidesFromKenseyMovement
	pause 30
	showemote EMOTE_QUESTION, EMPERORS_GARDEN_ADRINNA_3, 10
	showtext EG_Kensey_Text_1
	closetext
	applymovement EMPERORS_GARDEN_ADRINNA_3, AdrinnaMoves3
	pause 15
	opentext
	writetext EG_FamiliarSmellText
	waitbutton
	closetext
	applymovement EMPERORS_GARDEN_ADRINNA_3, AdrinnaMoves4
	disappear EMPERORS_GARDEN_ADRINNA_3
	applyonemovement EMPERORS_GARDEN_KENSEY_2, teleport_from
	disappear EMPERORS_GARDEN_KENSEY_2
	setevent EVENT_EMPERORS_GARDEN_KENSEY
	setscene $3
	end	

PlayerHidesFromKenseyMovement:
	step_left
	step_up
	step_up
	step_up
	turn_head_right
	step_end

EG_Kensey_Text_1:
	text "Adrinna: We"
	line "make trade with"
	cont "those"
	cont "barbarians?"
	
	para "Kensey: We"
	line "traded #mon"
	cont "and safe port"

	para "for their metal"
	line "for our tower."

	para "Adrinna:"
	line "Amazing..."

	para "Kensey: There"
	line "are now"
	cont "hundreds on"
	cont "our dole!"

	para "Under my"
	line "planning, our"
	cont "skills have"
	cont "never been"
	cont "sharper!"

	para "Adrinna: But"
	line "how will we"
	cont "remain"
	cont "dynamic?"

	para "Kensey: I'll"
	line "oversee it."

	para "Adrinna: I'm"
	line "sure you will."

	done

EG_FamiliarSmellText:
	text "What is that"
	line "familiar smell?"
	
	para "Like holly,"
	line "but that doesn't"
	cont "grow anywhere"
	cont "nearby."
	done

AdrinnaMoves3:
	step_down
	step_down
	step_down
	step_down	
	step_down
	step_left
	step_left
	step_left
	turn_head_down
	step_end

AdrinnaMoves4:
	step_down
	step_down	
	step_down
	step_down
	step_down
	step_down
	step_end

EmperorsGardenAdrinnaScene: ; todo - revise 
	showemote EMOTE_HAPPY, EMPERORS_GARDEN_ADRINNA_4, 10
	turnobject EMPERORS_GARDEN_ADRINNA_4, DOWN
	turnobject PLAYER, UP
	showtext EG_AdrinnaText1
	applymovement EMPERORS_GARDEN_ADRINNA_4, EG_AdrinnaMove3
	loadtrainer ADRINNA, ADRINNA1 
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap	
	showtext EG_AdrinnaText2
	verbosegivekeyitem SILVER_WING
	showtext EG_AdrinnaText3
	applyonemovement EMPERORS_GARDEN_ADRINNA_4, teleport_from
	disappear EMPERORS_GARDEN_ADRINNA_4
	setevent EVENT_EMPERORS_GARDEN_ADRINNA
	setscene $0
	end

EG_AdrinnaMove3:
	step_down
	step_down
	step_down
	step_end

EG_AdrinnaText1:
	text "<PLAYER>? What"
	line "are you doing"
	cont "here?"
	para "Fufufu..."
	line "Hopefully just"
	cont "enjoying the"
	cont "garden, eh?"

	para "This garden was"
	line "shaped from dirt"
	para "by the vision"
	line "of an architect"
	
	para "I see the dirt"
	line "on your nails - "
	
	para "show me, what"
	line "is your vision?"

	done

EG_AdrinnaText2:
	text "For entertaining"
	line "me, I offer a"
	cont "gift."
	
	para "Please accept"
	line "it: I found it"
	cont "on the ground"
	cont "near the towers."
	done

EG_AdrinnaText3:
	text "Now, please"
	line "relax, maybe on"
	cont "the beaches"
	cont "west of here."
	done


EG_SeedBombMT:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_SEED_BOMB_INTRO
	iftrue EG_TutorSeedBombScript
	writetext Text_SeedBombIntro
	waitbutton
	setevent EVENT_LISTENED_TO_SEED_BOMB_INTRO
EG_TutorSeedBombScript:
	writetext Text_EG_TutorSeedBomb ;;
	waitbutton
	checkitem SILVER_LEAF
	iffalse .NoSilverLeaf
	writetext Text_EG_TutorQuestion ;;
	yesorno
	iffalse .TutorRefused
	setval SEED_BOMB
	writetext ClearText
	special Special_MoveTutor
	ifequal $0, .TeachMove
.TutorRefused
	jumpopenedtext Text_EG_TutorRefused ;; 

.NoSilverLeaf
	jumpopenedtext Text_EG_TutorNoSilverLeaf

.TeachMove
	takeitem SILVER_LEAF
	jumpopenedtext Text_EG_TutorTaught ;;
	
Text_SeedBombIntro:
	text "Whoa, you almost"
	line "blew me up!"
	
	para "Don't you see"
	line "the spicy seeds"
	cont "in my hands?"
	
	para "When Bobesh asked"
	line "me to make some"
	cont "SEED BOMBs for"
	cont "the army,"
	
	para "I knew just what"
	line "to do."
	
	para "These seeds will"
	line "turn enemies into"
	cont "ghosts!"
	done
	
Text_EG_TutorSeedBomb:
	text "Grass #mon"
	line "use SEED BOMBs"
	cont "in combat."
	done

Text_EG_TutorQuestion:
	text "I could make"
	line "your #mon"
	para "seasoned in"
	line "combat, for a"
	cont "Silver Leaf."
	done

Text_EG_TutorNoSilverLeaf:
	text "Oh, no Silver"
	line "Leaf? This isn't"
	cont "a charity!"
	done

Text_EG_TutorRefused:
	text "Not everyone can"
	line "handle the heat."
	done

Text_EG_TutorTaught:
	text "There! Now you"
	line "can used SEED"
	cont "BOMBs like me!"
	done
