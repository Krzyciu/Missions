#include "script_component.hpp"
/*
 * XEH_preInit.sqf
 * Poniższy kod wykona się na serwerze oraz u każdego gracza przed rozpoczęciem wczytywania obiektów misji
 */

PREP(intro);
PREP(typeText);
PREP(checkWires);
PREP(damageUnit);
PREP(landingGuide);
PREP(bombDefuse);
PREP(bombFail);
PREP(civTalk);

if (isServer) then {
    0 spawn {
      private _handle = [{
      ace_medical_statemachine_AIUnconsciousness = true;
      ace_magazinerepack_timePerAmmo = 0.5;
      ace_magazinerepack_timePerBeltLink = 3.25;
      ace_magazinerepack_timePerMagazine = 1;
      ace_map_DefaultChannel = 0;
      ace_maptools_drawStraightLines = true;
      ace_medical_feedback_painEffectType = 1;
      ace_medical_feedback_bloodVolumeEffectType = 2;
      ace_weather_enabled = false;

      }, 0.5, []] call CBA_fnc_addPerFrameHandler;
      sleep 10;
      [_handle] call CBA_fnc_removePerFrameHandler;
    };

    [QGVAR(medevac_1), {
      [
        "task_3657",
        2,
        true
      ] call a3cs_tasks_fnc_setTaskState;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(medevac_2), {
      [
        "task_3692",
        2,
        true
      ] call a3cs_tasks_fnc_setTaskState;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(medevac_3), {
      [
        "task_3749",
        2,
        true
      ] call a3cs_tasks_fnc_setTaskState;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(medevac_4), {
      [
        "task_3749",
        2,
        true
      ] call a3cs_tasks_fnc_setTaskState;
    }] call CBA_fnc_addEventHandler;

};


if !(hasInterface) exitWith {};

[QGVAR(civiliansCount), {
  [
    [
      [format ["Zabici cywile: %1", GVAR(confirmedKills)], "font = 'PuristaMedium'"]
    ],
  	safeZoneX - 0.01,
  	safeZoneY + (1 - 0.125) * safeZoneH,
  	true,
  	"<t align = 'right' size = '1.0'>%1</t>"
  ] spawn BIS_fnc_typeText2;
}] call CBA_fnc_addEventHandler;

[QGVAR(playSound), {
  speakers_1 say3D [QGVAR(scramble), 2100];
}] call CBA_fnc_addEventHandler;
