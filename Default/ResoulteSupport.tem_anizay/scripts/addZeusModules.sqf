#include "script_component.hpp"

["[Krzyciu] - Mission", "Liczba cywili", {
  ["Pokazać?", [], {
    [QGVAR(civiliansCount)] call CBA_fnc_globalEvent;
  }, {}, []] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Medevac", "Medevac - 1", {
  if (missionNamespace getVariable ["medevac_1", false]) exitWith {};
  ["Rozpocząć zadanie medeavc?", [], {
  missionNamespace setVariable ["medevac_1", true, true];
  [QGVAR(playSound)] call CBA_fnc_globalEvent;
  }, {}, []] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Zaliczenia", "Medevac - 1", {
  ["Zaliczyć zadanie?", [], {
  [QGVAR(medevac_1)] call CBA_fnc_serverEvent;
  }, {}, []] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Medevac", "Medevac - 2", {
  if (missionNamespace getVariable ["medevac_2", false]) exitWith {};
  ["Rozpocząć zadanie medeavc?", [], {
  missionNamespace setVariable ["medevac_2", true, true];
  [QGVAR(playSound)] call CBA_fnc_globalEvent;
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
  [QGVAR(playSound)] call CBA_fnc_globalEvent;
  }, {}, []] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Zaliczenia", "Medevac - 3", {
  ["Zaliczyć zadanie?", [], {
  [QGVAR(medevac_3)] call CBA_fnc_serverEvent;
  }, {}, []] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Medevac", "Medevac - 4", {
  if (missionNamespace getVariable ["medevac_4", false]) exitWith {};
  ["Rozpocząć zadanie medeavc?", [], {
  missionNamespace setVariable ["medevac_4", true, true];
  [QGVAR(playSound)] call CBA_fnc_globalEvent;
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
  }, {}, []] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["[Krzyciu] - Zaliczenia", "Medevac - 9", {
  ["Zaliczyć zadanie?", [], {
  [QGVAR(medevac_9)] call CBA_fnc_serverEvent;
  }, {}, []] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;