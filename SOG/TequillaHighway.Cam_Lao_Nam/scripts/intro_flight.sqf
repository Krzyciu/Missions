#include "script_component.hpp"

private _posStart = getPosASL heli_intro;
private _heli = heli_intro;
_heli engineOn true;

private _proxy = createVehicle ["test_EmptyObjectForBubbles", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_proxy hideObjectGlobal true;
_proxy setDir 47;
_proxy setPosASL _posStart;
_proxy setVelocity [
  45 * (sin 47),
  45 * (cos 47),
  0
];

_heli attachTo [_proxy, [0,0,-2]];

_heli addEventHandler ["Killed", {
  params ["_heli"];
  detach _heli;
}];

[{!alive heli_intro}, {
  0 spawn {
    sleep 1.8;
    missionNamespace setVariable ["Krzyc_heli_crash", true , true];
    playSound3D ['a3\dubbing_f_exp\exp_m05\60_PilotLeaves\exp_m05_60_pilotleaves_PIL_0.ogg', heli_intro];
    sleep 3;
    {deleteVehicle _x} forEach (getMissionLayerEntities "Intro_amb") #0;
  };
},[]] call CBA_fnc_waitUntilAndExecute;
