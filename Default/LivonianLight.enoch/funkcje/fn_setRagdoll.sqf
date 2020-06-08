//[player,[0,100,0]] call Krzyc_fnc_setRagdoll//

params
[
["_unit",objNull,[objNull]],
["_force",[0,0,0],[[]],[3]],
["_position","spine1",["string"]],
["_noEffect",false,[false]]
];

// only characters
if(!(_unit isKindOf "Man"))exitWith{};

// dissable dmg
private _damageState = isDamageAllowed _unit;
if(_damageState)then{_unit allowDamage false};

// create collider and add mass
private _pos =  (AGLtoASL(_unit modelToWorldVisual (_unit selectionPosition _position))) ;
private _collider = "B_MRAP_01_F" createVehicleLocal [0,0,0];
_collider setMass 10^10;
_collider setPosASL _pos;
_collider setVelocity _force;
removeBackpack player;
// pp effects for players
if(_unit isEqualTo player && !_noEffect)then
{
playSound ["combat_deafness",true];
_PP_radial = ppEffectCreate ["radialBlur",700];
_PP_radial ppEffectEnable true;
_PP_radial ppEffectAdjust [0.06,0.09,0.19,0.37];
_PP_radial ppEffectCommit 3;
_PP_dynamic = ppEffectCreate ["DynamicBlur",600];
_PP_dynamic ppEffectEnable true;
_PP_dynamic ppEffectAdjust [1.12];
_PP_dynamic ppEffectCommit 0;

Krzyc_playerRagdolled = true;
// disable removal of pp
{
	_x spawn
	{
		sleep 6;
		(_this select 0) ppeffectAdjust (_this select 1);
		(_this select 0) ppEffectCommit 7;
		sleep 7;
		Krzyc_playerRagdolled = false;
		ppEffectDestroy (_this select 0);
	};
}foreach [[_PP_radial,[0.0,0.0,0.0,0.0]],[_PP_dynamic,[0]]];
};

_handle_wet = ppEffectCreate ["WetDistortion", 2];
_handle_wet ppEffectEnable true;
_handle_wet ppEffectCommit 0.1;
_handle_wet ppEffectAdjust [0.5, 1, 1, 4.10, 3.70, 2.50, 1.85, 0.0054, 0.0041, 0.05, 0.0070, 1, 1, 1, 1];
_handle_wet ppEffectCommit 0;
sleep 0.2;
// delete coliider
deleteVehicle _collider;
	// allow dmg
	if(_damageState)then{_unit allowDamage true};

cutText ["","BLACK OUT",3,true];
sleep 5;
cutText ["","BLACK IN",4,true];
sleep 5;
cutText ["","BLACK OUT",3,true];
sleep 5;
cutText ["","BLACK IN",4,true];
sleep 5;
cutText ["","BLACK OUT",3,true];
sleep 5;
cutText ["","BLACK IN",4,true];
sleep 5;
cutText ["","BLACK OUT",3,true];
sleep 5;
cutText ["","BLACK IN",4,true];
sleep 5;
player setDamage 1;
