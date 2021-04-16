missionNamespace setVariable ["mapclick",false,true];
openMap true;
systemChat localize "STR_Mission_Art_Call";
["Krzyc_arty", "onMapSingleClick", {
private _marker_Bomb = createMarkerLocal ['Bomb',_pos];
_marker_Bomb setMarkerAlphaLocal 1;
_marker_Bomb setMarkerColorLocal 'ColorRed';
_marker_Bomb setMarkerShapeLocal 'ELLIPSE';
_marker_Bomb setMarkerBrushLocal 'Solid';
_marker_Bomb setMarkerSizeLocal [75, 75];
systemChat localize "STR_Mission_Art_Confirm";
missionNamespace setVariable ["Krzyc_art",0,true];
[_pos] spawn {
params ["_pos"];
sleep 2;
missionNamespace setVariable ["mapclick",true,true];
openMap false;
sleep 37;
[
        _pos,
        'Sh_82mm_AMOS',
        60,
        8,
        [3,7],
        {},
        10,
        500,
        120,
        ['shell1','shell2']
    ] spawn BIS_fnc_fireSupportVirtual;
deleteMarker "Bomb";
};
}] call BIS_fnc_addStackedEventHandler;
waitUntil{sleep 1;missionNamespace getVariable ["mapclick",false]};
["Krzyc_arty", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
[{missionNamespace setVariable ["Krzyc_art",1,true];systemChat localize "STR_Mission_Art_Rearmed";}, [], 1350] call CBA_fnc_waitAndExecute;
