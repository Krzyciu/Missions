#include "script_component.hpp"
/*
 * XEH_preInit.sqf
 * Poniższy kod wykona się na serwerze oraz u każdego gracza przed rozpoczęciem wczytywania obiektów misji
 */

PREP(intro);
PREP(typeText);

setTerrainGrid 50;

if (isServer) then {

    0 spawn {
      private _handle = [{
        ace_map_DefaultChannel = 0;
        ace_maptools_drawStraightLines = true;
        lambs_danger_disableAIHideFromTanksAndAircraft = true;
        ace_viewdistance_limitViewDistance = 40000;
      }, 0.5, []] call CBA_fnc_addPerFrameHandler;
      sleep 10;
      [_handle] call CBA_fnc_removePerFrameHandler;
    };
};
