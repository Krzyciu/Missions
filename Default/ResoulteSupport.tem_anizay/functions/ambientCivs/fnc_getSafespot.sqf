#include "script_component.hpp"
#include "defines.inc"

params ["_unit","_mode", "_safespots"];

//filter out invalid safespots, Waypoint ONLY for endangered behaviour or Cover ONLY for idle
switch (_mode) do
{
	case MODE_NEAREST:
	{
		([_safespots,[_unit],{_x distance _input0},"ASCEND"] call bis_fnc_sortBy) param [0,objNull]
	};
	case MODE_RANDOM:
	{
		selectRandom _safespots
	};
	default
	{
		objNull
	};
};
