#include "script_component.hpp"

params ["_target"];

_target setVariable [QGVAR(spoken), true];

private _town = _target getVariable ["town", "generic"];

if (typeOf player isEqualTo "B_Survivor_F") then {
  switch (_town) do
  {
  	case landay:{
      private _text = selectRandom [LLSTRING(Landay_T_1), LLSTRING(Landay_T_2), LLSTRING(Landay_T_3), LLSTRING(Landay_T_4), LLSTRING(Landay_T_5), LLSTRING(Landay_T_6), LLSTRING(Landay_T_7), LLSTRING(Landay_T_8), LLSTRING(Landay_T_9)];
    };
    case landay2; {
      private _text = selectRandom [LLSTRING(Landay_1), LLSTRING(Landay_2), LLSTRING(Landay_3), LLSTRING(Landay_4), LLSTRING(Landay_5), LLSTRING(Landay_6), LLSTRING(Landay_7), LLSTRING(Landay_8), LLSTRING(Landay_9)];
    };
  };
} else {
  switch _town do
  {
  	case landay: {
      GVAR(text) = selectRandom [LLSTRING(Generic_P_1), LLSTRING(Generic_P_2), LLSTRING(Generic_P_3), LLSTRING(Generic_P_4), LLSTRING(Generic_P_5), LLSTRING(Generic_P_6), LLSTRING(Generic_P_7), LLSTRING(Generic_P_8), LLSTRING(Generic_P_9)];
    };
    case generic: {
      GVAR(text) = selectRandom [LLSTRING(Generic_P_1), LLSTRING(Generic_P_2), LLSTRING(Generic_P_3), LLSTRING(Generic_P_4), LLSTRING(Generic_P_5), LLSTRING(Generic_P_6), LLSTRING(Generic_P_7), LLSTRING(Generic_P_8), LLSTRING(Generic_P_9)];
    };
  };
};

titleText [format [
  "<t color='#653382' size='1.7' shadow='1'>%1: </t><t color='#ffffff' size='1.7' shadow='1'>%2</t>",
  LLSTRING(Afghan),
  GVAR(text)
], "PLAIN DOWN", 0, false, true];
