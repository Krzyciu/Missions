//przekazywac null = ["klasaPojazdu","klasaCrew",glStart,glEnd] execVM "skrypty\pojazdy.sqf";
//versja 0.1
if (!hasInterface && !isDedicated) then {
_klasaPojazd = _this select 0;
_klasaCrew = _this select 1;
_start = _this select 2;
_end = _this select 3;
_strona = east;

_pojazd = _klasaPojazd createVehicle getPosATL _start;

_grupaARMOR = createGroup _strona;
for "_i" from 1 to 2 do {
_soldaten = nil;
_klasaCrew createUnit [getPosATL _pojazd, _grupaARMOR,"_soldaten = this;"];
if(!alive driver _pojazd) then {_soldaten moveInDriver _pojazd;} else {_soldaten moveInGunner _pojazd};
_soldaten setSkill (selectRandom [0.5,0.6,0.7,0.8]);
doStop _soldaten;
sleep 0.1;
};


_wp =_grupaARMOR addWaypoint [_end, 0];

_grupaARMOR setCurrentWaypoint [_grupaARMOR, 0];

_grupaARMOR setBehaviour "SAFE";

(driver _pojazd) doMove (getPosATL _end);};
