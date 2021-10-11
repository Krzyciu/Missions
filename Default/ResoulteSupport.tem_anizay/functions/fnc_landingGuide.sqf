#include "script_component.hpp"
params ["_unit"];

private _chemlightR = "Chemlight_yellow_Infinite"createVehicle [0,0,0];
_chemlightR attachTo [_unit,[0,0,0],"righthand"];
private _chemlightL = "Chemlight_yellow_Infinite"createVehicle [0,0,0];
_chemlightL attachTo [_unit,[0,0,0],"lefthand"];

_unit switchMove "Acts_JetsMarshallingEmergencyStop_in";
sleep 1.366;
_unit playMove "Acts_JetsMarshallingEmergencyStop_loop";
sleep 2;
_unit switchMove "Acts_JetsMarshallingStraight_loop";
sleep 8;
_unit switchMove "Acts_JetsMarshallingEnginesOn_out";
sleep 2;
_unit switchMove "Acts_JetsMarshallingClear_in";
sleep 1;
_unit switchMove "Acts_JetsMarshallingClear_loop";
sleep 2;
_unit switchMove "Acts_JetsMarshallingClear_out";
sleep 1;

{deleteVehicle _x} forEach [_chemlightR,_chemlightL];
