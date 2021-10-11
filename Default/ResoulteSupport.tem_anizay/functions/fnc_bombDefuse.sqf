#include "script_component.hpp"

params ["_target"];

playSound "click";
deleteVehicle _target;
hint "";
