SproutTower1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7, 15, VIOLET_CITY, 7
	warp_event  8, 15, VIOLET_CITY, 7
	warp_event  4,  4, SPROUT_TOWER_2F, 1


	def_coord_events

	def_bg_events
	bg_event  5, 15, BGEVENT_JUMPTEXT, SproutTower1FStatueText
	bg_event 10, 15, BGEVENT_JUMPTEXT, SproutTower1FStatueText

	def_object_events
	object_event  5, 12, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBirdKeeperRod, -1
	object_event  10, 12, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSageAbe, -1



SproutTower1FStatueText:
	text "A #mon statue…"

	para "It looks very"
	line "distinguished."
	done

GenericTrainerBirdKeeperRod:
    generictrainer BIRD_KEEPER, ROD, EVENT_BEAT_BIRD_KEEPER_ROD, BirdKeeperRodSeenText, BirdKeeperRodBeatenText

    text "I feel like I"
    line "could fly from up"
    cont "here."
    done

GenericTrainerBirdKeeperAbe:
    generictrainer BIRD_KEEPER, ABE, EVENT_BEAT_BIRD_KEEPER_ABE, BirdKeeperAbeSeenText, BirdKeeperAbeBeatenText

    text "It's hard to have"
    line "more fun than"
    cont "flying."
    done

BirdKeeperRodSeenText:
    text "Can we get much"
    line "higher?"
    done

BirdKeeperRodBeatenText:
    text "Can't get any"
    line "lower."
    done

BirdKeeperAbeSeenText:
    text "It's exhilarating"
    line "to fly on a bird"
    cont "#mon!"
    done

BirdKeeperAbeBeatenText:
    text "What a thrill!"
    done
