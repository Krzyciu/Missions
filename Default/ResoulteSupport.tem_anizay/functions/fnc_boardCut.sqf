#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handler for board cut action
 */

closeDialog 0;
private _opened = createDialog (format [QGVAR(board_%1_dis), GVAR(currentBoardId)]);
playSound QGVAR(board_cut);
0 spawn {
  sleep 1;
  hint parseText LLSTRING(Action_DisarmBoard_Success);
  deleteVehicle GVAR(currentBoardSatchel);
};
