_info = [player, false] call a3cs_nametags_fnc_getUnitData;
_imie = _info select 1;
_ranga = _info select 2;
//Czarny ekran//
cutText ["", "BLACK FADED", 999];
sleep 10;
//Muzyka//
playMusic "Music_Intro_03_MissionStart";
sleep 0.1;
//Czarne paski na dole i na górze ekranu//
[0, 0] spawn BIS_fnc_cinemaBorder;
sleep 10;
//3x wyświetlenie tekstu na środku ekranu//
titleText ["<t font='RobotoCondensedLight' size='2'>Dzięki działaniom wywiadu udało się zdobyć informacje na temat lokalizacji Liwońskich wyrzutni rakiet balistycznych.</t>", "PLAIN",3,true,true];
sleep 6;
titleFadeOut 1;
sleep 3;
titleText ["<t font='RobotoCondensedLight' size='2'>Ze względu na realną możliwość ich użycia, podjęto decyzję o przeprowadzeniu rajdu wgłąb terytorium Liwonii i unieszkodliwieniu wyrzutni.  </t>", "PLAIN",3,true,true];
sleep 6;
titleFadeOut 1;
sleep 3;
titleText ["<t font='RobotoCondensedLight' size='2'>W region Nadboru zostaje wysłany 3PGR z zadaniem sabotażu wrogich instalacji.</t>", "PLAIN",3,true,true];
sleep 6;
titleFadeOut 1;
sleep 4;
//Wyświetlenie loga army/a3c//
titleText ["","BLACK OUT",2];
2 cutRsc ["RscLogoB","BLACK",0.01];
titleText ["","BLACK IN",2];
sleep 3;
titleText ["","BLACK OUT",2];
sleep 3;
2 cutRsc ["RscLogoA","BLACK",0.01];
titleText ["","BLACK IN",2];
sleep 3;
titleText ["","BLACK OUT",2];
sleep 3;
2 cutFadeOut 0;
titleText ["","BLACK IN",2];
//Tekst po prawej stronie//
[["Region Nadboru, Liwonia",2,3,4],["24 Listopada 2020, 00:04",2,3,4],["3 Pluton Głębokiego Rozpoznania",2,3,4],[(_ranga + " " + _imie),2,3,4]] spawn BIS_fnc_EXP_camp_SITREP;
//Koniec czarnego ekranu//
 titleCut ["", "BLACK IN", 8];
 //efekt rozmycia obrazu//
 "dynamicBlur" ppEffectEnable true;
 "dynamicBlur" ppEffectAdjust [6];
 "dynamicBlur" ppEffectCommit 0;
 "dynamicBlur" ppEffectAdjust [0.0];
 "dynamicBlur" ppEffectCommit 5;
sleep 16;
10 fadeMusic 0;
//Wyłączenie czarnych pasków na dole i na górze ekranu//
[1, 1] spawn BIS_fnc_cinemaBorder;
titleText ["<t color='#2cb0a5' shadow = 1 size='1.4'>Crossroads:</t><t color ='#FFFFFF' shadow = 2 size ='1.3'>Już po północy. Ruszajcie. Będziemy w kontakcie radiowym. Crossroads out.</t>", "PLAIN DOWN", -1, true, true];
