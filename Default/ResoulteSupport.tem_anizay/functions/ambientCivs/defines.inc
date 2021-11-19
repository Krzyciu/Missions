	#define PROFILING_ENABLED

	#ifndef INTERNAL_VERSION
		#undef PROFILING_ENABLED
	#endif

	#ifdef PROFILING_ENABLED
#define PROFILE_START(blockName) 								profilingStart blockName
#define PROFILE_START_INFO(blockName,string,val) 				profilingStart blockName; profilingSetInfo format [string,val]
#define PROFILE_START_INFO2(blockName,string,val1,val2) 		profilingStart blockName; profilingSetInfo format [string,val1,val2]
#define PROFILE_START_INFO3(blockName,string,val1,val2,val3) 	profilingStart blockName; profilingSetInfo format [string,val1,val2,val3]
#define PROFILE_INFO(blockName,string,val) 						profilingSetInfo format [string,val]
#define PROFILE_INFO2(blockName,string,val1,val2) 				profilingSetInfo format [string,val1,val2]
#define PROFILE_INFO3(blockName,string,val1,val2,val3) 			profilingSetInfo format [string,val1,val2,val3]
#define PROFILE_WATCH(var,val) 									profilingWatch [var,val]
#define PROFILE_WATCH_CATEGORY(var,val,cat) 					profilingWatch [var,val,cat]
#define PROFILE_STOP(blockName) 								profilingStop blockName
	#else
	#define PROFILE_START(blockName)
	#define PROFILE_START_INFO(blockName,string)
	#define PROFILE_START_INFO2(blockName,string,val1,val2)
	#define PROFILE_START_INFO3(blockName,string,val1,val2,val3)
	#define PROFILE_INFO(blockName,string,val)
	#define PROFILE_INFO2(blockName,string,val1,val2)
	#define PROFILE_INFO3(blockName,string,val1,val2,val3)
	#define PROFILE_WATCH(var,val)
	#define PROFILE_WATCH_CATEGORY(var,val,cat)
	#define PROFILE_STOP(blockName)
	#endif


#define MODE_NEAREST						0
#define MODE_RANDOM							1

#define DC_ENEMY_DETECTED					0
#define DC_FIRE								1
#define DC_HIT                      		2
#define DC_ENEMY_NEAR               		3
#define DC_EXPLOSION                		4
#define DC_DEAD_BODY_GROUP          		5
#define DC_DEAD_BODY                		6
#define DC_SCREAM                   		7
#define DC_CAN_FIRE                 		8
#define DC_BULLET_CLOSE             		9

#define DC_THREAT_ENEMY_DETECTED			1
#define DC_THREAT_FIRE						1
#define DC_THREAT_HIT                    	5
#define DC_THREAT_ENEMY_NEAR               	5
#define DC_THREAT_EXPLOSION                	2
#define DC_THREAT_DEAD_BODY_GROUP          	0
#define DC_THREAT_DEAD_BODY                	0
#define DC_THREAT_SCREAM                   	0
#define DC_THREAT_CAN_FIRE                 	0
#define DC_THREAT_BULLET_CLOSE             	0

#define REACTION_DELAY_PER_METER			0.01				//reaction delay seconds per meter (0.01 = AI 100m away from player will react 1x per second)
#define THREAT_DECAY_PER_METER				0.005				//absolute threat degradation per meter (0.01 = treat drops by 1 for each 100m)
#define THREAT_DECAY_PER_SECOND				0.005				//absolute threat degradation per second (0.01 = treat drops by 1 for each 100secs)

#define GET_DC_STRING(cause)									(["DC_ENEMY_DETECTED","DC_FIRE","DC_HIT","DC_ENEMY_NEAR","DC_EXPLOSION","DC_DEAD_BODY_GROUP","DC_DEAD_BODY","DC_SCREAM","DC_CAN_FIRE","DC_BULLET_CLOSE"] select cause)
#define GET_DC_THREAT(cause)									([DC_THREAT_ENEMY_DETECTED,DC_THREAT_FIRE,DC_THREAT_HIT,DC_THREAT_ENEMY_NEAR,DC_THREAT_EXPLOSION,DC_THREAT_DEAD_BODY_GROUP,DC_THREAT_DEAD_BODY,DC_THREAT_SCREAM,DC_THREAT_CAN_FIRE,DC_THREAT_BULLET_CLOSE] select cause)

#define GET_THREAT_BY_DISTANCE(threatValue,threatPos,unitPos)	((threatValue - ((unitPos distance threatPos) * THREAT_DECAY_PER_METER)) max 0)

#define ICON_SAFESPOT						"\A3\Modules_F_Tacops\Data\CivilianPresenceSafeSpot\icon32_ca.paa"
#define ICON_SAFESPOT_TERMINAL				"\A3\Modules_F_Tacops\Data\CivilianPresenceSafeSpot\debugIsTerminal_ca.paa"
#define ICON_UNIT							"\A3\Modules_F_Tacops\Data\CivilianPresenceUnit\debugUnit_ca.paa"
#define ICON_DESTINATION					"\A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\default_ca.paa"

#define ROUND_DECIMALS(input,accuracy)		(round((1/accuracy)*(input))*accuracy)