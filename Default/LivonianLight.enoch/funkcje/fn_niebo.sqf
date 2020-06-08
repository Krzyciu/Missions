
if (!isServer) exitWith {};

_sky_obj = _this select 0;
if (!isNil {_sky_obj getVariable "is_ON"}) exitwith {};
_sky_obj setVariable ["is_ON",true,true];

[[_sky_obj],Krzyc_fnc_nieboSFX] remoteexec ["spawn",0,true];
