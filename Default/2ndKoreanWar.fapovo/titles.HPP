
//dimension of bitmaps to be mapped 1:1 in 720p
#define w16                           0.0196078
#define h16                           0.0261438
#define w32                           0.0392157
#define h32                           0.0522876
#define w64                           0.0784314
#define h64                           0.1045752
#define w128                          0.1568627
#define h128                          0.2091503
#define w256                          0.3137255
#define h256                          0.4183007
#define w512                          0.6274510
#define h512                          0.8366013
#define w1024                         1.2549020
#define h1024                         1.6732026
#define w2048                         2.5098039
#define h2048                         3.3464052

class RscLogoA
{
	idd = -1;
	duration = 1e+1000;
	fadeIn = 0;
	fadeOut = 0;

	controls[] = {RsclogoPicture};

    class RsclogoPicture
    {
	    idc = -1;
	    type = 0;
	    style = 0x30;
	    x = SafeZoneX + SafeZoneW/2 - w512/2;
	    y = SafeZoneY + SafeZoneH/2 - h512/2;
	    w = w512;
        h = h512;
	    font = "PuristaMedium";
	    sizeEx = 0;
	    colorBackground[] = {0,0,0,0};
	    colorText[] = {1,1,1,1};
	    text = "data\a3c2.paa";
	};
};

class RscLogoB
{
	idd = -1;
	duration = 1e+1000;
	fadeIn = 0;
	fadeOut = 0;

	controls[] = {RsclogoPicture};

    class RsclogoPicture
    {
	    idc = -1;
	    type = 0;
	    style = 0x30;
	    x = SafeZoneX + SafeZoneW/2 - w512/2;
	    y = SafeZoneY + SafeZoneH/2 - h256/2;
	    w = w512;
        h = h256;
	    font = "PuristaMedium";
	    sizeEx = 0;
	    colorBackground[] = {0,0,0,0};
	    colorText[] = {1,1,1,1};
	    text = "data\logg2.paa";
	};
};
