#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Opens satchel board GUI
 */

params ["_satchel"];

private _boardId = _satchel getVariable [QGVAR(boardId), 1];
private _disarmed = _satchel getVariable [QGVAR(boardDisarmed), false];

if (
  _disarmed ||
  {_satchel getVariable [QGVAR(boardFailed), false]}
) exitWith {};

GVAR(currentBoardSatchel) = _satchel;
GVAR(currentBoardId) = _boardId;
GVAR(boardFail) = false;

private _dialogClass = format [
  QGVAR(board_%1%2),
  _boardId,
  ["", "_dis"] select _disarmed
];

private _opened = createDialog _dialogClass;
if (_opened) then {
  hint parseText LLSTRING(Action_DisarmBoard_Info);
};
