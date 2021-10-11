#include "script_component.hpp"
/*
 * XEH_postInit.sqf
 * Poniższy kod wykona się po starcie misji, gdy wykonają się już pozostałe inity.
 * Dokumentacja: https://community.bistudio.com/wiki/Arma_3:_Functions_Library#Pre_and_Post_Init
 */

if (hasInterface) then {
  // Briefing
  #include "briefing.hpp"

  // Intro
  ["CBA_loadingScreenDone", {
    if (didJIP) exitWith {};
    0 spawn FUNC(intro);
  }] call CBA_fnc_addEventHandler;

  player addEventHandler ["killed", {
    0 call FUNC(playerKilled);
  }];

  enableSaving [false, false];
  enableSentences false;
  "LightShafts" ppEffectAdjust [0.3, 0.4, 0.4, 0.8];
  setViewDistance 950;
  setObjectViewDistance 850;

  player setSpeaker "NoVoice";
  setCompassOscillation [rad 45, 180, 180];
  // Disable modules simulation
  0 spawn {
      {
        {
          _x enableSimulation false;
        } forEach (allMissionObjects _x);
        sleep 0.5;
      } forEach [
        "ModuleHideTerrainObjects_F",
        "ModuleEditTerrainObject_F",
        "a3cs_modules_units3DENComp",
        "a3cs_modules_onDeleted",
        "a3cs_modules_createTask",
        "a3cs_modules_addAction",
        "a3cs_modules_onPlayerInArea"
      ];
  };
};


if (isServer) then {
  0 spawn {
    sleep 10;
    ["Krzyc_intro"] call CBA_fnc_globalEvent;
  };
};
