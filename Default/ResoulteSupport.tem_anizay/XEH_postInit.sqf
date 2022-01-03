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
    if (didJIP) exitWith {
      player setObjectTextureGlobal [0,"data\Uniform.paa"];
    };
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

  GVAR(nvg) = ppEffectCreate ["colorCorrections", 3749];
  GVAR(nvg) ppEffectForceInNVG true;
  GVAR(nvg) ppEffectCommit 0;
  GVAR(nvg) ppEffectEnable false;

  ["visionMode", {
      params ["_unit", "_visionMode"];
      if (_visionMode isEqualTo 1) then {
          GVAR(nvg) ppEffectEnable true;
          GVAR(nvg) ppEffectAdjust [0.9, 0.4, 0, [0, 0.1, 0.2, 0], [0.8, 1, 0.75, 0], [1, 1, 1, 0]];
          GVAR(nvg) ppEffectCommit 0;
          playSound QGVAR(nvg_on);
      } else {
          GVAR(nvg) ppEffectEnable false;
          playSound QGVAR(nvg_off);
      };
  }] call CBA_fnc_addPlayerEventHandler;

    // Register a simple keypress to an action
  #include "\a3\ui_f\hpp\defineDIKCodes.inc"

  ["[Resolute Support]", QGVAR(holdCiv), LLSTRING(Action_Stop), {
      private _object = cursorObject;
      // Condition: canInteract
      if !(alive _object && (side _object) == civilian) exitWith {};
      // Statement
      _object call FUNC(civStop);
  }, {
  },
  [DIK_P, [false, false, false]]] call CBA_fnc_addKeybind;

  ["[Resolute Support]", QGVAR(civTalk), LLSTRING(Action_Talk), {
      private _object = cursorObject;
      // Condition: alreadySpoken
      if (_object getVariable [QGVAR(spoken), false]) exitWith {};
      // Condition: canInteract
      if !(alive _object && (side _object) == civilian) exitWith {};
      // Statement
      private _sound = format ["Krzyc_M%1ambient%2", (floor random 5) +1,(floor random 31)];
      [QGVAR(ambientTalk), [_object, _sound]] call CBA_fnc_globalEvent;
      _object call FUNC(civTalk);
  }, {
  },
  [DIK_O, [false, false, false]]] call CBA_fnc_addKeybind;


  call (compileScript ["scripts\addZeusModules.sqf"]);
  call (compileScript ["scripts\addInteractions.sqf"]);

  showChat false;
  enableSaving [false, false];
  enableSentences false;
  "LightShafts" ppEffectAdjust [0.2, 1, 0.8, 0.2];
  player setSpeaker "NoVoice";
  player addEventHandler ["Fired", {addCamShake [1, 0.5,20];}];
  // Water tank texture
  if (!isNull zamak) then {
    zamak setObjectTexture [1, "\A3\soft_f_orange\Truck_02\Data\Truck_02_water_IDAP_co.paa"];
  };

  CUP_stopLampCheck = true;

  // Add travelBags to mineDetector
  ace_minedetector_detectableClasses setVariable ["plp_ct_TravelBagRed", true];

  Color_PP = ppEffectCreate ["colorCorrections", 1501];
  Color_PP ppEffectEnable true;
  Color_PP ppEffectAdjust [1,1.02,-0.005,[0,0,0,0],[1,0.8,0.6,0.65],[0.199,0.587,0.115,0]];
  Color_PP ppEffectCommit 0;
};

if (isServer) then {

  GVAR(confirmedKills) = 0;

  addMissionEventHandler ["EntityKilled", {
    params ["_unit"];

    if !(_unit isKindOf "CAManBase") exitWith {};
    private _side = side (group _unit);

    if (_side isEqualTo civilian) then {
      GVAR(confirmedKills) = GVAR(confirmedKills) + 1;
      [QGVAR(civKilled), [GVAR(confirmedKills), name _killer]] call CBA_fnc_globalEvent;
    };
  }];

  // Initialize bombs id's
  {
    if (!isNull _x) then {
      private _id = selectRandom [1,2,3,4,5,6,7,8,9,10];
      _x setVariable [QGVAR(boardId), _id, true];
    };
  } forEach [bag_bomb_1, bag_bomb_2, bag_bomb_3, bag_bomb_4, bag_bomb_5];

  bag_bomb_1 setObjectTextureGlobal [0,"\plp_containers\StcSuitcases\plp_ct_TravelBagWhite_co.paa"];
  bag_bomb_2 setObjectTextureGlobal [0,"\plp_containers\StcSuitcases\plp_ct_TravelBagPink_co.paa"];
  bag_bomb_3 setObjectTextureGlobal [0,"\plp_containers\StcSuitcases\plp_ct_TravelBagGreen_co.paa"];
  bag_bomb_4 setObjectTextureGlobal [0,"\plp_containers\StcSuitcases\plp_ct_TravelBagBlue_co.paa"];

  {_x setObjectTextureGlobal [0,"data\Uniform.paa"];} forEach (getMissionLayerEntities "Players_2") #0;

  // Attached flags
  {_x forceFlagTexture "\A3\Data_F\Flags\flag_AltisColonial_co.paa";} forEach [car_1, car_2, car_3, zamak];

  //Ambient anims
  [{
    {_x switchMove "Acts_Briefing_SA_Loop"} forEach [s_1, s_6, s_9];
    {_x switchMove "Acts_Commenting_On_Fight_loop"} forEach [s_2, s_5, s_8];
    s_3 switchMove "HubSittingChairC_idle2";
    s_4 switchMove "Acts_Kore_IdleNoWeapon_loop";
    s_7 switchMove "Acts_CivilListening_1";
    s_10 switchMove "HubStanding_idle3";
    [p_13, true] call ACEFUNC(medical_status,setUnconsciousState);
    p_13 switchMove "Acts_LyingWounded_loop3";
    amb_1 switchMove "Acts_CivilShocked_2";
    amb_2 switchMove "InBaseMoves_repairVehicleKnl";
    {_x setVariable ["town", "idap", true]} forEach [idap_1, idap_2];
  }, [], 30] call CBA_fnc_waitAndExecute;

  ["CAManBase", "killed", {
    params ["_unit"];
    if !(isNull objectParent _unit) exitWith {};
    [{
        params ["_unit"];
        private _bloods = [
            "a3\Props_F_Orange\Humanitarian\Garbage\BloodPool_01_Large_F.p3d",
            "a3\Props_F_Orange\Humanitarian\Garbage\BloodPool_01_Medium_F.p3d",
            "a3\Props_F_Orange\Humanitarian\Garbage\BloodSplatter_01_Large_F.p3d",
            "a3\Props_F_Orange\Humanitarian\Garbage\BloodSplatter_01_Medium_F.p3d",
            "a3\Props_F_Orange\Humanitarian\Garbage\BloodSpray_01_F.p3d"
        ];
        private _pos = (getPosWorld _unit) vectorAdd [0,0,0.05];
        private _blood = createSimpleObject [selectRandom _bloods, _pos];
        _blood setDir random 360;
        _blood setVectorUp surfaceNormal position _blood;

        // Use ACE medical blood module to handle clean up
        ["ace_medical_blood_bloodDropCreated", [_blood]] call CBA_fnc_localEvent;
    }, [_unit], 3] call CBA_fnc_waitAndExecute;
  }] call CBA_fnc_addClassEventHandler;
};
