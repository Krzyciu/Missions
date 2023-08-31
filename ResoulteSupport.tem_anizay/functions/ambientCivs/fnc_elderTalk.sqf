#include "script_component.hpp"

params ["_target"];

_target lookAt player;
private _text = "";
if (headgear player isEqualTo "") then {
  private _town = _target getVariable [QGVAR(town), "Landay"];
  private _relations = (missionNamespace getVariable [QGVAR(relations), [_town, 0]]) #1;
  _text = localize format ["STR_Krzyc_%1_%2", _town, _relations];
  if (_relations > 9) then {_target setVariable [QGVAR(elderTalked), false, true]};
} else {
  _text = localize format ["STR_Krzyc_RemoveHelmet_%1", (floor random 4)];
};

private _sound = format ["Krzyc_M%1ambient%2", (floor random 5) +1, (floor random 31)];
[QGVAR(ambientTalk), [_target, _sound]] call CBA_fnc_globalEvent;

[QGVAR(sayText), [_text, _target]] call CBA_fnc_globalEvent;
