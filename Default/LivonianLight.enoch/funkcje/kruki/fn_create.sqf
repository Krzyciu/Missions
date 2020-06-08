/*

classname:

Eagle_F
Crowe
Kestrel_random_F

["Crowe", position player, 5, 50, 50, player] call kruki_fnc_create;

*/

params [["_type", "Crowe"], "_flockPos", ["_flockCount", 5], ["_density", 20], ["_flockHeight", 50], ["_target", objNull]];

private _krukiLista = [];

for "_i" from 1 to _flockCount do {

	private _kruk = _type camcreate [
		(_flockPos select 0) - _density + (random _density)*2,
		(_flockPos select 1) - _density + (random _density)*2,
		_flockPos select 2
	];

	_kruk setDir random 360;
	_krukiLista pushBack _kruk;

	sleep (random 0.01);
};


_veh = createSimpleObject ["Land_PenBlack_F", _flockPos, true];
_veh say3D ["crows_takeoff", 250];
[{deleteVehicle _this}, _veh, 10] call CBA_fnc_waitAndExecute;

[_krukiLista, _flockHeight, _target] call kruki_fnc_loop;

_krukiLista;


sleep 500;
{deleteVehicle _x} forEach _krukiLista;
