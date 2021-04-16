params ["_tow"];

private _onComplete = {
  params ["_tow"];
  _tow addMagazineTurret ["rhs_mag_TOW2a", [0], 1];
  player removeMagazine "ace_compat_rhs_usf3_mag_TOW";
};

private _onFailure = {
};

[10,_tow, _onComplete, _onFailure, "Ładowanie Amunicji"] call ace_common_fnc_progressBar;
