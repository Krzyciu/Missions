class RscTitles {

  class Default {
		idd = -1;
		fadein = 0;
		fadeout = 0;
		duration = 0;
	};

  class GVAR(logo) {
    idd = -1;
  	fadein = 0.001;
  	fadeout = 0.001;
  	duration = 99999;
      class controls {
          class RscPicture_1200: RscPicture {
          	idc = 1200;
          	text = "data\logo.paa";
          	x = 0.5 * safezoneW + safezoneX;
          	y = 0.5 * safezoneH + safezoneY;
          	w = 0.5 * safezoneW;
          	h = 0.5 * safezoneH;
          };
      };
  };

	class GVAR(introSlideshow) {
    idd = -1;
  	fadein = 0.001;
  	fadeout = 0.001;
  	duration = 9999999;
    onload = "_this call Krzyc_fnc_introSlideshow";
      class controls {
          class RscPicture_1201: RscPicture {
          	idc = 1201;
              text = "data\slides\slide_1.jpg";
              x = "safezoneXAbs";
          	y = "safezoneY";
          	w = "safezoneWAbs";
          	h = "safezoneH";
              colortext[] = {0,0,0,0};
          };
          class RscPicture_1202: RscPicture {
          	idc = 1202;
            text = "data\slides\slide_2.jpg";
            x = "safezoneXAbs";
          	y = "safezoneY";
          	w = "safezoneWAbs";
          	h = "safezoneH";
              colortext[] = {0,0,0,0};
          };
          class RscPicture_1203: RscPicture {
              idc = 1203;
              text = "data\slides\slide_3.jpg";
              x = "safezoneXAbs";
              y = "safezoneY";
              w = "safezoneWAbs";
              h = "safezoneH";
              colortext[] = {0,0,0,0};
          };
          class RscPicture_1204: RscPicture {
          	 idc = 1204;
             text = "data\slides\slide_4.jpg";
             x = "safezoneXAbs";
             y = "safezoneY";
             w = "safezoneWAbs";
             h = "safezoneH";
            colortext[] = {0,0,0,0};
          };
          class RscPicture_1205: RscPicture {
          	 idc = 1204;
             text = "data\slides\slide_5.jpg";
             x = "safezoneXAbs";
             y = "safezoneY";
             w = "safezoneWAbs";
             h = "safezoneH";
            colortext[] = {0,0,0,0};
          };
          class RscPicture_1206: RscPicture {
              idc = 1205;
              text = "data\slides\slide_blank.jpg";
              x = "safezoneXAbs";
              y = "safezoneY";
              w = "safezoneWAbs";
              h = "safezoneH";
              colortext[] = {0,0,0,0};
    	    };
      };
	 };
};
