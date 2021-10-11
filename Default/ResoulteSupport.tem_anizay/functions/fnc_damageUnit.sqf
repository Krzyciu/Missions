#include "script_component.hpp"

params ["_value", "_uncon", "_unit"];

switch (_value) do
{

	case "low": {
    for "_i" from 0 to 6 do {
      [_unit, 0.7, "body", "vehiclecrash"] call ace_medical_fnc_addDamageToUnit
    };
  };

	case "med": {
    for "_i" from 0 to 10 do {
      [_unit, 0.8, "body", "vehiclecrash"] call ace_medical_fnc_addDamageToUnit
    };
  };

	case "high": {
    for "_i" from 0 to 16 do {
      [_unit, 0.9, "body", "vehiclecrash"] call ace_medical_fnc_addDamageToUnit
    };
  };

  default {
    [_unit, 0.7, "body", "vehiclecrash"] call ace_medical_fnc_addDamageToUnit
  };

};

if (_uncon) then {
  [_unit, true] call ace_medical_status_fnc_setUnconsciousState;
} else {
  [_unit, true] call ace_medical_status_fnc_setUnconsciousState;
	sleep 5;
  private _anim = selectRandom ["Acts_CivilInjuredChest_1", "Acts_CivilInjuredGeneral_1", "Acts_CivilInjuredHead_1", "Acts_CivilInjuredLegs_1", "Acts_CivilInjuredArms_1", "Acts_Injured_Driver_Loop", "Acts_InjuredLookingRifle01", "Acts_InjuredLookingRifle02", "Acts_InjuredLookingRifle04", "Acts_LyingWounded_loop3"];
  _unit switchMove _anim;
};
