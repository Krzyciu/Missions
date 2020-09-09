private _pos = _this select 0;
private _mode = _this select 1;

cutText ["","BLACK OUT"];
sleep 1;
player setPosATL (getPosATL _pos);
sleep 1.5;
cutText ["","BLACK IN"];

switch (_mode) do
{

case "on":
{
  enableEnvironment [false,false];
  _handle = [{if (player isFlashlightOn (currentWeapon player) isEqualTo true) then {player action ["GunLightOff", player]}}, (random 10), []] call CBA_fnc_addPerFrameHandler;
  handle = _handle;
  player setVariable ["handle", _handle];
  player say3D "spark";
};

case "off":
{
  enableEnvironment [false,true];
  _handle = player getVariable "handle";
  [_handle] call CBA_fnc_removePerFrameHandler;
  handle = _handle;
  player setVariable ["handle", _handle];
};

};
