_timelineA =
[
	[
		0,
		{
			[markerSize "BIS_mrkh_Zoom_0", markerpos "BIS_mrkh_Zoom_0", 4, nil, true] spawn BIS_fnc_zoomOnArea;
			["show",(getMissionLayerEntities "showAtStart") select 1] spawn BIS_fnc_showMarkers;
			["show",(getMissionLayerEntities "showAtEnd") select 1] spawn BIS_fnc_showMarkers;
		}
	],
	[
		4,
		{
			titleText ["<t color='#A52A2A' shadow = 1 size='1.4'>Porucznik:</t><t color ='#FFFFFF' shadow = 2 size ='1.3'>Czołem! Wszyscy już są? Świetnie. Możemy zaczynać. Otwórzcie mapy.</t>", "PLAIN DOWN", -1, true, true];
		}
	],
	[
		9,
		{
			["marker_0", 1.25,1] spawn BIS_fnc_showMarker;
			sleep 1;titleText ["<t color='#A52A2A' shadow = 1 size='1.4'>Porucznik:</t><t color ='#FFFFFF' shadow = 2 size ='1.3'>Zostaniecie przetransportowani do LZ Vulture, za pomocą śmigłowca Chinook.</t>", "PLAIN DOWN", -1, true, true];
			["marker_0", 2] spawn BIS_fnc_blinkMarker;
		}
	],
	[
		12,
		{
			["Kier_atak_1", 1,1] spawn BIS_fnc_showMarker;
			sleep 1;
			["Kier_atak_1", getMarkerPos "Kier_atak_final_1", 1, 0] spawn BIS_fnc_moveMarker;
			sleep 1.1;titleText ["<t color='#A52A2A' shadow = 1 size='1.4'>Porucznik:</t><t color ='#FFFFFF' shadow = 2 size ='1.3'>Opanujecie teren i ruszycie wgłąb wyspy.</t>", "PLAIN DOWN", -1, true, true];
			["Kier_atak_1", 2] spawn BIS_fnc_blinkMarker;
		}
	],
	[
		16,
		{
			[markerSize "BIS_mrkh_Zoom_1", markerpos "BIS_mrkh_Zoom_1", 4, nil, true] spawn BIS_fnc_zoomOnArea;

		}
	],
	[
		21,
		{
			["marker_2", 1,1] spawn BIS_fnc_showMarker;
			sleep 1.1;titleText ["<t color='#A52A2A' shadow = 1 size='1.4'>Porucznik:</t><t color ='#FFFFFF' shadow = 2 size ='1.3'>Zajmiecie radiostacje na wzgórzu 82.</t>", "PLAIN DOWN", -1, true, true];
			["marker_2", 1] spawn BIS_fnc_blinkMarker;
		}
	],
	[
		25,
		{
			["marker_3", 1,1] spawn BIS_fnc_showMarker;
			sleep 1.1;			titleText ["<t color='#A52A2A' shadow = 1 size='1.4'>Porucznik:</t><t color ='#FFFFFF' shadow = 2 size ='1.3'>Następnym celem będą wyrzutnie pocisków przeciwokrętowych EXOCET.</t>", "PLAIN DOWN", -1, true, true];
			["marker_3", 1] spawn BIS_fnc_blinkMarker;
		}
	],
	[
		29,
		{

		["marker_4", 1,1] spawn BIS_fnc_showMarker;
		sleep 1.1;				titleText ["<t color='#A52A2A' shadow = 1 size='1.4'>Porucznik:</t><t color ='#FFFFFF' shadow = 2 size ='1.3'>Po ich zniszczeniu zajmiecie się zlokalizowaniem i przejęciem magazynu amunicji ukrytego gdzieś w wąwozach.</t>", "PLAIN DOWN", -1, true, true];
		["marker_4", 1] spawn BIS_fnc_blinkMarker;
		}
	],
	[
		33,
		{
		["marker_5", 1,1] spawn BIS_fnc_showMarker;
		sleep 1.1;titleText ["<t color='#A52A2A' shadow = 1 size='1.4'>Porucznik:</t><t color ='#FFFFFF' shadow = 2 size ='1.3'>Po zabezpieczeniu północy ruszycie w dół wyspy. Zajmiecie placówkę radarową w koordynatach 054-069.</t>", "PLAIN DOWN", -1, true, true];
		["marker_5", 1] spawn BIS_fnc_blinkMarker;
		}
	],
	[
		36,
		{
		[markerSize "BIS_mrkh_Zoom_2", markerpos "BIS_mrkh_Zoom_2", 4, nil, true] spawn BIS_fnc_zoomOnArea;
		}
	],
	[
		41,
		{
			["marker_6", 1,1] spawn BIS_fnc_showMarker;
			sleep 1.1;titleText ["<t color='#A52A2A' shadow = 1 size='1.4'>Porucznik:</t><t color ='#FFFFFF' shadow = 2 size ='1.3'>Waszym ostatnim zadaniem będzie przejęcie obecnego gubernatora wyspy z jego posiadłości na południu.</t>", "PLAIN DOWN", -1, true, true];
			["marker_6", 1] spawn BIS_fnc_blinkMarker;
		}
	],
	[
		45,
		{
			[markerSize "BIS_mrkh_Zoom_3", markerpos "BIS_mrkh_Zoom_3", 4, nil, true] spawn BIS_fnc_zoomOnArea;
		}
	],
	[
		50,
		{
			["marker_7", 1,1] spawn BIS_fnc_showMarker;
			sleep 1.1;titleText ["<t color='#A52A2A' shadow = 1 size='1.4'>Porucznik:</t><t color ='#FFFFFF' shadow = 2 size ='1.3'>Prowizoryczne lotnisko... Nasz ostrzał prawdopodobnie wyeliminował większość jednostek wroga ale należy się o tym upewnić.</t>", "PLAIN DOWN", -1, true, true];
			["marker_7", 1] spawn BIS_fnc_blinkMarker;
		}
	],
	[
		55,
		{
			[markerSize "BIS_mrkh_Zoom_4", markerpos "BIS_mrkh_Zoom_4", 3, nil, true] spawn BIS_fnc_zoomOnArea;
		}
	],
	[
		62,
		{
			titleText ["<t color='#A52A2A' shadow = 1 size='1.4'>Porucznik:</t><t color ='#FFFFFF' shadow = 2 size ='1.3'>Pytań brak? Do roboty.</t>", "PLAIN DOWN", -1, true, true];
		}
	]
];
