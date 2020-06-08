/*
	opis - modyfikuje zachowanie AI tak by zachowywa� si� agresywnie i zadawa� ace obra�enia mele
	autor - 	blaster (skrypt wzorowany na skrypcie Chrno, z wywaleniem zb�dnych pierd�� i dodaniem swoich)
			skrypt napisany porz�dnie od zera - 1 pentla + spawn na dzwieki, a nie 10 pentli, d�u�sze sleepy = optymalizacja, dostosowanie do systemu cache, dostosowanie do systemu ACE medical.

	wersja mod�w z 2017-09-05

	u�ycie:
		uwaga! jednostki graczy powinny by� w opforze, skrypt tak przewiduje - ale mo�na przerobi� kilka linijek by gracze byli w INDFORZE lub w cywilach.
		w folderze dzwieki znajduje si� 5 plikow z nazwa duszek oraz 3 z nazwa agro - roznia sie numerami. Skrypt losuje miedzy nimi i je odtwarza.
	w module:
	0 = [_this,100,true] execVM "skrypty\duchy.sqf";
	w jednostce postawionej z palca:
	0 = [this,100,true] execVM "skrypty\duchy.sqf";

	100 - odleglo�� od ktorej z�apie agro je�eli zauwa�y gracza
	true/false - tryb edytor - true: widocznosc edytor. false: widocznosc misja oficjalna na serwerze dedykowanym z HC




*/

private ["_unit", "_agro", "_edytor","_targets","_target","_selections","_gethit","_i","_olddamage","_currentdmg","_damage","_soundPath","_soundToPlay"];


	_unit = _this select 0; // jednostka AI
	_agro = _this select 1; // odleglosc agro
	_edytor = _this select 2; // tryb debug - true: widocznosc edytor. false: widocznosc misja oficjalna na serwerze dedykowanym z HC
	_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString; //musimy zapisac nazwe misji aby odtworzyc dzwiek 3d

		//to trzeba zmieni� by chodzi�o tylko na HC/na serwerze/ lub tu i tu
	 if (hasInterface) exitWith {};

	_unit addRating -10000;
	//wy��czamy rzeczy kt�re sie nie przydadz� a dadz� nam optymalizacje
	_unit setunitpos "up";
	 _unit setBehaviour "CARELESS";
	{_unit disableAI _x} foreach ["TARGET","AUTOTARGET","FSM","AIMINGERROR","SUPPRESSION","COVER","AUTOCOMBAT","MINEDETECTION" ];
	_unit allowFleeing 0;
	_unit setskill 1;
	_unit setSpeedMode "FULL";
	if(isFormationLeader _unit) then {(group _unit) setSpeedMode "FULL";};
	_unit setmimic "dead";
	_unit disableConversation true;

		//w tym miejscu wy��czamy ace medical dla duch�w - aby zwiekszyc im hp trzeba wylaczyc ace medical
		_unit removeAllEventHandlers "HandleDamage";
		//w tym miejscu zwiekszamy odpornosc duch�w
		_unit setVariable ["selections", []];
		_unit setVariable ["gethit", []];
		_unit addEventHandler
		[
		"HandleDamage",
		{
		_unit = _this select 0;
		_selections = _unit getVariable ["selections", []];
		_gethit = _unit getVariable ["gethit", []];
		_selection = _this select 1;
		if !(_selection in _selections) then
		{
			_selections set [count _selections, _selection];
			_gethit set [count _gethit, 0];
		};
		_i = _selections find _selection;
		_olddamage = _gethit select _i;
		_damage = _olddamage + ((_this select 2) - _olddamage) * 0.07;
		_gethit set [_i, _damage];
		_damage;
		}
		];

		sleep 1;
		_currentdmg = 0;

	//g�owna pentla - chodzi ca�y czas kiedy jednostka ma wlaczon� symulacje - system cache
	while {alive _unit} do {

		//przydzia� cel�w
		_targets = nearestObjects [_unit,["MAN","LandVehicle"],_agro];
		{if ((if (_x iskindOf "LandVehicle" and count crew _x == 0) then {true} else {false}) or (side _x != west) and (side _x != east) and (side _x != civilian) and (side _x != Independent) or (side _x == civilian) or (!(alive _x))) then {_targets=_targets-[_x];};}ForEach _targets;

		sleep 0.15;

		if (count _targets > 0) then {
		_target = _targets select 0;

				if ((!isNull _target) && (_target != _unit) && (side _target == WEST) && (alive _unit) && (alive _target) && (_target distance _unit < _agro) && (_unit KnowsAbout _target > 1)) then {

				_unit setSpeedMode "FULL";
				_unit reveal _target;
				_unit doWatch _target;

				//tutaj dzwi�k 3D agro - je�eli jednostka zauwa�y gracza wyda dzwi�k.
				_soundToPlay = _soundPath + "sounds\" + (selectRandom["agro1.ogg","agro2.ogg","agro3.ogg"]);
				playSound3D [_soundToPlay, _unit, false, getPos _unit, 10, 1, _agro];

					//jednostka atakuje
					while {((!isNull _target) && (_target != _unit) && (alive _unit) && (side _target == WEST) && (_target distance _unit < _agro) && (_unit KnowsAbout _target > 1))} do {

						/* przeniesione do initplayerlocal aby zaoszczedzic na wymianie sieciowej
						//odtwarzanie dzwiekow w osobnej pentli
							_dzwiek = [_unit,_target,_agro,_soundPath] spawn {
							private ["_unit", "_target","_agro","_soundPath","_soundToPlay"];
							_unit = _this select 0;
							_target = _this select 1;
							_agro = _this select 2;
							_soundPath = _this select 3;

							sleep 4; // dajmy czas na rozruch
								while {((_unit distance _target < 20) && (alive _unit) && (alive _target) && (_unit KnowsAbout _target > 1))} do {

								_soundToPlay = _soundPath + "dzwieki\" + (selectRandom ["duszek1.ogg","duszek2.ogg","duszek3.ogg","duszek4.ogg","duszek5.ogg"]);
								playSound3D [_soundToPlay, _unit, false, getPos _unit, 10, 1, _agro];

								sleep 20;
								};
						};
						*/

					_unit Move (_target modelToworld [0,0,0]);

						/* przenioslem to do init player local - nie potrafie wywolac zdalnie u ��danego gracza tej komendy. A ona jest lokalna....
						//zadawanie (po ACE medical) dmgu graczowi jezeli jednostka podejdzie blisko
						if (_unit distance _target < 3) then {

						[_target, 0.5, (selectRandom ["Head","body","hand_l","hand_r","leg_l","leg_r"]), "stab"] call ace_medical_fnc_addDamageToUnit;

						};
						*/

					//pauza w pentli atakujacej
					sleep 1;

					//jednostka gubi cel bo umar lub uciekl lub cos sie zjebalo
					if ((_target == _unit) or (side _target != WEST) or ((_target distance _unit) > _agro) or (_unit KnowsAbout _target < 2)) exitWith {};
					};
				};
		};

		//jezeli jednostka zginie to wy�acza skrypt
		if (!(alive _unit)) exitWith {};

		//zamra�a dzia�anie pentli je�eli zadzia�a system cache. Nastepnie czeka na ponowne w��czenie jednostki.
		if (!(simulationEnabled _unit)) then {
		waitUntil {simulationEnabled _unit};
		};

	// g�owna pauza w skrypcie
	sleep 2;
	};
