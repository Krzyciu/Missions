params ["_sounds"];
private _ambianceSounds = [];
private _minimalDistance = 100;
private _maximalDistance = 400;
private _minDelayBetweensounds = 30;
private _maxDelayBetweenSounds = 60;
private _volume = 4;
private _range = 800;

if (isNil "MISSION_ROOT") then {
    if(isDedicated) then {
        MISSION_ROOT = "mpmissions\__CUR_MP." + worldName + "\";
    } else {
        MISSION_ROOT = str missionConfigFile select [0, count str missionConfigFile - 15];
    };
};


if (!isServer) exitWith {};
if (missionNamespace getVariable ["IS_AMBIENT_RUNNING", false]) exitWith {};

IS_AMBIENT_RUNNING = true;

{
	_x = [_x] call CBA_fnc_removeWhitespace;

	if (isClass (missionConfigFile >> "CfgSounds" >> _x)) then {
		// CfgSounds nie akceptuje podwojnego slasha
		private _soundPath = getArray (missionConfigFile >> "CfgSounds" >> _x >> "sound") select 0;
		if (_soundPath select [0,1] == "\") then {
			_ambianceSounds pushBack (MISSION_ROOT + (_soundPath select [1]));
			// _ambianceSounds pushBack (_missionRoot + (_soundPath select [1]));
		} else {
			_ambianceSounds pushBack (MISSION_ROOT + _soundPath);
			// _ambianceSounds pushBack (_missionRoot + _soundPath);
		};
	} else {
		if (isClass (configFile >> "CfgSounds" >> _x)) then {
			_soundPath = (getArray(configFile >> "CfgSounds" >> _x >> "sound")) param [0, ""];
			if ((_soundPath select [0, 1]) == "\") then {_soundPath = _soundPath select [1];};
			_ambianceSounds pushBack _soundPath;
		} else {
			// nie ma dźwięku
		};
	};

	false
} count _sounds;

if (count _ambianceSounds == 0) exitWith {};
{
	if ((_x find ".") == -1) then {
		_ambianceSounds set [_forEachIndex, _x + ".wss"];
	};
} forEach _ambianceSounds;

[{
	params ["_args", "_pfhHandle"];
	_args params ["_ambianceSounds", "_minimalDistance", "_maximalDistance", "_minDelayBetweensounds", "_maxDelayBetweenSounds", "_volume", "_lastTimePlayed", "_range", "_surfacetypes"];

	if (!(IS_AMBIENT_RUNNING)) exitWith {
		[_pfhHandle] call CBA_fnc_removePerFrameHandler;
	};

	if (CBA_missionTime - _lastTimePlayed >= ((_minDelayBetweensounds + random(_maxDelayBetweenSounds)) min _maxDelayBetweenSounds)) then {

		// Wszyscy gracze w sesji
		private _allUnits = if (isMultiplayer) then {playableUnits select {side _x isEqualTo west}} else {[ACE_player]};
		// _allUnits = _allUnits select {!(_x getVariable ["JRM_spectator_isSet",false])};


		// Czy są w ogole gracze
		if (count _allUnits > 0) then {
			// znalezienie miejsca  skad bedzie grane
			private _targetUnit = selectRandom _allUnits;
			private _newPosASL = AGLtoASL (_targetUnit getPos [_minimalDistance + random (_maximalDistance - _minimalDistance), random 360]);

			// jak sa odpowiednio daleko to gra
			if ({(_newPosASL distance _x < (_minimalDistance / 2))}count _allUnits == 0) then {
					private _soundFile = selectRandom _ambianceSounds;
					playSound3D [_soundFile, objNull,  false, _newPosASL, _volume, 1, _range];
					// systemchat _soundFile;
					_args set [6, CBA_missionTime];
				};
			} else {
				//zbyt blisko gracza
			};
		};
}, 0.5, [_ambianceSounds, _minimalDistance, _maximalDistance, _minDelayBetweensounds, _maxDelayBetweenSounds, _volume, CBA_missionTime, _range] ] call CBA_fnc_addPerFrameHandler;
