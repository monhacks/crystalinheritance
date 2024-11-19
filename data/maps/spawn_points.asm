spawn: MACRO
; map, y, x
	map_id \1
	db \2, \3
ENDM

SpawnPoints:
; entries correspond to SPAWN_* constants, ALSO USED IN CONSTANTS/MAP_DATA_CONSTANTS
	table_width 4, SpawnPoints

	spawn KURTS_HOUSE,                 7,  1 ;  "YOUR HOUSE"

	spawn ANARRES_TOWN,               17, 10 ;
	spawn GAULDENROD,                 18, 28
	spawn WESTERN_CAPITAL,            21, 26
	spawn TRADERS_LANDING,            15, 17
	spawn SHELTERED_SHORES,           34, 20
	spawn CIANWOOD_COVE,              11, 14
	spawn TRANQUIL_TARN,              13,  4
	spawn EERIE_HAMLET,               11,  8
	spawn SULFUR_STY,                 47, 24
	spawn TIMELESS_TAPESTRY,           3,  6

	spawn VIOLET_CITY,                31, 30
	spawn ROUTE_32,                   11, 74
	spawn AZALEA_TOWN,                15, 10
	spawn CIANWOOD_CITY,              23, 44
	spawn GOLDENROD_CITY,             18, 28
	spawn OLIVINE_CITY,               13, 18
	spawn ECRUTEAK_CITY,              23, 28
	spawn MAHOGANY_TOWN,              15, 14
	spawn LAKE_OF_RAGE,               21, 29

	spawn N_A,                        -1, -1

	assert_table_length NUM_SPAWNS + 1
