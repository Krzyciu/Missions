//przed wrzuceniem na serwer zastapic (isServer) na (!hasInterface && !isDedicated)
// inicjacja null = [od, do] execVM "skrypty\genAI.sqf";

	_pozycjes = _this select 0;
	_pozycjek = _this select 1;
	_strona = east;
	_klasy = ["uns_men_VC_local_RF5", "uns_men_VC_mainforce_68_AT",
"uns_men_VC_local_RF1",
"uns_men_VC_local_LMG",
"uns_men_VC_local_nco",
"uns_men_VC_local_AS7",
"uns_men_VC_mainforce_RF1",
"uns_men_VC_mainforce_MRK",
"uns_men_VC_mainforce_RF3",
"uns_men_VC_mainforce_RF5",
"uns_men_VC_recon_RF3",
"uns_men_VC_recon_RF1",
"uns_men_VC_mainforce_LMG",
"uns_men_VC_recon_RF6"];
	_grupaOkop = createGroup _strona;
	_klasyJed = _klasy;
	_soldaten = nil;
	_posture = ["UP"];
	for "_i" from _pozycjes to _pozycjek do
	{
		_jed = ("pos_" + str(_i));
		_jed = missionNamespace getVariable [_jed, objNull];
		_jedDoSpawnu = selectRandom _klasyJed;
		_jedDoSpawnu createUnit [getPosASL _jed, _grupaOkop,"_soldaten = this; this disableAI 'path';reload _unit;"];
		_soldaten setPosASL (getPosASL _jed);
		_isStanding = selectRandom _posture;
		_soldaten setUnitPos _isStanding;
		_soldaten setSkill (selectRandom [0.8,0.9]);
		doStop _soldaten;
		sleep 0.1;
	};
