_info = [player, false] call a3cs_nametags_fnc_getUnitData;
_imie = _info select 1;
_ranga = _info select 2;
enableEnvironment [false,false];
sleep 0.5;
//Czarny ekran//
cutText ["", "BLACK FADED", 999];
//Czarne paski na dole i na górze ekranu//
[0, 0] spawn BIS_fnc_cinemaBorder;
//desync
sleep 10:
//Muzyka//
playMusic "Track_R_24";
sleep 7;
//3x wyświetlenie tekstu na środku ekranu//
titleText [localize "STR_Mission_Intro_1", "PLAIN",-1,true,true];
sleep 5;
titleFadeOut 2;
sleep 5;
titleText [localize "STR_Mission_Intro_2", "PLAIN",-1,true,true];
sleep 5;
titleFadeOut 2;
sleep 5;
titleText [localize "STR_Mission_Intro_3", "PLAIN",-1,true,true];
sleep 5;
titleFadeOut 2;
sleep 5;
//Wyświetlenie loga army/a3c//
titleText ["","BLACK OUT",2];
2 cutRsc ["RscLogoB","BLACK",0.01];
titleText ["","BLACK IN",3];
sleep 4;
titleText ["","BLACK OUT",2];
sleep 4;
2 cutRsc ["RscLogoA","BLACK",0.01];
titleText ["","BLACK IN",3];
sleep 4;
titleText ["","BLACK OUT",2];
sleep 4;
2 cutFadeOut 0;
titleText ["","BLACK IN",2];
//Tekst po prawej stronie//
[[localize "STR_Mission_Intro_4",2,3,4],[localize "STR_Mission_Intro_5",2,3,4],[localize "STR_Mission_Intro_6",2,3,4],[(_ranga + " " + _imie),2,3,4]] spawn BIS_fnc_EXP_camp_SITREP;
//Koniec czarnego ekranu//
 titleCut ["", "BLACK IN", 8];
 //efekt rozmycia obrazu//
 "dynamicBlur" ppEffectEnable true;
 "dynamicBlur" ppEffectAdjust [6];
 "dynamicBlur" ppEffectCommit 0;
 "dynamicBlur" ppEffectAdjust [0.0];
 "dynamicBlur" ppEffectCommit 5;
sleep 15;
10 fadeMusic 0;
//Wyłączenie czarnych pasków na dole i na górze ekranu//
[1, 1] spawn BIS_fnc_cinemaBorder;
enableEnvironment [true,true];
