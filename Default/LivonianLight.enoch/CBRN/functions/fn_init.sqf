
if (isServer) then {
    cbrn_zoneSimulationRange = 500;
    publicVariable "cbrn_zoneSimulationRange";
};

if !(hasInterface) exitWith {};

if (isNil "cbrn_mask_abberation") then {
    private _name = "ChromAberration";
    private _priority = 400;
    cbrn_mask_abberation = ppEffectCreate [_name, _priority];
    while {
        cbrn_mask_abberation < 0
    } do {
        _priority = _priority + 1;
        cbrn_mask_abberation = ppEffectCreate [_name, _priority];
    };
};
if (isNil "cbrn_mask_damage") then {
    private _name = "ChromAberration";
    private _priority = 400;
    cbrn_mask_damage = ppEffectCreate [_name, _priority];
    while {
        cbrn_mask_damage < 0
    } do {
        _priority = _priority + 1;
        cbrn_mask_damage = ppEffectCreate [_name, _priority];
    };
    cbrn_mask_damage ppEffectEnable true;
    cbrn_mask_damage ppEffectAdjust [0, 0, true];
    cbrn_mask_damage ppEffectCommit 0;
};

cbrn_loadouteh = ["cba_events_loadoutEvent",{
    params ["_unit", "_oldLoadout"];
    if (_unit != player) exitWith {};
    private _goggles = goggles _unit;
    private _backpack = backpack _unit;
    private _uniform = uniform _unit;

    private _hasMask = (cbrn_masks findIf {_x isEqualTo _goggles}) > -1;
    if (!(_unit getVariable ["cbrn_mask_on", false]) && {_hasMask}) then {
        // maskaaaaaa
        _unit setVariable ["cbrn_mask_on", true, true];
        cbrn_mask_abberation ppEffectEnable true;
        cbrn_mask_abberation ppEffectAdjust [0.005,0.005,true];
        cbrn_mask_abberation ppEffectCommit 1;

        "cbrn_gasmask_overlay" cutRsc ["cbrn_gasmask", "PLAIN", 1, false];
        cbrn_breath_handle = [_unit] spawn {
            params ["_unit"];
            private _fat = 0;
            while{alive _unit && _unit getVariable ["cbrn_mask_on", false]} do {
                _fat = [_unit] call cbrn_fnc_getFatigue;
                sleep (0.75 + (3 - (3 * _fat)) + (random (2 - (2 * _fat))));
                if !(alive _unit && _unit getVariable ["cbrn_mask_on", false]) exitWith {};
                playSound format ["gas_breath_in_%1", floor (random 4) + 1];
                _fat = [_unit] call cbrn_fnc_getFatigue;
                sleep (0.75 + (2 - (2 * _fat)) + (random (2 - (2 * _fat))));
                if !(alive _unit && _unit getVariable ["cbrn_mask_on", false]) exitWith {};
                playSound format ["gas_breath_out_%1", floor (random 4) + 1];
            };
        };
    };
    if (_unit getVariable ["cbrn_mask_on", false] && {!_hasMask}) then {
        // masskaskaskksasa
        _unit setVariable ["cbrn_mask_on", false, true];
        cbrn_mask_abberation ppEffectEnable true;
        cbrn_mask_abberation ppEffectAdjust [0,0,true];
        cbrn_mask_abberation ppEffectCommit 1;
        "cbrn_gasmask_overlay" cutFadeOut 1;
        terminate cbrn_breath_handle;
    };

    private _hasBackpack = (cbrn_backpacks findIf {_x isEqualTo _backpack}) > -1;
    if (!(_unit getVariable ["cbrn_backpack_on", false]) && {_hasBackpack}) then {
        _unit setVariable ["cbrn_backpack_on", true, true];
    };
    if (_unit getVariable ["cbrn_backpack_on", false] && {!_hasBackpack}) then {
        _unit setVariable ["cbrn_backpack_on", false, true];
    };

    private _hasThreatMeter = [_unit, cbrn_threatMeteritem] call ace_common_fnc_hasItem;
    if (!(_unit getVariable ["cbrn_hasThreatMeter", false]) && {_hasThreatMeter}) then {
        _unit setVariable ["cbrn_hasThreatMeter", true, true];
    };
    if (_unit getVariable ["cbrn_hasThreatMeter", false] && {!_hasThreatMeter}) then {
        _unit setVariable ["cbrn_hasThreatMeter", false, true];
        if (_unit getVariable ["cbrn_using_threat_meter", false]) then {
            _unit setVariable ["cbrn_using_threat_meter", false, true];
        };
    };

    private _hasSuit = (cbrn_suits findIf {_x isEqualTo _uniform}) > -1;
    if (!(_unit getVariable ["cbrn_hasSuite", false]) && {_hasSuit}) then {
        _unit setVariable ["cbrn_hasSuite", true, true];
    };
    if (_unit getVariable ["cbrn_hasSuite", false] && {!_hasSuit}) then {
        _unit setVariable ["cbrn_hasSuite", false, true];
    };

    private _backPackContainer = backpackContainer _unit;
    if (_unit getVariable ["cbrn_backpack_on", false] && {_unit getVariable ["cbrn_mask_on", false]}) then {
        // dodanie rurki laczacej maske z plecakiem
        if !(_backPackContainer getVariable ["cbrn_hose_attached", false]) then {
            _backPackContainer setVariable ["cbrn_hose_attached", true];

            if (_goggles isEqualTo "G_RegulatorMask_F") then {
                _backPackContainer setObjectTextureGlobal [2,"a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
            } else {
                _backPackContainer setObjectTextureGlobal [1,"a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
                _backPackContainer setObjectTextureGlobal [3,"a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
            };
        };
    } else {
        if (_backPackContainer getVariable ["cbrn_hose_attached", false]) then {
            _backPackContainer setVariable ["cbrn_hose_attached", false];
            _backPackContainer setObjectTextureGlobal [1,""];
            _backPackContainer setObjectTextureGlobal [2,""];
            _backPackContainer setObjectTextureGlobal [3,""];
        };
    };
}] call CBA_fnc_addEventHandler;

private _action = ["cbrn_turn_on_oxygen", "Włącz dopływ tlenu","",{
    [ace_player] call cbrn_fnc_startOxygen;
},{
    private _plr = ace_player;
    private _backpackItem = backpackContainer _plr;
    !(_plr getVariable ["cbrn_oxygen", false]) && {!isNull _backpackItem && {_plr getVariable ["cbrn_mask_on", false] && {_plr getVariable ["cbrn_backpack_on", false] && {_backpackItem getVariable ["cbrn_air", 100] > 0}}}}
},{},[], [0,0,0], 3] call ace_interact_menu_fnc_createAction;
["CAManBase", 1, ["ACE_SelfActions","ACE_Equipment"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ["cbrn_turn_off_oxygen", "Wyłącz dopływ tlenu","",{
    ace_player setVariable ["cbrn_oxygen", false];
},{
    ace_player getVariable ["cbrn_oxygen", false]
},{},[], [0,0,0], 3] call ace_interact_menu_fnc_createAction;
["CAManBase", 1, ["ACE_SelfActions","ACE_Equipment"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ["cbrn_check_oxygen", "Sprawdź tlen","",{
    [{
        params ["_unit"];
        [_unit] call cbrn_fnc_checkOxygen;
    }, [ace_player]] call CBA_fnc_execNextFrame;
},{
    ace_player getVariable ["cbrn_backpack_on", false];
},{},[], [0,0,0], 3] call ace_interact_menu_fnc_createAction;
["CAManBase", 1, ["ACE_SelfActions","ACE_Equipment"], _action, true] call ace_interact_menu_fnc_addActionToClass;

"ChemiCalDetector" cutRsc ["RscWeaponChemicalDetector", "PLAIN", 1, false];
cbrn_threatPfh = [cbrn_fnc_threatPFH, 0.5, [cba_missiontime]] call CBA_fnc_addPerFrameHandler;
cbrn_beepPfh = -1;

[{
    private _player = ace_player;
    private _range = missionNameSpace getVariable ["cbrn_zoneSimulationRange", 500];
    {
        if ((_player distance2D _x) < _range) then {
            if !(simulationEnabled _x) then {
                _x enableSimulation true;
            };
        } else {
            if (simulationEnabled _x) then {
                _x enableSimulation false;
            };
        };
    } forEach cbrn_localZones;
}, 10] call CBA_fnc_addPerFrameHandler;

player addEventHandler ["Killed", {
    params ["_unit", "_killer", "_instigator", "_useEffects"];
    if (_unit getVariable ["cbrn_mask_on", false]) then {
        _unit setVariable ["cbrn_mask_on", false, true];
        cbrn_mask_abberation ppEffectEnable true;
        cbrn_mask_abberation ppEffectAdjust [0,0,true];
        cbrn_mask_abberation ppEffectCommit 1;
        "cbrn_gasmask_overlay" cutFadeOut 1;
        terminate cbrn_breath_handle;
    };
    _unit setVariable ["cbrn_using_threat_meter", false, true];
}];

player addEventHandler ["Respawn", {
    player setVariable ["cbrn_damage", nil];
    player setVariable ["cbrn_autoDamage", nil];
    player setVariable ["cbrn_stoppedAutoDamage", nil];
    player getVariable ["cbrn_using_threat_meter", nil];
    player setVariable ["cbrn_oxygen", nil];
}];

_action = ["cbrn_turn_check_damage", "Sprawdź swój stan","",{
    private _damage = ace_player getVariable ["cbrn_damage", 0];
    private _coef = _damage / cbrn_maxDamage;
    if (_coef < 0.1) exitWith {
        titleText ["Czujesz się <t color='#00ff00'>świetnie</t>!" , "PLAIN DOWN", -1, false, true];
    };
    if (_coef < 0.4) exitWith {
        titleText ["Czujesz się <t color='#ffff00'>dobrze</t>! Oddycha ci się cieżko..." , "PLAIN DOWN", -1, false, true];
    };
    if (_coef < 0.9) exitWith {
        titleText ["Czujesz się <t color='#ff7b00'>słabo</t>! Oddychanie boli, piecze cię skóra..." , "PLAIN DOWN", -1, false, true];
    };
    titleText ["Czujesz się <t color='#ff0000'>bardzo źle</t>! Potrzebujesz natychmiastowej pomocy..." , "PLAIN DOWN", -1, false, true];
},{true},{},[], [0,0,0], 3] call ace_interact_menu_fnc_createAction;
["CAManBase", 1, ["ACE_SelfActions","Medical"], _action, true] call ace_interact_menu_fnc_addActionToClass;
["CAManBase", 1, ["ACE_SelfActions","ACE_Medical"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ["cbrn_turn_on_threatmeter", "Włącz licznik Geigera","",{
    ace_player setVariable ["cbrn_using_threat_meter", true, true];
},{
    !(ace_player getVariable ["cbrn_using_threat_meter", false]) && {ace_player getVariable ["cbrn_hasThreatMeter", false]}
},{},[], [0,0,0], 3] call ace_interact_menu_fnc_createAction;
["CAManBase", 1, ["ACE_SelfActions","ACE_Equipment"], _action, true] call ace_interact_menu_fnc_addActionToClass;
_action = ["cbrn_turn_off_threatmeter", "Wyłącz licznik Geigera","",{
    ace_player setVariable ["cbrn_using_threat_meter", false, true];
},{
    ace_player getVariable ["cbrn_using_threat_meter", false]
},{},[], [0,0,0], 3] call ace_interact_menu_fnc_createAction;
["CAManBase", 1, ["ACE_SelfActions","ACE_Equipment"], _action, true] call ace_interact_menu_fnc_addActionToClass;

["cbrn_turnOnShower", {
    params ["_shower"];
    [_shower, true] call cbrn_fnc_toggleShower;
}] call CBA_fnc_addEventhandler;
["cbrn_turnOffShower", {
    params ["_shower"];
    [_shower, false] call cbrn_fnc_toggleShower;
}] call CBA_fnc_addEventhandler;

player createDiaryRecord ["Diary", ["Mechaniki CBRN",
"Misja zawiera mechaniki CRBN! Występują obrażenia od promieniowania, które można sprawdzić Interakcje własne -> Medyczne -> Sprawdź swój stan.<br/><br/>Zagrożenie CRBN będzie obecne przez cały czas trwania misji. Jeżeli zostaniecie napromieniowani nie przejdzie wam to samo. Dopóki nie użyjecie środków dekontaminacyjnych cały czas będziecie narażeni na śmiercionośne skutki. Gdy tak się stanie, dostaniecie odpowiednie powiadomienie.<br/><br/>Jeżeli przekroczycie maksymalną dawkę jednoskową umrzecie od razu.<br/><br/>Powietrze w butlach wyczerpuje się. Gdy skończy się powietrze butle będą bezużyteczne. Pamiętajcie o kontrolowaniu ciśnienia powietrza. Czujnik zapiszczy trzy razy gdy zostanie mniej niż 5 minut powietrza. Gdy powietrza będzie na mniej niż 30 sekund czujnik wyda 10 sekudnowy ciągły dźwięk.<br/><br/>Osoby z MicrDagrem mogą za pomocą interackji na osobie otworzyć licznik Geigera. Pojawi się na górze ekranu. Licznik wskazuje zagrożenie za pomocą kolorów.
<br/><br/>Zielonego - strefa bezpieczna<br/><br/>Żółty - wymagana maska<br/><br/>Pomarańczowy - wymagana butla z powietrzem<br/><br/>Czerwony - wymagany strój CRBN.<br/><br/>Wszystkie poziomy powyżej nie są wizualizowane. Jest to odpowiednik wartości powyżej 3.6 roentgena."]];

if !(isNil "CBA_fnc_addItemContextMenuOption") then {
    {
        [_x, "BACKPACK", "Włącz dopływ tlenu", nil, nil, [{
                private _plr = ace_player;
                private _backpackItem = backpackContainer _plr;
                !(_plr getVariable ["cbrn_oxygen", false]) && {!isNull _backpackItem && {_plr getVariable ["cbrn_mask_on", false] && {_plr getVariable ["cbrn_backpack_on", false] && {_backpackItem getVariable ["cbrn_air", 100] > 0}}}}
            }, {
                private _plr = ace_player;
                _plr getVariable ["cbrn_backpack_on", false] && {!(_plr getVariable ["cbrn_oxygen", false])}
            }], {
            [ace_player] call cbrn_fnc_startOxygen;
            false
        }, false] call CBA_fnc_addItemContextMenuOption;

        [_x, "BACKPACK", "Wyłącz dopływ tlenu", nil, nil,
        [{ace_player getVariable ["cbrn_oxygen", false]}, {ace_player getVariable ["cbrn_oxygen", false]}], {
            ace_player setVariable ["cbrn_oxygen", false];
            false
        }, false] call CBA_fnc_addItemContextMenuOption;

        [_x, "BACKPACK", "Sprawdź ciśnienie w butli", nil, nil,
        [{true}, {ace_player getVariable ["cbrn_backpack_on", false]}], {
            [{
                params ["_unit"];
                [_unit] call cbrn_fnc_checkOxygen;
            }, [ace_player]] call CBA_fnc_execNextFrame;
            false
        }, false] call CBA_fnc_addItemContextMenuOption;
    } forEach cbrn_backpacks;

    ["ChemicalDetector_01_watch_F", "WATCH", "Zwiększ głośność", nil, nil,
    [{cbrn_beepVolume < 5},{cbrn_beep}], {
        cbrn_beepVolume = cbrn_beepVolume + 1;
        false
    }, false] call CBA_fnc_addItemContextMenuOption;

    ["ChemicalDetector_01_watch_F", "WATCH", "Zmniejsz głośność", nil, nil,
    [{cbrn_beepVolume > 0},{cbrn_beep}], {
        cbrn_beepVolume = cbrn_beepVolume - 1;
        false
    }, false] call CBA_fnc_addItemContextMenuOption;

    ["ChemicalDetector_01_watch_F", "WATCH", "Włącz sygnał dźwiękowy", nil, nil,
    [{!cbrn_beep},{!cbrn_beep}], {
        cbrn_beep = true;
        cbrn_beepPfh = [cbrn_fnc_detectorBeepPFH, 0.05, [cba_missiontime]] call CBA_fnc_addPerFrameHandler;
        false
    }, false] call CBA_fnc_addItemContextMenuOption;

    ["ChemicalDetector_01_watch_F", "WATCH", "Wyłącz sygnał dźwiękowy", nil, nil,
    [{cbrn_beep},{cbrn_beep}], {
        cbrn_beep = false;
        false
    }, false] call CBA_fnc_addItemContextMenuOption;

    [cbrn_threatMeteritem, "CONTAINER", "Włącz licznik Geigera", nil, nil,
    [{!(ace_player getVariable ["cbrn_using_threat_meter", false]) && {ace_player getVariable ["cbrn_hasThreatMeter", false]}},{!(ace_player getVariable ["cbrn_using_threat_meter", false]) && {ace_player getVariable ["cbrn_hasThreatMeter", false]}}], {
        ace_player setVariable ["cbrn_using_threat_meter", true, true];
        false
    }, false] call CBA_fnc_addItemContextMenuOption;

    [cbrn_threatMeteritem, "CONTAINER", "Wyłącz licznik Geigera", nil, nil,
    [{ace_player getVariable ["cbrn_using_threat_meter", false]},{ace_player getVariable ["cbrn_using_threat_meter", false]}], {
        ace_player setVariable ["cbrn_using_threat_meter", false, true];
        false
    }, false] call CBA_fnc_addItemContextMenuOption;
};
