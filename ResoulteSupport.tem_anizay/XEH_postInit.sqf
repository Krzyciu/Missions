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

  GVAR(color) = ppEffectCreate ["colorCorrections", 1501];
  GVAR(color) ppEffectEnable true;
  GVAR(color) ppEffectAdjust [1,1.02,-0.005,[0,0,0,0],[1,0.8,0.6,0.65],[0.199,0.587,0.115,0]];
  GVAR(color) ppEffectCommit 0;
};

if (isServer) then {

  GVAR(confirmedKills) = 0;

  addMissionEventHandler ["EntityKilled", {
    params ["_unit"];

    if !(_unit isKindOf "CAManBase") exitWith {};
    private _side = side (group _unit);

    if ((side (group _unit)) isEqualTo civilian) then {
      GVAR(confirmedKills) = GVAR(confirmedKills) + 1;
      [QGVAR(civKilled), [GVAR(confirmedKills), name _killer]] call CBA_fnc_globalEvent;
    };
  }];

  // Initialize bombs id's
  {
    if (!isNull _x) then {
      private _id = selectRandom [1,2,3,4,6,7,8,9,10];
      _x setVariable [QGVAR(boardId), _id, true];
    };
  } forEach [bag_bomb_1, bag_bomb_2, bag_bomb_3, bag_bomb_4, bag_bomb_5];

  bag_bomb_1 setObjectTextureGlobal [0,"\plp_containers\StcSuitcases\plp_ct_TravelBagWhite_co.paa"];
  bag_bomb_2 setObjectTextureGlobal [0,"\plp_containers\StcSuitcases\plp_ct_TravelBagPink_co.paa"];
  bag_bomb_3 setObjectTextureGlobal [0,"\plp_containers\StcSuitcases\plp_ct_TravelBagGreen_co.paa"];
  bag_bomb_4 setObjectTextureGlobal [0,"\plp_containers\StcSuitcases\plp_ct_TravelBagBlue_co.paa"];

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
  }, [], 30] call CBA_fnc_waitAndExecute;
};