//Cywile są friendly dla wszystkich stron//
CIVILIAN setFriend [EAST , 1];
CIVILIAN setFriend [INDEPENDENT , 1];
CIVILIAN setFriend [WEST , 1];
trigger_rockets setTriggerInterval 25;
trigger_wieza setTriggerInterval 25;
trigger_paliwo setTriggerInterval 25;
{_x disableAI "PATH"}forEach ((getMissionLayerEntities "Players") select 0);
_blackdownLocal = ["blackfishdownLocal", {[] spawn Krzyc_fnc_blackfishLocal}] call CBA_fnc_addEventHandler;
_blackdownServer = ["blackfishdownServer", {[] spawn Krzyc_fnc_blackfishServer}] call CBA_fnc_addEventHandler;
{_x hideObjectGlobal true} forEach ((getMissionLayerEntities "Labs") select 0);

0 spawn {
[[switchableUnits, playableUnits] select isMultiplayer] call A3CS_fnc_jamSquadRadar;
sleep 65;
[[switchableUnits, playableUnits] select isMultiplayer, false, false] call A3CS_fnc_jamSquadRadar;
};
