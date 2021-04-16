params ["_text","_posX","_posY","_duration","_fadeTime"];
forceUnicode 1;
private _distance = 1.53;
private _size = 0.6;
private _stringArray = _text splitString "";

if (isNil "Krzyc_layers") then
{
	Krzyc_layers = 99999;
};

{
	private _text = format ["<t align='left' font='EtelkaMonospacePro' size='%2' shadow='2' color='#9abf9a'>%1</t>",_x,_size];

	[_text,_posX - _distance,_posY,_duration,_fadeTime,0,Krzyc_layers] spawn bis_fnc_dynamictext;

	_distance = _distance - (_size*0.045)/1.5;


	if (Krzyc_layers < 900000) then
	{
		Krzyc_layers = 999999;
	}
	else
	{
		Krzyc_layers = Krzyc_layers - 1;
	};

	if (_text != " ") then
	{
		sleep 0.05;
	}
} forEach _stringArray;
