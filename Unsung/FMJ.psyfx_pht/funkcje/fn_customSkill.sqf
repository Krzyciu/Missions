
_unit = _this select 0;
sleep 5;
_this setbehaviour "SAFE";
_this setskill ["spotDistance",0.2];
_this setskill ["spotTime",0.1];
_this setskill ["courage",1];
_this setUnitPos "UP";
_this disableAI "FSM";
_this disableAI "Cover";
_this disableAI "SUPPRESSION";
