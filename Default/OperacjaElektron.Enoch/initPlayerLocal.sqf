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
//Add facewear
 removeGoggles _player;
_player addGoggles "rhsusf_shemagh2_gogg_grn";
//Zeus module
if (!isnil "zen_custom_modules_fnc_register") then{
  ["Mission", "Krzyciu:Destroy Blackfish",
  	{
  		["blackfishdownLocal", []] call CBA_fnc_globalEventJIP;
      ["blackfishdownServer", []] call CBA_fnc_serverEvent;
  	}
  ] call zen_custom_modules_fnc_register;
};
