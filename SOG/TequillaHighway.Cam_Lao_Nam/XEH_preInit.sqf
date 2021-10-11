#include "script_component.hpp"
/*
 * XEH_preInit.sqf
 * Poniższy kod wykona się na serwerze oraz u każdego gracza przed rozpoczęciem wczytywania obiektów misji
 */

PREP(intro);
PREP(typeText);
PREP(firedNear);
PREP(playerKilled);

["Krzyc_intro", {

  if (isServer) then {
    0 execVM "scripts\intro_flight.sqf";
  };

  if (hasInterface) then {
      0 spawn {
        sleep 5;

        private _camera = "camera" camCreate [0,0,0];
        private _posStart = getPosASL heli_intro;
        _camera camPreparePos _posStart;
        _camera cameraEffect ["external", "back"];
        _camera camPrepareTarget heli_intro;
        _camera camCommitPrepared 0;
        private _proxy = createVehicle ["test_EmptyObjectForBubbles", [0, 0, 0], [], 0, "CAN_COLLIDE"];
        _proxy hideObjectGlobal true;
        _proxy setDir 47;
        _proxy setPosASL _posStart;
        _proxy setVelocity [
          45 * (sin 47),
          45 * (cos 47),
          0
        ];
        _camera attachTo [_proxy,[-14, -14, 5]];

        [{missionNamespace getVariable ["Krzyc_heli_crash", false]}, {
          params ["_camera"];

          [_camera] spawn {
            params ["_camera"];
            titleText ["", "BLACK OUT", -1];
            sleep 1;
            playMusic "";
            _camera cameraEffect ["terminate", "back"];
            camDestroy _camera;
            for "_i" from 0 to 5 do {
              [player, 0.7, "body", "vehiclecrash"] call ace_medical_fnc_addDamageToUnit
            };
            private _move = selectRandom ["Acts_UnconsciousStandUp_part1", "Acts_Flashes_Recovery_1", "Acts_Flashes_Recovery_2", "UnconsciousOutProne"];
            playMusic "vn_deadly_jungle";
            sleep 6;
            player switchMove _move;
            titleText ["", "BLACK IN", 5];
            "dynamicBlur" ppEffectEnable true;
            "dynamicBlur" ppEffectAdjust [6];
            "dynamicBlur" ppEffectCommit 0;
            "dynamicBlur" ppEffectAdjust [0.0];
            "dynamicBlur" ppEffectCommit 5;

            [false] call a3cs_ui_fnc_toggleScreenshotMode;
          };
        }, _camera] call CBA_fnc_waitUntilAndExecute;
      };
  };

}] call CBA_fnc_addEventHandler;

if (hasInterface) then {

  ["Krzyc_Tunnel_In", {
      private _firedEH = player addEventHandler ["FiredNear", {call FUNC(firedNear)}];
      player setVariable [QGVAR(firedEH), _firedEH];
      private _explosionEH = player addEventHandler ["Explosion", {call FUNC(firedNear)}];
      player setVariable [QGVAR(explosionEH), _explosionEH];

  }] call CBA_fnc_addEventHandler;

  ["Krzyc_Tunnel_Out", {
      private _firedEH = player getVariable [QGVAR(firedEH), -1];
      player removeEventHandler ["FiredNear", _firedEH];
      player setVariable [QGVAR(firedEH), nil];
      private _explosionEH = player getVariable [QGVAR(explosionEH), -1];
      player removeEventHandler ["Explosion", _explosionEH];
      player setVariable [QGVAR(explosionEH), nil];
  }] call CBA_fnc_addEventHandler;
};

if (isServer) then {
  0 execVM "scripts\safeZoneDraw.sqf";
  ace_medical_playerDamageThreshold = 3.5;
  ace_medical_feedback_painEffectType = 2;
};
