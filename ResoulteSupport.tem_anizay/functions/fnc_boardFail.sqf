#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handler for board fail action
 */

if (GVAR(boardFail)) exitWith {};
GVAR(boardFail) = true;
GVAR(currentBoardSatchel) setVariable [QGVAR(boardFailed), true, true];

0 spawn {
  playSound QGVAR(beep);
  sleep 0.55;
  playSound QGVAR(beep);
  sleep 0.5;
  playSound QGVAR(beep);
  sleep 0.45;
  playSound QGVAR(beep);
  sleep 0.4;
  playSound QGVAR(beep);
  sleep 0.35;
  playSound QGVAR(beep);
  sleep 0.3;
  playSound QGVAR(beep);
  sleep 0.25;
  playSound QGVAR(beep);
  sleep 0.2;
  playSound QGVAR(beep);
  sleep 0.15;
  playSound QGVAR(beep);
  sleep 0.1;
  playSound QGVAR(beep);
  sleep 0.05;
  playSound QGVAR(beep);
  sleep 0.04;
  playSound QGVAR(beep);
  sleep 0.03;
  playSound QGVAR(beep);
  sleep 0.02;
  playSound QGVAR(beep);
  sleep 0.1;
  closeDialog 0;
  [QGVAR(boardFailed), GVAR(currentBoardSatchel)] call CBA_fnc_serverEvent;
};
