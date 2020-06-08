if (!hasInterface) exitWith {};
params
[
	["_vehicle",objNull,[objNull]],		// obiekt do animacji
	["_time",60,[1]]					// czas trwania animacji
];
private _pos = getpos _vehicle;
_przewodnik2 = "TestSphere2" createVehicleLocal [0, 0, 0];
_przewodnik2 setPosASL getPosASL _vehicle;
_przewodnik2 hideObjectGlobal true;
_vehicle2 = "Sign_Sphere200cm_Geometry_F" createVehicleLocal [0, 0, 0];
_vehicle2 attachTo [_przewodnik2,[0,0,0]];
_vehicle attachTo [_przewodnik2,[0,0,0]];

// Light point
private _light2 = "#lightpoint" createVehicleLocal [0,0,0];
_light2 setLightDayLight true;
_light2 setLightUseFlare true;
_light2 setLightFlareSize 10;
_light2 setLightFlareMaxDistance 4000;
_light2 setLightAmbient[1,0.5,1];
_light2 setLightColor[1,0.5,0.4];
_light2 setLightAttenuation [0,0,0,0,0,4000];
_light2 setLightBrightness 5;
_light2 attachTo [_vehicle2, [0,0,0]];

// Refract effect
_refractFX = "#particlesource" createVehicleLocal [0,0,0];
_refractFX setParticleClass "ObjectDestructionFire1Smallx";
_refractFX setpos _pos;

_refractFX setParticleRandom [0, [0, 0, 0], [0.1, 0.1, 0.1], 0, 0, [0, 0, 0, 0.1], 0, 0];
_refractFX setParticleParams [["\a3\Data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 0], "", "Billboard", 1, 12, [0, 0, 0.3], [0, 0, 0.1], 0, 10, 7.8, 0, [0.6, 3], [[1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _vehicle2, 0, false, 0, [[0,0,0,0]]];
_refractFX setDropInterval 1;

sleep _time;

// fade out efektu
for "_i" from 1 to 60 do
{

	_refractFX setParticleParams [["\a3\Data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 0], "", "Billboard", 1, 12, [0, 0, 0.3], [0, 0, 0.1], 0, 10, 7.8, 0, [0.6/_i*0.5, 3/_i*0.5], [[1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _vehicle2, 0, false, 0, [[0,0,0,0]]];
	_light2 setLightBrightness (linearConversion [1,200,_i,0.4,0.01,true]);
	sleep 0.2;
};
sleep 5;
_przewodnik2 setVelocity [0,0,1];
_przewodnik2 say3D ["orbSound2", 2000, 3];
sleep 2;
_przewodnik2 setVelocity [0,0,2];
_przewodnik2 say3D ["orbSound2", 2000, 3];
sleep 2;
_przewodnik2 setVelocity [0,0,3];
_przewodnik2 say3D ["orbSound2", 2000, 3];
sleep 1;
_przewodnik2 setVelocity [0,0,4];
_przewodnik2 say3D ["orbSound2", 2000, 3];
sleep 1;
_przewodnik2 setVelocity [0,0,6];
_przewodnik2 say3D ["orbSound2", 2000, 3];
sleep 1;
_przewodnik2 setVelocity [0,0,8];
_przewodnik2 say3D ["orbSound2", 2000, 3];
sleep 0.5;
_przewodnik2 setVelocity [0,0,16];
_przewodnik2 say3D ["orbSound2", 2000, 3];
sleep 0.5;
_przewodnik2 setVelocity [0,0,32];
_przewodnik2 say3D ["orbSound2", 2000, 3];
sleep 0.5;
_przewodnik2 setVelocity [0,0,64];
_przewodnik2 say3D ["orbSound2", 2000, 3];
sleep 0.5;
_przewodnik2 setVelocity [0,0,400];
_przewodnik2 say3D ["orbSound2", 2000, 3];
sleep 5;
{deleteVehicle _x}foreach [_refractFX,_light2,_przewodnik2,_vehicle,_vehicle2];
