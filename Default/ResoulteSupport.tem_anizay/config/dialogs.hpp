class ctrlDefault;
class ctrlDefaultText;
class ctrlDefaultButton;
class ctrlStatic;
class ctrlStaticPicture;
class ctrlStaticPictureKeepAspect;
class ctrlStaticPictureTile;
class ctrlStaticFrame;
class ctrlStaticLine;
class ctrlStaticMulti;
class ctrlStaticBackground;
class ctrlStaticOverlay;
class ctrlStaticTitle;
class ctrlStaticFooter;
class ctrlStaticBackgroundDisable;
class ctrlStaticBackgroundDisableTiles;
class ctrlButton;
class ctrlButtonPicture;
class ctrlButtonPictureKeepAspect;
class ctrlButtonOK;
class ctrlButtonCancel;
class ctrlButtonClose;
class ctrlButtonToolbar;
class ctrlButtonSearch;
class ctrlButtonExpandAll;
class ctrlButtonCollapseAll;
class ctrlButtonFilter;
class ctrlEdit;
class ctrlEditMulti;
class ctrlSliderV;
class ctrlSliderH;
class ctrlCombo;
class ctrlComboToolbar;
class ctrlListbox;
class ctrlToolbox;
class ctrlToolboxPicture;
class ctrlToolboxPictureKeepAspect;
class ctrlCheckboxes;
class ctrlCheckboxesCheckbox;
class ctrlProgress;
class ctrlHTML;
class ctrlActiveText;
class ctrlActivePicture;
class ctrlActivePictureKeepAspect;
class ctrlTree;
class ctrlStructuredText;
class ctrlControlsGroup;
class ctrlControlsGroupNoScrollbars;
class ctrlControlsGroupNoHScrollbars;
class ctrlControlsGroupNoVScrollbars;
class ctrlShortcutButton;
class ctrlShortcutButtonOK;
class ctrlShortcutButtonCancel;
class ctrlShortcutButtonSteam;
class ctrlXListbox;
class ctrlXSliderV;
class ctrlXSliderH;
class ctrlMenu;
class ctrlMenuStrip;
class ctrlObject;
class ctrlObjectContainer;
class ctrlObjectZoom;
class ctrlMap: ctrlDefault
{
	class LineMarker;
	class Legend;
	class Task;
	class ActiveMarker;
	class Waypoint;
	class WaypointCompleted;
	class CustomMark;
	class Command;
	class Bush;
	class SmallTree;
	class Tree;
	class Rock;
	class BusStop;
	class FuelStation;
	class Hospital;
	class Church;
	class Lighthouse;
	class Power;
	class PowerSolar;
	class PowerWave;
	class PowerWind;
	class Quay;
	class Transmitter;
	class Watertower;
	class Cross;
	class Chapel;
	class Shipwreck;
	class Bunker;
	class Fortress;
	class Fountain;
	class Ruin;
	class Stack;
	class Tourism;
	class ViewTower;
};
class ctrlMapMain;
class ctrlListNBox;
class ctrlCheckbox;
class ctrlCheckboxToolbar;
class ctrlCheckboxBaseline;
class ctrlControlsGroupHighlight;
class ctrlControlsGroupTutorial;

