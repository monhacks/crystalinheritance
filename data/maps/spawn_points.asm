spawn: MACRO
; map, y, x
	map_id \1
	db \2, \3
ENDM

SpawnPoints:
; entries correspond to SPAWN_* constants, ALSO USED IN CONSTANTS/MAP_DATA_CONSTANTS
	table_width 4, SpawnPoints

	spawn KURTS_HOUSE,                 7,  1 ; 

	spawn ANARRES_TOWN,               17, 10 ;
	spawn GAULDENROD, ;             23, 26
	spawn WESTERN_CAPITAL,                13, 26
	spawn TRADERS_LANDING,                    61,  4
	spawn SHELTERED_SHORES,              19, 18
	spawn CIANWOOD_COVE,               9,  6
	spawn TRANQUIL_TARN,             11, 36
	spawn EERIE_HAMLET,              9,  6
	spawn SULFUR_STY,               5,  8
	spawn TIMELESS_TAPESTRY,                9, 30
;	spawn CELADON_CITY,               33, 10
;	spawn FUCHSIA_CITY,               19, 28
;	spawn CINNABAR_ISLAND,            11, 16
;	spawn INDIGO_PLATEAU,             11,  6

;	spawn NEW_BARK_TOWN,              15,  6 ; these are in front of pokemon centers
;	spawn CHERRYGROVE_CITY,           29,  4
	spawn VIOLET_CITY,                31, 30
	spawn ROUTE_32,                   11, 74
	spawn AZALEA_TOWN,                15, 10
	spawn CIANWOOD_CITY,              23, 44
	spawn GOLDENROD_CITY,             18, 28
	spawn OLIVINE_CITY,               13, 18
	spawn ECRUTEAK_CITY,              23, 28
	spawn MAHOGANY_TOWN,              15, 14
;	spawn ROUTE_48,                   11,  6
	spawn LAKE_OF_RAGE,               21, 29
;	spawn BLACKTHORN_CITY,            21, 30
;	spawn SILVER_CAVE_OUTSIDE,        23, 14
;	spawn FAST_SHIP_CABINS_SW_SSW_NW,  6,  2

	spawn N_A,                        -1, -1

	assert_table_length NUM_SPAWNS + 1
