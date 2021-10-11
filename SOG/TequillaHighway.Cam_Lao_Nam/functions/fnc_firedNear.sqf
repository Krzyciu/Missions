#include "script_component.hpp"

params ["_unit", "_firer", "_distance"];

TRACE_3("handleSuppressed",_unit,_distance);

if (!(local _unit) || {!(alive _unit)}) exitWith {};

if (_distance isEqualTo 0) then {
       _distance = 10;
   };

private _newSuppress = linearConversion [15, 1, _distance, 0, 1, true];

// Exit if shot has no effect
if (_newSuppress isEqualTo 0) exitWith {};
playSound "ACE_EarRinging_Medium";
private _force = (30 / _distance) min 20;
addCamShake [_force, 1, 5];
