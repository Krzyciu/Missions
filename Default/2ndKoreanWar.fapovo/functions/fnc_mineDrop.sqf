miner setVariable ["Krzyc_used", false, true];
for "_i" from 1 to 10 do {
 private _pos = miner modelToWorld [-0.3,0.4,-0.2];
 private _dir = (getDir miner - 90);
 systemChat format ["Wystrzelono %1 min", _i];
 private _speedProjectile = velocity miner;
 private _posProjectile = [sin _dir,cos _dir,0];
 private _mineProjectile = createvehicle ["Land_BombDemine_01_Dummy_F",_pos vectorAdd _posProjectile,[],0,"can_collide"];
 _mineProjectile setdir _dir;
 _mineProjectile setvelocity [
  sin _dir * 10,
  cos _dir * 10,
  -1
 ];
 _mineProjectile allowdamage false;
_mineProjectile spawn {
  params ["_mineProjectile"];
  private _smoke = "#particlesource" createVehicle [0,0,0];
  _smoke setParticleClass "DeminingExplosiveTrial";
  _smoke attachTo [_mineProjectile,[0,0,0]];
  sleep 6;
  deleteVehicle _smoke;};
 _mineProjectile spawn {
 private _timeOut = time + 10;
  waituntil {velocity _this distance [0,0,0] == 0 || time > _timeOut};
  if (time > _timeOut || (getposasl _this select 2) < 0) exitwith {deletevehicle _this;}; //terminate when failed to stop or under water
  private _mine = createvehicle ["APERSMineDispenser_Mine_Ammo",position _this,[],0,"can_collide"];
  _mine setposatl getposatl _this;
  deletevehicle _this;
 };
 sleep 0.7;
};
systemChat localize "STR_Mission_Mines_Reload";
[{
private _minesLeft = (miner getVariable ["Krzyc_mines",_minesLeft]) - 10;
miner setVariable ["Krzyc_mines",_minesLeft, true];
miner setVariable ["Krzyc_used", true, true];
}, [], 10] call CBA_fnc_waitAndExecute;
