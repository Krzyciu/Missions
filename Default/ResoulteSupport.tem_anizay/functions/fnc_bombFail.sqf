#include "script_component.hpp"

params ["_target"];

[_target] spawn {
  params ["_target"];
  
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
  "Bo_GBU12_LGB" createVehicle (_target modelToWorld [0, 0, -0.5]);
  deleteVehicle _target;
};
