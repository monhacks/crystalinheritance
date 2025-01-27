GrassMonProbTable:
	table_width 1, GrassMonProbTable
	db 25  ; 25% chance
	db 50  ; 25% chance
	db 70  ; 20% chance
	db 80  ; 10% chance
	db 90  ; 10% chance
	db 95  ;  5% chance
	db 100 ;  5% chance
	assert_table_length NUM_GRASSMON

WaterMonProbTable:
	table_width 1, WaterMonProbTable
	db 60  ; 60% chance
	db 90  ; 30% chance
	db 100 ; 10% chance
	assert_table_length NUM_WATERMON
