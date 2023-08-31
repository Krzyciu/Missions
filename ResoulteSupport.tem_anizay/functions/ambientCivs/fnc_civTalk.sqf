#include "script_component.hpp"

params ["_target"];
GVAR(spoken) = _target getVariable [QGVAR(spoken), 0];
GVAR(spoken) = GVAR(spoken) + 1;

_target setVariable [QGVAR(spoken), GVAR(spoken), true];
_target lookAt player;

private _text = "";
private _town = _target getVariable [QGVAR(town), "generic"];

if (typeOf player isEqualTo "B_Survivor_F") then {
  switch (_town) do
  {
  	case landay:{
      _text = localize format ["STR_Krzyc_Landay_T_%1", (floor random 24)];
    };
    case janur: {
      _text = localize format ["STR_Krzyc_Janur_T_%1", (floor random 24)];
    };
    case naw: {
      _text = localize format ["STR_Krzyc_Naw_T_%1", (floor random 24)];
    };
    case mian: {
      _text = localize format ["STR_Krzyc_Mian_T_%1", (floor random 12)];
    };
    case qalandar: {
      _text = localize format ["STR_Krzyc_Qalandar_T_%1", (floor random 20)];
    };
    case idap: {
      _text = localize format ["STR_Krzyc_IDAP_T_%1", (floor random 5)];
    };
    default {
      _text = localize format ["STR_Krzyc_Landay_T_%1", (floor random 20)];
    };
  };
} else {
  switch _town do
  {
    case landay:{
      _text = localize format ["STR_Krzyc_Landay_UT_%1", (floor random 24)];
    };
    case janur: {
      _text = localize format ["STR_Krzyc_Janur_UT_%1", (floor random 24)];
    };
    case naw: {
      _text = localize format ["STR_Krzyc_Naw_UT_%1", (floor random 24)];
    };
    case mian: {
      _text = localize format ["STR_Krzyc_Mian_UT_%1", (floor random 12)];
    };
    case qalandar: {
      _text = localize format ["STR_Krzyc_Qalandar_UT_%1", (floor random 20)];
    };
    case idap: {
      _text = localize format ["STR_Krzyc_IDAP_T_%1", (floor random 5)];
    };
    default {
      _text = localize format ["STR_Krzyc_Landay_UT_%1", (floor random 20)];
    };
  };
};

[QGVAR(sayText), [_text, _target]] call CBA_fnc_globalEvent;

[{
  params ["_target"];
  _target setVariable [QGVAR(speaking), false, true];
}, [_target], 8] call CBA_fnc_waitAndExecute;
