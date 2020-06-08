params ["_obiekt","_effect"];
if (isDedicated) then {
sleep selectRandom [1,5,8,12,15];
private _przewodnik3 = "TestSphere2" createVehicle [0, 0, 0];
_przewodnik3 setPosASL getPosASL _obiekt;
_przewodnik3 hideObjectGlobal true;
_przewodnik3 setDir (getDir _obiekt);

_refractFX = "#particlesource" createVehicle [0,0,0];

_refractFX setposASL getPosASL _obiekt;

_refractFX setParticleRandom [0, [0, 0, 0], [0.1, 0.1, 0.1], 0, 2, [0, 0, 0, 0.1], 0, 0];
_refractFX setParticleParams [["\a3\Data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 0], "", "Billboard", 1, 12, [0, 0, 0.3], [0, 0, 0.1], 0, 10, 7.8, 0, [0.6, 3], [[1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _obiekt, 0, false, 0, [[0,0,0,0]]];
_refractFX setDropInterval 1;
_obiekt attachTo [_przewodnik3, [0,0,1]];
_przewodnik3 setVelocity [0,0,0.2];
sleep selectRandom [1,2,3];
_przewodnik3 setVelocity [0,0,0.4];
sleep selectRandom [3,4,5];
_przewodnik3 setVelocity [0,0,0.8];
sleep 2;
_przewodnik3 setVelocity [0,0,0.4];
sleep 3;
_przewodnik3 setVelocity [0,0,0];

sleep 0.5;
[_przewodnik3,_refractFX,_obiekt,_effect] spawn {
params ["_przewodnik3","_refractFX","_obiekt","_effect"];
sleep 15;
detach _obiekt;
sleep 1;
if (_effect == 1) then {["play", _obiekt] call BIS_fnc_carAlarm;} else {};
deleteVehicle _refractFX;
sleep 0.1;detach _obiekt;
deleteVehicle _przewodnik3;
sleep 0.5;
if (_effect == 1) then {["play", _obiekt] call BIS_fnc_carAlarm}};

while {alive _przewodnik3} do {
		 private _vectors = [
			 [vectorDirVisual _przewodnik3, vectorUpVisual _przewodnik3], 0.25, 0.15, 0.25
		 ] call BIS_fnc_transformVectorDirAndUp;
		 _przewodnik3 setVectorDirAndUp _vectors;
		 sleep 0.1;
	 };
 };
