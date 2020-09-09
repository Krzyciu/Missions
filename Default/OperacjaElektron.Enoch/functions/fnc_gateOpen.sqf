private _gate = _this param [0, objNull, [objNull]];
private _open = _this param [1, true, [false]];
private _height = 12;
private _pos = getPosATL _gate;

if (_open) then
{
		while {(_pos select 2) < _height} do
		{
			_gate setPos [_pos select 0, _pos select 1, (_pos select 2) + 0.05];
			_pos = getPosATL _gate;

			sleep 0.02;
		};
		_gate setPosATL [_pos select 0, _pos select 1, _height];
	};
