#include "script_component.hpp"

params ["_target"];

_target stop true;
_target lookAt player;
private _text = selectRandom ["Madha?", "Naem?", "Ahlan bik", "As-Salamu ʿAlaykum", "Marhaba", "Ahlan"];

[QGVAR(sayText), [_text, _target]] call CBA_fnc_globalEvent;

[{
  params ["_target"];
  _target stop false;
}, [_target], 10] call CBA_fnc_waitAndExecute;
