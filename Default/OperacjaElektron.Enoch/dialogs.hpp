
class dialog_menuCiv_1
{
	idd = 1984;
	movingEnabled = false;


		class controls
		{

			class IGUIBack_2200: Krzyc_IGUIBACK
			{
				idc = 2200;
				moving = 1;

				x = 7.27 * GUI_GRID_W + GUI_GRID_X;
				y = 8.05 * GUI_GRID_H + GUI_GRID_Y;
				w = 25.4566 * GUI_GRID_W;
				h = 1.27224 * GUI_GRID_H;
			};
			class IGUIBack_2201: Krzyc_IGUIBACK2
			{
				idc = 2201;
				moving = 1;

				x = 7.27 * GUI_GRID_W + GUI_GRID_X;
				y = 9.32 * GUI_GRID_H + GUI_GRID_Y;
				w = 25.4566 * GUI_GRID_W;
				h = 6.3612 * GUI_GRID_H;
			};
			class RscText_1000: Krzyc_RscText
			{
				idc = 1000;

				text = "                                 Wpisz kod"; //--- ToDo: Localize;
				x = 7.27 * GUI_GRID_W + GUI_GRID_X;
				y = 8.05 * GUI_GRID_H + GUI_GRID_Y;
				w = 22.911 * GUI_GRID_W;
				h = 1.27224 * GUI_GRID_H;
			};
			class RscButton_1600: Krzyc_RscButton2
			{
				idc = 1600;

				text = "X"; //--- ToDo: Localize;
				x = 30.82 * GUI_GRID_W + GUI_GRID_X;
				y = 8.05 * GUI_GRID_H + GUI_GRID_Y;
				w = 1.90925 * GUI_GRID_W;
				h = 1.27224 * GUI_GRID_H;

				action = "closeDialog 0";
			};
			class RscEdit_1400: Krzyc_RscEdit
			{
				idc = 1400;

				x = 11.05 * GUI_GRID_W + GUI_GRID_X;
				y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 17 * GUI_GRID_W;
				h = 1.5 * GUI_GRID_H;
			};
			class RscButton_1601: Krzyc_RscButton
			{
				idc = 1601;

				text = "Login"; //--- ToDo: Localize;
				x = 16.18 * GUI_GRID_W + GUI_GRID_X;
				y = 13.14 * GUI_GRID_H + GUI_GRID_Y;
				w = 7.63699 * GUI_GRID_W;
				h = 1.27224 * GUI_GRID_H;

				action = " [_this,'jedynka'] spawn Krzyc_fnc_password;"
			};

	};
};

class dialog_menuCiv_2
{
	idd = 2984;
	movingEnabled = false;


		class controls
		{

			class IGUIBack_2200: Krzyc_IGUIBACK
			{
				idc = 3200;
				moving = 1;

				x = 7.27 * GUI_GRID_W + GUI_GRID_X;
				y = 8.05 * GUI_GRID_H + GUI_GRID_Y;
				w = 25.4566 * GUI_GRID_W;
				h = 1.27224 * GUI_GRID_H;
			};
			class IGUIBack_2201: Krzyc_IGUIBACK2
			{
				idc = 3201;
				moving = 1;

				x = 7.27 * GUI_GRID_W + GUI_GRID_X;
				y = 9.32 * GUI_GRID_H + GUI_GRID_Y;
				w = 25.4566 * GUI_GRID_W;
				h = 6.3612 * GUI_GRID_H;
			};
			class RscText_1000: Krzyc_RscText
			{
				idc = 3000;

				text = "                                 Wpisz kod"; //--- ToDo: Localize;
				x = 7.27 * GUI_GRID_W + GUI_GRID_X;
				y = 8.05 * GUI_GRID_H + GUI_GRID_Y;
				w = 22.911 * GUI_GRID_W;
				h = 1.27224 * GUI_GRID_H;
			};
			class RscButton_1600: Krzyc_RscButton2
			{
				idc = 3600;

				text = "X"; //--- ToDo: Localize;
				x = 30.82 * GUI_GRID_W + GUI_GRID_X;
				y = 8.05 * GUI_GRID_H + GUI_GRID_Y;
				w = 1.90925 * GUI_GRID_W;
				h = 1.27224 * GUI_GRID_H;

				action = "closeDialog 0";
			};
			class RscEdit_1400: Krzyc_RscEdit
			{
				idc = 3400;

				x = 11.05 * GUI_GRID_W + GUI_GRID_X;
				y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 17 * GUI_GRID_W;
				h = 1.5 * GUI_GRID_H;
			};
			class RscButton_1601: Krzyc_RscButton
			{
				idc = 3601;

				text = "Login"; //--- ToDo: Localize;
				x = 16.18 * GUI_GRID_W + GUI_GRID_X;
				y = 13.14 * GUI_GRID_H + GUI_GRID_Y;
				w = 7.63699 * GUI_GRID_W;
				h = 1.27224 * GUI_GRID_H;

				action = " [_this,'dwojka'] spawn Krzyc_fnc_password;"
			};

	};
};
