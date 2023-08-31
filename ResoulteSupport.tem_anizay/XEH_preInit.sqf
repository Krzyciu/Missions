#include "script_component.hpp"
/*
 * XEH_preInit.sqf
 * Poniższy kod wykona się na serwerze oraz u każdego gracza przed rozpoczęciem wczytywania obiektów misji
 */

PREP(intro);
PREP(introSlideshow);
PREP(typeText);
PREP(damageUnit);
PREP(boardCut);
PREP(boardFail);
PREP(boardOpen);
PREP(camera);

PREPAMB(ambientCivilians);
PREPAMB(getSafespot);
PREPAMB(civTalk);
PREPAMB(civStop);
PREPAMB(elderTalk);

GVAR(damageBase) = 1;
GVAR(damageMedium) = 1;
GVAR(damageHigh) = 2;

[QGVAR(stabilizeUnit), {
  params ["_unit", "", "_classname"];
  _unit setVariable ["ace_medical_heartRate", 50, true];
  _unit setVariable ["ace_medical_bloodVolume", 4.0, true];
  [{
    ["ace_medical_CPRSucceeded", _this] call CBA_fnc_localEvent;
  }, [_unit], 0.25] call CBA_fnc_waitAndExecute;
  private  _bloodPressure = [95, 65];
  _unit setVariable ["ace_medical_bloodPressure", _bloodPressure, true];
}] call CBA_fnc_addEventHandler;

[QGVAR(damageUnit), {
  params ["_unit"];
  _unit setVariable ["a4es_medical_aceDamageEnabled", true, true];
  _unit setVariable ["ace_medical_damageThreshold", 10, true];
  ["high", 0,7, _unit] spawn FUNC(damageUnit)
}] call CBA_fnc_addEventHandler;

[QGVAR(headshotOff), {
  params ["_unit"];
  _unit setVariable ["a4es_medical_disableHSHandling", true];
}] call CBA_fnc_addEventHandler;

[QGVAR(headshotOn), {
  params ["_unit"];
  _unit setVariable ["a4es_medical_disableHSHandling", false];
}] call CBA_fnc_addEventHandler;

[QGVAR(moveUnit), {
  params ["_unit"];
  _unit moveTo (_unit modelToWorld [10, 10, 0]);
}] call CBA_fnc_addEventHandler;

[QGVAR(playAnimInjured), {
  params ["_unit"];

  private _anim = selectRandom [
  "Acts_CivilInjuredChest_1",
  "Acts_CivilInjuredGeneral_1",
  "Acts_CivilInjuredHead_1",
  "Acts_CivilInjuredLegs_1",
  "Acts_CivilInjuredArms_1",
  "Acts_Injured_Driver_Loop",
  "Acts_InjuredLookingRifle01",
  "Acts_InjuredLookingRifle02",
  "Acts_InjuredLookingRifle03",
  "Acts_InjuredLookingRifle04",
  "Acts_LyingWounded_loop3"];

  _unit switchMove _anim;
}] call CBA_fnc_addEventHandler;

[QGVAR(playAnim), {
  params ["_unit", "_move"];
  _unit switchMove _move;
}] call CBA_fnc_addEventHandler;

[QGVAR(landingGuide), {
  params ["_unit"];

  if (local _unit) then {
    _unit disableAI "ALL";
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

[QGVAR(spawnCity), {
    params ["_city", "_radius", "_civNumber"];
    if (isMultiplayer && {!(isNull A4ES_HC_1)}) then {
      // Exec on headless
      [_city, _radius, _civNumber] remoteExec ["Krzyc_fnc_ambientCivilians", owner A4ES_HC_1];
    } else {
      // Exec on server
      [_city, _radius, _civNumber] spawn FUNC(ambientCivilians);
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(sayText), {
  params ["_text", "_target"];
  if (player distance _target > 15) exitWith {};

  titleText [format [
    "<t color='#653382'><t size='1.7'>%1: </t><t color='#ffffff'><t size='1.7'>%2</t>",
    LLSTRING(Afghan),
    _text
  ], "PLAIN DOWN", 0, false, true];
}] call CBA_fnc_addEventHandler;

if (isServer) then {

    [QGVAR(medevac_1), {
      [
        "task_3657",
        2,
        true
      ] call a4es_tasks_fnc_setTaskState;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(medevac_2), {
      [
        "task_3692",
        2,
        true
      ] call a4es_tasks_fnc_setTaskState;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(medevac_3), {
      [
        "task_3749",
        2,
        true
      ] call a4es_tasks_fnc_setTaskState;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(medevac_4), {
      [
        "task_3749",
        2,
        true
      ] call a4es_tasks_fnc_setTaskState;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(medevac_5), {
      [
        "task_8234",
        2,
        true
      ] call a4es_tasks_fnc_setTaskState;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(medevac_6), {
      [
        "task_8311",
        2,
        true
      ] call a4es_tasks_fnc_setTaskState;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(medevac_7), {
      [
        "task_8318",
        2,
        true
      ] call a4es_tasks_fnc_setTaskState;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(medevac_8), {
      [
        "task_8319",
        2,
        true
      ] call a4es_tasks_fnc_setTaskState;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(medevac_9), {
      [
        "task_8320",
        2,
        true
      ] call a4es_tasks_fnc_setTaskState;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(medevac_10), {
      [
        "task_8321",
        2,
        true
      ] call a4es_tasks_fnc_setTaskState;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(boardFailed), {
      params ["_target"];
      private _missile = "ammo_Missile_Cruise_01" createVehicle (getPos _target);
      _missile setDamage 1;
      deleteVehicle _target;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(civiliansCountServer), {
      [QGVAR(civiliansCount), GVAR(confirmedKills)]call CBA_fnc_GlobalEvent;
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
  _unit say3D [_sound, 90];
}] call CBA_fnc_addEventHandler;
