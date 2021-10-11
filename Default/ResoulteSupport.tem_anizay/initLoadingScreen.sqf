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

private _size = 0.2;
private _width = _size * safezoneW;
private _height = _size * safezoneH * (getResolution#4);

private _picture = _display ctrlCreate ["RscPicture", -1];

_picture ctrlSetPosition [
    0.5-_width/2,
    0.5-_height/2,
    _width, _height
];
_picture ctrlCommit 0;
_picture ctrlSetText "data\a3c2.paa";

private _text = _display ctrlCreate ["RscLoadingText", -1];

_text ctrlSetPosition [
    0.5-_width/2,
    0.5,
    _width, _height
];
_text ctrlCommit 0;
_text ctrlSetText "Tequila Highway";


private _text3 = _display ctrlCreate ["RscStructuredText", -1];
_text3 ctrlSetPosition [safeZoneX, safeZoneH + safeZoneY - (20 * pixelH * (getResolution#4)),1, (20 * pixelH * (getResolution#4))];
_text3 ctrlCommit 0;
_text3 ctrlSetStructuredText parseText "<t color='#9abf9a' size='1.2' align='left'>by </t><t color='#9abf9a' size='1.4' align='left'>A3C|Krzyciu</t>";
