RadioTower4F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 12,  0, RADIO_TOWER_5F, 2
	warp_event 17,  0, RADIO_TOWER_3F, 3

	def_coord_events

	def_bg_events
	bg_event 15,  0, BGEVENT_JUMPTEXT, RadioTower4FStudio2SignText

	def_object_events
    object_event 14,  2, SPRITE_LANNA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, RadioTower4FLannaScript, EVENT_BEAT_WHITNEY


RadioTower4FProductionSignText:
	text "4F Production"
	done

RadioTower4FStudio2SignText:
	text "4F Studio 2"
	done


RadioTower4FLannaScript:
    faceplayer
    opentext
    writetext RadioTower4FLannaHealText
    waitbutton
    closetext
    special HealParty
    opentext
    writetext RadioTower4FLannaRemindText
    waitbutton
    closetext
    end

RadioTower4FLannaHealText:
    text "Lanna: <PLAYER>!"
    line "You made it. Let"
    cont "me heal your"
    cont "#mon."
    done

RadioTower4FLannaRemindText:
    text "We're almost to"
    line "the top floor."
    para "There, you will"
	line "see a fire exit"
    line "that leads"
    cont "to the Magnet"
    cont "Train tracks."
    para "That might be your"
    line "way to Ecruteak."
    para "Be careful, and"
    line "good luck!"
    done
