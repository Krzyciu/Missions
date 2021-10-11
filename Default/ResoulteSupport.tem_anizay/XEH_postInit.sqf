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
    //0 spawn FUNC(intro);
  }] call CBA_fnc_addEventHandler;

  // Epipen makes your run a bit faster
  ["ace_medical_treatment_medicationLocal", {
    params ["_unit", "", "_classname"];
    if (_classname isEqualTo "Epinephrine") then {
        // Player dead
        if (!alive _unit) exitWith {};

          [_unit, 1.2] remoteExec ["setAnimSpeedCoef", -2];

          [{
            params ["_unit"];
          [_unit, 1] remoteExec ["setAnimSpeedCoef", -2];
          }, _unit, 180] call CBA_fnc_waitAndExecute;
    };
  }] call CBA_fnc_addEventHandler;

  ["visionMode", {
      params ["_unit", "_visionMode"];
      if (isNull objectParent _unit) then {
          if (_visionMode isEqualTo 1) then {
              playSound QGVAR(nvg_on);
          };

          if (_visionMode isEqualTo 0) then {
              playSound QGVAR(nvg_off);
          };
      };
  }] call CBA_fnc_addPlayerEventHandler;

  call (compileScript ["scripts\addZeusModules.sqf"]);
  call (compileScript ["scripts\addInteractions.sqf"]);

  showChat false;
  enableSaving [false, false];
  enableSentences false;
  "LightShafts" ppEffectAdjust [0.2, 1, 0.8, 0.2];
  player setSpeaker "NoVoice";

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

  // Water tank texture
  if (!isNull zamak) then {
    zamak setObjectTexture [1, "\A3\soft_f_orange\Truck_02\Data\Truck_02_water_IDAP_co.paa"];
  };

  // Translator role
  if (typeOf player isEqualTo "B_Survivor_F") then {
    player setVariable ["Krzyc_Translator", true, true];
  };

  CUP_stopLampCheck = true;
};

if (isServer) then {

  GVAR(confirmedKills) = 0;

  addMissionEventHandler ["EntityKilled", {
    params ["_unit"];

    if !(_unit isKindOf "CAManBase") exitWith {};
    private _side = side (group _unit);

    if (_side isEqualTo civilian) then {
      GVAR(confirmedKills) = GVAR(confirmedKills) + 1;
    };
  }];

  // Add travelBags to mineDetector
  ace_minedetector_detectableClasses setVariable ["plp_ct_TravelBagRed", true];

  // Initialize wires colors
  {
    if (!isNull _x) then {
      private _color = selectRandom ["#ff0000", "#00ff00", "#0000ff"];
      _x setVariable ["color", _color, true];
    };
  } forEach [bag_bomb_1, bag_bomb_2, bag_bomb_3, bag_bomb_4, bag_bomb_5];

  // Reskins
  {_x setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.518,0.519,0.455,0.2)"];
   _x setObjectTextureGlobal [1,"#(argb,8,8,3)color(0.518,0.519,0.455,0.2)"];
  } forEach [plane_0, plane_1, plane_2];

  bag_bomb_1 setObjectTextureGlobal [0,"\plp_containers\StcSuitcases\plp_ct_TravelBagWhite_co.paa"];
  bag_bomb_2 setObjectTextureGlobal [0,"\plp_containers\StcSuitcases\plp_ct_TravelBagPink_co.paa"];
  bag_bomb_3 setObjectTextureGlobal [0,"\plp_containers\StcSuitcases\plp_ct_TravelBagGreen_co.paa"];
  bag_bomb_4 setObjectTextureGlobal [0,"\plp_containers\StcSuitcases\plp_ct_TravelBagBlue_co.paa"];

  {_x setObjectTextureGlobal [0,"data\Uniform.paa"];} forEach (getMissionLayerEntities "Players_2") #0;

  // Attached flags
  {_x forceFlagTexture "\A3\Data_F\Flags\flag_AltisColonial_co.paa";} forEach [car_1, car_2, car_3, zamak];

  //Ambient anims
  [{
    s_1 switchMove "Acts_Briefing_SA_Loop";
    s_2 switchMove "Acts_Commenting_On_Fight_loop";
    s_3 switchMove "HubSittingChairC_idle2";
    s_4 switchMove "Acts_Kore_IdleNoWeapon_loop";
    [p_13, true] call ace_medical_status_fnc_setUnconsciousState;
    p_13 switchMove "Acts_LyingWounded_loop3";
  }, [], 25] call CBA_fnc_waitAndExecute;

};
