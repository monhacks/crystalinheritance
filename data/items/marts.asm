Marts: 
	table_width 2, Marts
	dw CherrygroveMart ; unused
	dw CherrygroveMartAfterDex ; unused
	dw VioletMart
	dw AzaleaMart
	dw Goldenrod2FMart1
	dw Goldenrod2FMart2
	dw Goldenrod2FMart2Eevee
	dw Goldenrod3FMart
	dw Goldenrod4FMart
	dw Goldenrod5FTMMart
	dw GoldenrodBallsMart
	dw UndergroundMart
	dw EcruteakMart
	dw OlivineMart
	dw WesternCapitalMonMart
	dw WesternCapitalPrepMart ; unused
	dw MahoganyMart1 ; unused
	dw MahoganyMart2
	dw BlackthornMart ; unused
	dw TradersLandingMart
	dw AnarresMart
	dw GauldenrodMart1
	dw GauldenrodMart2 ; BERRIES
	dw GauldenrodMart3
	dw WesternCapitalMart
	dw WesternCapitalMart_TM
	dw TradersLandingMart
	dw TradersLandingMart_Items
	dw SinjohCrossroadsMart
	dw EerieHamletMart
	dw WesternCapitalMart2
	dw Celadon5FMart2 ; unused
	dw EcruteakBattleMart
	dw OlivineBattleMart
	dw SinjohCrossroadsMonMart ; unused
	dw GauldenrodTMMart ; unused
	dw ShamoutiMart2 ; unused
	dw BattleTowerMart1 ; unused
	dw BattleTowerMart2 ; unused
	dw BattleTowerMart3 ; unused
	assert_table_length NUM_MARTS

CherrygroveMart:
	db 1 ; # items
	db POTION
	db -1

CherrygroveMartAfterDex:
	db 1 ; # items
	db POTION
	db -1
	
BlackthornMart:
	db 1 ; # items
	db POTION
	db -1

VioletMart:
	db 10 ; # items
	db POKE_BALL
	db REPEAT_BALL
	db MAX_REPEL
	db ESCAPE_ROPE
	db ANTIDOTE
	db PARALYZEHEAL
	db AWAKENING
	db X_ATTACK
	db X_DEFEND
	db X_SPEED
	db -1

AzaleaMart: ;updated
	db 10 ; # items
	db RARE_CANDY
	db MAX_REPEL
	db POTION
	db POKE_BALL
	db NET_BALL
	db ESCAPE_ROPE
	db ANTIDOTE
	db SMOKE_BALL
	db SILVER_LEAF
	db CHARCOAL
	db -1

Goldenrod2FMart1:
	db 9 ; # items
	db RARE_CANDY
	db SUPER_POTION
	db ANTIDOTE
	db PARALYZEHEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db FULL_HEAL
	db REVIVE
	db -1

Goldenrod2FMart2:
	db 8 ; # items
	db POKE_BALL
	db GREAT_BALL
	db LUXURY_BALL
	db TIMER_BALL
	db QUICK_BALL
	db ESCAPE_ROPE
	db MAX_REPEL
	db POKE_DOLL
	db -1

Goldenrod2FMart2Eevee:
	db 8 ; # items
	db POKE_BALL
	db GREAT_BALL
	db LUXURY_BALL
	db TIMER_BALL
	db QUICK_BALL
	db ESCAPE_ROPE
	db MAX_REPEL
	db POKE_DOLL
	db -1

Goldenrod3FMart:
Celadon5FMart2:
	db 10 ; # items
	db FIRE_STONE
	db WATER_STONE
	db THUNDERSTONE
	db LEAF_STONE
	db MOON_STONE
	db SUN_STONE
	db ICE_STONE
	db DUSK_STONE
	db SHINY_STONE
	db UP_GRADE
	db -1

Goldenrod4FMart:
Celadon5FMart1:
	db 6 ; # items
	db PROTEIN
	db IRON
	db CARBOS
	db CALCIUM
	db ZINC
	db HP_UP
	db -1

Goldenrod5FTMMart:
	db 8 ; # items
	dbw TM_PROTECT,       10000
	dbw TM_REFLECT,       10000
	dbw TM_LIGHT_SCREEN,  10000
	dbw TM_SOLAR_BEAM,    25000
	dbw TM_THUNDER,       30000
	dbw TM_FIRE_BLAST,    30000
	dbw TM_BLIZZARD,      30000
	dbw TM_HYPER_BEAM,    50000
	db -1

