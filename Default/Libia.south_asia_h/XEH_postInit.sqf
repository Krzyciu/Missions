#include "script_component.hpp"
/*
 * XEH_postInit.sqf
 * Poniższy kod wykona się po starcie misji, gdy wykonają się już pozostałe inity.
 * Dokumentacja: https://community.bistudio.com/wiki/Arma_3:_Functions_Library#Pre_and_Post_Init
 */

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
     "a3cs_modules_onDeleted",
     "a3cs_modules_createTask",
     "a3cs_modules_addAction",
     "a3cs_modules_onPlayerInArea"
   ];
};

if (hasInterface) then {
  // Briefing
  #include "briefing.hpp"

  // Intro
  ["CBA_loadingScreenDone", {
    if (didJIP) exitWith {};
    //0 spawn FUNC(intro);
  }] call CBA_fnc_addEventHandler;

  call (compileScript ["scripts\addZeusModules.sqf"]);
  call (compileScript ["scripts\addInteractions.sqf"]);

  showChat false;
  enableSaving [false, false];
  enableSentences false;
  "LightShafts" ppEffectAdjust [0.2, 1, 0.8, 0.2];
  player setSpeaker "NoVoice";

  CUP_stopLampCheck = true;

  setViewDistance 30000;
  setObjectViewDistance 30000;
};

if (isServer) then {
};
