class RscTitles {
	class Default {
		idd = -1;
		fadein = 0;
		fadeout = 0;
		duration = 0;
	};
    // Pamiętaj, że GVAR(twojaKlasa) rozwiazuje się do mission_twojaKlasa
    class RscLogoA {
        idd = -1;
		fadein = 0.001;
		fadeout = 0.001;
		duration = 99999;
        class controls {
            class RscPicture_1200: RscPicture {
            	idc = 1200;
            	text = "data\a3c2.paa";
            	x = 0.37625 * safezoneW + safezoneX;
            	y = 0.269 * safezoneH + safezoneY;
            	w = 0.237187 * safezoneW;
            	h = 0.44 * safezoneH;
            };
        };
    };
		class snow_overlay1 {
				idd = -1;
			movingEnable = 0;
			duration = 10000;
			fadein = 0;
			fadeout = 5;
			name = "snow_overlay1";
			controls[] = {"Picture"};
			class Picture: RscPicture
			{
				x=safeZoneX; y=safeZoneY; w=safeZoneW; h=safeZoneH;
				idc = 1200;
				text = "data\blizzard\overlay1.paa";
			};
		};
		class snow_overlay2 {
				idd = -1;
			movingEnable = 0;
			duration = 10000;
			fadein = 0;
			fadeout = 5;
			name = "snow_overlay2";
			controls[] = {"Picture"};
			class Picture: RscPicture
			{
				x=safeZoneX; y=safeZoneY; w=safeZoneW; h=safeZoneH;
				idc = 1200;
				text = "data\blizzard\overlay2.paa";
			};
		};
		class snow_overlay3 {
				idd = -1;
			movingEnable = 0;
			duration = 10000;
			fadein = 0;
			fadeout = 5;
			name = "snow_overlay3";
			controls[] = {"Picture"};
			class Picture: RscPicture
			{
				x=safeZoneX; y=safeZoneY; w=safeZoneW; h=safeZoneH;
				idc = 1200;
				text = "data\blizzard\overlay3.paa";
			};
		};
};
