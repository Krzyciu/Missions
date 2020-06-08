//-- [] spawn MyF_fnc_intro; --//
_info = [player] call a3cs_nametag_fnc_getUnitData;
_ranga = _info select 1;

[_ranga] spawn BIS_fnc_EXP_camp_SITREP;
