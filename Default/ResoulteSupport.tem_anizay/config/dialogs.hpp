#define CT_STATIC	0
#define CT_BUTTON	1
#define CT_EDIT	2
#define CT_SLIDER	3
#define CT_COMBO	4
#define CT_LISTBOX	5
#define CT_TOOLBOX	6
#define CT_CHECKBOXES	7
#define CT_PROGRESS	8
#define CT_HTML	9
#define CT_STATIC_SKEW	10
#define CT_ACTIVETEXT	11
#define CT_TREE	12
#define CT_STRUCTURED_TEXT	13
#define CT_CONTEXT_MENU	14
#define CT_CONTROLS_GROUP	15
#define CT_XKEYDESC	40
#define CT_XBUTTON	41
#define CT_XLISTBOX	42
#define CT_XSLIDER	43
#define CT_XCOMBO	44
#define CT_ANIMATED_TEXTURE	45
#define CT_OBJECT	80
#define CT_OBJECT_ZOOM	81
#define CT_OBJECT_CONTAINER	82
#define CT_OBJECT_CONT_ANIM	83
#define CT_LINEBREAK	98
#define CT_USER	99
#define CT_MAP	100
#define CT_MAP_MAIN	101
#define ST_POS	0x0F
#define ST_HPOS	0x03
#define ST_VPOS	0x0C
#define ST_LEFT	0x00
#define ST_RIGHT	0x01
#define ST_CENTER	0x02
#define ST_DOWN	0x04
#define ST_UP	0x08
#define ST_VCENTER	0x0c
#define ST_TYPE	0xF0
#define ST_SINGLE	0
#define ST_MULTI	16
#define ST_TITLE_BAR	32
#define ST_PICTURE	48
#define ST_FRAME	64
#define ST_BACKGROUND	80
#define ST_GROUP_BOX	96
#define ST_GROUP_BOX2	112
#define ST_HUD_BACKGROUND	128
#define ST_TILE_PICTURE	144
#define ST_WITH_RECT	160
#define ST_LINE	176
#define ST_SHADOW	0x100
#define ST_NO_RECT	0x200
#define ST_KEEP_ASPECT_RATIO	0x800
#define ST_TITLE	ST_TITLE_BAR + ST_CENTER
#define SL_DIR	0x400
#define SL_VERT	0
#define SL_HORZ	0x400
#define SL_TEXTURES	0x10
#define LB_TEXTURES	0x10
#define LB_MULTI	0x20
#define FontM	"TahomaB"
#define FontHTML	"TahomaB"


class GVAR(boardPicture) {
	type = CT_STATIC;
	idc = -1;
	style = ST_PICTURE;
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1};
	font = FontM;
	sizeEx = 0.02;
	text = "";
};

class GVAR(cutWire) {
	type = CT_BUTTON;
	idc = -1;
	style = ST_CENTER;
	colorText[]={0, 0, 0, 1};
	font = FontHTML;
	sizeEx = 0.025;
	soundPush[] = {"", 0.2, 1};
	soundClick[] = {"", 0.2, 1};
	soundEscape[] = {"", 0.2, 1};
	default = false;
	text = "";
    action = "_this call Krzyc_fnc_boardCut";
	colorActive[] = {0, 0, 0, 0};
	colorDisabled[] = {0, 0, 0, 0};
	colorBackground[] = {0, 0, 0, 0};
	colorBackgroundActive[] = {0, 0, 0, 0};
	colorBackgroundDisabled[] = {0, 0, 0, 0};
	colorFocused[] = {0.84, 1, 0.55, 0};
	colorShadow[] = {1, 1, 1, 0};
	colorBorder[] = {0, 0, 0, 0};
	offsetX = 0;
	offsetY = 0;
	offsetPressedX = 0;
	offsetPressedY = 0;
	borderSize = 0;
	soundEnter[] = {"", 0.15, 1};
};

