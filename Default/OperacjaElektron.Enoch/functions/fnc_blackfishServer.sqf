{_x allowDamage false} forEach [pil_1,pil_2,pil_3];
private _hitPoints =	["HitAvionics","HitEngine","HitEngine2","HitHull","HitFuel","HitGlass1"];
private _hitPoints =	_hitPoints call BIS_fnc_arrayShuffle;
private _warningSound = [{[samolot,"warning"] remoteExec ["say2D", [pil_1,pil_2,pil_3], true];},10,[]] call CBA_fnc_addPerFrameHandler;
{
  for "_h" from 0.2 to 1 step 0.1 do {
    samolot setHit [getText(configFile >> "cfgVehicles" >> (typeOf  samolot) >> "HitPoints" >> _x >> "name"), _h];
      sleep (random 0.5);
        };

   if (_x == "HitEngine")then{
      private _smoke = "test_EmptyObjectForSmoke" createVehicle [0,0,0];
      _smoke attachTo [samolot,[0,0,0]];

      samolot setHit ["Glass1", 1];
              };
      }foreach  _hitPoints;

waitUntil {sleep 1;(count (crew samolot)) isEqualTo 0};

[_warningSound] call CBA_fnc_removePerFrameHandler;
sleep 150;
{_x allowDamage true} forEach [pil_1,pil_2,pil_3];
