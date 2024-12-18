TinTowerRoof_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, TinTowerRoofHoOh

	def_warp_events
	warp_event  7, 13, TIN_TOWER_10F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7,  3, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, HO_OH, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TinTowerHoOh, EVENT_TIN_TOWER_ROOF_HO_OH
	object_event  7,  4, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTowerRoofSilverScript, EVENT_BEAT_SILVER

	object_const_def
	const TINTOWERROOF_HO_OH
	const TINTOWERROOF_SILVER

TinTowerRoofHoOh:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .NoAppear
	checkkeyitem RAINBOW_WING
	iftrue .Appear
	sjump .NoAppear

.Appear:
	appear TINTOWERROOF_HO_OH
	endcallback

.NoAppear:
	disappear TINTOWERROOF_HO_OH
	endcallback

TinTowerHoOh:
	faceplayer
	opentext
	writetext HoOhText
	cry HO_OH
	pause 15
	closetext
	setevent EVENT_FOUGHT_HO_OH
	loadvar VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	loadwildmon HO_OH, 50
	startbattle
	disappear TINTOWERROOF_HO_OH
	reloadmapafterbattle
	setevent EVENT_SET_WHEN_FOUGHT_HO_OH
	end

HoOhText:
	text "Shaoooh!"
	done

TinTowerRoofSilverScript:
	faceplayer
	showtext TinTowerRoofSilverIntroText
	setlasttalked TINTOWERROOF_SILVER
	winlosstext SilverWinText, 0
	loadtrainer SILVER, 1 
	startbattle
	dontrestartmapmusic
	reloadmap	
	showtext SilverAfterBattleText
	clearevent EVENT_TIN_TOWER_ROOF_HO_OH
	appear TINTOWERROOF_HO_OH
	showtext SilverLeavesRoofText
	applyonemovement TINTOWERROOF_SILVER, teleport_from
	disappear TINTOWERROOF_SILVER
	setevent EVENT_BEAT_SILVER
	end

TinTowerRoofSilverIntroText:
	text "Look at those be-"
	line "autiful fabrics"
	cont "given to you."
	
	para "I was wrapped in"
	line "spite and malice."
	
	para "I fled, but I co-"
	line "uldn't stop myse-"
	cont "lf draping my"
	para "#mon in the"
	line "same bitter thr-"
	cont "eads I knew."
	
	para "But one day, I"
	line "saw the pain in"
	para "their bloodshot"
	line "eyes, a long red"
	cont "tapestry of our"
	cont "collective abuse."
	
	para "I wept. My tears"
	line "washed it clean."
	para "I gave them love,"
	line "and they gave me"
	cont "a second chance"
	cont "at life."
	
	para "My travels brou-"
	line "ght me to Ho-Oh."
	para "It saw my heart"
	line "had been reborn."
	
	para "Do you think you"
	line "are worthy of its"
	para "presence? Battle"
	line "me, let's see!"
	done

	
SilverWinText:
	text "You are deserv-"
	line "ing of those"
	cont "robes."
	done
	
SilverAfterBattleText:
	text "I claim no owner-"
	line "ship of Ho-Oh."
	
	para "I've learned all"
	line "I need to."
	
	para "Now, it is your"
	line "turn. Perhaps our"
	cont "stories will"
	cont "interweave again."
	done
	