class GVAR(clickAnywhere) {
	type = CT_BUTTON;
	idc = -1;
	style = ST_CENTER;
	colorText[]={0, 0, 0, 1};
	font = FontHTML;
	sizeEx = 0.025;
	soundPush[] = {"", 0.2, 1};
	soundClick[] = {"", 0.2, 1};
	soundEscape[] = {"", 0.2, 1};
	default = false;
	text = "";
	action = "_this call Krzyc_fnc_boardFail";
    colorActive[] = {0, 0, 0, 0};
	colorDisabled[] = {0, 0, 0, 0};
	colorBackground[] = {0, 0, 0, 0};
	colorBackgroundActive[] = {0, 0, 0, 0};
	colorBackgroundDisabled[] = {0, 0, 0, 0};
	colorFocused[] = {0.84, 1, 0.55, 0};
	colorShadow[] = {1, 1, 1, 0};
	colorBorder[] = {0, 0, 0, 0};
	offsetX = 0;
	offsetY = 0;
	offsetPressedX = 0;
	offsetPressedY = 0;
	borderSize = 0;
	soundEnter[] = {"", 0.15, 1};
};

class GVAR(board_1) {
	idd = -1;
	movingEnable = false;
	onLoad = "";
	onUnload = "1 cutText ['', 'PLAIN']";
	class Controls {
		class GVAR(board): GVAR(boardPicture) {
			idc = 1200;
			style = 2096;
			text = "data\boards\board_1.paa";
			x = safeZoneX;
			y = safeZoneY;
			w = safeZoneW;
			h = safeZoneH;
		};
        class GVAR(success): GVAR(cutWire) {
			idc = 1600;
			text = "";
			x = safeZoneX + 0.666 * safeZoneW;
			y = safeZoneY + 0.366 * safeZoneH;
			w = safeZoneW * 0.017;
			h = safeZoneH * 0.017;
		};
		class GVAR(fail): GVAR(clickAnywhere) {
			idc = 1601;
			text = "";
			x = safeZoneX + 0.30 * safeZoneW;
			y = safeZoneY + 0.26 * safeZoneH;
			w = safeZoneW * 0.4;
			h = safeZoneH * 0.4;
		};
	};
};

class GVAR(board_1_dis) {
	idd = -1;
	movingEnable = false;
	onLoad = "";
	onUnload = "1 cutText ['', 'PLAIN']";
	class Controls {
		class GVAR(board): GVAR(boardPicture) {
			idc = 1200;
			style = 2096;
			text = "data\boards\board_1_dis.paa";
			x = safeZoneX;
			y = safeZoneY;
			w = safeZoneW;
			h = safeZoneH;
		};
	};
};

class GVAR(board_2) {
	idd = -1;
	movingEnable = false;
	onLoad = "";
	onUnload = "1 cutText ['', 'PLAIN']";
	class Controls {
		class GVAR(board): GVAR(boardPicture) {
			idc = 1200;
			style = 2096;
			text = "data\boards\board_2.paa";
			x = safeZoneX;
			y = safeZoneY;
			w = safeZoneW;
			h = safeZoneH;
		};
		class GVAR(success): GVAR(cutWire) {
			idc = 1600;
			text = "";
            x = safeZoneX + 0.666 * safeZoneW;
			y = safeZoneY + 0.508 * safeZoneH;
			w = safeZoneW * 0.017;
			h = safeZoneH * 0.017;
		};
		class GVAR(fail): GVAR(clickAnywhere) {
			idc = 1601;
			text = "";
			x = safeZoneX + 0.30 * safeZoneW;
			y = safeZoneY + 0.26 * safeZoneH;
			w = safeZoneW * 0.4;
			h = safeZoneH * 0.4;
		};
	};
};

class GVAR(board_2_dis) {
	idd = -1;
	movingEnable = false;
	onLoad = "";
	onUnload = "1 cutText ['', 'PLAIN']";
	class Controls {
		class GVAR(board): GVAR(boardPicture) {
			idc = 1200;
			style = 2096;
			text = "data\boards\board_2_dis.paa";
			x = safeZoneX;
			y = safeZoneY;
			w = safeZoneW;
			h = safeZoneH;
		};
	};
};

