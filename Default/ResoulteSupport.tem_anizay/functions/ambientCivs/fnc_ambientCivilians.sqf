#include "script_component.hpp"
#include "defines.inc"

/*
 * Author: Krzyciu
 * Ambient civilians spawner
 */

params ["_city", "_radius", "_civNumber"];

private _houses = _city nearObjects ["House", _radius];
// filter only enterable buildings
private _validHouses = _houses select {
	(_x buildingExit 0) isNotEqualTo [0, 0, 0]
};

private _civClasses = ["CFP_C_AFG_Civilian_02", "CFP_C_AFG_Civilian_01", "CUP_C_TK_Man_08", "CUP_C_TK_Man_04", "CUP_C_TK_Man_07", "CUP_C_TK_Man_03_Waist", "CUP_C_TK_Man_03_Jack", "CFP_C_ME_Civ_2_01", "CFP_C_ME_Civ_1_01"];

for "_i" from 1 to _civNumber do {
  private _pos = selectRandom _validHouses;
  _validHouses = _validHouses - [_pos];
	private _spawnPos = getPosATL _pos;
  private _grp = createGroup civilian;
	_grp deleteGroupWhenEmpty true;
  private _unit = _grp createUnit [selectRandom _civClasses, _spawnPos, [], 0, "NONE"];
  _unit setbehaviour "SAFE";
  private _fsmHandler = _unit execFSM "functions\ambientCivs\behavior.fsm";
	_fsmHandler setFSMVariable ["_safespots", _houses];
	_unit addEventHandler ["FiredNear", {
		params ["_unit"];
		_unit forceWalk false;
		_unit setBehaviour "COMBAT";
		_unit setSpeedMode "FULL";
	}];
	_unit setVariable ["town", _city, true];
	_unit enableDynamicSimulation true;
	sleep 0.4;
};
