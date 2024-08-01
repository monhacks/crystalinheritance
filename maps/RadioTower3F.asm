RadioTower3F_MapScriptHeader:
	def_scene_scripts

	def_callbacks


	def_warp_events
	warp_event  0,  0, RADIO_TOWER_2F, 1
	warp_event  7,  0, RADIO_TOWER_4F, 2
	warp_event 17,  0, RADIO_TOWER_4F, 4

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_JUMPTEXT, RadioTower3FPersonnelSignText
	bg_event  9,  0, BGEVENT_JUMPTEXT, RadioTower3FPokemonMusicSignText
	bg_event 14,  2, BGEVENT_UP, CardKeySlotScript

	def_object_events




CardKeySlotScript::
	opentext
	writetext RadioTower3FCardKeySlotText
	waitbutton
;	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
;	iftrue .UsedCardKey
;	checkkeyitem CARD_KEY
;	iftrue .HaveCardKey
;.UsedCardKey:
	endtext

RadioTower3FSuperNerdText:
	text "We have recordings"
	line "of the cries of"

	para "all #mon that"
	line "have been found."

	para "We must have about"
	line "200 kinds."
	done

RadioTower3FCardKeySlotText:
	text "It's the Card Key"
	line "slot."
	done

InsertedTheCardKeyText:
	text "<PLAYER> inserted"
	line "the Card Key."
	done

RadioTower3FPersonnelSignText:
	text "3F Personnel"
	done

RadioTower3FPokemonMusicSignText:
	text "#mon Music with"
	line "Host DJ Ben"
	done