class GVAR(board_3) {
	idd = -1;
	movingEnable = false;
	onLoad = "";
	onUnload = "1 cutText ['', 'PLAIN']";
	class Controls {
		class GVAR(board): GVAR(boardPicture) {
			idc = 1200;
			style = 2096;
			text = "data\boards\board_3.paa";
			x = safeZoneX;
			y = safeZoneY;
			w = safeZoneW;
			h = safeZoneH;
		};
		class GVAR(success): GVAR(cutWire) {
			idc = 1600;
			text = "";
            x = safeZoneX + 0.666 * safeZoneW;
			y = safeZoneY + 0.308 * safeZoneH;
			w = safeZoneW * 0.017;
			h = safeZoneH * 0.017;
		};
		class GVAR(fail): GVAR(clickAnywhere) {
			idc = 1601;
			text = "";
			x = safeZoneX + 0.30 * safeZoneW;
			y = safeZoneY + 0.26 * safeZoneH;
			w = safeZoneW * 0.4;
			h = safeZoneH * 0.4;
		};
	};
};

class GVAR(board_3_dis) {
	idd = -1;
	movingEnable = false;
	onLoad = "";
	onUnload = "1 cutText ['', 'PLAIN']";
	class Controls {
		class GVAR(board): GVAR(boardPicture) {
			idc = 1200;
			style = 2096;
			text = "data\boards\board_3_dis.paa";
			x = safeZoneX;
			y = safeZoneY;
			w = safeZoneW;
			h = safeZoneH;
		};
	};
};

class GVAR(board_4) {
	idd = -1;
	movingEnable = false;
	onLoad = "";
	onUnload = "1 cutText ['', 'PLAIN']";
	class Controls {
		class GVAR(board): GVAR(boardPicture) {
			idc = 1200;
			style = 2096;
			text = "data\boards\board_4.paa";
			x = safeZoneX;
			y = safeZoneY;
			w = safeZoneW;
			h = safeZoneH;
		};
		class GVAR(success): GVAR(cutWire) {
			idc = 1600;
			text = "";
            x = safeZoneX + 0.666 * safeZoneW;
			y = safeZoneY + 0.308 * safeZoneH;
			w = safeZoneW * 0.017;
			h = safeZoneH * 0.017;
		};
		class GVAR(fail): GVAR(clickAnywhere) {
			idc = 1601;
			text = "";
			x = safeZoneX + 0.30 * safeZoneW;
			y = safeZoneY + 0.26 * safeZoneH;
			w = safeZoneW * 0.4;
			h = safeZoneH * 0.4;
		};
	};
};

class GVAR(board_4_dis) {
	idd = -1;
	movingEnable = false;
	onLoad = "";
	onUnload = "1 cutText ['', 'PLAIN']";
	class Controls {
		class GVAR(board): GVAR(boardPicture) {
			idc = 1200;
			style = 2096;
			text = "data\boards\board_4_dis.paa";
			x = safeZoneX;
			y = safeZoneY;
			w = safeZoneW;
			h = safeZoneH;
		};
	};
};

class GVAR(board_5) {
	idd = -1;
	movingEnable = false;
	onLoad = "";
	onUnload = "1 cutText ['', 'PLAIN']";
	class Controls {
		class GVAR(board): GVAR(boardPicture) {
			idc = 1200;
			style = 2096;
			text = "data\boards\board_5.paa";
			x = safeZoneX;
			y = safeZoneY;
			w = safeZoneW;
			h = safeZoneH;
		};
		class GVAR(success): GVAR(cutWire) {
			idc = 1600;
			text = "";
            x = safeZoneX + 0.666 * safeZoneW;
			y = safeZoneY + 0.508 * safeZoneH;
			w = safeZoneW * 0.017;
			h = safeZoneH * 0.017;
		};
		class GVAR(fail): GVAR(clickAnywhere) {
			idc = 1601;
			text = "";
			x = safeZoneX + 0.30 * safeZoneW;
			y = safeZoneY + 0.26 * safeZoneH;
			w = safeZoneW * 0.4;
			h = safeZoneH * 0.4;
		};
	};
};

