/***********************************************************************
	init.sqf
	Poniższy kod wykona się lokalnie u gracza oraz na serwerze w trakcie ładowania misji przez grę
************************************************************************/

//-- Twój kod --//
["CAManBase", "init", {
  params ["_unit"];

  _unit spawn {
    params ["_unit"];

    // Wait for modules stuff setup and proper network sync
    sleep 0.15;

    if !(local _unit) exitWith {};

    _unit setSkill ["aimingShake", 0.10];
    _unit setSkill ["aimingAccuracy", 0.10];
    _unit setSkill ["aimingSpeed", 0.20];
    _unit setSkill ["endurance", 1];
    _unit setSkill ["spotDistance", 1];
    _unit setSkill ["spotTime", 1];
    _unit setSkill ["courage", 1];
    _unit setSkill ["reloadSpeed",1];
    _unit setSkill ["commanding", 1];
  };
}, true, [], true] call CBA_fnc_addClassEventHandler;
