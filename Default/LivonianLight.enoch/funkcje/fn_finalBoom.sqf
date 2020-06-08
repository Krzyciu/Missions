if (!hasInterface) exitWith {};

_kulka = _this select 0;

_przewodnik4 = "TestSphere2" createVehicleLocal [0, 0, 0];
_przewodnik4 setPosASL getPosASL _kulka;
_przewodnik4 hideObjectGlobal true;
_vehicle = "Sign_Sphere200cm_Geometry_F" createVehicleLocal [0, 0, 0];
_vehicle attachTo [_przewodnik4,[0,0,0]];

// Light point
private _light = "#lightpoint" createVehicleLocal [0,0,0];
_light setLightDayLight true;
_light setLightUseFlare true;
_light setLightFlareSize 15;
_light setLightFlareMaxDistance 5000;
_light setLightAmbient[1,0.5,1];
_light setLightColor[1,0.5,0.4];
_light setLightAttenuation [0,0,0,0,0,4000];
_light setLightBrightness 20;
_light attachTo [_vehicle, [0,0,0]];

_przewodnik4 setVelocity [0,0,-10];
_przewodnik4 say3D ["orbSound2", 2000, 3];
sleep 2;
_przewodnik4 setVelocity [0,0,-20];
_przewodnik4 say3D ["orbSound2", 2000, 3];
sleep 2;
_przewodnik4 setVelocity [0,0,-30];
_przewodnik4 say3D ["orbSound2", 2000, 3];
sleep 1;
_przewodnik4 setVelocity [0,0,-40];
_przewodnik4 say3D ["orbSound2", 2000, 3];
sleep 1;
_przewodnik4 setVelocity [0,0,-60];
_przewodnik4 say3D ["orbSound2", 2000, 3];
sleep 1;
_przewodnik4 setVelocity [0,0,-80];
_przewodnik4 say3D ["orbSound2", 2000, 3];
