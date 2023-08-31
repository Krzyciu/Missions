params ["_display"];

private _background = _display ctrlCreate ["RscPicture", -1];

_background ctrlSetPosition [
    safezoneXAbs,
    safezoneY,
    safezoneWAbs,
    safezoneH
];
_background ctrlCommit 0;
_background ctrlSetText "#(rgb,8,8,3)color(0,0,0,1)";

private _size = 0.25;
private _width = _size * safezoneW;
private _height = _size * safezoneH * (getResolution#4);

private _picture = _display ctrlCreate ["RscPicture", -1];

_picture ctrlSetPosition [
    0.5-_width/2,
    0.5-_height/2,
    _width, _height
];
_picture ctrlCommit 0;
_picture ctrlSetText "data\logo.paa";

private _text = _display ctrlCreate ["RscStructuredText", -1];

_text ctrlSetPosition [
    0.5-_width/2,
    0.2+_height/1.15,
    _width, _height
];
_text ctrlCommit 0;
_text ctrlSetStructuredText parseText "<t color='#ffffff' size='2.7' align='center'> Resolute Support </t>";


private _text3 = _display ctrlCreate ["RscStructuredText", -1];
_text3 ctrlSetPosition [safeZoneX, safeZoneH + safeZoneY - (20 * pixelH * (getResolution#4)),1, (20 * pixelH * (getResolution#4))];
_text3 ctrlCommit 0;
_text3 ctrlSetStructuredText parseText "<t color='#ffffff' size='1.5' align='left'>by </t><t color='#ffffff' size='1.7' align='left'>Krzyciu</t>";
