#include "script_component.hpp"

params ["_target"];

_target stop true;
private _text = selectRandom ["Madha?", "Naem?", "Ahlan bik", "As-Salamu ʿAlaykum", "Marhaba", "Ahlan"];
titleText [format [
  "<t color='#653382'><t size='1.7'>%1: </t><t color='#ffffff'><t size='1.7'>%2</t>",
  LLSTRING(Afghan),
  _text
], "PLAIN DOWN", 0, false, true];

[{
  params ["_target"];
  _target stop false;
}, [_target], 10] call CBA_fnc_waitAndExecute;