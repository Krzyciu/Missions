//Przezbraja/naprawia i uzupełnia paliwo pojazdom w promieniu 50m.
//_rearm = ["naprawa","Serwis Pojazdów","",{[25, [], {[] spawn TwojTag_fnc_rearm}, {hint "Przerwano"}, "Przezbrajanie"] call ace_common_fnc_progressBar},{true}] call ace_interact_menu_fnc_createAction;[NazwaObiektuNaKtórymJestRearm, 0, ["ACE_MainActions"], _rearm] call ace_interact_menu_fnc_addActionToObject;//
//depot to nazwa warsztatu
private _list = ASLToAGL getPosASL depot nearEntities [["Air","Car", "Motorcycle", "Tank"], 100];
{_x setVehicleAmmo 1} forEach _list;
{_x setFuel 1} forEach _list;
{_x setDamage 0} forEach _list;
