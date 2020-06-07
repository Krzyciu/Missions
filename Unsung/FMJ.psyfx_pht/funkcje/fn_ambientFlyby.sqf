  if (!isServer) exitWith {};

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
_swiatlo = "#lightpoint" createvehicleLocal getPosASL _vehicle;
_swiatlo setLightDayLight true;
_swiatlo setLightUseFlare true;
_swiatlo setLightFlareSize 5;
_swiatlo setLightFlareMaxDistance 5000;
_swiatlo setLightAmbient[1,0.5,1];
_swiatlo setLightColor[1,0.1,0.1];
_swiatlo setLightAttenuation [0,0,0,0,0,4000];
_swiatlo setLightBrightness 10;
_swiatlo attachto [_vehicle,[0,0,0.3]];
_vehicle limitSpeed 250;
    [_vehicle, _safeTime] spawn {
        params ["_vehicle", "_safeTime"];
        sleep _safeTime;
        if (!isNull _vehicle) then {
            deleteGroup (group (driver _vehicle));
            deleteVehicle (driver _vehicle);
            deleteVehicle _vehicle;
        };
    };
