By SzwedzikPL https://github.com/SzwedzikPL
private _data = call compile preprocessFileLineNumbers "data_map.sqf";
private _count = count _data;
  {
    _x params ["_model", "_posWorld", "_vector"];
    private _object = createSimpleObject [_model, [0,0,0]];
    _object setPosWorld _posWorld;
    _object setVectorDirAndUp _vector;
    sleep 0.01;
  } forEach _data;
