params ["_kruk", "_targetWp"];


// diag_log format ["crow moving %1", velocityModelSpace _crow];

private _dis = _kruk distance _targetWp;
private _time = (_dis);

if (_time > 20) then {
	_time = _time/5;
} else {
	if (_time > 15) then {
		_time = _time/4;
	} else {
		if (_time > 10) then {
			_time = _time/3;
		} else {
			if (_time > 5) then {
				_time = _time/2;
			} else {
				if (_time < 1) then {
					_targetWp = [_targetWp] call kruki_fnc_circle;
				};
			}
		};
	};
};


_kruk camsetpos _targetWp;
_kruk camcommit _time;
