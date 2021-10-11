#include "script_component.hpp"


private _action = [
  QGVAR(talk),
  LLSTRING(Action_Talk),
  "\A3\ui_f\data\igui\cfg\simpleTasks\types\talk_ca.paa",
  {
    params ["_target"];
    [_target] call FUNC(civTalk);
  },
  {true}
] call ace_interact_menu_fnc_createAction;

["CAManBase", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

// Bomb defusal interactions

// Check color
[
  "plp_ct_TravelBagRed",
  0,
  ["ACE_MainActions"],
  [QGVAR(checkWire), LLSTRING(Action_CheckWire), "\A3\ui_f\data\igui\cfg\simpleTasks\types\search_ca.paa", {
    params ["_target"];
    [LLSTRING(Action_CheckWire_Confirm), [], {
      params ["", "_target"];
      [_target] spawn FUNC(checkWires);
    }, {}, _target] call zen_dialog_fnc_create;
  }, {[player, "ACE_DefusalKit"] call ace_common_fnc_hasItem}, {}, [], [0,0,0], 7] call ace_interact_menu_fnc_createAction
] call ace_interact_menu_fnc_addActionToClass;

// Red
[
  "plp_ct_TravelBagRed",
  0,
  ["ACE_MainActions"],
  [QGVAR(cutWireRed), LLSTRING(Action_CutWireRed), "\A3\ui_f\data\map\diary\icons\playerEast_ca.paa", {
    params ["_target"];
    [LLSTRING(Action_CutWire_Confirm), [], {
      params ["", "_target"];
      private _color = _target getVariable ["color", "#ff0000"];
      if (_color isEqualTo "#ff0000") then {
        [_target] call FUNC(bombDefuse);} else {
        [_target] call FUNC(bombFail);
      };
    }, {}, _target] call zen_dialog_fnc_create;
  }, {true}, {}, [], [0,0,0], 7] call ace_interact_menu_fnc_createAction
] call ace_interact_menu_fnc_addActionToClass;

// Green
[
  "plp_ct_TravelBagRed",
  0,
  ["ACE_MainActions"],
  [QGVAR(cutWireGreen), LLSTRING(Action_CutWireGreen), "\A3\ui_f\data\map\diary\icons\playerGuer_ca.paa", {
    params ["_target"];
    [LLSTRING(Action_CutWire_Confirm), [], {
      params ["", "_target"];
      private _color = _target getVariable ["color", "#ff0000"];
      if (_color isEqualTo "#00ff00") then {
        [_target] call FUNC(bombDefuse);} else {
        [_target] call FUNC(bombFail);
      };
    }, {}, _target] call zen_dialog_fnc_create;
  }, {true}, {}, [], [0,0,0], 7] call ace_interact_menu_fnc_createAction
] call ace_interact_menu_fnc_addActionToClass;

  // Blue
  [
    "plp_ct_TravelBagRed",
    0,
    ["ACE_MainActions"],
    [QGVAR(cutWireBlue), LLSTRING(Action_CutWireBlue), "\A3\ui_f\data\map\diary\icons\playerWest_ca.paa", {
      params ["_target"];
      [LLSTRING(Action_CutWire_Confirm), [], {
        params ["", "_target"];
        private _color = _target getVariable ["color", "#ff0000"];
        if (_color isEqualTo "#0000ff") then {
          [_target] call FUNC(bombDefuse);} else {
          [_target] call FUNC(bombFail);
        };
      }, {}, _target] call zen_dialog_fnc_create;
    }, {true}, {}, [], [0,0,0], 7] call ace_interact_menu_fnc_createAction
  ] call ace_interact_menu_fnc_addActionToClass;