class Krzyc_radioDisplay
{
	idd=2201;
	enablesimulation=1;
	enabledisplay=1;
	class controlsBackground
	{
		class Radio_CA: ctrlStaticPicture
		{
			text="\data\Radio\radio_ca.paa";
			x="((getResolution select 2) * 0.5 * pixelW) - 70 * (pixelW * pixelGrid * 0.50)";
			y="((getResolution select 3) * 0.5 * pixelH) - 75 * (pixelH * pixelGrid * 0.50)";
			w="200 * (pixelW * pixelGrid * 0.50)";
			h="100 * (pixelH * pixelGrid * 0.50)";
		};
	};
	class controls
	{
		class RadioGroup: ctrlControlsGroupNoScrollbars
		{
			idc=-1;
			x="((getResolution select 2) * 0.5 * pixelW) - 70 * (pixelW * pixelGrid * 0.50)";
			y="((getResolution select 3) * 0.5 * pixelH) - 75 * (pixelH * pixelGrid * 0.50)";
			w="200 * (pixelW * pixelGrid * 0.50)";
			h="60 * (pixelH * pixelGrid * 0.50)";
			class controls
			{
				class BandDial: ctrlStaticPicture
				{
					text="\data\Radio\dial_3_ca.paa";
					angle=90;
					color[]={0.80000001,0.80000001,0.80000001,1};
					colorActive[]={1,1,1,1};
					colorDisabled[]={1,1,1,1};
					x="33 * (pixelW * pixelGrid * 0.50)";
					y="40 * (pixelH * pixelGrid * 0.50)";
					w="16 * (pixelW * pixelGrid * 0.50)";
					h="16 * (pixelH * pixelGrid * 0.50)";
				};
				class BandDialButton: ctrlButton
				{
					idc=-1;
					x="33 * (pixelW * pixelGrid * 0.50)";
					y="40 * (pixelH * pixelGrid * 0.50)";
					w="16 * (pixelW * pixelGrid * 0.50)";
					h="16 * (pixelH * pixelGrid * 0.50)";
					colorBackground[]={0,0,0,0};
					colorBackgroundDisabled[]={0,0,0,0};
					colorBackgroundActive[]={0,0,0,0};
					colorFocused[]={0,0,0,0};
					colorDisabled[]={0,0,0,0};
					colorText[]={0,0,0,0};
				};
				class PresetLDial: BandDial
				{
					text="\data\Radio\dial_1_ca.paa";
					x="53.5 * (pixelW * pixelGrid * 0.50)";
					y="31 * (pixelH * pixelGrid * 0.50)";
					w="14 * (pixelW * pixelGrid * 0.50)";
					h="14 * (pixelH * pixelGrid * 0.50)";
				};
				class PresetLDialButton: BandDialButton
				{
					idc=-1;
					x="53.5 * (pixelW * pixelGrid * 0.50)";
					y="31 * (pixelH * pixelGrid * 0.50)";
					w="14 * (pixelW * pixelGrid * 0.50)";
					h="14 * (pixelH * pixelGrid * 0.50)";
				};
				class PresetRDial: PresetLDial
				{
					onload="";
					x="90 * (pixelW * pixelGrid * 0.50)";
				};
				class PresetRDialButton: PresetLDialButton
				{
					x="90 * (pixelW * pixelGrid * 0.50)";
					onButtonClick="";
				};
				class VolumeDial: BandDial
				{
					text="\data\Radio\dial_2_ca.paa";
					x="120 * (pixelW * pixelGrid * 0.50)";
					y="26.5 * (pixelH * pixelGrid * 0.50)";
					w="13 * (pixelW * pixelGrid * 0.50)";
					h="13 * (pixelH * pixelGrid * 0.50)";
				};
				class VolumeDialButton: BandDialButton
				{
					x="120 * (pixelW * pixelGrid * 0.50)";
					y="26.5 * (pixelH * pixelGrid * 0.50)";
					w="13 * (pixelW * pixelGrid * 0.50)";
					h="13 * (pixelH * pixelGrid * 0.50)";
				};
				class SettingDial: BandDial
				{
					x="118 * (pixelW * pixelGrid * 0.50)";
					y="43.5 * (pixelH * pixelGrid * 0.50)";
					w="16 * (pixelW * pixelGrid * 0.50)";
					h="16 * (pixelH * pixelGrid * 0.50)";
				};
				class SettingDialButton: BandDialButton
				{
					x="118 * (pixelW * pixelGrid * 0.50)";
					y="43.5 * (pixelH * pixelGrid * 0.50)";
					w="16 * (pixelW * pixelGrid * 0.50)";
					h="16 * (pixelH * pixelGrid * 0.50)";
				};
			};
		};
		class MapFolder: ctrlStaticPictureKeepAspect
		{
			text="\data\vn_displayartillery\mapfolder.paa";
			x="((getResolution select 2) * 0.5 * pixelW) - 0.5 * 200 * (pixelW * pixelGrid * 0.50)";
			y="((getResolution select 3) * 0.5 * pixelH) - 10 * (pixelH * pixelGrid * 0.50)";
			w="200 * (pixelW * pixelGrid * 0.50)";
			h="0.5 * 200 * (pixelH * pixelGrid * 0.50)";
		};
		class map_selection: ctrlMap
		{
			idc=7001;
			x="((getResolution select 2) * 0.5 * pixelW) + 13 * (pixelW * pixelGrid * 0.50)";
			y="((getResolution select 3) * 0.5 * pixelH) + 1 * (pixelH * pixelGrid * 0.50)";
			w="73 * (pixelW * pixelGrid * 0.50)";
			h="75 * (pixelH * pixelGrid * 0.50)";
			showCountourInterval=0;
			class task
			{
				icon="#(argb,8,8,3)color(0,0,0,0)";
				iconCreated="#(argb,8,8,3)color(0,0,0,0)";
				iconCanceled="#(argb,8,8,3)color(0,0,0,0)";
				iconDone="#(argb,8,8,3)color(0,0,0,0)";
				iconFailed="#(argb,8,8,3)color(0,0,0,0)";
				color[]={0,0,0,0};
				colorCreated[]={0,0,0,0};
				colorCanceled[]={0,0,0,0};
				colorDone[]={0,0,0,0};
				colorFailed[]={0,0,0,0};
				size=0;
			};
			class custommark
			{
				icon="#(argb,8,8,3)color(0,0,0,0)";
				color[]={0,0,0,0};
				size=0;
				coefMax=4;
				coefMin=0.25;
				importance=0;
			};
			class hospital: custommark
			{
			};
			class church: custommark
			{
			};
			class lighthouse: custommark
			{
			};
			class power: custommark
			{
			};
			class powersolar: custommark
			{
			};
			class powerwave: custommark
			{
			};
			class powerwind: custommark
			{
			};
			class transmitter: custommark
			{
			};
			class watertower: custommark
			{
			};
			class Cross: custommark
			{
			};
			class Chapel: custommark
			{
			};
			class tourism: custommark
			{
			};
			class biewtower: custommark
			{
			};
			class busstop: custommark
			{
			};
			class fuelstation: custommark
			{
			};
			class rock: custommark
			{
			};
			class smalltree: custommark
			{
			};
			class bush: custommark
			{
			};
			class fortress: custommark
			{
			};
			class fountain: custommark
			{
			};
			class quay: custommark
			{
			};
			class ruin: custommark
			{
			};
			class shipwreck: custommark
			{
			};
			class bunker: custommark
			{
			};
			class stack: custommark
			{
			};
		};
		class NotepadContent: ctrlControlsGroupNoScrollbars
		{
			x="((getResolution select 2) * 0.5 * pixelW) - 84 * (pixelW * pixelGrid * 0.50)";
			y="((getResolution select 3) * 0.5 * pixelH) + 2.5 * (pixelH * pixelGrid * 0.50)";
			w="74 * (pixelW * pixelGrid * 0.50)";
			h="75 * (pixelH * pixelGrid * 0.50)";
			class controls
			{
				class Title: ctrlStructuredText
				{
					idc=350;
					text="$STR_ARTILLERY_SUPPORT_AIR";
					x=0;
					y=0;
					w="75 * (pixelW * pixelGrid * 0.50)";
					h="5 * (pixelH * pixelGrid * 0.50)";
					size="5 * (pixelH * pixelGrid * 0.50)";
					shadow=0;
					class Attributes
					{
						align="center";
						color="#000000";
						colorLink="#D09B43";
						size=1;
						font="RobotoCondensed";
					};
				};
				class AmmoType: ctrlListbox
				{
					idc=103;
					x="0 * (pixelW * pixelGrid * 0.50)";
					y="7.5 * (pixelH * pixelGrid * 0.50)";
					w="36.5 * (pixelW * pixelGrid * 0.50)";
					h="38.5 * (pixelH * pixelGrid * 0.50)";
					sizeEx="3 * (pixelH * pixelGrid * 0.50)";
					font="RobotoCondensed";
					colorBackground[]={0,0,0,0};
					colorText[]={0,0,0,1};
					shadow=0;
				};
				class Teams: AmmoType
				{
					idc=102;
					x="36 * (pixelW * pixelGrid * 0.50)";
					w="38 * (pixelW * pixelGrid * 0.50)";
					h="34.5 * (pixelH * pixelGrid * 0.50)";
					rowHeight="10 * (pixelH * pixelGrid * 0.50)";
					sizeEx="3 * (pixelH * pixelGrid * 0.50)";
				};
				class Amount: ctrlCombo
				{
					idc=104;
					x="0.5 * (pixelW * pixelGrid * 0.50)";
					y="50.25 * (pixelH * pixelGrid * 0.50)";
					w="35 * (pixelW * pixelGrid * 0.50)";
					h="5 * (pixelH * pixelGrid * 0.50)";
					font="RobotoCondensed";
					sizeEx="3 * (pixelH * pixelGrid * 0.50)";
					colorText[]={0,0,0,1};
					colorSelect[]={0,0,0,1};
					colorBackground[]={0.89999998,0.89999998,0.86000001,1};
					class Items
					{
						class Normal
						{
							text="$STR_ARTILLERY_AMOUNT_NORMAL";
						};
						class Heavy
						{
							text="$STR_ARTILLERY_AMOUNT_HEAVY";
						};
					};
				};
				class Request: ctrlButton
				{
					idc=105;
					text="$STR_ARTILLERY_CONFIRM";
					font="RobotoCondensed";
					sizeEx="5 * (pixelH * pixelGrid * 0.50)";
					x="36.5 * (pixelW * pixelGrid * 0.50)";
					y="49 * (pixelH * pixelGrid * 0.50)";
					w="37 * (pixelW * pixelGrid * 0.50)";
					h="5 * (pixelH * pixelGrid * 0.50)";
				};
				class Info: ctrlStructuredText
				{
					text="";
					idc=203;
					x=0;
					y="59.5 * (pixelH * pixelGrid * 0.50)";
					w="75 * (pixelW * pixelGrid * 0.50)";
					h="15 * (pixelH * pixelGrid * 0.50)";
					size="3 * (pixelH * pixelGrid * 0.50)";
					shadow=0;
					class Attributes
					{
						align="left";
						color="#000000";
						colorLink="#D09B43";
						size=1;
						font="RobotoCondensed";
					};
				};
			};
		};
	};
};
