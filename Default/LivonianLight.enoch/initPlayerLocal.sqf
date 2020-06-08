/***********************************************************************
    initPlayerLocal.sqf
    Poniższy kod wykona się lokalnie u gracza w trakcie ładowania misji przez grę
************************************************************************/
params ["_player", "_jip"];

//Briefing//
#include "briefing.hpp"
//better lightshafts//
"LightShafts" ppEffectAdjust [0.5, 0.6, 0.45, 0.89];
//a3c only rang check interaction//
_rangacheck = ["ranga","Sprawdź rangę","",{[] spawn Krzyc_fnc_ranga},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _rangacheck] call ace_interact_menu_fnc_addActionToObject;
//intro//
if(!_jip) then
{
[] spawn Krzyc_fnc_intro;
} else {};
//earplugs//
player addItem "ACE_EarPlugs";
//ambient fog//
if (typeOf player == "VirtualCurator_F" || {!(getPlayerUID player isEqualTo "76561198017606120")}) then {
  [
    70, // ["_maxDist", 80, [0]],
    26, // ["_minDist", 10, [0]],
    8, // ["_amount", 15, [0]],
    0.3, // ["_dropTimer", 0.15, [0]],
    12, // ["_maxSize", 7, [0]],
    5, // ["_minSize", 3, [0]],
    5, // ["_height", -0.3, [0]],
    0.02, // ["_transparency", 0.3, [0]],
    [1,0.2,0.3], // ["_color", [1,1,1], [[]], 3],
    nil, // ["_spawn", 15, [0]],
    nil, // ["_maxLifetime", 15, [0]],
    nil, // ["_minLifetime", 8, [0]],
    false, // ["_windAffected", true, [false]],
    0, // ["_windstrength", 1, [0]],
    nil, // ["_windForward", 0, [0]],
    nil, // ["_windRight", 0, [0]],
    nil // ["_windUp", 0, [0]],
    // {!([vehicle ace_player] call ace_common_fnc_isInBuilding)} // ["_cond", {true}, [{}]]
] call mission_fnc_ambientFog};
//yellow postprocess//
[] spawn {if(isNil "krzyc_yellowfilter") then {
        private _name = "ColorCorrections";
        private _priority = 400;
        krzyc_yellowfilter = ppEffectCreate [_name, _priority];
        while {
            krzyc_yellowfilter < 0
        } do {
            _priority = _priority + 1;
            krzyc_yellowfilter = ppEffectCreate [_name, _priority];
        };
        krzyc_yellowfilter ppEffectEnable true;
    };

    krzyc_yellowfilter ppEffectAdjust [
        1, // brigthness
        0.95, // contrast
        0, // offset
        [0,0,0,0], // color blend
        [1,0.55,0,0.55], // colorization
        [0.299, 0.587, 0.114, 0] // desaturation
        ];
    krzyc_yellowfilter ppEffectCommit 1;
};

//occlusion effects over roads//
[] spawn {
    private _roads = [];
    private _connectedRoads = [];
    private _connectedRoad = objNull;
    private _dir = 0;
    private _pos = [];
    private _max = 200;
    private _maxIter = 10;
    private _cur = 0;
    private _curIter = 0;
    private _roadPos = [];
    private _surfacetype = "";
    private _campos = [];

    private _streets = ["#GdtKlTarmac", "#GdtKlWeatheredTarmac", "#GdtKlSoil"];
    while {true} do {
        if (particlesQuality > 0) then {
            _campos = positionCameraToWorld [0,0,0];
            _roads = _campos nearRoads 150;
            _cur = 0;
            {
                _roadPos = getpos _x;
                _surfacetype = surfaceType _roadPos;
                if (_cur <= _max && {_streets findif {_surfacetype isEqualTo _x} > -1}) then {
                    _connectedRoads = roadsConnectedTo _x;
                    if !(_connectedRoads isEqualTo []) then {
                        _connectedRoad = _connectedRoads select 0;
                        _dir = _x getDir _connectedRoad;

                        _curIter = 0;
                        for "_a" from 1 to 20 do {
                            if (_maxIter <= _curIter) exitWith {};
                            _pos = [[_roadPos, 6, 50, _dir, true]] call CBA_fnc_randPosArea;
                            if ((_campos distance2D _pos) >= 60 && {_surfacetype isEqualTo (surfaceType _pos)}) then {
                                _pos = _pos vectorAdd [0,0,-0.5];
                                drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 5, _pos, [0, 0, 0.25], 0, 11, 7.9, 0, [0.01, 5, 5, 0.01], [[0.1, 0.1, 0.1, 0.5]], [0.08], 1, 0, "", "", ""];
                                _cur = _cur + 1;
                                _curIter = _curIter + 1;
                            };
                        };
                    };
                };
            } forEach _roads;
        };
        sleep 1;
    };
};

["Krzyc_krukiprzelot", {
    [] spawn {
        private _start = getMarkerPos "crow_start";
        private _target = createSimpleObject ["building", getMarkerPos "crow_end", true];
        private _crows = ["Crowe", _start, 25, 1, 25, _target] call kruki_fnc_create;
        [{((_this select 0) select 0) distance2d (_this select 1) < 100}, {
            deleteVehicle (_this select 1);
        }, [_crows, _target]] call CBA_fnc_waitUntilAndExecute
    };
}] call CBA_fnc_addEventHandler;


private ["_dzwiek"];

enableSentences false;


    //jezeli chuj podejdzie to dostaje dmg
    0 = [] spawn {
    if (!hasInterface) exitWith {};
    private ["_target", "_targets"];
    while {alive player} do {


    _targets = nearestObjects [player, ["O_Soldier_VR_F"], 5];
    if (count _targets > 0) then {
        _target = _targets select 0;

            if ((player distance _target < 3) && (alive _target)) then {

            [player, 0.20, (selectRandom ["Head","body","hand_l","hand_r","leg_l","leg_r"]), "stab"] call ace_medical_fnc_addDamageToUnit;
            };
    };
 sleep 1;
 };
};


        //pentla dzwiekow standardowych
        0 = [] spawn {
       private ["_targets"];

        sleep 4; // dajmy czas na rozruch

            while {alive player} do {

            _targets = nearestObjects [player, ["O_Soldier_VR_F"], 50];
            if (count _targets > 0) then {

        {
        if (_x distance player < 200) then {sleep (random 3); _x say3D [(selectRandom ["duszek1","duszek2","duszek3","duszek4","duszek5"]),200,1];};
        } foreach _targets;


            sleep 6;
         };
        };
       };
