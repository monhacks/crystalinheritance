TrainerClassDVsAndPersonality:
; entries correspond to trainer classes (see constants/trainer_constants.asm)
	table_width 6, TrainerClassDVsAndPersonality
	;  EVs  HP   Def  SAt  Ability  Gender
	;  *    Atk  Spd  SDf  Nature   Form
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, FEMALE ; carrie
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; cal
	db  48, $BB, $BB, $BB, ABILITY_1 | QUIRKY, MALE   ; falkner
	db  48, $BB, $BB, $BB, ABILITY_1 | QUIRKY, MALE   ; bugsy
	db  48, $CC, $CC, $CC, ABILITY_1 | QUIRKY, FEMALE ; whitney
	db  48, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE   ; morty
	db  48, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; chuck
	db  48, $DD, $DD, $DD, ABILITY_1 | QUIRKY, FEMALE ; jasmine
	db  48, $EE, $EE, $EE, ABILITY_1 | QUIRKY, MALE   ; pryce
	db  48, $EE, $EE, $EE, ABILITY_1 | QUIRKY, FEMALE ; clair
	db  64, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; KURT
	db  64, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; MEJIMI
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; bruno
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, FEMALE ; karen-SANDRA
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; champion
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; brock
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, FEMALE  ; Samsara
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; lt surge
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, FEMALE ; erika
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, FEMALE ; janine
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, FEMALE ; sabrina
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; Hollis
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; blue
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; red
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, FEMALE ; leaf
	db   0, $66, $66, $66, ABILITY_1 | QUIRKY, MALE   ; rival0
	db  24, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; rival1
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; rival2
	db   0, $BB, $BB, $BB, ABILITY_1 | QUIRKY, FEMALE ; lyra1
	db  48, $BB, $BB, $BB, ABILITY_1 | QUIRKY, FEMALE ; lyra2
	db   0, $66, $66, $66, ABILITY_1 | QUIRKY, MALE   ; youngster
	db   0, $66, $66, $66, ABILITY_1 | QUIRKY, MALE   ; bug catcher
	db   8, $77, $77, $77, ABILITY_1 | QUIRKY, MALE   ; camper
	db   8, $77, $77, $77, ABILITY_1 | QUIRKY, FEMALE ; picnicker
	db  16, $88, $88, $88, ABILITY_1 | QUIRKY, FEMALE ; twins
	db  16, $88, $88, $88, ABILITY_1 | QUIRKY, MALE   ; fisher
	db  16, $88, $88, $88, ABILITY_1 | QUIRKY, MALE   ; bird keeper
	db  24, $99, $99, $99, ABILITY_1 | QUIRKY, MALE   ; hiker
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; Brigader
	db  32, $AA, $AA, $AA, ABILITY_1 | QUIRKY, FEMALE ; gruntf
	db  32, $AA, $AA, $AA, ABILITY_1 | QUIRKY, MALE   ; pokefanm
	db  32, $AA, $AA, $AA, ABILITY_1 | QUIRKY, FEMALE ; pokefanf
	db  48, $DD, $BB, $DB, ABILITY_1 | QUIRKY, MALE   ; officerm
	db  48, $7B, $DB, $FF, ABILITY_1 | QUIRKY, FEMALE ; officerf
	db  48, $E5, $FA, $D6, ABILITY_1 | QUIRKY, FEMALE ; nurse
	db  40, $BB, $BB, $BB, ABILITY_1 | QUIRKY, MALE   ; pokemaniac
	db  40, $BB, $BB, $BB, ABILITY_1 | QUIRKY, FEMALE ; cosplayer
	db  40, $BB, $BB, $BB, ABILITY_1 | QUIRKY, MALE   ; super nerd
	db  40, $BB, $BB, $BB, ABILITY_1 | QUIRKY, FEMALE ; lass
	db  48, $CC, $CC, $CC, ABILITY_1 | QUIRKY, FEMALE ; beauty
	db  48, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE   ; bug maniac
	db  48, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE   ; ruin maniac
	db  48, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE   ; firebreather
	db  48, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE   ; juggler
	db  48, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE   ; schoolboy
	db  48, $CC, $CC, $CC, ABILITY_1 | QUIRKY, FEMALE ; schoolgirl
	db  48, $AA, $CC, $EE, ABILITY_1 | QUIRKY, MALE   ; psychic
	db  48, $AA, $CC, $EE, ABILITY_1 | QUIRKY, FEMALE ; hex maniac
	db  48, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE   ; sage
	db  48, $CC, $CC, $CC, ABILITY_1 | QUIRKY, FEMALE ; medium
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, FEMALE ; kimono girl 1
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, FEMALE ; kimono girl 2
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, FEMALE ; kimono girl 3
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, FEMALE ; kimono girl 4
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, FEMALE ; kimono girl 5
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; elder
	db  48, $CC, $CC, $CC, ABILITY_1 | QUIRKY, FEMALE ; sr&jr
	db  48, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE   ; couple
	db  48, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE   ; gentleman
	db  20, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE   ; rich boy (high EVs from vitamins)
	db  48, $CC, $CC, $CC, ABILITY_1 | QUIRKY, FEMALE ; lady
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, FEMALE ; breeder (low EVs due to breeding)
	db  48, $CC, $CC, $CC, ABILITY_1 | QUIRKY, FEMALE ; baker
	db  48, $CC, $CC, $CC, ABILITY_1 | QUIRKY, FEMALE ; cowgirl
	db  48, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE   ; sailor
	db  48, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE   ; swimmerm
	db  48, $CC, $CC, $CC, ABILITY_1 | QUIRKY, FEMALE ; swimmerf
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; burglar
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; pi
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; scientist
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; rocket scientist
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; boarder
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, FEMALE ; skier
	db  32, $FF, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; blackbelt
	db  32, $FF, $DD, $DD, ABILITY_1 | QUIRKY, FEMALE ; battle girl
	db  36, $DF, $DF, $DD, ABILITY_1 | QUIRKY, MALE   ; dragon tamer
	db  36, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; engineer
	db  36, $DD, $DD, $DD, ABILITY_1 | QUIRKY, FEMALE ; teacher
	db  36, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; guitaristm
	db  36, $DD, $DD, $DD, ABILITY_1 | QUIRKY, FEMALE ; guitaristf
	db  36, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; biker
	db  36, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; roughneck
	db  36, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; tamer
	db  36, $DD, $DD, $DD, ABILITY_1 | QUIRKY, FEMALE ; artist
	db  36, $DD, $DD, $DD, ABILITY_1 | QUIRKY, FEMALE ; aroma lady
	db  36, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; waiter
	db  36, $DD, $DD, $DD, ABILITY_1 | QUIRKY, FEMALE ; waitress
	db  36, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; sightseerm
	db  36, $DD, $DD, $DD, ABILITY_1 | QUIRKY, FEMALE ; sightseerf
	db  36, $EE, $EE, $EE, ABILITY_1 | QUIRKY, MALE   ; sightseers
	db  32, $EE, $EE, $EE, ABILITY_1 | QUIRKY, MALE   ; cooltrainerm
	db  32, $EE, $EE, $EE, ABILITY_1 | QUIRKY, FEMALE ; cooltrainerf
	db  36, $EE, $EE, $EE, ABILITY_1 | QUIRKY, MALE   ; ace duo
	db  40, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; veteranm
	db  40, PERFECT_DVS,   ABILITY_1 | QUIRKY, FEMALE ; veteranf
	db  80, $BB, $BB, $BB, ABILITY_1 | QUIRKY, MALE   ; proton
	db  48, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE   ; petrel
	db  40, $EE, $EE, $EE, ABILITY_1 | QUIRKY, MALE   ; archer
	db  40, $DD, $DD, $DD, ABILITY_1 | QUIRKY, FEMALE ; ariana
	db  20, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; giovanni
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; prof oak
	db   8, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE   ; prof elm
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, FEMALE ; prof ivy
	db  88, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; mysticalman
	db  88, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; karate king
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; towertycoon-OSTENE
	db  88, $BB, $B8, $BB, ABILITY_1 | QUIRKY, MALE   ; jessie&james
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, FEMALE ; lorelei
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, FEMALE ; agatha
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; steven
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, FEMALE ; cynthia
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; inver/AMOS
	db  30, $EE, $EE, $EE, ABILITY_1 | QUIRKY, FEMALE ; cheryl
	db  30, $EE, $EE, $EE, ABILITY_1 | QUIRKY, MALE   ; riley
	db  30, $EE, $EE, $EE, ABILITY_1 | QUIRKY, MALE   ; buck
	db  30, $EE, $EE, $EE, ABILITY_1 | QUIRKY, FEMALE ; marley
	db  30, $EE, $EE, $EE, ABILITY_1 | QUIRKY, FEMALE ; mira
	db  30, $EE, $EE, $EE, ABILITY_1 | QUIRKY, FEMALE ; anabel-LANNA
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; darach
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, FEMALE ; caitlin
	db  48, PERFECT_DVS,   ABILITY_1 | LONELY, FEMALE ; candela/BOBESH
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, FEMALE ; blanche/ADRINNA
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; spark/BOBESH
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, FEMALE ; flannery
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, FEMALE ; maylene/KANNA
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, FEMALE ; skyla
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, FEMALE ; valerie
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; kukui
	db  30, $EE, $EE, $EE, ABILITY_1 | QUIRKY, MALE   ; victor
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; bill
	db  12, $EE, $EE, $EE, ABILITY_1 | QUIRKY, FEMALE ; yellow/TAMMY
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; silver
	db  30, $EE, $EE, $EE, ABILITY_1 | QUIRKY, MALE   ; imakuni
	db  48, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; lawrence/KENSEY
	db  48, $EE, $EE, $EE, ABILITY_1 | QUIRKY, FEMALE ; rei






	assert_table_length NUM_TRAINER_CLASSES
