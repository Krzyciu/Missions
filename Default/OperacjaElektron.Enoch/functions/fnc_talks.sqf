// Rozbudowany system do dialogów. Tutaj znajdują się tylko teksty wyświetlane na ekranie, całe menu obsługuje plik dialogs.hpp
_talker = _this select 0;

switch (_talker) do
{
case "IDCard":
{"ID Oficera CSAT" hintC "ID: 90072951535"
};
case "tablet":
{
  disableSerialization;
  createDialog "dialog_menuCiv_2";
};
case "tablet2":
{
  disableSerialization;
  createDialog "dialog_menuCiv_1";
};
case "laptop":
{

  _getSignal =
  {
  	_signal = switch (true) do
  	{
  		case (player distance2d getPosATL laptop <= 2) :
  		{
  			"a3\Ui_f\data\IGUI\RscTitles\RscHvtPhase\JAC_A3_Signal_4_ca.paa"
  		};
  		case (player distance2d getPosATL laptop > 2 && player distance2d getPosATL laptop <= 5) :
  		{
  			"a3\Ui_f\data\IGUI\RscTitles\RscHvtPhase\JAC_A3_Signal_3_ca.paa"
  		};
      case (player distance2d getPosATL laptop > 2 && player distance2d getPosATL laptop <= 5) :
  		{
  			"a3\Ui_f\data\IGUI\RscTitles\RscHvtPhase\JAC_A3_Signal_1_ca.paa"
  		};
  		case (player distance2d getPosATL laptop > 5) :
  		{
  			""
  		};
  	};
  	_signal
  };
  _display = uiNamespace getVariable "disp_downloadingData";

  (_display displayCtrl 200) ctrlSetText "Hakowanie systemu...";

  _downloaded = 0;

  while {_downloaded < 100 && "layer_rsc_downloadingData" in allCutLayers} do
  {
    _increment = selectRandom[0,0.25,0.5,0.75,1,1.25,1.5,1.75,2,2.25,5];
  	_downloaded = _downloaded + _increment;
  	(_display displayCtrl 400) progressSetPosition (_downloaded / 100);
  	(_display displayCtrl 500) ctrlSetText format ["%1%2 / 100%2", _downloaded, "%"];
  	(_display displayCtrl 700) ctrlSetText format ["%1", call _getSignal];
    if ((player distance2d getPosATL laptop > 7) || (_downloaded > 99.5))  exitWith
    {
      ("layer_rsc_downloadingData" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
    };
    sleep 1;
  };
  waitUntil {_downloaded > 99.5};
  ("layer_rsc_downloadingData" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
  hint"BU4MQV689A11C";
};
};
