KurtsHouse_MapScriptHeader: ; model after players house 1f. Check PlayersHouse2F.asm for debug script. You spawn at 7, 1
	def_scene_scripts

	def_callbacks


	def_warp_events
	warp_event  3,  7, AZALEA_TOWN, 4
	warp_event  4,  7, AZALEA_TOWN, 4
	warp_event 15,  4, TINDER_GARDEN, 1
	warp_event 15,  5, TINDER_GARDEN, 2

	def_coord_events
	coord_event 7, 2, 0, KurtTrigger1 ; you have to hit this square due to where the slowpoke is

	def_bg_events;done
	bg_event  6,  1, BGEVENT_JUMPSTD, radio2
	bg_event  8,  0, BGEVENT_JUMPTEXT, KurtsHouseOakPhotoText ;revised
	bg_event  9,  0, BGEVENT_JUMPTEXT, KurtsHouseOakPhotoText ;revised
	bg_event  5,  1, BGEVENT_READ, PokemonJournalProfWestwoodScript ; revised
	bg_event  2,  1, BGEVENT_READ, PokemonJournalProfWestwoodScript
	bg_event  3,  1, BGEVENT_READ, PokemonJournalProfWestwoodScript
	bg_event  4,  1, BGEVENT_JUMPTEXT, KurtsHouseCelebiStatueText

	def_object_events
	pokemon_event  8,  1, SLOWPOKE, -1, -1, PAL_NPC_RED, KurtsHouseSlowpokeText, EVENT_KURTS_HOUSE_SLOWPOKE
	object_event  6,  3, SPRITE_KURT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KurtScript, EVENT_KURTS_HOUSE_KURT_0 ; 
;	object_event  3,  2, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Kurt1, EVENT_KURTS_HOUSE_KURT_1 ; from clean version
; kurt is at the celebi shrine if you visit later

	object_const_def
	const KURTSHOUSE_KURT
	
KurtTrigger1: ; when you walk to 7, 2
	playmusic MUSIC_PROF_OAK
	turnobject KURTSHOUSE_KURT, UP
	applymovement KURTSHOUSE_KURT, .kurt_walks_to_you
	sjump KurtEventScript

.kurt_walks_to_you:
	step_up
	turn_head_right
	step_end

KurtEventScript:
	opentext
	writetext KurtIntroText
	promptbutton
	getstring GearName, $1
	callstd receiveitem
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	addcellnum PHONE_MOM
	setscene $1
	setevent EVENT_KURTS_HOUSE_KURT_0 ; changed from mom
	clearevent EVENT_PLAYERS_HOUSE_MOM_2 ; may not need this line? 
	writetext MomPokegearText
	promptbutton
	special Special_SetDayOfWeek
.InitialSetDSTFlag:
	writetext MomDSTText
	yesorno
	iffalse .NotDST
	special Special_InitialSetDSTFlag
	yesorno
	iffalse .InitialSetDSTFlag
	sjump .InitializedDSTFlag
.NotDST:
	special Special_InitialClearDSTFlag
	yesorno
	iffalse .InitialSetDSTFlag
.InitializedDSTFlag:
	writetext MomRunningShoesText
	yesorno
	iftrue .NoInstructions
	writetext MomInstructionsText
	promptbutton
.NoInstructions:
	writetext MomOutroText
	waitbutton
	closetext
	applymovement KURTSHOUSE_KURT, .kurt_walks_back
	special RestartMapMusic
	end

.kurt_walks_back:
	step_down
	turn_head_right
	step_end

KurtIntroText: ; TODO
	text "Oh, <PLAYER>!"
	line "You're awake."

	para "Your friend Lyra"
	line "was just here."

	para "She said that our"
	line "neighbor, Prof."

	para "Elm, was looking"
	line "for you."

	para "Oh! I almost for-"
	line "got! Your #mon"

	para "Gear is back from"
	line "the repair shop."

	para "Here you go!"
	done

MomPokegearText:
	text "#mon Gear, or"
	line "just #gear."

	para "It's essential if"
	line "you want to be a"
	cont "good trainer."

	para "Oh, the day of the"
	line "week isn't set."

	para "You mustn't forget"
	line "that!"
	done

MomDSTText:
	text "Is it Daylight"
	line "Saving Time now?"
	done

GearName:
	db "#gear@"

MomRunningShoesText:
	text "Come home to"
	line "adjust your clock"

	para "for Daylight"
	line "Saving Time."

	para "By the way, do"
	line "you know how to"

	para "use your new"
	line "Running Shoes?"
	done

MomInstructionsText:
	text "I'll read the"
	line "instructions."

	para "Just hold down the"
	line "B Button to run,"
	cont "indoors or out."

	para "Or use the Option"
	line "to always run, and"
	cont "hold B to walk."
	done

MomOutroText:
	text "Gee, aren't they"
	line "convenient?"
	done


KurtScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_A_POKEMON
	iftrue_jumpopenedtext KurtNeedsAlphText
	jumpthisopenedtext

	text "Where is the "
	line "charcoal family?"
	done

KurtNeedsAlphText:
	text "I need samples"
	line "from the Ruins"
	cont "of Alph."
	
	para "Can you get"
	line "the UNOWN"
	cont "Report for me?"
	done
	
KurtsHouseSlowpokeText:
	text "Slowpoke: …"
	line "Yawn?"
	done
PokemonJournalProfWestwoodScript:
	setflag ENGINE_READ_PROF_WESTWOOD_JOURNAL ; revised this? 
	jumpthistext

	text "Apricorn Journal"

	para "What else can"
	line "be used like"
	cont "Apricorns?"
	
	para "Maybe hollow"
	line "rocks like a"
	cont "geode could be"
	
	para "used to catch"
	line "rock types."
	done

KurtsHouseOakPhotoText:
	text "It's Grandpa,"
	line "Dad, and a"
	cont "happy Snubbull."
	done

KurtsHouseCelebiStatueText:
	text "It's a statue of"
	line "the forest's pro-"
	cont "tector."
	done
