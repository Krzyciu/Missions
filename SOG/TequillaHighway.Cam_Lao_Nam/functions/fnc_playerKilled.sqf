#include "script_component.hpp"
0 spawn {
  cutText ["","BLACK FADED", 50];
  private _unitData = [player, false] call a3cs_nametags_fnc_getUnitData;
  private _age = selectRandom ["1950-1975", "1951-1975", "1952-1975", "1954-1975", "1955-1975", "1956-1975", "1957-1975", "1955-1975"];
  sleep 6;
  [format ["4th SOG Recon Team <br /> %1 <br /> %2", (_unitData #2 + " " + _unitData #1), _age], -1, -1, 10, 2, 0, 789] spawn BIS_fnc_dynamicText;
  sleep 13;
  cutText ["","BLACK IN", 5];
};
