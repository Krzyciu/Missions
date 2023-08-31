#include "script_component.hpp"
#include "defines.inc"

/* ----------------------------------------------------------------------------
Function: fnc_ambientCivilians
Description:
    Spawns civilian agents around given object
Parameters:
    _city - Name of object being center of spawner. [Object]
    _radius - [Number]
    _civNumber- [Number]
Returns:
Examples:
    (begin example)
        ["Landay", 200, 20] spawn Krzyc_fnc_ambientCivilians
    (end)
Author:
    Krzyciu
---------------------------------------------------------------------------- */
params ["_city", "_radius", "_civNumber"];

private _buildings = nearestObjects [_city, ["House", "CBA_BuildingPos"], _radius];
_buildings = _buildings select {_x buildingPos -1 isNotEqualTo []};

private _civClasses = [
	"UK3CB_TKC_C_CIV", 
	"UK3CB_TKC_C_DOC", 
	"UK3CB_TKC_C_SPOT", 
	"UK3CB_TKC_C_WORKER"
];


for "_i" from 1 to _civNumber do {
	private _building = selectRandom _buildings;
	private _allPos = _building buildingPos -1;

	if (_allPos isNotEqualTo []) then
	{
		private _pos = selectRandom _allPos;
		private _randomClass = selectRandom _civClasses;
		private _agent = createAgent [_randomClass, _pos, [], 0, "CAN_COLLIDE"];
		_agent setDir random 360;

		_agent setBehaviour "CARELESS";
		_agent forceWalk true;
		_agent setVariable ["BIS_fnc_animalBehaviour_disable", true];

		// disable unwanted AI features
		_agent disableAI "FSM";

		sleep 0.1;
		private _fsmHandler = _agent execFSM "functions\ambientCivs\behavior.fsm";
		_fsmHandler setFSMVariable ["_safespots", _buildings];

		private _ehFiredNear = _agent addEventHandler ["FiredNear", {
			params ["_agent"];
			_agent forceWalk false;
			doStop _agent;
			switch (round (random 2)) do {
				case 0: {[_agent,"ApanPercMstpSnonWnonDnon_G01"] remoteExec ["switchMove", 0]};
				case 1: {_agent playMoveNow "ApanPknlMstpSnonWnonDnon_G01"};
				case 2: {_agent playMoveNow "ApanPpneMstpSnonWnonDnon_G01"};
				default {_agent playMoveNow "ApanPknlMstpSnonWnonDnon_G01"};
			};
			_agent forceSpeed (_agent getSpeed "FAST");
		}];

		_agent setVariable ["ehFiredNear", _ehFiredNear];
		_agent setVariable [QGVAR(town), _city, true];
		_agent enableDynamicSimulation true;

		{[_x, [[_agent], true]] remoteExecCall ["addCuratorEditableObjects", 2, false]; }forEach allCurators;
	};
	sleep 0.25;
};
