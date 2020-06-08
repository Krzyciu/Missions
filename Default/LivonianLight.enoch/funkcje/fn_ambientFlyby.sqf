if (isDedicated) then {

params ["_class", "_side", "_glStart", "_glEnd", "_safeTime"];
  private _posStart = getPosASL _glStart;
  private _posEnd = getPosASL _glEnd;
  private _dir = _posStart getDir _posEnd;

    ([_posStart, _dir, _class, _side] call BIS_fnc_spawnVehicle) params ["_vehicle", "_crew", "_group"];

    private _wp =_group addWaypoint [_posEnd, 0];
    _wp setWaypointType "MOVE";
    _wp setWaypointBehaviour "COMBAT";
    _wp setWaypointCombatMode "BLUE";
    _wp setWaypointSpeed "LIMITED";
    _wp setWaypointStatements ["true", "private _veh = vehicle this;deleteGroup (group this);deleteVehicle this;deleteVehicle _veh"];
{_vehicle setObjectMaterialGlobal [_x, 'A3\Data_F\mirror.rvmat'];} forEach [0,1,2,3,4,5,6,7,8,9,10];
_vehicle limitSpeed 250;
    [_vehicle, _safeTime] spawn {
        params ["_vehicle", "_safeTime"];
        sleep _safeTime;
        if (!isNull _vehicle) then {
            deleteGroup (group (driver _vehicle));
            deleteVehicle (driver _vehicle);
            deleteVehicle _vehicle;
            _swiatlo = "#lightpoint" createvehicle getPosASL _vehicle;
            [_swiatlo,true] remoteExec ["setLightDayLight",-2,_swiatlo];
            [_swiatlo,true] remoteExec ["setLightUseFlare",-2,_swiatlo];
            [_swiatlo,5] remoteExec ["setLightFlareSize",-2,_swiatlo];
            [_swiatlo,5000] remoteExec ["setLightFlareMaxDistance",-2,_swiatlo];
            [_swiatlo,[1,0.5,1]] remoteExec ["setLightAmbient",-2,_swiatlo];
            [_swiatlo,[1,0.1,0.1]] remoteExec ["setLightColor",-2,_swiatlo];
            [_swiatlo,[0,0,0,0,0,4000]] remoteExec ["setLightAttenuation",-2,_swiatlo];
            [_swiatlo,10] remoteExec ["setLightBrightness",-2,_swiatlo];
            [_vehicle,[0, 0, 0]] remoteExec ["lightAttachObject",-2,_swiatlo];
        };
    };
};
