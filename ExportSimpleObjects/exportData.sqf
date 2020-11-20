private _objects = (getMissionLayerEntities "Objects (simple)") # 0;
{
private _data = [_x] call BIS_fnc_simpleObjectData;
_data params ["", "_model", "_reversed"];

diag_log [_model, getPosWorld _x, [vectorDir _x, vectorUp _x], _reversed];
} forEach _objects;
