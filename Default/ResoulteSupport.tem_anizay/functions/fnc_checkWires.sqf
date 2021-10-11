#include "script_component.hpp"

params ["_target"];

[[_target, 0, ["ACE_MainActions", QGVAR(checkWire)]], ace_interact_menu_fnc_removeActionFromObject] remoteExec ["call", 0, true];

private _color = _target getVariable ["color", "#ff0000"];
private _matrix = "";

for "_i" from 1 to 40 do {
  private _matrixColor = selectRandomWeighted ["#ff0000", 0.27, "#00ff00", 0.27, "#0000ff", 0.27, _color, 0.2];
  _matrix = _matrix + format ["<t color='%1' size='3.2' font='PuristaLight'>O</t>", _matrixColor];
};

private _time = selectRandom [10, 15, 16, 17, 20, 25];

while {alive _target && _time > 0} do {
  private _hint = parseText format ["<t size='2'>Wybierz kolor Pozostało około %1 sekund</t><br/> %2", _time, _matrix];
  hint _hint;
  sleep 1;
  _time = _time - 1;
};

if (_time < 1) then {
  [_target] call FUNC(bombDefuse)
};
hint "";
