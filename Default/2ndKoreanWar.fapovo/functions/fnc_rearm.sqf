[-2, {
private _vehicles = [heli_1,heli_2,miner];
{_x setVehicleAmmo 1;
_x setFuel 1;
_x setDamage 0} forEach _vehicles;
}] call CBA_fnc_globalExecute;
