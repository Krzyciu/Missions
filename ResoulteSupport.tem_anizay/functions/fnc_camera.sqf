#include "script_component.hpp"

private _blur = ppEffectCreate ["dynamicBlur",100];
_blur ppEffectAdjust [5];
_blur ppEffectCommit 0;
_blur ppEffectEnable true;

private _color = ppEffectCreate ["ColorCorrections",1500];
_color ppEffectAdjust [1,1, 0, [0,0, 0, 0.0], [0.5, 0.5, 0.5,0],  [0.1, 0.9, 0.9, 0]];
_color ppEffectCommit 0;
_color ppEffectEnable true;

_blur ppEffectAdjust [0];
_blur ppEffectCommit 7;

_color ppEffectAdjust [1,1, 0, [0,0, 0, 0.0], [0.5, 0.5, 0.5,1],  [0.1, 0.9, 0.9, 0]];
_color ppEffectCommit 7;

private _pos = getPos player;
cutText ["","BLACK IN", 2];
private _camera = "camera" camCreate [0,0,0];
showCinemaBorder false;
_camera cameraEffect ["external", "back"];
_camera camPrepareTarget player;
_camera camCommitPrepared 0;
_camera camPrepareRelPos [0, -15, 100];
_camera camCommitPrepared 0;
_camera camPreparePos getPosATL player;
_camera camCommitPrepared 5;
sleep 4.95;
_camera cameraEffect ["terminate", "back"];
camDestroy _camera;

// Text, letter by letter
0 spawn {
    private _w = 2.42;
    private _h = 0.25;
    private _unitData = [player, false] call A4ESFUNC(nametags,getUnitData);
    date params ["", "", "", "_hour", "_minute"];

    [
        [
            [(_unitData #2 + " " + _unitData #1)],
            [LLSTRING(Intro_4)],
            [format ["%1  %2%3%4:%5",LLSTRING(Intro_5), ["0", ""] select (_hour >= 10), _hour, ["0", ""] select (_minute >= 10), _minute]],
            [LLSTRING(Intro_6)]
        ],
        [safeZoneX + safeZoneW - _w, _w],
        [safeZoneY + safeZoneH - _h - 0.05, _h]
    ] spawn FUNC(typeText);
};

sleep 5;
_blur ppEffectEnable false;
_color ppEffectEnable false;

ppEffectDestroy [_blur, _color];

5 fadeEnvironment 1;

[false] call A4ESFUNC(ui,toggleScreenshotMode);
