
	fnc_spiral = {
		private ["_ufo","_orb_obj2","_orbit_speed","_radius","_crop","_ung"]; params ["_ufo","_orb_obj2","_orbit_speed","_radius","_crop"];
		_ung = 0;
		_placeit=0;
		"Crater" createVehiclelocal getpos _ufo;
		while {_ung<1260} do {
			_poz_rel=_ufo getRelPos [_radius,_ung];
			_orb_obj2 setpos [_poz_rel#0,_poz_rel#1,2];
			drop [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,0.3,[0,0,0],[0,0,0],0,9.999,7,0,[1,10],[[0.443,0.706,0.81,0.2],[0.443,0.706,0.81,0]],[1],0,0,"","",_orb_obj2];
			if ((_crop)&&(_placeit==0)) then {_gol = "Land_ShellCrater_02_decal_F" createvehiclelocal _poz_rel; _placeit=2};
			_placeit=_placeit-1;
			_radius=_radius+0.1;
			_ung=_ung+1;
			sleep _orbit_speed;
		};
		for "_i" from 1 to 10 do {
			sleep 0.2;
			drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",.5,1,[0,0,0],[0,0,0],0,9,7,0,[1,10,.5],[[0,0,0,0],[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_orb_obj2];
		};
		drop [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,2.5,[0,0,0],[0,0,200],0,9,7,0,[10,1],[[1,1,1,1],[0.9,.9,1,1]],[1],0,0,"","",_orb_obj2];
		deletevehicle _orb_obj2;
	};



	if (!hasinterface) exitwith {};
	params ["_ufo","_radius","_typ_crop"];
	enableCamShake true;
	sleep 1.3;
	_orb_obj2 = "#lightpoint" createvehiclelocal [0,0,0];
	_orb_obj2 setLightDayLight true;_orb_obj2 setLightUseFlare true;
	_orb_obj2 setLightFlareSize 5; _orb_obj2 setLightFlareMaxDistance 5000;
	_orb_obj2 setLightAmbient[0.5,0.5,1]; _orb_obj2 setLightColor[1,0.2,0.1];
	_orb_obj2 setLightAttenuation [0,0,0,0,0,4000];
	_orb_obj2 setLightBrightness 5;

	drop [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,2.5,[0,0,500],[0,0,-200],0,9,7,0,[1,10],[[0,0,1,1],[0.9,.9,1,1]],[1],0,0,"","",_ufo];
	sleep 2;
	for "_i" from 1 to 3 do {
		sleep 0.1;
		drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",.5,1,[0,0,0],[0,0,0],0,9,7,0,[1,10,.5],[[0,0,0,0],[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_orb_obj2];
	};
	sleep 0.3;
	_blast_wave = "#particlesource" createVehicleLocal getPosATL _ufo;
	_blast_wave setParticleCircle [5,[0,0,0]];
	_blast_wave setParticleRandom [0.1,[3,3,1],[100,100,0],0,2,[0,0,0,0.5],1,0];
	_blast_wave setParticleParams [["\A3\data_f\cl_basic",1,0,1],"","Billboard",1,3,[1,1,2],[0,0,-5],0,20,1,1,[5,10],[[0,0,0,0.3],[0.1,0.1,0.1,0]],[1],1,0,"","",_ufo];
	_blast_wave setDropInterval 0.002;
	[_blast_wave] spawn {_de_sters = _this select 0;sleep 0.2; deleteVehicle _de_sters};
	//addCamShake [2,10,30];
	//playSound "cutremur";
	switch (_typ_crop) do {
	    case "spiral": {[_ufo,_orb_obj2,0.01,_radius,true] spawn fnc_spiral};
	};
	while {alive _orb_obj2} do {
		_orb_obj2 say3d ["OrbSound",2000,3];
		sleep 10;
	};
