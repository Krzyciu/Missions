params ["_kula", "_speed"];
if (!hasInterface) exitWith{};
Myvar = [];

private _przewodnik = "TestSphere2" createVehicleLocal [0,0,0];
_przewodnik setPosASL getPosASL _kula;
_przewodnik hideObject true;
_przewodnik setDir getDir _kula;
drop [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,2.5,[0,0,500],[0,0,-200],0,9,7,0,[1,10],[[0,0,1,1],[0.9,.9,1,1]],[1],0,0,"","",_przewodnik];

private _light = "#lightpoint" createVehicleLocal [0,0,0];
_light setLightDayLight true;
_light setLightUseFlare true;
_light setLightFlareMaxDistance 500;
_light setLightAmbient[1,0.5,1];
_light setLightColor[0.3,0.2,1];
_light setLightBrightness 18;
_light setLightFlareSize 18;
_light attachTo [_przewodnik, [0, 0, 2.5]];

Myvar pushBack _przewodnik;
sleep 0.2;

private _dir = direction _przewodnik;

_przewodnik setVelocity [(sin _dir * _speed),(cos _dir * _speed),0];

private _sound = [{
private _l = Myvar select 0;
_l say3D ["orbSound", 2000, 3];
},
2.3
] call CBA_fnc_addPerFrameHandler;



sleep 80;
drop [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,2.5,[0,0,0],[0,0,200],0,9,7,0,[10,1],[[1,1,1,1],[0.9,.9,1,1]],[1],0,0,"","",_przewodnik];
sleep 0.5;
deleteVehicle _przewodnik;
deleteVehicle _light;
[_sound] call CBA_fnc_removePerFrameHandler;
