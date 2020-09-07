/***********************************************************************
    initPlayerLocal.sqf
    Poniższy kod wykona się lokalnie u gracza w trakcie ładowania misji przez grę
************************************************************************/
params ["_player", "_jip"];

//Briefing//
#include "briefing.hpp"
//Lepsze promienie świetlne//
"LightShafts" ppEffectAdjust [0.5, 0.6, 0.45, 0.89];
//intro//
if(!_jip) then
{
[] spawn Krzyc_fnc_intro;
} else {};
//Dodanie maski
_gogle = ["rhsusf_shemagh_grn","rhsusf_shemagh2_grn","G_Bandanna_oli","rhsusf_shemagh2_od"];
_faceWear = selectRandom _gogle;
removeGoggles _player;
_player addGoggles _faceWear;
//Anim brief
if (typeOf player == "VirtualCurator_F" || {!(getPlayerUID player isEqualTo "76561198017606120")}) then {
[]spawn {
	sleep 77;
	[1] spawn Krzyc_fnc_initBriefing;
};
};
