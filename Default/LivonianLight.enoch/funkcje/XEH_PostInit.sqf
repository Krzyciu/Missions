if(isNil "MISSION_ROOT") then {
    if(isDedicated) then {
        MISSION_ROOT = "mpmissions\__CUR_MP." + worldName + "\";
    }
    else
    {
        MISSION_ROOT = str missionConfigFile select [0, count str missionConfigFile - 15];
    };
};

if !(hasInterface) exitWith {};

// if (didJIP) then {};

// bez granatow na spawnie
player addEventHandler ["Fired", {
    if ((_this select 2) == "HandGrenadeMuzzle") then {
        private _proj = param [6, objNull];
        private _idx = [blufor, opfor, independent, civilian] find side player;
        if (_idx == -1) exitWith {};

        private _mrk = markerPos "start_pos";
        if ((_this select 0) distance _mrk < 150) then {
            [_proj] call ace_frag_fnc_addBlackList;
            deleteVehicle _proj;
            titleText ["Granat na spawnie jest głupim pomysłem", "PLAIN", 2];
        };
    };
}];


[{
    // opuszczenie broni po starcie
    if (primaryWeapon player != "") then {
        player switchMove "amovpercmstpslowwrfldnon";
    };
}, [], 0.5] call CBA_fnc_waitAndExecute; 
