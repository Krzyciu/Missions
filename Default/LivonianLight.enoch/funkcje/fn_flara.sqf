/*
		opis: Skrypt w��cza widzialno�� Ai przez hideObjectGlobal true; na czas dzia�ania flary i w konkretnej odleg�o�ci.
		autor: blaster
		wersja mod�w z 2017-09-05 v2 zmiana zasady dzia�ania - przydzielanie jednostek do ukrycia

	u�ycie w inicie gracza:
	this addEventHandler ["Fired", {
	if(_this select 5 == "UGL_FlareWhite_F") then {
	0 = [(_this select 0),"B_Soldier_VR_F",3,55,1500,false] execVM "skrypty\Flara.sqf";
	};
	}];
	"B_Soldier_VR_F" - to klasa jednostki ktora bedzie odkrywana
	3 - to czas zapalenia sie granatu
	55 - to czas w kt�rym flara p�onie
	1500 - to odleglo�� na ktora ma dziala� skrypt
	false - false lub true - true kiedy sprawdzasz w edytorze false - kiedy ma dziala� na dedyku podczas misji oficialnej.

*/

private ["_Gracz", "_unit", "_wystrzal", "_plonie", "_odleglosc", "_edytor","_powtorzen","_duchy","_iloscDuchow"];

_Gracz = _this select 0; 	// odwolanie do gracza ktory odpalil flare
_unit = _this select 1; 		// nazwa klasy jednostki ktora nalezy odkryc
_wystrzal = _this select 2; 	// wartosc w sekundach od wytrzelenia flary do jej zapalenia sie
_plonie = _this select 3; 	// wartosc w sekundach - jak dlugo flara pali sie
_odleglosc = _this select 4;	// wartosc w metrach - jak daleko jednostki maja odkryc sie



	sleep _wystrzal;

	while {_plonie > 0} do {

	_duchy = nearestObjects [_Gracz, [_unit], _odleglosc];
	_iloscDuchow = Count _duchy;

	if (_iloscDuchow > 0) then {
	{_x hideObjectGlobal false} foreach _duchy;
	};

	sleep 1;
	_plonie = (_plonie - 1);

	if (_plonie == 0) then {
	//ukrywa duchy jezeli pentla konczy sie

	_duchy = nearestObjects [_Gracz, [_unit], (_odleglosc + 1000)];
	{_x hideObjectGlobal true;} foreach _duchy;

	};
};
