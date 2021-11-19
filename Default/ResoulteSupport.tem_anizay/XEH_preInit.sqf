#include "script_component.hpp"
/*
 * XEH_preInit.sqf
 * Poniższy kod wykona się na serwerze oraz u każdego gracza przed rozpoczęciem wczytywania obiektów misji
 */

PREP(intro);
PREP(typeText);
PREP(damageUnit);
PREP(boardCut);
PREP(boardFail);
PREP(boardOpen);

PREPAMB(ambientCivilians);
PREPAMB(getSafespot);
PREPAMB(civTalk);
PREPAMB(civStop);

[QGVAR(playAnim), {
  params ["_unit"];
  private _anim = selectRandom ["Acts_CivilInjuredChest_1", "Acts_CivilInjuredGeneral_1", "Acts_CivilInjuredHead_1", "Acts_CivilInjuredLegs_1", "Acts_CivilInjuredArms_1", "Acts_Injured_Driver_Loop", "Acts_InjuredLookingRifle01", "Acts_InjuredLookingRifle02", "Acts_InjuredLookingRifle03", "Acts_InjuredLookingRifle04", "Acts_LyingWounded_loop3"];
  _unit switchMove _anim;
}] call CBA_fnc_addEventHandler;

[QGVAR(surrender), {
  params ["_unit"];
  _unit switchMove _anim;
}] call CBA_fnc_addEventHandler;

[QGVAR(landingGuide), {
  params ["_unit"];
  if (isServer) then {
    private _chemlightR = "Chemlight_yellow_Infinite" createVehicle [0,0,0];
    _chemlightR attachTo [_unit, [0,0,0], "righthand"];
    private _chemlightL = "Chemlight_yellow_Infinite" createVehicle [0,0,0];
    _chemlightL attachTo [_unit, [0,0,0], "lefthand"];
    [{
      params ["_chemlightR", "_chemlightL"];
      {deleteVehicle _x} forEach [_chemlightR,_chemlightL];
    }, [_chemlightR, _chemlightL], 20] call CBA_fnc_waitAndExecute;
  };

  _unit spawn {
    params ["_unit"];
    _unit switchMove "Acts_JetsMarshallingEmergencyStop_in";
    sleep 1.366;
    _unit switchMove "Acts_JetsMarshallingEmergencyStop_loop";
    sleep 2;
    _unit switchMove "Acts_JetsMarshallingStraight_loop";
    sleep 8;
    _unit switchMove "Acts_JetsMarshallingEnginesOn_out";
    sleep 2;
    _unit switchMove "Acts_JetsMarshallingClear_in";
    sleep 1;
    _unit switchMove "Acts_JetsMarshallingClear_loop";
    sleep 2;
    _unit switchMove "Acts_JetsMarshallingClear_out";
  };
}] call CBA_fnc_addEventHandler;

if (isServer) then {

    0 spawn {
      private _handle = [{
        ace_medical_statemachine_AIUnconsciousness = true;
        ace_magazinerepack_timePerAmmo = 0.5;
        ace_magazinerepack_timePerBeltLink = 3.25;
        ace_magazinerepack_timePerMagazine = 1;
        ace_map_DefaultChannel = 0;
        ace_maptools_drawStraightLines = true;
        ace_medical_feedback_bloodVolumeEffectType = 2;
        lambs_danger_disableAIHideFromTanksAndAircraft = true;
        TFAR_AICanHearPlayer = true;
        grad_trenches_functions_shortEnvelopeDigTime = 30;
        ace_trenches_smallEnvelopeDigDuration = 30;
        grad_trenches_functions_smallEnvelopeDigTime = 45;
        grad_trenches_functions_vehicleEnvelopeDigTime = 75;
        grad_trenches_functions_bigEnvelopeDigTime = 90;
        grad_trenches_functions_LongEnvelopeDigTime = 90;
        grad_trenches_functions_giantEnvelopeDigTime = 90;
        ace_trenches_bigEnvelopeDigDuration = 90;
        cba_disposable_dropUsedLauncher = 1;
        cba_disposable_replaceDisposableLauncher = false;
        ace_nightvision_noiseScaling = 0.45;
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

    [QGVAR(medevac_5), {
      [
        "task_8234",
        2,
        true
      ] call a3cs_tasks_fnc_setTaskState;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(medevac_6), {
      [
        "task_8311",
        2,
        true
      ] call a3cs_tasks_fnc_setTaskState;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(medevac_7), {
      [
        "task_8318",
        2,
        true
      ] call a3cs_tasks_fnc_setTaskState;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(medevac_8), {
      [
        "task_8319",
        2,
        true
      ] call a3cs_tasks_fnc_setTaskState;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(medevac_9), {
      [
        "task_8320",
        2,
        true
      ] call a3cs_tasks_fnc_setTaskState;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(medevac_10), {
      [
        "task_8321",
        2,
        true
      ] call a3cs_tasks_fnc_setTaskState;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(boardFailed), {
      params ["_target"];
      private _missile = "ammo_Missile_Cruise_01" createVehicle (getPos _target);
      _missile setDamage 1;
      deleteVehicle _target;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(damageUnit), {
      params ["_unit"];
      _unit setVariable ["a3cs_medical_aceDamageEnabled", true, true];
      _unit setVariable ["ace_medical_damageThreshold", 10, true];
      ["high", true, _unit] spawn FUNC(damageUnit)
    }] call CBA_fnc_addEventHandler;
};

if !(hasInterface) exitWith {};

[QGVAR(civiliansCount), {
  params ["_kills"];
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

[QGVAR(civKilled), {
  params ["_count", "_killerName"];
  if ((side (group player)) isNotEqualTo sideLogic) exitWith {};
  hint format ["Nieuzbrojony cywil zabity przez %1. Zabitych: %2", _killerName, _count];
  diag_log text format ["Nieuzbrojony cywil zabity przez %1. Zabitych: %2", _killerName, _count];
}] call CBA_fnc_addEventHandler;

[QGVAR(playSound), {
  speakers_1 say3D [QGVAR(scramble), 2400];
}] call CBA_fnc_addEventHandler;

[QGVAR(ambientTalk), {
  params ["_unit", "_sound"];
  _unit say3D [_sound, 120];
}] call CBA_fnc_addEventHandler;
