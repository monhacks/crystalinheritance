UndergroundRadioTower_MapScriptHeader:
    def_scene_scripts

    def_callbacks

    def_warp_events
    ; Add warp events here

    def_coord_events

    def_bg_events

    def_object_events
    object_event  5,  5, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBirdKeeperVance1, EVENT_FOUGHT_RADIO_TOWER_RIVAL
    object_event 10,  8, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBlackbeltKenji, EVENT_FOUGHT_RADIO_TOWER_RIVAL
    object_event 15,  7, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerBeautySamantha, EVENT_FOUGHT_RADIO_TOWER_RIVAL
    object_event  8, 12, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerBeautyCassie, EVENT_FOUGHT_RADIO_TOWER_RIVAL
    object_event 18, 10, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerBeautyJulia, EVENT_FOUGHT_RADIO_TOWER_RIVAL
    object_event 20, 15, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, UndergroundRadioTowerLannaScript, EVENT_FOUGHT_RADIO_TOWER_RIVAL

	const_def
	CONST_UNDERGROUND_LANNA
	
TrainerBirdKeeperVance1:
    trainer BIRD_KEEPER, VANCE1, EVENT_BEAT_BIRD_KEEPER_VANCE1, BirdKeeperVance1SeenText, BirdKeeperVance1BeatenText, 0, .Script

.Script:
    endifjustbattled
    opentext
    writetext BirdKeeperVance1AfterText
    waitbutton
    closetext
    end

TrainerBlackbeltKenji:
    trainer BLACKBELT_T, KENJI, EVENT_BEAT_BLACKBELT_KENJI, BlackbeltKenjiSeenText, BlackbeltKenjiBeatenText, 0, .Script

.Script:
    endifjustbattled
    opentext
    writetext BlackbeltKenjiAfterText
    waitbutton
    closetext
    end

TrainerBeautySamantha:
    trainer BEAUTY, SAMANTHA, EVENT_BEAT_BEAUTY_SAMANTHA, BeautySamanthaSeenText, BeautySamanthaBeatenText, 0, .Script

.Script:
    endifjustbattled
    opentext
    writetext BeautySamanthaAfterText
    waitbutton
    closetext
    end

TrainerBeautyCassie:
    trainer BEAUTY, CASSIE, EVENT_BEAT_BEAUTY_CASSIE, BeautyCassieSeenText, BeautyCassieBeatenText, 0, .Script

.Script:
    endifjustbattled
    opentext
    writetext BeautyCassieAfterText
    waitbutton
    closetext
    end

TrainerBeautyJulia:
    trainer BEAUTY, JULIA, EVENT_BEAT_BEAUTY_JULIA, BeautyJuliaSeenText, BeautyJuliaBeatenText, 0, .Script

.Script:
    endifjustbattled
    opentext
    writetext BeautyJuliaAfterText
    waitbutton
    closetext
    end

UndergroundRadioTowerLannaScript:
    faceplayer
    opentext
    writetext LannaThankYouText
    special HealParty
    playsound SFX_FULL_HEAL
    waitsfx
    writetext LannaAfterHealText
    yesorno
    iffalse .NotReady
    writetext LannaReadyText
    promptbutton
    verbosegivetmhm HM_FLY
    iffalse .NoRoom
    setevent EVENT_GOT_FLY_LANNA
	setevent EVENT_RIVAL_RADIO_TOWER
    writetext LannaAfterFlyText
    waitbutton
    closetext
	applymovement CONST_UNDERGROUND_LANNA, UndergroundLannaMoves
    end
	
.NotReady
    writetext LannaNotReadyText
    waitbutton
    closetext
    end
.NoRoom
    writetext LannaNoRoomText
    waitbutton
    closetext
    end

BirdKeeperVance1SeenText:
    text "We're fighting for"
    line "fair competition!"
    done

BirdKeeperVance1BeatenText:
    text "Silph creates new"
    line "tech, but you need"
    cont "their whole system"
    para "Take the flower"
    line "shop: they own it"
    cont "all! Is Silph that"
    cont "much better than"
    cont "Gloria?"
    done

BirdKeeperVance1AfterText:
    text "Silph creates new"
    line "tech, but you need"
    cont "their whole system"
    para "Take the flower"
    line "shop: they own it"
    cont "all! Is Silph that"
    cont "much better than"
    cont "Gloria?"
    done

BlackbeltKenjiSeenText:
    text "We'll make our"
    line "voices heard!"
    done

BlackbeltKenjiBeatenText:
    text "Whitney and Silph"
    line "have all channels."
    para "How's it free"
    line "speech when no one"
    cont "else can talk?"
    done

BlackbeltKenjiAfterText:
    text "Whitney and Silph"
    line "have all channels."
    para "How's it free"
    line "speech when no one"
    cont "else can talk?"
    done

BeautySamanthaSeenText:
    text "I tried to follow"
    line "Whitney's advice."
    done

BeautySamanthaBeatenText:
    text "Why am I here? I"
    line "tried to 'roll in"
    cont "not roll out'."
    para "But I can't do all"
    line "Whitney does, I"
    cont "lack her resources"
    done

BeautySamanthaAfterText:
    text "Why am I here? I"
    line "tried to 'roll in"
    cont "not roll out'."
    para "But I can't do all"
    line "Whitney does, I"
    cont "lack her resources"
    done

BeautyCassieSeenText:
    text "Cute #mon need"
    line "fair chances too!"
    done

BeautyCassieBeatenText:
    text "Whitney says she's"
    line "helping cute mon,"
    para "but one trainer"
    line "isn't enough to"
    cont "protect them all."
    done

BeautyCassieAfterText:
    text "Whitney says she's"
    line "helping cute mon,"
    para "but one trainer"
    line "isn't enough to"
    cont "protect them all."
    done

BeautyJuliaSeenText:
    text "This tunnel has"
    line "quite a history."
    done

BeautyJuliaBeatenText:
    text "This tunnel was"
    line "found recently."
    para "It was a waterway,"
    line "now dry from the"
    cont "drought."
    done

BeautyJuliaAfterText:
    text "This tunnel was"
    line "found recently."
    para "It was a waterway,"
    line "now dry from the"
    cont "drought."
    done

LannaThankYouText:
    text "Lanna: <PLAYER>,"
    line "thank you for"
    cont "coming."
    para "I see you helped"
    line "our members get"
    cont "stronger."
    para "Let me heal your"
    line "#mon."
    done

LannaAfterHealText:
    text "Whitney was once"
    line "good, but now just"
    cont "cares that she"
	cont "stays on top."
    para "Too many follow"
    line "her blindly. We"
    cont "must act."
    para "We'll shut off the"
    line "Radio Tower power."
    para "When power's down,"
    line "sneak onto tracks"
	cont "from the roof of"
	cont "the Radio Tower."
    para "Are you ready?"
    done



LannaNotReadyText:
    text "OK. Let me know if"
    line "you change your"
    cont "mind."
    done
	

LannaReadyText:
    text "Thank you. This"
    line "ladder leads to"
    cont "the radio tower."
    para "Climb to the roof,"
    line "then hop onto the"
    cont "train tracks."
    para "Watch for guards."
    line "We'll work on"
    cont "taking her show"
    cont "off the air..."
    done

LannaAfterFlyText:
    text "This HM will help"
    line "you escape if"
    cont "things get dicey."
    para "Good luck,"
    line "<PLAYER>."
    done

LannaNoRoomText:
    text "Oh! Your pack is"
    line "full. Make some"
    cont "room and come"
    cont "back for this HM."
    done