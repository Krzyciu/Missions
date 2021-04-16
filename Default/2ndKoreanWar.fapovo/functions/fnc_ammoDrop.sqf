missionNamespace setVariable ["ammoDrop",2,true];
private _posStart = getPosASL gl_start;
private _pos = getPosASL player;
private _posEnd = [_pos#0, _pos#1 , (_pos#2) + 150];
private _dir = _posStart getDir _posEnd;
private _plane = "UK3CB_AAF_B_C130J_G_CARGO" createVehicle [0,0,0];
_plane engineOn true;
_plane setDir _dir;
private _przewodnik = "TestSphere2" createVehicle [0, 0, 0];
_przewodnik setPosASL _posStart;
_przewodnik hideObjectGlobal true;
_przewodnik setDir _dir;
_przewodnik setVelocity [70*(sin(_dir)),70*(cos(_dir)),0];
_plane attachTo [_przewodnik, [0,0,-2]];

waitUntil{
sleep 1;
_plane distance _posEnd < 200
};

private _chute1 = createvehicle ["B_Parachute_02_F", [0,0,0]];
private _chute2 = createvehicle ["B_Parachute_02_F", [0,0,0]];
private _chute3 = createvehicle ["B_Parachute_02_F", [0,0,0]];
private _chute4 = createvehicle ["B_Parachute_02_F", [0,0,0]];
private _smoke1 = createVehicle ["SmokeShellYellow", [0,0,0]];
private _smoke2 = createVehicle ["SmokeShellYellow", [0,0,0]];
_chute1 setPosASL [(getPosASL _plane) #0, (getPosASL _plane) #1 , ((getPosASL _plane) #2) - 35];
ammo_1 attachTo [_chute1,[0,0,0]];
sleep 0.75;
_chute2 setPosASL [(getPosASL _plane) #0, (getPosASL _plane) #1 , ((getPosASL _plane) #2) - 40];
ammo_2 attachTo [_chute2,[0,0,0]];
sleep 0.75;
_chute3 setPosASL [(getPosASL _plane) #0, (getPosASL _plane) #1 , ((getPosASL _plane) #2) - 50];
med_1 attachTo [_chute3,[0,0,0]];
sleep 0.75;
_chute4 setPosASL [(getPosASL _plane) #0, (getPosASL _plane) #1 , ((getPosASL _plane) #2) - 30];
med_2 attachTo [_chute4,[0,0,0]];
sleep 25;
_smoke1 attachTo [ammo_1,[0,0,0]];
_smoke2 attachTo [med_2,[0,0,0]];
sleep 70;
private _vehArray = [_chute1,_chute2,_chute3,_chute4,_przewodnik,_plane,_smoke1,_smoke2];
{deleteVehicle _x} forEach _vehArray;
