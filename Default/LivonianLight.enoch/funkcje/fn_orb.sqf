if (!hasInterface) exitWith{};
_kula = _this select 0;
_speed = _this select 1;

_przewodnik = "TestSphere2" createVehicleLocal [0, 0, 0];
_przewodnik setPosASL getPosASL _kula;
_przewodnik hideObjectGlobal true;
_przewodnik setDir getDir _kula;
_orb_obj = "#lightpoint" createVehicleLocal getPosASL _przewodnik;
_orb_obj setLightDayLight true;
_orb_obj setLightUseFlare true;
_orb_obj setLightFlareSize 5;
_orb_obj setLightFlareMaxDistance 5000;
_orb_obj setLightAmbient[1,0.5,1];
_orb_obj setLightColor[1,0.5,0.4];
_orb_obj setLightAttenuation [0,0,0,0,0,4000];
_orb_obj setLightBrightness 10;
_orb_obj attachto [_przewodnik,[0,0,0.3]];
sleep 0.2;
private _vel = velocity _przewodnik;
private _dir = direction _przewodnik;

_przewodnik setVelocity [
	(_vel select 0) + (sin _dir * _speed),
	(_vel select 1) + (cos _dir * _speed),
	(_vel select 2)
];
while {alive _orb_obj} do {

_orb_obj say3D ["orbSound", 2000, 3];
	sleep 5;
};


sleep 30;
deleteVehicle _przewodnik;
deleteVehicle _orb_obj;
