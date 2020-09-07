
class dialog_menuCiv_1
{
	idd = 9999;
	movingEnabled = false;


		class controls
		{

			class RscButton_1600: RscButton
			{
				idc = 1600;
				text = "Zapytaj co słychać"; //--- ToDo: Localize;
				x = 0.298906 * safezoneW + safezoneX;
				y = 0.533 * safezoneH + safezoneY;
				w = 0.175313 * safezoneW;
				h = 0.088 * safezoneH;
				action = "closeDialog 0, ['civ_1a'] spawn TwojTag_fnc_talks;";
			};
			class RscButton_1601: RscButton
			{
				idc = 1601;
				text = "Zapytaj czy czegoś potrzebuje"; //--- ToDo: Localize;
				x = 0.525781 * safezoneW + safezoneX;
				y = 0.533 * safezoneH + safezoneY;
				w = 0.175313 * safezoneW;
				h = 0.088 * safezoneH;
				action = "closeDialog 0, ['civ_1b'] spawn TwojTag_fnc_talks";
			};
			class RscButton_1602: RscButton
			{
				idc = 1602;
				text = "Zapytaj o mechanika"; //--- ToDo: Localize;
				x = 0.396875 * safezoneW + safezoneX;
				y = 0.654 * safezoneH + safezoneY;
				w = 0.175313 * safezoneW;
				h = 0.088 * safezoneH;
				action = "closeDialog 0, ['civ_1c'] spawn TwojTag_fnc_talks";
			};

	};
};
