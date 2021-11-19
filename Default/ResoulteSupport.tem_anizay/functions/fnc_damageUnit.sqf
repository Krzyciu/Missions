#include "script_component.hpp"

params ["_value", "_uncon", "_unit"];
_unit setVariable ["a3cs_medical_aceDamageEnabled", true, true];
_unit setVariable ["ace_medical_damageThreshold", 10, true];
switch (_value) do
{

	case "low": {
    for "_i" from 0 to 6 do {
      [_unit, 0.7, "body", "vehiclecrash"] call ACEFUNC(medical,addDamageToUnit)
    };
  };

	case "med": {
    for "_i" from 0 to 10 do {
      [_unit, 0.8, "body", "vehiclecrash"] call ACEFUNC(medical,addDamageToUnit)
    };
  };

	case "high": {
    for "_i" from 0 to 16 do {
      [_unit, 0.95, "body", "vehiclecrash"] call ACEFUNC(medical,addDamageToUnit);
    };
  };

  default {
    [_unit, 0.7, "body", "vehiclecrash"] call ACEFUNC(medical,addDamageToUnit)
  };

};
if (_uncon) then {
  [_unit, true, 99999, false] call ACEFUNC(medical,setUnconscious);
} else {
  [_unit, true, 99999, false] call ACEFUNC(medical,setUnconscious);
	sleep 10;
	[QGVAR(playAnim), _unit] call CBA_fnc_GlobalEvent;
};