GoldenrodBallsMart:
	db 7 ; # items
	db REPEAT_BALL
	db NET_BALL
	db LUXURY_BALL
	db HEAL_BALL
	db QUICK_BALL
	db DUSK_BALL
	db DREAM_BALL
	db -1

UndergroundMart:
	db 7 ; # items
	db MACHO_BRACE
	db POWER_WEIGHT
	db POWER_BRACER
	db POWER_BELT
	db POWER_LENS
	db POWER_BAND
	db POWER_ANKLET
	db -1

EcruteakMart:
	db 11 ; # items
	db POKE_BALL
	db GREAT_BALL
	db NEST_BALL
	db RARE_CANDY
	db SUPER_POTION
	db ANTIDOTE
	db PARALYZEHEAL
	db AWAKENING
	db BURN_HEAL
	db MAX_REPEL
	db REVIVE
	db -1

OlivineMart:
	db 10 ; # items
	db GREAT_BALL
	db DIVE_BALL
	db SUPER_POTION
	db HYPER_POTION
	db ANTIDOTE
	db PARALYZEHEAL
	db AWAKENING
	db ABILITY_CAP 
	db MAX_REPEL
	db RARE_CANDY
	db -1

WesternCapitalMonMart:
	db 6 ; # items
	db PROTECTOR
	db ELECTIRIZER
	db MAGMARIZER
	db RAZOR_FANG
	db RAZOR_CLAW
	db METAL_COAT
	db -1

WesternCapitalPrepMart:
	db 7 ; # items
	db FULL_RESTORE
	db FULL_HEAL
	db MAX_POTION
	db REVIVE
	db ULTRA_BALL
	db MAX_ELIXIR
	db RARE_CANDY
	db PP_MAX	
	db -1

MahoganyMart1:
	db 1 ; # items
	db POTION
	db -1

WesternCapitalMart:
	db 10 ; # items
	db RAGECANDYBAR
	db AIR_BALLOON
	db QUICK_CLAW
	db KINGS_ROCK
	db GREAT_BALL
	db SUPER_POTION
	db HYPER_POTION
	db MAX_REPEL
	db REVIVE
	db RARE_CANDY
	db -1

WesternCapitalMart_TM:
	db 10 ; # items
	db GREAT_BALL
	db ULTRA_BALL
	db DUSK_BALL
	db HYPER_POTION
	db MAX_POTION
	db FULL_HEAL
	db REVIVE
	db MAX_REPEL
	db X_DEFEND
	db X_ATTACK
	db -1

TradersLandingMart:
	db 7 ; # items
	db ULTRA_BALL
	db MAX_REPEL
	db HYPER_POTION
	db MAX_POTION
	db FULL_RESTORE
	db REVIVE
	db FULL_HEAL
	db -1

AnarresMart:
	db 10 ; # items
	db RARE_CANDY
	db MAX_REPEL
	db CHERI_BERRY
	db CHESTO_BERRY
	db PECHA_BERRY
	db HEAL_POWDER
	db REVIVAL_HERB
	db ORAN_BERRY 
	db WHITE_HERB
	db POKE_BALL
	db -1

GauldenrodMart1: ; normal items
	db 8 ; # items
	db RARE_CANDY
	db MAX_REPEL
	db POKE_BALL
	db ESCAPE_ROPE
	db SUPER_POTION
	db HEAL_POWDER
	db ENERGYPOWDER
	db REVIVAL_HERB
	db -1
	
GauldenrodMart2: ; berries
	db 9 ; # items
	db CHERI_BERRY
	db CHESTO_BERRY
	db PECHA_BERRY
	db LEPPA_BERRY
	db RAWST_BERRY
	db ASPEAR_BERRY
	db PERSIM_BERRY
	db LUM_BERRY
	db SITRUS_BERRY
	db -1

GauldenrodMart3: ; TMs, HMs
	db 5 ; # items
	dbw TM_THUNDER_WAVE,  10000
	dbw TM_SUNNY_DAY,     20000
	dbw TM_RAIN_DANCE,    20000
	dbw TM_SANDSTORM,     20000
	dbw TM_HAIL,          20000
	db -1

