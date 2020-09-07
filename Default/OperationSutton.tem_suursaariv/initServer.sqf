//Cywile są friendly dla wszystkich stron//
CIVILIAN setFriend [EAST , 1];
CIVILIAN setFriend [INDEPENDENT , 1];
CIVILIAN setFriend [WEST , 1];
{_x disableAI "PATH"}forEach ((getMissionLayerEntities "Players") select 0);
//Usuwanie paneli słonecznych
nH_List=["Land_CarService_F","Land_Chapel_Small_V1_F","Land_Chapel_Small_V2_F","Land_Chapel_V1_F","Land_Chapel_V2_F","Land_d_Stone_Shed_V1_F","Land_FuelStation_Build_F","Land_FuelStation_Shed_F","Land_Hospital_main_F","Land_Hospital_side1_F","Land_Hospital_side2_F","Land_i_Addon_02_V1_F","Land_i_Addon_03mid_V1_F","Land_i_Addon_03_V1_F","Land_i_Addon_04_V1_F","Land_i_Barracks_V1_F","Land_i_Barracks_V2_F","Land_i_Garage_V1_F","Land_i_Garage_V2_F","Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_i_House_Big_01_V3_F","Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_02_V3_F","Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V3_F","Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_House_Small_02_V3_F","Land_i_House_Small_03_V1_F","Land_i_Shed_Ind_F","Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F","Land_i_Stone_HouseBig_V1_F","Land_i_Stone_HouseBig_V2_F","Land_i_Stone_HouseBig_V3_F","Land_i_Stone_HouseSmall_V1_F","Land_i_Stone_HouseSmall_V2_F","Land_i_Stone_HouseSmall_V3_F","Land_i_Stone_Shed_V1_F","Land_i_Stone_Shed_V2_F","Land_i_Stone_Shed_V3_F","Land_Metal_Shed_F","Land_MilOffices_V1_F","Land_Offices_01_V1_F","Land_Slum_House01_F","Land_Slum_House02_F","Land_Slum_House03_F","Land_Unfinished_Building_01_F","Land_Unfinished_Building_02_F","Land_u_Addon_01_V1_F","Land_u_Addon_02_V1_F","Land_u_Barracks_V2_F","Land_u_House_Big_01_V1_F","Land_u_House_Big_02_V1_F","Land_u_House_Small_01_V1_F","Land_u_House_Small_02_V1_F","Land_u_Shed_Ind_F","Land_u_Shop_01_V1_F","Land_u_Shop_02_V1_F","Land_WIP_F"];

publicVariable "nH_List";


//Eh powodujący ucieczke cywili
{if(side _x==civilian)then{
_x addEventHandler["FiredNear",{
_civ=_this select 0;

	switch(round(random 2))do{
		case 0:{_civ switchMove "ApanPercMstpSnonWnonDnon_G01";_civ setSpeedMode "FULL";};
		case 1:{_civ playMoveNow "ApanPknlMstpSnonWnonDnon_G01";_civ setSpeedMode "FULL";};
		case 2:{_civ playMoveNow "ApanPpneMstpSnonWnonDnon_G01";_civ setSpeedMode "FULL";};
		default{_civ playMoveNow "ApanPknlMstpSnonWnonDnon_G01";_civ setSpeedMode "FULL";};};

//nearestObjects[ PositionOrTarget, ["List","Of","Classnames","To","Look","For"], MaxDistanceToSearchAroundTarget ];
_nH=nearestObjects[_civ,nH_List,100];


_H=selectRandom _nH;//Pick an object found in the above nearestObjects array

_HP=_H buildingPos -1;//Finds list of all available building positions in the selected building

_HP=selectRandom _HP;//Picks a building position from the list of building positions

_civ doMove _HP;//Orders the civilian to move to the building position

//Remove the eventHandler to prevent spamming
_civ removeAllEventHandlers "FiredNear";}];};
}forEach allUnits-switchableUnits-playableUnits;

zal_plane_1 setTriggerInterval 60;
zal_plane_2 setTriggerInterval 60;
zal_plane_3 setTriggerInterval 30;
