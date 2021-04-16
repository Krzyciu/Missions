/***********************************************************************
    XEH_postInit.sqf
    Poniższy kod wykona się na serwerze oraz u każdego gracza po wczytaniu wszystkich elementów misji
************************************************************************/
// Disables ambient animals and ambient sounds
["ACRE_PRC117F", "default", "Krzyciu"] call acre_api_fnc_copyPreset;
["ACRE_PRC117F", "Krzyciu", 1, "label", "Piechota"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "Krzyciu", 2, "label", "Lotnictwo"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "Krzyciu"] call acre_api_fnc_setPreset;

if (hasInterface) then {
disableRemoteSensors true;

["CBA_loadingScreenDone", {
if (didJIP) exitWith {};
0 spawn Krzyc_fnc_intro;
}] call CBA_fnc_addEventHandler;

0 spawn {
waitUntil {!isNull findDisplay 12};
findDisplay 12 displayCtrl 51 ctrlAddEventHandler ["Draw", "
   _this #0 drawIcon [
    getMissionPath 'data\N_Korea.paa',
    [1,1,1,1],
    getMarkerPos 'N_Korea',
    46,
    32,
    0
   ];
   _this #0 drawIcon [
    getMissionPath 'data\S_Korea.paa',
    [1,1,1,1],
    getMarkerPos 'S_Korea',
    46,
    32,
    0
   ]
"];
};
//facewear
removeGoggles player;
if (typeOf player isEqualto "rhsusf_army_ucp_officer") then {
player addGoggles "antenna_long_one_face"};

