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
//yellow postprocess//

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