class GVAR(board_5_dis) {
	idd = -1;
	movingEnable = false;
	onLoad = "";
	onUnload = "1 cutText ['', 'PLAIN']";
	class Controls {
		class GVAR(board): GVAR(boardPicture) {
			idc = 1200;
			style = 2096;
			text = "data\boards\board_5_dis.paa";
			x = safeZoneX;
			y = safeZoneY;
			w = safeZoneW;
			h = safeZoneH;
		};
	};
};

class GVAR(board_6) {
	idd = -1;
	movingEnable = false;
	onLoad = "";
	onUnload = "1 cutText ['', 'PLAIN']";
	class Controls {
		class GVAR(board): GVAR(boardPicture) {
			idc = 1200;
			style = 2096;
			text = "data\boards\board_6.paa";
			x = safeZoneX;
			y = safeZoneY;
			w = safeZoneW;
			h = safeZoneH;
		};
		class GVAR(success): GVAR(cutWire) {
			idc = 1600;
			text = "";
            x = safeZoneX + 0.666 * safeZoneW;
			y = safeZoneY + 0.446 * safeZoneH;
			w = safeZoneW * 0.017;
			h = safeZoneH * 0.017;
		};
		class GVAR(fail): GVAR(clickAnywhere) {
			idc = 1601;
			text = "";
			x = safeZoneX + 0.30 * safeZoneW;
			y = safeZoneY + 0.26 * safeZoneH;
			w = safeZoneW * 0.4;
			h = safeZoneH * 0.4;
		};
	};
};

class GVAR(board_6_dis) {
	idd = -1;
	movingEnable = false;
	onLoad = "";
	onUnload = "1 cutText ['', 'PLAIN']";
	class Controls {
		class GVAR(board): GVAR(boardPicture) {
			idc = 1200;
			style = 2096;
			text = "data\boards\board_6_dis.paa";
			x = safeZoneX;
			y = safeZoneY;
			w = safeZoneW;
			h = safeZoneH;
		};
	};
};

class GVAR(board_7) {
	idd = -1;
	movingEnable = false;
	onLoad = "";
	onUnload = "1 cutText ['', 'PLAIN']";
	class Controls {
		class GVAR(board): GVAR(boardPicture) {
			idc = 1200;
			style = 2096;
			text = "data\boards\board_7.paa";
			x = safeZoneX;
			y = safeZoneY;
			w = safeZoneW;
			h = safeZoneH;
		};
		class GVAR(success): GVAR(cutWire) {
			idc = 1600;
			text = "";
            x = safeZoneX + 0.565 * safeZoneW;
			y = safeZoneY + 0.585 * safeZoneH;
			w = safeZoneW * 0.025;
			h = safeZoneH * 0.022;
		};
		class GVAR(fail): GVAR(clickAnywhere) {
			idc = 1601;
			text = "";
			x = safeZoneX + 0.30 * safeZoneW;
			y = safeZoneY + 0.26 * safeZoneH;
			w = safeZoneW * 0.4;
			h = safeZoneH * 0.4;
		};
	};
};

class GVAR(board_7_dis) {
	idd = -1;
	movingEnable = false;
	onLoad = "";
	onUnload = "1 cutText ['', 'PLAIN']";
	class Controls {
		class GVAR(board): GVAR(boardPicture) {
			idc = 1200;
			style = 2096;
			text = "data\boards\board_7_dis.paa";
			x = safeZoneX;
			y = safeZoneY;
			w = safeZoneW;
			h = safeZoneH;
		};
	};
};

