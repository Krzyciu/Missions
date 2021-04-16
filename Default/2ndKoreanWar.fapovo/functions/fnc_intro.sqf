[] call a3cs_ui_fnc_toggleScreenshotMode;
enableEnvironment [false,false];
private _unitData = [player, false] call a3cs_nametags_fnc_getUnitData;
cutText ["", "BLACK FADED", 999];
sleep 2;
playMusic "AmbientTrack03a_F_Tacops";
titleText ["<t size='1.4' color='#6b6b6b'>Przeładowywanie magazynków...</t>", "PLAIN DOWN", -1, false, true];
sleep 10;
waitUntil {
  sleep 0.1;
  private _status = missionNamespace getVariable ["mission_mapSpawn", [false]];
  _status # 0
};
waitUntil {
  sleep 0.25;
  private _status = missionNamespace getVariable ["mission_mapSpawn", [false, 0, 0, false]];
  private _counter = _status # 1;
  private _count = _status # 2;
  private _percent = floor ((_counter / _count) * 100);
  titleText [format [
    "<t color='#6b6b6b'><t size='1.4'>%5</t><br/><t size='1.6'>%1%2</t><br/>%3/%4</t>",
    _percent,
    "%",
    _counter,
    _count,
    localize "STR_Mission_Intro_CreatingObjs"
  ], "PLAIN DOWN", 0.001, false, true];
  titleFadeOut 9999;
  _status # 3
};
titleText ["<t size='1.4' color='#6b6b6b'>Uzupełnianie paliwa...</t>", "PLAIN DOWN", -1, false, true];
sleep 1.5;
titleText ["<t size='1.4' color='#6b6b6b'>Pobieranie sprzętu...</t>", "PLAIN DOWN", -1, false, true];
sleep 1.5;
titleText ["<t size='1.4' color='#6b6b6b'>Malowanie pojazdów...</t>", "PLAIN DOWN", -1, false, true];
sleep 4;
//2x wyświetlenie tekstu na środku ekranu//
titleText [localize "STR_Mission_Intro_2", "PLAIN",-1,true,true];
sleep 5;
titleFadeOut 2;
sleep 3;
titleText [localize "STR_Mission_Intro_3", "PLAIN",-1,true,true];
sleep 5;
titleFadeOut 2;
sleep 2;
//Wyświetlenie loga army/a3c//
titleText ["","BLACK OUT",2];
2 cutRsc ["RscLogoB","BLACK",0.01];
titleText ["","BLACK IN",3];
sleep 3;
titleText ["","BLACK OUT",2];
sleep 3;
2 cutRsc ["RscLogoA","BLACK",0.01];
titleText ["","BLACK IN",3];
sleep 3;
titleText ["","BLACK OUT",2];
sleep 2;
2 cutFadeOut 0;
titleText ["","BLACK IN",10];
cutText ["","BLACK OUT", 0];
sleep 3;
[(_unitData # 2 + " " + _unitData # 1),0.82, 1.17, 12, 4] spawn Krzyc_fnc_typeText;
sleep 2;
[localize "STR_Mission_Intro_4",0.82, 1.22, 12, 4] spawn Krzyc_fnc_typeText;
sleep 2;
[localize "STR_Mission_Intro_5",0.82, 1.27, 12, 4] spawn Krzyc_fnc_typeText;
sleep 2;
[localize "STR_Mission_Intro_6",0.82, 1.32, 12, 4] spawn Krzyc_fnc_typeText;
sleep 16;
cutText ["","BLACK IN", 18];
8 fadeMusic 0;
//efekt rozmycia obrazu//
 "dynamicBlur" ppEffectEnable true;
 "dynamicBlur" ppEffectAdjust [6];
 "dynamicBlur" ppEffectCommit 0;
 "dynamicBlur" ppEffectAdjust [0.0];
 "dynamicBlur" ppEffectCommit 5;
sleep 6;
enableEnvironment [false,true];
[] call a3cs_ui_fnc_toggleScreenshotMode;