0 spawn {
  sleep 1;
  private _actionParent = ["Wsparcie", "Wsparcie", "", {}, {true}] call ace_interact_menu_fnc_createAction;
  [dowodca, 1, ["ACE_SelfActions"], _actionParent] call ace_interact_menu_fnc_addActionToObject;

  private _condition = {missionNamespace getVariable ["ammoDrop", 0] isEqualTo 1};
  private _ammoDrop = ["ammo","Wezwij zrzut amunicji","",{0 spawn Krzyc_fnc_ammoDrop;
  titleText ["<t color='#9abf9a' shadow = 1 size='1.4'>Hawk 1-1:</t><t color ='#9abf9a' shadow = 2 size ='1.3'> Prośba przyjęta, Hawk 1-1 nadlatuje od południa.</t>", "PLAIN DOWN", -1, true, true];},_condition] call ace_interact_menu_fnc_createAction;
  [dowodca, 1, ["ACE_SelfActions","Wsparcie"],_ammoDrop] call ace_interact_menu_fnc_addActionToObject;

  private _condition2 = {missionNamespace getVariable ["Krzyc_art", 0] isEqualTo 1};
  private _arty = ["arty","Wezwij ostrzał artyleryjski","",{0 spawn Krzyc_fnc_arty;
  },_condition2] call ace_interact_menu_fnc_createAction;
  [dowodca, 1, ["ACE_SelfActions","Wsparcie"],_arty] call ace_interact_menu_fnc_addActionToObject;

  private _condition3 = {(miner getVariable ["Krzyc_mines", 0] > 10) && (miner getVariable ["Krzyc_used", false])};
  private _mineDrop = ["mines","Wystrzel miny (10)","",{0 spawn Krzyc_fnc_mineDrop;
  },_condition3] call ace_interact_menu_fnc_createAction;
  [miner, 1, ["ACE_SelfActions"],_mineDrop] call ace_interact_menu_fnc_addActionToObject;

  private _rearm = ["naprawa","Serwis Pojazdów","",{[25, [], {0 call Krzyc_fnc_rearm}, {hint "Przerwano"}, "Przezbrajanie"] call ace_common_fnc_progressBar},{true}] call ace_interact_menu_fnc_createAction;
  [repair_depot, 0, ["ACE_MainActions"], _rearm] call ace_interact_menu_fnc_addActionToObject;

  private _grassCut = ["grassCut","Wyrwij trawę","",{[] call Krzyc_fnc_cutGrass},{true}] call ace_interact_menu_fnc_createAction;
  [player, 1, ["ACE_SelfActions"], _grassCut] call ace_interact_menu_fnc_addActionToObject;

  private _mtow = ["tow","Celuj z towa","",{[true] call Krzyc_fnc_tow},{true}] call ace_interact_menu_fnc_createAction;
  [mtow, 1, ["ACE_SelfActions"], _mtow] call ace_interact_menu_fnc_addActionToObject;

  private _tow = ["towAmmo","Załaduj amunicję","",{[_target] call Krzyc_fnc_towRearm},{"ace_compat_rhs_usf3_mag_TOW" in magazines _player}] call ace_interact_menu_fnc_createAction;
  {[_x, 0, ["ACE_MainActions"], _tow] call ace_interact_menu_fnc_addActionToObject;} forEach [tow,tow2];

  private _changeFlag = ["changeFlag","Zmień flagę","a3\ui_f\data\igui\cfg\simpletasks\types\interact_ca.paa",{[_target] spawn Krzyc_fnc_changeFlag},{true},{},[],[0.05, -0.385, -2.375],4] call ace_interact_menu_fnc_createAction;
  private _flags = [flag_n_1,flag_n_2,flag_n_3,flag_n_4,flag_n_5,flag_n_6];
  {[_x, 0, [], _changeFlag] call ace_interact_menu_fnc_addActionToObject;} forEach _flags;
  };
};
if (isServer) then {

  0 execVM "scripts\safeZoneDraw.sqf";
  missionNamespace setVariable ["ammoDrop",1,true];
  missionNamespace setVariable ["Krzyc_art",1,true];
  miner setVariable ["Krzyc_mines",100,true];
  miner setVariable ["Krzyc_used", true, true];
  tank_1 forceFlagTexture "data\S_Korea.paa";
  private _flagsS = [flag_s_1,flag_s_2,flag_s_3,flag_s_4,flag_s_5];
  private _flagsN = [flag_n_1,flag_n_2,flag_n_3,flag_n_4,flag_n_5,flag_n_6];
  {_x setFlagTexture "data\S_Korea.paa"} forEach _flagsS;
  {_x setFlagTexture "data\N_Korea.paa"} forEach _flagsN;
  [vls_s,vls_n] joinSilent createGroup civilian;
  0 spawn {
  sleep 6;
  private _players = (getMissionLayerEntities "Players") # 0;
  {[_x, selectRandom ["AsianHead_A3_01","AsianHead_A3_02","AsianHead_A3_03","AsianHead_A3_04","AsianHead_A3_05","AsianHead_A3_06","AsianHead_A3_07"]] remoteExec ["setFace", 0, true];_x setObjectTextureGlobal [0,"data\Uniform.paa"]} forEach _players;
  sleep 3;
  {_x setObjectTextureGlobal [0,"data\body.paa"];_x setObjectTextureGlobal [1,"data\EngineA.paa"]} forEach [heli_1,heli_2];
  { _x disableTIEquipment true} forEach [heli_1,heli_2,tank_1,tank_2];
  jeep setObjectTextureGlobal [1,""];
  tow attachTo [mtow,[0.78,-1.7,0.22]];
  tow2 attachTo [mtow2,[0.78,-1.7,0.22]];
  sleep 0.1;
  {_x enableSimulationGlobal true} forEach [mtow,tow,mtow2,tow2];
  {_x lock 2} forEach [tow,tow2];
  {_x addMagazineCargoGlobal ["ace_compat_rhs_usf3_mag_TOW", 12];_x lockCargo true;} forEach [mtow,mtow2];
  };

  0 spawn {
  sleep 60;
  private _handle = [{
  private _sounds = selectRandom ["A3\Sounds_F\ambient\battlefield\battlefield_firefight1.wss","A3\Sounds_F\ambient\battlefield\battlefield_firefight2.wss","A3\Sounds_F\ambient\battlefield\battlefield_firefight3.wss","A3\Sounds_F\ambient\battlefield\battlefield_firefight4.wss"];
  playSound3D [_sounds, border,false,getPosASL border,5];
  playSound3D [_sounds, border,false,getPosASL border,5];
  }, 30, []] call CBA_fnc_addPerFrameHandler;
  [{params ["_handle"];[_handle] call CBA_fnc_removePerFrameHandler;}, [_handle], 1350] call CBA_fnc_waitAndExecute;
  };

  0 spawn {
    sleep 7;
    private _data = call compile preprocessFileLineNumbers "scripts\data_map.sqf";
    private _lastUpdate = CBA_missionTime;
    private _count = count _data;
    private _counter = 0;
    {
      _x params ["_model", "_posWorld", "_vector"];
      private _object = createSimpleObject [_model, [0,0,0]];
      _object setPosWorld _posWorld;
      _object setVectorDirAndUp _vector;
      _counter = _counter + 1;
      if ((CBA_missionTime - _lastUpdate) > 0.98) then {
        missionNamespace setVariable ["mission_mapSpawn", [true, _counter, _count, false], true];
        _lastUpdate = CBA_missionTime;
      };
      sleep 0.02;
    } forEach _data;
    missionNamespace setVariable ["mission_mapSpawn", [true, _counter, _count, true], true];
    waitUntil {
      sleep 0.25;
      private _status = missionNamespace getVariable ["mission_mapSpawn", [false, 0, 0, false]];
      _status # 3
    };
  };
};
