#include "script_component.hpp"

params ["_value", "_uncon", "_unit"];
_unit setVariable ["ace_medical_damageThreshold", 10, true];
_unit setVariable ["ace_medical_overrideaimedicalsettings", 1, true];
private _bodyPart = "";
private _dmgSource = "";
private _dmg = GVAR(damageBase);
private _bodyPartArray = ["head", "body", "hand_l", "hand_r", "leg_l", "leg_r"];
private _dmgSourceArray = ["bullet", "explosive","grenade","shell", "stab","vehiclecrash"];

switch (_value) do
{

	case "low": {
    for "_i" from 0 to 1 do {
      _bodyPart = selectRandom _bodyPartArray;
      _dmgSource = selectRandom _dmgSourceArray;
      [_unit, _dmg, _bodyPart, _dmgSource] call ACEFUNC(medical,addDamageToUnit)
    };
  };

	case "med": {
    for "_i" from 0 to 2 do {
      _bodyPart = selectRandom _bodyPartArray;
      _dmgSource = selectRandom _dmgSourceArray;
      _dmg = 0.75 + random GVAR(damageMedium);
      [_unit, _dmg, _bodyPart, _dmgSource] call ACEFUNC(medical,addDamageToUnit)
    };
  };

	case "high": {
    for "_i" from 0 to 2 do {
      _bodyPart = selectRandom _bodyPartArray;
      _dmgSource = selectRandom _dmgSourceArray;
      _dmg = 0.75 + random GVAR(damageHigh);
      [_unit, _dmg, _bodyPart, _dmgSource] call ACEFUNC(medical,addDamageToUnit);
    };
  };

  default {
    [_unit, 1, _bodyPart, _dmgSource] call ACEFUNC(medical,addDamageToUnit)
  };

};

if (_uncon > random 1) then {
	[_unit, true] call ACEFUNC(medical_engine,setUnconsciousAnim);
  [_unit, true, 9999, false] call ACEFUNC(medical,setUnconscious);
} else {
	[_unit, true] call ACEFUNC(medical_engine,setUnconsciousAnim);
  [_unit, true, 9999, false] call ACEFUNC(medical,setUnconscious);
	sleep 4;
	[QGVAR(playAnimInjured), _unit] call CBA_fnc_GlobalEvent;
};
