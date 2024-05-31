landmark: MACRO
	db \1, \2
	dw \3
ENDM

Landmarks:
	table_width 4, Landmarks
	landmark   0,   0, SpecialMapName
	landmark  92,  76, VioletCityName
	landmark  94,  74, SproutTowerName
	landmark  84,  92, RuinsOfAlphName
	landmark  92, 108, Route32Name
	landmark  92, 140, UnionCaveName
	landmark  84, 140, Route33Name
	landmark  76, 140, AzaleaTownName
	landmark  76, 130, TinderGardenName
	landmark  84, 132, SlowpokeWellName
	landmark  60, 140, IlexForestName
	landmark  60, 124, Route34Name
	landmark  60, 108, GoldenrodCityName
	landmark  58, 108, RadioTowerName
	landmark  60,  92, Route35Name
	landmark  76, 100, RouteKaJoName ;add
	landmark  60,  76, NationalParkName
	landmark  72,  76, Route36Name
	landmark  76,  68, Route37Name
	landmark  76,  60, EcruteakCityName
	landmark  77,  58, BellchimeTrailName
	landmark  78,  58, TinTowerName
	landmark  74,  58, BurnedTowerName
	landmark  60,  60, Route38Name
	landmark  44,  64, Route39Name
	landmark  44,  76, OlivineCityName
	landmark  46,  78, LighthouseName
	landmark  36,  80, Route40Name
	landmark  36, 108, WhirlIslandsName
	landmark  36, 116, Route41Name
	landmark  28, 116, CianwoodCityName
	landmark 100,  60, Route42Name
	landmark  92,  60, MtMortarName
	landmark 116,  60, MahoganyTownName
	landmark 116,  52, Route43Name
	landmark 116,  44, LakeOfRageName
	assert_table_length KANTO_LANDMARK
	landmark  60, 140, HollysHoltName
	landmark  76, 140, AnarresTownName
	landmark  72, 138, AnarresTowerName
	landmark  84, 132, MistyBasinName
	landmark  60, 124, CalmCoastName
	landmark  60, 108, GauldenrodName
	landmark  58, 107, GauldenrodTowerName
	landmark  60,  92, SereneSpringsName
	landmark  60,  80, StadiumGroundsName
	landmark  60,  76, StadiumName
	landmark  76,  56, EmperorsGardenName
	landmark  76,  70, WesternCapitalName
	landmark  78,  58, HisuiTowerName;tin OR BELL tower
	landmark  74,  58, BrassTowerName ;burned tower
	landmark  44,  60, CattleCullName
	landmark  44,  76, TradersLandingName
	landmark  28, 116, CianwoodCoveName
	landmark  36, 116, ShelteredShoresName
	landmark  36,  76, PhantomFjordName
	landmark  36, 108, SeaFluxNexusName
	landmark  36,  80, ArduousAnchorageName
	landmark  44,  80, LandingDocksName
	landmark 116,  44, TranquilTarnName
	landmark 116,  28, GrottoedGlacierName
	landmark 108,  28, WesternGlacierName
	landmark 116,  34, SinjohCampName
	landmark 116,  52, EmpiresReachName
	landmark 116,  60, EerieHamletName
	landmark 116,  56, RebelsRedoubtName
	landmark 100,  60, SulfurStyName
	landmark  92,  60, ClastsCradleName
	assert_table_length SHAMOUTI_LANDMARK
;	landmark  76,  68, ShamoutiIslandName
	assert_table_length NUM_LANDMARKS

