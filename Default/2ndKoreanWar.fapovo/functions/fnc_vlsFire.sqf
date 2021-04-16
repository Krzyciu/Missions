params ["_vls","_target"];
civilian reportRemoteTarget [_target, 3600];
_target confirmSensorTarget [civilian, true];
_vls fireAtTarget [_target, "weapon_vls_01"];
sleep 10;
_vls fireAtTarget [_target, "weapon_vls_01"];
sleep 5;
_vls fireAtTarget [_target, "weapon_vls_01"];
