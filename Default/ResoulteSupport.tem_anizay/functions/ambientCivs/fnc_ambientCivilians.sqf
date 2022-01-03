#include "script_component.hpp"
#include "defines.inc"

/*
 * Author: Krzyciu
 * Ambient civilians spawner
 */

params ["_city", "_radius", "_civNumber"];

private _buildings = nearestObjects [_city, ["House", "CBA_BuildingPos"], _radius];
_buildings = _buildings select {_x buildingPos -1 isNotEqualTo []};

private _civClasses = ["CFP_C_AFG_Civilian_02", "CFP_C_AFG_Civilian_01", "CUP_C_TK_Man_08", "CUP_C_TK_Man_04", "CUP_C_TK_Man_07", "CUP_C_TK_Man_03_Waist", "CUP_C_TK_Man_03_Jack", "CFP_C_ME_Civ_2_01", "CFP_C_ME_Civ_1_01"];


for "_i" from 1 to _civNumber do {
	private _building = selectRandom _buildings;
	private _allPos = _building buildingPos -1;
	// added BEFORE condition, so if building was somehow corrupted it won't be stuck in infinite loop.

	if (_allPos isNotEqualTo []) then
	{
		private _pos = selectRandom _allPos;
		private _randomClass = selectRandom _civClasses;
		private _agent = createAgent [_randomClass, _pos, [], 0, "CAN_COLLIDE"];

		_agent setBehaviour "CARELESS";
		_agent forceWalk true;
		private _fsmHandler = _agent execFSM "functions\ambientCivs\behavior.fsm";
		_fsmHandler setFSMVariable ["_safespots", _buildings];

		private _ehFiredNear = _agent addEventHandler ["FiredNear",
		{
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
		_agent setVariable ["town", _city, true];
		_agent enableDynamicSimulation true;

		{[_x, [[_agent], true]] remoteExecCall ["addCuratorEditableObjects", 2, false]; }forEach allCurators;
	};
	sleep 0.1;
};