;modern johto
VioletCityName:        rawchar "Violet City@"
AzaleaTownName:        rawchar "Azalea Town@"
TinderGardenName:	   rawchar "Tinder¯Garden@"
GoldenrodCityName:     rawchar "Goldenrod¯City@"
EcruteakCityName:      rawchar "Ecruteak¯City@"
OlivineCityName:       rawchar "Olivine¯City@"
CianwoodCityName:      rawchar "Cianwood¯City@"
MahoganyTownName:      rawchar "Mahogany¯Town@"
LakeOfRageName:        rawchar "Lake of¯Rage@"
SproutTowerName:       rawchar "Sprout¯Tower@"
RuinsOfAlphName:       rawchar "Ruins¯of Alph@"
UnionCaveName:         rawchar "Union Cave@"
SlowpokeWellName:      rawchar "Slowpoke¯Well@"
RadioTowerName:        rawchar "Radio Tower@"
NationalParkName:      rawchar "National¯Park@"
BellchimeTrailName:    rawchar "Bellchime¯Trail@"
TinTowerName:          rawchar "Bell Tower@"
LighthouseName:        rawchar "Lighthouse@"
WhirlIslandsName:      rawchar "Whirl¯Islands@"
MtMortarName:          rawchar "Mt.Mortar@"
Route32Name:           rawchar "Route 32@"
Route33Name:           rawchar "Route 33@"
Route34Name:           rawchar "Route 34@"
Route35Name:           rawchar "Route 35@"
Route36Name:           rawchar "Route 36@"
Route37Name:           rawchar "Route 37@"
Route38Name:           rawchar "Route 38@"
Route39Name:           rawchar "Route 39@"
Route40Name:           rawchar "Route 40@"
Route41Name:           rawchar "Route 41@"
Route42Name:           rawchar "Route 42@"
Route43Name:           rawchar "Route 43@"
RouteKaJoName:		   rawchar "Route¯Ka-Jo@"
IlexForestName:        rawchar "Ilex¯Forest@"
BurnedTowerName:       rawchar "Burned¯Tower@"
;old johto
HollysHoltName:		   rawchar "Holly's¯Holt@"
AnarresTownName:	   rawchar "Anarres¯Town@"
AnarresTowerName:	   rawchar "Anarres¯Tower@"
MistyBasinName:		   rawchar "Misty¯Basin@"
CalmCoastName:	       rawchar "Calm¯Coast@"
GauldenrodName:		   rawchar "Gauldenrod@"
GauldenrodTowerName:   rawchar "Gauldenrod¯Tower@"
SereneSpringsName:	   rawchar "Serene¯Springs@"
StadiumGroundsName:	   rawchar "Stadium¯Grounds@"
StadiumName:           rawchar "Stadium@"
EmperorsGardenName:    rawchar "Emperor's¯Garden@"
WesternCapitalName:    rawchar "Western¯Capital@"
HisuiTowerName:        rawchar "Tin Tower@"
BrassTowerName:        rawchar "Brass¯Tower@"
CattleCullName:		   rawchar "Cattle¯Cull@"
TradersLandingName:	   rawchar "Trader's¯Landing@"
CianwoodCoveName:      rawchar "Cianwood¯Cove@"
ShelteredShoresName:   rawchar "Sheltered¯Shores@"
PhantomFjordName:      rawchar "Phantom¯Fjord@"
SeaFluxNexusName:      rawchar "Sea Flux¯Nexus@"
ArduousAnchorageName:  rawchar "Arduous¯Anchorage@"
LandingDocksName:      rawchar "Landing¯Docks@"
TranquilTarnName:      rawchar "Tranquil¯Tarn@"
GrottoedGlacierName:   rawchar "Grottoed¯Glacier@"
WesternGlacierName:    rawchar "Western_Glacier@"
SinjohCampName:        rawchar "Sinjoh¯Camp@"
EmpiresReachName:      rawchar "Empires¯Reach@"
EerieHamletName:       rawchar "Eerie¯Hamlet@"
RebelsRedoubtName:     rawchar "Rebel's¯Redoubt@"
SulfurStyName:         rawchar "Sulfur¯Sty@"
ClastsCradleName:      rawchar "Clast's¯Cradle@"


SpecialMapName:        rawchar "?@"