TradersLandingMart_Items:
	db 9 ; # items
	db GREAT_BALL
	db HEAL_BALL
	db POTION
	db SUPER_POTION
	db MAX_REPEL
	db ANTIDOTE
	db PARALYZEHEAL
	db AWAKENING
	db BURN_HEAL
	db -1

SinjohCrossroadsMart:
	db 7 ; # items
	db RARE_CANDY
	db MAX_REPEL
	db HYPER_POTION
	db FULL_HEAL
	db REVIVE
	db ODD_SOUVENIR
	db POKE_BALL
	db -1

EerieHamletMart:
	db 11 ; # items
	db RARE_CANDY
	db MAX_REPEL
	db HYPER_POTION
	db FULL_HEAL
	db REVIVE
	db JEZE_BALL
	db BUB_BALL
	db DECI_BALL
	db HERB_BALL
	db FAST_BALL
	db GEODE
	db LOVE_BALL
	db -1

WesternCapitalMart2:
	db 7 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ULTRA_BALL
	db QUICK_BALL
	db TIMER_BALL
	db ESCAPE_ROPE
	db MAX_REPEL
	db -1

Celadon3FTMMart:
	db 8 ; # items
	dbw TM_SAFEGUARD,     10000
	dbw TM_BULK_UP,       20000
	dbw TM_CALM_MIND,     20000
	dbw TM_SWORDS_DANCE,  20000
	dbw TM_SUNNY_DAY,     40000
	dbw TM_RAIN_DANCE,    40000
	dbw TM_SANDSTORM,     40000
	dbw TM_HAIL,          40000
	db -1

MahoganyMart2:
	db 7 ; # items
	db POKE_DOLL
	db FIRE_STONE
	db WATER_STONE
	db THUNDERSTONE
	db LEAF_STONE
	db ICE_STONE
	db EXP_SHARE
	db -1

EcruteakBattleMart:
	db 9 ; # items
	db EJECT_BUTTON
	db LAGGING_TAIL
	db IRON_BALL
	db RING_TARGET
	db RED_CARD
	db ABSORB_BULB
	db CELL_BATTERY
	db SNOWBALL
	db EJECT_PACK
	db -1

OlivineBattleMart:
	db 10 ; # items
	db HEAVY_BOOTS
	db UTILUMBRELLA
	db MENTAL_HERB
	db POWER_HERB
	db DAMP_ROCK
	db HEAT_ROCK 
	db SMOOTH_ROCK
	db ICY_ROCK
	db FLAME_ORB
	db TOXIC_ORB
	db -1

SinjohCrossroadsMonMart: ; todo
	db 4 ; # items
	db DRAGON_SCALE
	db SCOPE_LENS
	db FOCUS_BAND
	db FOCUS_SASH
	db -1

GauldenrodTMMart: ; todo
	db 4 ; # items
	db TM_PROTECT
	db POWER_HERB
	db WHITE_HERB
	db BIG_ROOT
	db -1

ShamoutiMart2:
	db 6 ; # items
	db DAMP_ROCK
	db HEAT_ROCK
	db SMOOTH_ROCK
	db ICY_ROCK
	db LIGHT_CLAY
	db EVIOLITE
	db -1

BattleTowerMart1:
	db 9 ; # items
	db CHOICE_BAND,  48
	db CHOICE_SCARF, 48
	db CHOICE_SPECS, 48
	db EXPERT_BELT,  32
	db MUSCLE_BAND,  32
	db WISE_GLASSES, 32
	db METRONOME_I,  32
	db BINDING_BAND, 32
	db GRIP_CLAW,    32
	db -1

BattleTowerMart2:
	db 8 ; # items
	db RARE_CANDY,   64
	db PP_MAX,       64
	db ABILITY_CAP,  32
	db WEAK_POLICY,  48
	db LIFE_ORB,     48
	db FLAME_ORB,    32
	db TOXIC_ORB,    32
	db BLACK_SLUDGE, 32
	db -1

BattleTowerMart3:
	db 7 ; # items
	db MACHO_BRACE,  16
	db FOCUS_BAND,   16
	db FOCUS_SASH,   48
	db ASSAULT_VEST, 48
	db PROTECT_PADS, 16
	db ROCKY_HELMET, 48
	db SAFE_GOGGLES, 32
	db -1
