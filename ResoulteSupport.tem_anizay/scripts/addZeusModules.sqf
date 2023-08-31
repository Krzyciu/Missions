#include "script_component.hpp"

["[Krzyciu] - Mission", "Liczba cywili", {
  ["Pokazać?", [], {
  [QGVAR(civiliansCountServer)]call CBA_fnc_serverEvent;
  }, {}, []] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Mission", "HS off", {
  ["Wyłączyć headshoty?", [], {
  [QGVAR(headshotOff)]call CBA_fnc_globalEvent;
  }, {}, []] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Mission", "HS on", {
  ["Włączyć headshoty?", [], {
  [QGVAR(headshotOn)]call CBA_fnc_globalEvent;
  }, {}, []] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Mission", "Landing Guide", {
  params ["", "_target"];
  if (isNull _target) exitWith {};
  [QGVAR(landingGuide), _target] call CBA_fnc_globalEvent;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Mission", "Damage Unit", {
  params ["", "_target"];
  if (isNull _target) exitWith {};
  [QGVAR(damageUnit), _target, _target] call CBA_fnc_targetEvent;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Mission", "Move Unit", {
  params ["", "_target"];
  if (isNull _target) exitWith {};
  [QGVAR(moveUnit), _target, _target] call CBA_fnc_targetEvent;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Mission", "Stabilize Unit", {
  params ["", "_target"];
  if (isNull _target) exitWith {};
  [QGVAR(stabilizeUnit), _target, _target] call CBA_fnc_targetEvent;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Mission", "Ambient talk", {
  params ["", "_target"];
  if (isNull _target) exitWith {};
  private _sound = format ["Krzyc_M%1ambient%2", (floor random 5) +1,(floor random 31)];
  [QGVAR(ambientTalk), [_target, _sound]] call CBA_fnc_globalEvent;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Medevac", "Medevac - 1", {
  if (missionNamespace getVariable ["medevac_1", false]) exitWith {};
  ["Rozpocząć zadanie medeavc?", [], {
  missionNamespace setVariable ["medevac_1", true, true];
  [QGVAR(playSound)] call CBA_fnc_globalEvent;
  0 spawn {
    sleep 24;
    playSound3D [getMissionPath "data\sounds\medevac\call.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 2, 1, 65];
    sleep 10;
    playSound3D [getMissionPath "data\sounds\medevac\med1.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 2, 1, 65];
    sleep 24;
    playSound3D [getMissionPath "data\sounds\medevac\repeat.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 1.5, 1, 65];
    sleep 2;
    playSound3D [getMissionPath "data\sounds\medevac\med1.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 2, 1, 65];
  }
  }, {}, []] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Zaliczenia", "Medevac - 1", {
  ["Zaliczyć zadanie?", [], {
  [QGVAR(medevac_1)] call CBA_fnc_serverEvent;
  }, {}, []] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Medevac", "Medevac - 2", {
  if (missionNamespace getVariable ["medevac_2", false]) exitWith {};
  ["TYLKO W NOCY. Rozpocząć zadanie medeavc?", [], {
  missionNamespace setVariable ["medevac_2", true, true];
  [QGVAR(playSound)] call CBA_fnc_globalEvent;
  0 spawn {
    sleep 24;
    playSound3D [getMissionPath "data\sounds\medevac\call.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 2, 1, 65];
    sleep 10;
    playSound3D [getMissionPath "data\sounds\medevac\med2.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 2, 1, 65];
    sleep 24;
    playSound3D [getMissionPath "data\sounds\medevac\repeatSymb.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 1.5, 1, 65];
    sleep 2;
    playSound3D [getMissionPath "data\sounds\medevac\med2.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 2, 1, 65];
  }
  }, {}, []] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Zaliczenia", "Medevac - 2", {
  ["Zaliczyć zadanie?", [], {
  [QGVAR(medevac_2)] call CBA_fnc_serverEvent;
  }, {}, []] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Medevac", "Medevac - 3", {
  if (missionNamespace getVariable ["medevac_3", false]) exitWith {};
  ["Rozpocząć zadanie medeavc?", [], {
  missionNamespace setVariable ["medevac_3", true, true];
  playSound3D [getMissionPath "data\sounds\medevac\med3.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 2, 1, 65];
  }, {}, []] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Zaliczenia", "Medevac - 3", {
  ["Zaliczyć zadanie?", [], {
  [QGVAR(medevac_3)] call CBA_fnc_serverEvent;
  }, {}, []] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Medevac", "Medevac - 4", {
  if (missionNamespace getVariable ["medevac_4", false]) exitWith {};
  ["Rozpocząć zadanie medeavc? (Zle koordynaty w wezwaniu!)", [], {
  missionNamespace setVariable ["medevac_4", true, true];
  [QGVAR(playSound)] call CBA_fnc_globalEvent;
  0 spawn {
    sleep 24;
    playSound3D [getMissionPath "data\sounds\medevac\call.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 2, 1, 65];
    sleep 10;
    playSound3D [getMissionPath "data\sounds\medevac\med4.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 2, 1, 65];
    sleep 19;
    playSound3D [getMissionPath "data\sounds\medevac\repeatSymb.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 1.5, 1, 65];
    sleep 2;
    playSound3D [getMissionPath "data\sounds\medevac\med4.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 2, 1, 65];
  }
  }, {}, []] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Zaliczenia", "Medevac - 4", {
  ["Zaliczyć zadanie?", [], {
  [QGVAR(medevac_4)] call CBA_fnc_serverEvent;
  }, {}, []] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Medevac", "Medevac - 5", {
  if (missionNamespace getVariable ["medevac_5", false]) exitWith {};
  ["Rozpocząć zadanie medeavc?", [], {
  missionNamespace setVariable ["medevac_5", true, true];
  [QGVAR(playSound)] call CBA_fnc_globalEvent;
  0 spawn {
    sleep 24;
    playSound3D [getMissionPath "data\sounds\medevac\call.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 2, 1, 65];
    sleep 10;
    playSound3D [getMissionPath "data\sounds\medevac\med5.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 2, 1, 65];
    sleep 24;
    playSound3D [getMissionPath "data\sounds\medevac\repeat5.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 1.5, 1, 65];
    sleep 2;
    playSound3D [getMissionPath "data\sounds\medevac\med5.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 2, 1, 65];
  }
  }, {}, []] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Zaliczenia", "Medevac - 5", {
  ["Zaliczyć zadanie?", [], {
  [QGVAR(medevac_5)] call CBA_fnc_serverEvent;
  }, {}, []] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Medevac", "Medevac - 6", {
  if (missionNamespace getVariable ["medevac_6", false]) exitWith {};
  ["Rozpocząć zadanie medeavc?", [], {
  missionNamespace setVariable ["medevac_6", true, true];
  [QGVAR(playSound)] call CBA_fnc_globalEvent;
  0 spawn {
    sleep 24;
    playSound3D [getMissionPath "data\sounds\medevac\call.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 2, 1, 65];
    sleep 10;
    playSound3D [getMissionPath "data\sounds\medevac\med6.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 2, 1, 65];
    sleep 22;
    playSound3D [getMissionPath "data\sounds\medevac\repeatSymb.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 1.5, 1, 65];
    sleep 2;
    playSound3D [getMissionPath "data\sounds\medevac\med6.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 2, 1, 65];
  }
  }, {}, []] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Zaliczenia", "Medevac - 6", {
  ["Zaliczyć zadanie?", [], {
  [QGVAR(medevac_6)] call CBA_fnc_serverEvent;
  }, {}, []] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Medevac", "Medevac - 7", {
  if (missionNamespace getVariable ["medevac_7", false]) exitWith {};
  ["Rozpocząć zadanie medeavc?", [], {
  missionNamespace setVariable ["medevac_7", true, true];
  [QGVAR(playSound)] call CBA_fnc_globalEvent;
  0 spawn {
    sleep 24;
    playSound3D [getMissionPath "data\sounds\medevac\call.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 2, 1, 65];
    sleep 10;
    playSound3D [getMissionPath "data\sounds\medevac\med7.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 2, 1, 65];
    sleep 19;
    playSound3D [getMissionPath "data\sounds\medevac\repeat7.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 1.5, 1, 65];
    sleep 2;
    playSound3D [getMissionPath "data\sounds\medevac\med7.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 2, 1, 65];
  }
  }, {}, []] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Zaliczenia", "Medevac - 7", {
  ["Zaliczyć zadanie?", [], {
  [QGVAR(medevac_7)] call CBA_fnc_serverEvent;
  }, {}, []] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Medevac", "Medevac - 8", {
  if (missionNamespace getVariable ["medevac_8", false]) exitWith {};
  ["Rozpocząć zadanie medeavc?", [], {
  missionNamespace setVariable ["medevac_8", true, true];
  [QGVAR(playSound)] call CBA_fnc_globalEvent;
  0 spawn {
    sleep 24;
    playSound3D [getMissionPath "data\sounds\medevac\call.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 2, 1, 65];
    sleep 10;
    playSound3D [getMissionPath "data\sounds\medevac\med8.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 2, 1, 65];
    sleep 21;
    playSound3D [getMissionPath "data\sounds\medevac\repeat.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 1.5, 1, 65];
    sleep 2;
    playSound3D [getMissionPath "data\sounds\medevac\med8.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 2, 1, 65];
  }
  }, {}, []] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Zaliczenia", "Medevac - 8", {
  ["Zaliczyć zadanie?", [], {
  [QGVAR(medevac_8)] call CBA_fnc_serverEvent;
  }, {}, []] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Medevac", "Medevac - 9", {
  if (missionNamespace getVariable ["medevac_9", false]) exitWith {};
  ["Rozpocząć zadanie medeavc?", [], {
  missionNamespace setVariable ["medevac_9", true, true];
  [QGVAR(playSound)] call CBA_fnc_globalEvent;
  0 spawn {
    sleep 24;
    playSound3D [getMissionPath "data\sounds\medevac\call.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 2, 1, 65];
    sleep 8;
    playSound3D [getMissionPath "data\sounds\medevac\med9.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 2, 1, 65];
    sleep 16;
    playSound3D [getMissionPath "data\sounds\medevac\repeat.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 1.8, 1, 65];
    sleep 2;
    playSound3D [getMissionPath "data\sounds\medevac\med9.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 2, 1, 65];
  }
  }, {}, []] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Zaliczenia", "Medevac - 9", {
  ["Zaliczyć zadanie?", [], {
  [QGVAR(medevac_9)] call CBA_fnc_serverEvent;
  }, {}, []] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Medevac", "Medevac - 10", {
  if (missionNamespace getVariable ["medevac_10", false]) exitWith {};
  ["Rozpocząć zadanie medeavc?", [], {
  missionNamespace setVariable ["medevac_10", true, true];
  [QGVAR(playSound)] call CBA_fnc_globalEvent;
  0 spawn {
    sleep 24;
    playSound3D [getMissionPath "data\sounds\medevac\call.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 2, 1, 65];
    sleep 8;
    playSound3D [getMissionPath "data\sounds\medevac\med10.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 2, 1, 65];
    sleep 17;
    playSound3D [getMissionPath "data\sounds\medevac\repeat.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 2, 1, 65];
    sleep 2;
    playSound3D [getMissionPath "data\sounds\medevac\med10.ogg", Krzyc_radio, true, getPosASL Krzyc_radio, 2, 1, 65];
  }
  }, {}, []] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Zaliczenia", "Medevac - 10", {
  ["Zaliczyć zadanie?", [], {
  [QGVAR(medevac_10)] call CBA_fnc_serverEvent;
  }, {}, []] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;
