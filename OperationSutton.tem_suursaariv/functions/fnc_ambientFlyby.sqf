//Autor: Krzyciu
//Wywoływać:["klasaPojazdu", strona, "markerStartu", "markerKońca", wysokość] spawn TwojTag_fnc_ambientFlyby;
//np: ["C_Plane_Civil_01_F", west, "start_1", "end_1", 100] spawn TwojTag_fnc_ambientFlyby;
if (isServer) then {

params ["_class", "_side", "_markerStart", "_markerEnd", "_height"];

  private _posStart = getMarkerPos _markerStart;
  _posStart set [2, _height];
  private _posEnd = getMarkerPos _markerEnd;
  _posEnd set [2, _height];
  private _dir = _posStart getDir _posEnd;

    ([_posStart, _dir, _class, _side] call BIS_fnc_spawnVehicle) params ["_vehicle", "_crew", "_group"];

    _vehicle engineOn true;
    _vehicle setVehicleAmmo 0;
    //Czasami trzeba dodać prędkość bo samoloty spadają - np na ifie. Prędkość w formacie [Vx,Vy,Vz]
    //_vehicle setVelocity [0,90,35];
    private _wp =_group addWaypoint [_posEnd, 0];
    _wp setWaypointType "MOVE";
    _wp setWaypointBehaviour "CARELESS";
    _wp setWaypointCombatMode "BLUE";
    //Prędkość z którą leci ai, LIMITED albo FULL
    _wp setWaypointSpeed "LIMITED";
    _wp setWaypointStatements ["true", "private _veh = vehicle this;deleteGroup (group this);deleteVehicle this;deleteVehicle _veh"];

    [_vehicle] spawn {
        params ["_vehicle"];
        //czas po którym zostanie usunięty jeżeli waypoint nie bedzie aktywowany
        sleep 200;
        if (!isNull _vehicle) then {
            deleteGroup (group (driver _vehicle));
            deleteVehicle (driver _vehicle);
            deleteVehicle _vehicle;
        };
    };
};