class GVAR(board_8) {
	idd = -1;
	movingEnable = false;
	onLoad = "";
	onUnload = "1 cutText ['', 'PLAIN']";
	class Controls {
		class GVAR(board): GVAR(boardPicture) {
			idc = 1200;
			style = 2096;
			text = "data\boards\board_8.paa";
			x = safeZoneX;
			y = safeZoneY;
			w = safeZoneW;
			h = safeZoneH;
		};
		class GVAR(success): GVAR(cutWire) {
			idc = 1600;
			text = "";
            x = safeZoneX + 0.610 * safeZoneW;
			y = safeZoneY + 0.552 * safeZoneH;
			w = safeZoneW * 0.017;
			h = safeZoneH * 0.017;
		};
		class GVAR(fail): GVAR(clickAnywhere) {
			idc = 1601;
			text = "";
			x = safeZoneX + 0.30 * safeZoneW;
			y = safeZoneY + 0.26 * safeZoneH;
			w = safeZoneW * 0.4;
			h = safeZoneH * 0.4;
		};
	};
};

class GVAR(board_8_dis) {
	idd = -1;
	movingEnable = false;
	onLoad = "";
	onUnload = "1 cutText ['', 'PLAIN']";
	class Controls {
		class GVAR(board): GVAR(boardPicture) {
			idc = 1200;
			style = 2096;
			text = "data\boards\board_8_dis.paa";
			x = safeZoneX;
			y = safeZoneY;
			w = safeZoneW;
			h = safeZoneH;
		};
	};
};

class GVAR(board_9) {
	idd = -1;
	movingEnable = false;
	onLoad = "";
	onUnload = "1 cutText ['', 'PLAIN']";
	class Controls {
		class GVAR(board): GVAR(boardPicture) {
			idc = 1200;
			style = 2096;
			text = "data\boards\board_9.paa";
			x = safeZoneX;
			y = safeZoneY;
			w = safeZoneW;
			h = safeZoneH;
		};
		class GVAR(success): GVAR(cutWire) {
			idc = 1600;
			text = "";
            x = safeZoneX + 0.666 * safeZoneW;
			y = safeZoneY + 0.485 * safeZoneH;
			w = safeZoneW * 0.017;
			h = safeZoneH * 0.023;
		};
		class GVAR(fail): GVAR(clickAnywhere) {
			idc = 1601;
			text = "";
			x = safeZoneX + 0.30 * safeZoneW;
			y = safeZoneY + 0.26 * safeZoneH;
			w = safeZoneW * 0.4;
			h = safeZoneH * 0.4;
		};
	};
};

class GVAR(board_9_dis) {
	idd = -1;
	movingEnable = false;
	onLoad = "";
	onUnload = "1 cutText ['', 'PLAIN']";
	class Controls {
		class GVAR(board): GVAR(boardPicture) {
			idc = 1200;
			style = 2096;
			text = "data\boards\board_9_dis.paa";
			x = safeZoneX;
			y = safeZoneY;
			w = safeZoneW;
			h = safeZoneH;
		};
	};
};

class GVAR(board_10) {
	idd = -1;
	movingEnable = false;
	onLoad = "";
	onUnload = "1 cutText ['', 'PLAIN']";
	class Controls {
		class GVAR(board): GVAR(boardPicture) {
			idc = 1200;
			style = 2096;
			text = "data\boards\board_10.paa";
			x = safeZoneX;
			y = safeZoneY;
			w = safeZoneW;
			h = safeZoneH;
		};
		class GVAR(success): GVAR(cutWire) {
			idc = 1600;
			text = "";
            x = safeZoneX + 0.666 * safeZoneW;
			y = safeZoneY + 0.508 * safeZoneH;
			w = safeZoneW * 0.017;
			h = safeZoneH * 0.017;
		};
		class GVAR(fail): GVAR(clickAnywhere) {
			idc = 1601;
			text = "";
			x = safeZoneX + 0.30 * safeZoneW;
			y = safeZoneY + 0.26 * safeZoneH;
			w = safeZoneW * 0.4;
			h = safeZoneH * 0.4;
		};
	};
};

class GVAR(board_10_dis) {
	idd = -1;
	movingEnable = false;
	onLoad = "";
	onUnload = "1 cutText ['', 'PLAIN']";
	class Controls {
		class GVAR(board): GVAR(boardPicture) {
			idc = 1200;
			style = 2096;
			text = "data\boards\board_10_dis.paa";
			x = safeZoneX;
			y = safeZoneY;
			w = safeZoneW;
			h = safeZoneH;
		};
	};
};
