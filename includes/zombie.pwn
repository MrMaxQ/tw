#include <YSI\y_hooks>


#include <rnpc>
#define RNPC_NO_VERSION_CHECK
#define MAX_ANIMATION_INDEX 1812
#define MAX_ZOMBIES 51 //51 //OPTIONAL: Define the max amount of zombies to spawn here. (Default: 50) - На самом деле зомби будет 50!!!
#define ZOMBIE_NAME "ToxicMan[%i]"//OPTIONAL: Define the name of zombies here. (Default: Zombie[%i])
#define ZOMBIE_HEALTH 50//OPTIONAL: Define the full amount of health for zombies here. (Default: 50%)
#define ZOMBIE_SKIN 162//OPTIONAL: Define the skin id for zombies here. (Default: 162)
#define ZOMBIE_SKIN1 160//OPTIONAL: Define the skin id for zombies here. (Default: 162)
#define ZOMBIE_SKIN2 77//OPTIONAL: Define the skin id for zombies here. (Default: 162)
#define ZOMBIE_SKIN_ANTI_CHEAT 294//OPTIONAL: Define the skin id for zombies here. (Default: 162)
#define ZOMBIE_SKIN_FUEL_FACTORY 179//OPTIONAL: Define the skin id for zombies here. (Default: 162)
//#define ZOMBIE_COLOR 0xFF0000FF//OPTIONAL: Define the color of zombies here. (Default: Red)
#define ZOMBIE_COLOR 0xFFFFFF00
#define ZOMBIE_DETECT 50//OPTIONAL: Define the minimum detect range for zombies here. (Default: 25 Metres)
#define ZOMBIE_DAMAGE 5//OPTIONAL: Define the damage amount for zombies here. (Default: 25%)
#define ZOMBIE_PRESENT_MODE 0

new GetZombieVictimID[MAX_PLAYERS];
new zombieDontDropLootTime = 0;
new move3ZombiesToCounter = 0;

new ZombieAttackCounter[MAX_PLAYERS];
new ZombieID[MAX_ZOMBIES];
new ZombieAttackDelay[MAX_ZOMBIES];
new ZombieSpawnTime = 0;
new Float:ZombieNearPos[3];
new ZombieNearFlag = 0;

new playerZombieDefenceOff[MAX_PLAYERS];
new zombieCheaterMessageTime = 0;
new ZombieAttackTargetId[MAX_ZOMBIES];

new Float:ZombieGotoPos[3];
new ZombieGotoTime = 0;
new ZombieFollowPlayerID = -1;
new ZombieAttackEnable = 1;


new zombieWeapon[MAX_ZOMBIES];
new zombieWeaponRange[MAX_ZOMBIES];
new zombieNightMode = 0;
new zombieKillEmAll = 0;
new zombieTargetsCounter[MAX_PLAYERS];

new FuelFactoryZombieKillCounter[MAX_PLAYERS];
new GetAZombiePresent[MAX_PLAYERS];

new Float:ZombieSpawns[3][3] =//REQUIRED: Change [2] to the amount of spawn locations.
{
        //{214.4676, 1912.6348, 17.2970}, //zone 51
        //{-1529.0007, 470.7303, 7.2992}, //avia
        //{1558.6617, -1627.5209, 13.5725}, //ls police
        //{-1593.2509, 661.1603, 7.6389}, //sf police
        //{2233.5398, 2452.6841, 11.4464}, //lv police

        /*{297.5494, 1821.7087, 16.6227},
        {86.5314, 1921.5946, 16.8012},
        {205.0691, 1418.3073, 9.5691},
        {-320.0010, 2523.6133, 33.6774},
		{712.2579, -105.3388, 20.1810} //zlair */
        {-1631.8328, -2240.9934, 32.2086},
        {-904.9502, -2048.2017, 148.2282},
        {-1799.2128, -2256.1008, 76.9415}
};

new Float:ZombieSpawnFuelFactory[3] = {191.9512, 1404.9337, 11.4078};

new zombieConnectCounter = 0;
new nowZombieConnectID = -1;
new ZombieConnectDelay = 0;

hook OnGameModeInit() {
    SetTimer("OnZombieAttack", 500, true);
    SetTimer("OnZombieRoam", 30000, true);
    return 1;
}

forward OnZombieAttack();
forward OnZombieRoam();


public OnZombieAttack() {
		//new updatetime = tickcount();
		if (ZombieAttackEnable == 0) return 1;
        for(new npcid = 0; npcid < MAX_ZOMBIES; npcid++) {
            ZombieAttackDelay[npcid]--;
            if(ZombieAttackDelay[npcid] < 0 && IsPlayerConnected(ZombieID[npcid]) && ZombieID[npcid] != INVALID_PLAYER_ID && IsPlayerNPC(ZombieID[npcid])) {
                if(GetRNPCHealth(ZombieID[npcid]) > 0) {
                        new victim = INVALID_PLAYER_ID;
                        new Float:x, Float:y, Float:z, Float:health;
                        new Float:victimX, Float:victimY, Float:victimZ;
                        if (GetPlayerSkin(ZombieID[npcid]) == ZOMBIE_SKIN_FUEL_FACTORY) {
	                        if (!IsPlayerInRangeOfPoint(ZombieID[npcid],200,ZombieSpawnFuelFactory[0], ZombieSpawnFuelFactory[1], ZombieSpawnFuelFactory[2])) {
	                            //MoveRNPC(ZombieID[npcid], ZombieSpawnFuelFactory[0], ZombieSpawnFuelFactory[1], ZombieSpawnFuelFactory[2], RNPC_SPEED_SPRINT, 1);
	                            killZombie(ZombieID[npcid],npcid);
	                            continue;
	                        } else {
	                            if (zombieWeapon[npcid] < 1) {
		                            new zombieWeapons[3] = {18,37,16};
									new zombieWeaponsRange[3] = {20,4,20};
									new zombieWeaponID = random(3);
									zombieWeapon[npcid] = zombieWeapons[zombieWeaponID];
							        zombieWeaponRange[npcid] = zombieWeaponsRange[zombieWeaponID];
							    }
	                            victim = GetClosestToZombiePlayer(ZombieID[npcid]);
	                            if (victim == INVALID_PLAYER_ID && ZombieAttackTargetId[npcid] != INVALID_PLAYER_ID) {
	                                if(IsPlayerConnected(ZombieAttackTargetId[npcid]) && gPlayerLogged[ZombieAttackTargetId[npcid]] == 1) {
	                                    victim = ZombieAttackTargetId[npcid];
	                                } else {
	                                    ZombieAttackTargetId[npcid] = INVALID_PLAYER_ID;
	                                }
	                            }
	                        }
                        } else if (GetPlayerSkin(ZombieID[npcid]) != ZOMBIE_SKIN_ANTI_CHEAT) {
                            victim = GetClosestToZombiePlayer(ZombieID[npcid]);
                            if (victim == INVALID_PLAYER_ID && ZombieAttackTargetId[npcid] != INVALID_PLAYER_ID) {
                                if(IsPlayerConnected(ZombieAttackTargetId[npcid]) && gPlayerLogged[ZombieAttackTargetId[npcid]] == 1) {
                                    victim = ZombieAttackTargetId[npcid];
                                } else {
                                    ZombieAttackTargetId[npcid] = INVALID_PLAYER_ID;
                                }
                            }
						} else {
						    victim = GetClosestToZombieCheater(ZombieID[npcid]);
							if ((zombieCheaterMessageTime+60*3) < gettime()) {
							    if(victim != INVALID_PLAYER_ID) {
								    zombieCheaterMessageTime = gettime();
								    new warningString[100];
								    format(warningString,sizeof(warningString),"( ! ) Лимит счетчика читов превышен! %s[%d]",PlayerInfo[victim][dbName],victim);
								    ABroadCast(COLOR_LIGHTRED,warningString,3);
								    moveAntiCheatZombiesTo(victim);
								}
							}
						}
						if (victim == INVALID_PLAYER_ID) {
                            ZombieAttackDelay[npcid] = 15;
                            continue;
                        } else {
                        //if(victim != INVALID_PLAYER_ID) {
                            MySQLsavetime = gettime();
                            GetPlayerPos(ZombieID[npcid], x, y, z);
                            GetPlayerPos(victim, victimX, victimY, victimZ);
    	                    //if(IsPlayerInRangeOfPoint(victim, GetVictimDetectRange[victim], x, y, z) || GetPlayerSkin(ZombieID[npcid]) == ZOMBIE_SKIN_ANTI_CHEAT) {
	    	                    GetZombieVictimID[ZombieID[npcid]] = victim;
            		            if(IsPlayerInRangeOfPoint(victim, 1.0, x, y, z) || (zombieWeapon[npcid] > 0 && zombieWeaponRange[npcid] > 0 && IsPlayerInRangeOfPoint(victim, zombieWeaponRange[npcid], x, y, z)) ) {

            		                new victimVehicleId = GetPlayerVehicleID(victim);
                                    new Float:victimVehicleCarHealth;
                                    if (victimVehicleId > 0) {
	                                    GetVehicleHealth(victimVehicleId,victimVehicleCarHealth);
	                                    if (/*victimVehicleCarHealth < 255 ||*/ vehRepairDistance[victimVehicleId] >= 10000) {
	                                        victimVehicleId = 0;
	                                        ZombieAttackDelay[npcid] = 5;
                            				continue;
	                                    }
                                    }
            		                new ZombiePresentMode = ZOMBIE_PRESENT_MODE;

                                    RNPC_CreateBuild(ZombieID[npcid], PLAYER_RECORDING_TYPE_ONFOOT);

                                    if (GetPlayerSkin(ZombieID[npcid]) == ZOMBIE_SKIN_ANTI_CHEAT) {
                                    	RNPC_SetWeaponID(8);
									} else if (zombieWeapon[npcid] > 0) {
									    RNPC_SetWeaponID(zombieWeapon[npcid]);
										/*new Float:angle = floatabs(atan((victimY-y)/(victimX-x)));
										if(victimX <= x && victimY >= y) angle = floatsub(180, angle);
										else if(victimX < x && victimY < y) angle = floatadd(angle, 180);
										else if(victimX >= x && victimY <= y) angle = floatsub(360.0, angle);
										angle = floatsub(angle, 90.0);
										if(angle >= 360.0) angle = floatsub(angle, 360.0);*/

										new Float:angle = atan2(x - victimX, y - victimY) + Random(175, 180);
                                        RNPC_SetAngleQuats(0.0, angle, 0.0);
                                        RNPC_AddPause(100);
									}

                                    //RNPC_AddPause(100);
                                    //RNPC_AddMovement(x, y, z, victimX, victimY, victimZ);


                                    if (ZombiePresentMode == 0 || GetPlayerSkin(ZombieID[npcid]) == ZOMBIE_SKIN_ANTI_CHEAT) {
	                                    RNPC_SetKeys(KEY_FIRE);
									}
									if (zombieWeapon[npcid] > 0) {
									    RNPC_AddPause(1500);
									}
                                    RNPC_AddPause(100);

                                    RNPC_SetKeys(0);
                                    RNPC_FinishBuild();
                                    RNPC_StartBuildPlayback(ZombieID[npcid]);

                                    if (zombieWeaponRange[npcid] > 0) {
	                                    continue;
									}

                                    GetPlayerHealthAC(victim, health);
                                    new Float:victimHealth;
                                    if (GetPlayerSkin(ZombieID[npcid]) == ZOMBIE_SKIN1 || GetPlayerSkin(ZombieID[npcid]) == ZOMBIE_SKIN_FUEL_FACTORY) {
                                        if (ZombiePresentMode == 0) {
                                            if (victimVehicleId > 0) {
                                                checkVehHealthTime[victimVehicleId] = gettime();
												victimVehicleCarHealth -= 60.0;
												SetVehicleHealth(victimVehicleId,victimVehicleCarHealth);
												checkVehHealth[victimVehicleId] = victimVehicleCarHealth;
												prevVehHealth[victimVehicleId] = victimVehicleCarHealth;
                                            } else {
		                                        SetPlayerHealthAC(victim, health - 15.0);
		                                        victimHealth = health - 15.0;
		                                        MeChat(ZombieID[npcid],"мяясооо...");
			                                    MeChat(victim,"чувствует боль от укуса...");
											}
										} else {
										    GetAZombiePresent[victim]++;
										    MeChat(ZombieID[npcid],"",3);
										}
                                    } else if (GetPlayerSkin(ZombieID[npcid]) == ZOMBIE_SKIN2) {
                                        if (ZombiePresentMode == 0) {
                                            if (victimVehicleId > 0) {
                                                checkVehHealthTime[victimVehicleId] = gettime();
												victimVehicleCarHealth -= 40.0;
												SetVehicleHealth(victimVehicleId,victimVehicleCarHealth);
												checkVehHealth[victimVehicleId] = victimVehicleCarHealth;
												prevVehHealth[victimVehicleId] = victimVehicleCarHealth;
                                            } else {
		                                        SetPlayerHealthAC(victim, health - 10.0);
		                                        victimHealth = health - 10.0;
		                                        MeChat(ZombieID[npcid],"мяясооо...");
			                                    MeChat(victim,"чувствует боль от укуса...");
											}
										} else {
										    GetAZombiePresent[victim]++;
										    MeChat(ZombieID[npcid],"",3);
										}
                                    } else if (GetPlayerSkin(ZombieID[npcid]) == ZOMBIE_SKIN_ANTI_CHEAT) {
                                        SetPlayerHealthAC(victim, health - 100.0);
                                        victimHealth = health - 100.0;
                                    } else {
                                        if (ZombiePresentMode == 0) {
                                            if (victimVehicleId > 0) {
                                                checkVehHealthTime[victimVehicleId] = gettime();
												victimVehicleCarHealth -= 20.0;
												SetVehicleHealth(victimVehicleId,victimVehicleCarHealth);
												checkVehHealth[victimVehicleId] = victimVehicleCarHealth;
												prevVehHealth[victimVehicleId] = victimVehicleCarHealth;
                                            } else {
			                                    SetPlayerHealthAC(victim, health - ZOMBIE_DAMAGE);
			                                    victimHealth = health - ZOMBIE_DAMAGE;
	        	                                MeChat(ZombieID[npcid],"мяясооо...");
		        	                            MeChat(victim,"чувствует боль от укуса...");
											}
										} else {
										    GetAZombiePresent[victim]++;
										    MeChat(ZombieID[npcid],"",3);
										}
									}


                                    printf("[Server] ZOMBIE #%d ATTACK: %s[%d]HP:%f",ZombieID[npcid], PlayerInfo[victim][dbName],victim,PlayerHealth[victim]);
                                    if ((ZombiePresentMode == 0 || GetPlayerSkin(ZombieID[npcid]) == ZOMBIE_SKIN_ANTI_CHEAT) && victimHealth <=0 && victimVehicleId == 0) {
                                        ZombieAttackCounter[victim]++;
                                        if (GetPlayerSkin(ZombieID[npcid]) == ZOMBIE_SKIN_ANTI_CHEAT) {
                                            DestroyPlayerLootAndKill(victim);
                                            PlayerInfo[victim][pCheatCounter] =0;
                                        } else {
	                                        DropAllPlayerLootAndKill(victim);
										}
                                        if (ZombieAttackCounter[victim] > 10) {
                                            PlayerInfo[victim][pCheatCounter]++;
                                            DestroyPlayerLootAndKill(victim);
                                            OnPlayerUpdateRLSauronRealSave(victim);
                                            kickPlayer(victim);
                                        }
                                        break;
                                    }
                                    continue;
                                }
                                new Float:vx,Float:vy,Float:vz;
                                GetPlayerPos(victim, vx, vy, vz);
								/*if (IsPlayerInRangeOfPoint(victim, 100, 702.8103, -113.6644, 19.9949)) {
								    MoveRNPC(ZombieID[npcid], vx, vy, vz, RNPC_SPEED_SPRINT, 0);
								} else {*/
	                                if(Distance2D(x,y,vx,vy) < 15) {
	                                    /*SetPlayerColor(ZombieID[npcid], COLOR_ORANGERED);
	                                    if ((GetPlayerSkin(ZombieID[npcid]) == ZOMBIE_SKIN1 || GetPlayerSkin(ZombieID[npcid]) == ZOMBIE_SKIN2) && isPlayerAtRedZone(ZombieID[npcid],true)) {
	                                        MoveRNPC(ZombieID[npcid], vx, vy, vz, RNPC_SPEED_SPRINT, 0);
										} else if (GetPlayerSkin(ZombieID[npcid]) == ZOMBIE_SKIN_ANTI_CHEAT) {
										    MoveRNPC(ZombieID[npcid], vx, vy, vz, RNPC_SPEED_SPRINT, 0);
                                        } else if (random(2) == 1) {
										    MoveRNPC(ZombieID[npcid], vx, vy, vz, RNPC_SPEED_SPRINT, 0);
	                                    } else {
		                                    MoveRNPC(ZombieID[npcid], vx, vy, vz, RNPC_SPEED_RUN, 0);
										}*/
										//MoveRNPC(ZombieID[npcid], vx, vy, vz, RNPC_SPEED_RUN, 0);
										MoveRNPC(ZombieID[npcid], vx, vy, vz, RNPC_SPEED_SPRINT, 0);
	                                } else {
	                                    /*SetPlayerColor(ZombieID[npcid], TEAM_HIT_COLOR);
	                                    if ((GetPlayerSkin(ZombieID[npcid]) == ZOMBIE_SKIN1 || GetPlayerSkin(ZombieID[npcid]) == ZOMBIE_SKIN2) && random(3) == 1) {
	                                        MoveRNPC(ZombieID[npcid], vx, vy, vz, RNPC_SPEED_SPRINT, 1);
                                        } else if (GetPlayerSkin(ZombieID[npcid]) == ZOMBIE_SKIN_ANTI_CHEAT) {
										    MoveRNPC(ZombieID[npcid], vx, vy, vz, RNPC_SPEED_SPRINT, 1);
	                                    } else {
			                                MoveRNPC(ZombieID[npcid], vx, vy, vz, RNPC_SPEED_RUN, 1);
										}*/
										//MoveRNPC(ZombieID[npcid], vx, vy, vz, RNPC_SPEED_RUN, 1);
										MoveRNPC(ZombieID[npcid], vx, vy, vz, RNPC_SPEED_SPRINT, 1);
									}
								/*}*/
                            //}
                        }
                }
            }
        }
        //printf("[MySQL]  OnZombieAttack - done in %d ms",tickcount() - updatetime);
        return 1;
}

public OnZombieRoam()
{
		new followMode = 0;
		new Float:followPos[3];
		new singleFollowMode = 0;
		new Float:singleFollowPos[3];

        if (ZombieFollowPlayerID >= 0) {
	    	if (!IsPlayerConnected(ZombieFollowPlayerID) || ZombieFollowPlayerID == INVALID_PLAYER_ID || GetPlayerVirtualWorld(ZombieFollowPlayerID) > 0) {
	        	ZombieFollowPlayerID = -1;
		    }
		    if (ZombieFollowPlayerID >= 0) {
		        GetPlayerPos(ZombieFollowPlayerID, followPos[0],followPos[1],followPos[2]);
		        followMode = 1;
		    }
		}



        for(new npcid = 0; npcid < MAX_ZOMBIES; npcid++) {
            if(IsPlayerConnected(ZombieID[npcid]) && ZombieID[npcid] != INVALID_PLAYER_ID && IsPlayerNPC(ZombieID[npcid])) {
                if(GetRNPCHealth(ZombieID[npcid]) > 0) {
                	new victim = INVALID_PLAYER_ID;
                	singleFollowMode = 0;
                    new Float:x, Float:y, Float:z;
                    if (GetPlayerSkin(ZombieID[npcid]) == ZOMBIE_SKIN_FUEL_FACTORY) {
                        if (!IsPlayerInRangeOfPoint(ZombieID[npcid],100,ZombieSpawnFuelFactory[0], ZombieSpawnFuelFactory[1], ZombieSpawnFuelFactory[2])) {
                            MoveRNPC(ZombieID[npcid], ZombieSpawnFuelFactory[0], ZombieSpawnFuelFactory[1], ZombieSpawnFuelFactory[2], RNPC_SPEED_SPRINT, 1);
                            continue;
                        }
                    } else if (GetPlayerSkin(ZombieID[npcid]) != ZOMBIE_SKIN_ANTI_CHEAT) {
                        victim = GetClosestToZombiePlayer(ZombieID[npcid]);
                        if (victim == INVALID_PLAYER_ID && ZombieAttackTargetId[npcid] != INVALID_PLAYER_ID) {
                            if(IsPlayerConnected(ZombieAttackTargetId[npcid]) && gPlayerLogged[ZombieAttackTargetId[npcid]] == 1) {
                                //victim = ZombieAttackTargetId[npcid];
                                GetPlayerPos(ZombieAttackTargetId[npcid], singleFollowPos[0],singleFollowPos[1],singleFollowPos[2]);
		        				singleFollowMode = 1;
                            } else {
                                ZombieAttackTargetId[npcid] = INVALID_PLAYER_ID;
                            }
                        }
					} else {
					    victim = GetClosestToZombieCheater(ZombieID[npcid]);
					    SetRNPCHealth(ZombieID[npcid], 5000);
					}
                    if(victim == INVALID_PLAYER_ID) {
                        GetPlayerPos(ZombieID[npcid], x, y, z);
                        SetPlayerColor(ZombieID[npcid], TEAM_HIT_COLOR);
                        if (ZombieGotoTime > gettime() && !IsPlayerInRangeOfPoint(ZombieID[npcid],20,ZombieGotoPos[0], ZombieGotoPos[1], ZombieGotoPos[2]) && GetPlayerSkin(ZombieID[npcid]) != ZOMBIE_SKIN_ANTI_CHEAT && GetPlayerSkin(ZombieID[npcid]) != ZOMBIE_SKIN_FUEL_FACTORY) {
                            GetZombieVictimID[ZombieID[npcid]] = INVALID_PLAYER_ID;
                            RNPC_SetKeys(0);
	                        if(Distance2D(x,y,ZombieGotoPos[0], ZombieGotoPos[1]) < 20) {
                                MoveRNPC(ZombieID[npcid], ZombieGotoPos[0], ZombieGotoPos[1], ZombieGotoPos[2], RNPC_SPEED_SPRINT, 0);
                            } else {
                                MoveRNPC(ZombieID[npcid], ZombieGotoPos[0], ZombieGotoPos[1], ZombieGotoPos[2], RNPC_SPEED_SPRINT, 1);
							}
						} else if (followMode == 1 && !IsPlayerInRangeOfPoint(ZombieID[npcid],20,followPos[0], followPos[1], followPos[2]) && GetPlayerSkin(ZombieID[npcid]) != ZOMBIE_SKIN_ANTI_CHEAT && GetPlayerSkin(ZombieID[npcid]) != ZOMBIE_SKIN_FUEL_FACTORY) {
						    GetZombieVictimID[ZombieID[npcid]] = INVALID_PLAYER_ID;
                            RNPC_SetKeys(0);
	                        if(Distance2D(x,y,followPos[0], followPos[1]) < 20) {
                                MoveRNPC(ZombieID[npcid], followPos[0]+float(Random(-10,10)), followPos[1]+float(Random(-10,10)), followPos[2], RNPC_SPEED_SPRINT, 0);
                            } else {
                                MoveRNPC(ZombieID[npcid], followPos[0]+float(Random(-10,10)), followPos[1]+float(Random(-10,10)), followPos[2], RNPC_SPEED_SPRINT, 1);
							}
                        } else if (singleFollowMode == 1 && !IsPlayerInRangeOfPoint(ZombieID[npcid],20,singleFollowPos[0], singleFollowPos[1], singleFollowPos[2]) && GetPlayerSkin(ZombieID[npcid]) != ZOMBIE_SKIN_ANTI_CHEAT && GetPlayerSkin(ZombieID[npcid]) != ZOMBIE_SKIN_FUEL_FACTORY) {
						    GetZombieVictimID[ZombieID[npcid]] = INVALID_PLAYER_ID;
                            RNPC_SetKeys(0);
	                        if(Distance2D(x,y,followPos[0], followPos[1]) < 20) {
                                MoveRNPC(ZombieID[npcid], singleFollowPos[0]+float(Random(-10,10)), singleFollowPos[1]+float(Random(-10,10)), singleFollowPos[2], RNPC_SPEED_SPRINT, 0);
                            } else {
                                MoveRNPC(ZombieID[npcid], singleFollowPos[0]+float(Random(-10,10)), singleFollowPos[1]+float(Random(-10,10)), singleFollowPos[2], RNPC_SPEED_SPRINT, 1);
							}
                        } else {
                            /*new pos = random(4);
                            if(pos == 0) { x = x + 100.0; }
                            else if(pos == 1) { x = x - 100.0; }
                            else if(pos == 2) { y = y + 100.0; }
	                        else if(pos == 3) { y = y - 100.0; }*/
                            x += float(Random(-500,500));
                            y += float(Random(-500,500));
                            if (x > 3000 || x < -3000) {
                                x = 0;
                            }
                            if (y > 3000 || y < -3000) {
                                y = 0;
                            }
							GetZombieVictimID[ZombieID[npcid]] = INVALID_PLAYER_ID;
                            RNPC_SetKeys(0);
                            MoveRNPC(ZombieID[npcid], x, y, z, RNPC_SPEED_WALK, 1);
                            //MoveRNPC(ZombieID[npcid], x, y, z, RNPC_SPEED_RUN, 1);
                        }
                    }
                } else {
                    SetRNPCHealth(ZombieID[npcid], -10);
                }
            }
        }
        return 1;
}


stock GetClosestToZombiePlayer(npcid) {

	/*if (ClosestToZombieCacheCounter[npcid] > 0) {
	    if (IsPlayerConnected(ClosestToZombieCachePlayerId[npcid])) {
	        return ClosestToZombieCachePlayerId[npcid];
	    } else {
	        ClosestToZombieCacheCounter[npcid] = 0;
	    }
	    ClosestToZombieCacheCounter[npcid]--;
	}*/

	new Float:dis,Float:dis2,player;
	player = INVALID_PLAYER_ID;
	dis = 99999.99;
	new Float:x, Float:y, Float:z;
    GetPlayerPos(npcid, x, y, z);
	for (new playerid=0;playerid<=GetPlayerPoolSize();playerid++)	{
		if(IsPlayerConnected(playerid) && !IsPlayerNPC(playerid) && PlayerInfo[playerid][pAdmin] < 3 && PlayerInfo[playerid][pVampire] == 0 &&
			PlayerInfo[playerid][pAlcoholPerk] == 0 && (GetPlayerState(playerid) == PLAYER_STATE_ONFOOT || GetPlayerState(playerid) == PLAYER_STATE_DRIVER || GetPlayerState(playerid) == PLAYER_STATE_PASSENGER) && PlayerInfo[playerid][pLevel] >= 3 &&
			playerSpawnTime[playerid]+5 < gettime() && ((ZOMBIE_PRESENT_MODE == 1 && GetAZombiePresent[playerid] <= 10) || ZOMBIE_PRESENT_MODE == 0) &&
			IsPlayerInRangeOfPoint(playerid, GetVictimDetectRange[playerid], x, y, z) && GetPlayerVirtualWorld(playerid) == 0 ) {
				dis2 = GetDistanceBetweenPlayers(playerid,npcid);
				if(dis2 < dis && dis2 != -1.00) {
					dis = dis2;
					player = playerid;
				}
		}
	}
	/*if (player != INVALID_PLAYER_ID) {
	ClosestToZombieCacheCounter[npcid] = 20;
	ClosestToZombieCachePlayerId[npcid] = player;
	} else {
	    ClosestToZombieCacheCounter[npcid] = 0;
		ClosestToZombieCachePlayerId[npcid] = INVALID_PLAYER_ID;
	}*/

	return player;
}

stock GetClosestToPlayerZombieNPCid(playerid) {
	new Float:dis,Float:dis2,zombieId;
	zombieId = INVALID_PLAYER_ID;
	dis = 99999.99;
	new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
	for(new npcid = 0; npcid < MAX_ZOMBIES; npcid++) {
    		if(IsPlayerConnected(ZombieID[npcid]) && ZombieID[npcid] != INVALID_PLAYER_ID && IsPlayerNPC(ZombieID[npcid]) && ZombieAttackTargetId[npcid] == INVALID_PLAYER_ID && GetPlayerSkin(ZombieID[npcid]) != ZOMBIE_SKIN_ANTI_CHEAT && GetPlayerSkin(ZombieID[npcid]) != ZOMBIE_SKIN_FUEL_FACTORY && zombieTargetsCounter[playerid] < 10) {
				dis2 = GetDistanceBetweenPlayers(playerid,ZombieID[npcid]);
				if(dis2 < dis && dis2 != -1.00) {
					dis = dis2;
					zombieId = npcid;
				}
		}
	}
	return zombieId;
}

stock GetClosestToZombieCheater(npcid) {
	new Float:dis,Float:dis2,player;
	player = INVALID_PLAYER_ID;
	dis = 99999.99;
	new Float:x, Float:y, Float:z;
    GetPlayerPos(npcid, x, y, z);
	for (new playerid=0;playerid<=GetPlayerPoolSize();playerid++)	{
		if(IsPlayerConnected(playerid) && !IsPlayerNPC(playerid) && PlayerInfo[playerid][pCheatCounter] >= 1000 && PlayerInfo[playerid][pVampire] == 0 &&
			GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && PlayerInfo[playerid][pAdmin] < 3 &&
			playerSpawnTime[playerid]+5 < gettime()) {
				dis2 = GetDistanceBetweenPlayers(playerid,npcid);
				if(dis2 < dis && dis2 != -1.00) {
					dis = dis2;
					player = playerid;
				}
		}
	}
	return player;
}




/*stock GetZombieVictim(npcid) {
		new playerid = GetClosestPlayer(npcid);
		if (platerid != INVALID_PLAYER_ID) {
        //for(new playerid=0; playerid <= GetPlayerPoolSize(); playerid++) {
            if(!IsPlayerNPC(playerid) && IsPlayerConnected(playerid) && PlayerInfo[playerid][pAdmin] < 3 && PlayerInfo[playerid][pVampire] == 0 && PlayerInfo[playerid][pAlcoholPerk] == 0) {
                new Float:x, Float:y, Float:z;
                GetPlayerPos(npcid, x, y, z);
                if(IsPlayerInRangeOfPoint(playerid, GetVictimDetectRange[playerid], x, y, z) && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && GetPlayerInterior(playerid) == 0 && GetPlayerVirtualWorld(playerid) == 0) return playerid;
            }
        }
        return INVALID_PLAYER_ID;
}*/
public OnRNPCDeath(npcid, killerid, reason) {
	if (reason != 53) {
	    SendDeathMessage(killerid, npcid, reason);
    	//ApplyAnimation(npcid, "PED", "BIKE_fall_off", 4.1, 0, 1, 1, 1, 0, 1);
	}
	/*if (IsPlayerInRangeOfPoint(npcid, 100, 702.8103, -113.6644, 19.9949)) {

	}*/
	if(killerid != INVALID_PLAYER_ID) {
		PlayerInfo[killerid][zombieKilled]++;

		GetVictimDetectRange[killerid] = (ZOMBIE_DETECT * 10);
	    GetVictimTimerStatus[killerid] = 1;
    	GetVictimResetTimer[killerid] = SetTimerEx("ResetDetectRange", 120000, false, "i", killerid);

	//if (reason == 49) {
		/*new killerVeh = GetPlayerVehicleID(killerid);
		if (killerVeh > 0) {
		    checkVehHealthTime[killerVeh] = gettime();
		    new Float:carHealth;
			GetVehicleHealth(killerVeh,carHealth);
			carHealth -= 50;
			VipCar[VipCarFastId[killerVeh]][VehHealth] = carHealth;
			vehRepairDistance[killerVeh] -= 150.0;
		    vehWheelsDistance[killerVeh] = 150.0;
		    checkVehHealth[killerVeh] = carHealth;
			prevVehHealth[killerVeh] = carHealth;
			SetVehicleHealth(killerVeh, carHealth);
		}
		*/
		new Float:zHealth = GetRNPCHealth(npcid);
		printf("[debug] KILL ZOMBIE ID:%d | Health:%f | killerID: %d | reason: %d",npcid, zHealth, killerid, reason);

		if (PlayerInfo[killerid][pVampire] == 1) {
			PlayerInfo[killerid][lastShotTime] = gettime();
	        printf("[Server] Kill Player %s [%d] - Infect player kill zombie!",PlayerInfo[killerid][dbName],killerid);
            trueKill[killerid] = 1;
            playerSpawnCheat[killerid] = 0;
            DropAllPlayerLootAndKill(killerid);
	        SetPlayerHealthAC(killerid, -1000.0);
			PlayerInfo[killerid][pHP] = -1000;
			PlayerHealth[killerid] = -1000.0;
		}

		if (isPlayerAtRedZone(killerid,true)) {
			//zombie at red zone
			new zombieWeapons[] = {0,0,0};
			new zombieWeaponsRange[] = {0,0,0};
    	    if (zombieKillEmAll == 1) {
				zombieWeapons = {18,37,9};
				zombieWeaponsRange = {20,4,0};
			}

		    new attackNPCid = INVALID_PLAYER_ID;
		    for (new zzz=0; zzz<3; zzz++) {
			    attackNPCid = GetClosestToPlayerZombieNPCid(killerid);
			    if (attackNPCid != INVALID_PLAYER_ID) {
			        ZombieAttackTargetId[attackNPCid] = killerid;
			        zombieWeapon[attackNPCid] = zombieWeapons[zzz];
					zombieWeaponRange[attackNPCid] = zombieWeaponsRange[zzz];
			        printf("[DEBUG] ON NPC DEATH FOUND TARGET FOR ZOMBIE #%d | TARGET ID = %d | WEAPON: %s[RANGE:%d]",attackNPCid,killerid,GunNames[zombieWeapon[attackNPCid]],zombieWeaponRange[attackNPCid]);
			    }
			}
		}



	//}
	    if (reason != 53) {
	        new ZombiePresentMode = ZOMBIE_PRESENT_MODE;
			new Float:x1,Float:y1,Float:z1,Float:a1,dskin;
			zombieTargetsCounter[killerid]++;
			GetPlayerPos(npcid,x1,y1,z1);
			GetPlayerFacingAngle(npcid, a1);
			dskin = GetPlayerSkin(npcid);
			if (reason < 47 && PlayerInfo[killerid][pAlcoholPerk] == 0 && zombieDontDropLootTime < gettime() && ZombiePresentMode == 0) {
				/*if (dskin == ZOMBIE_SKIN1) {
				    if (random(3) == 1) {
						CreateItem(x1,y1,z1+0.5,108);
					}
					CreateItem(x1,y1,z1+0.5,18);
					if (random(2) == 1) {
					    CreateItem(x1,y1,z1+0.5,38);
					} else {
					    CreateItem(x1,y1,z1+0.5,42);
					}
					if (reason != 49 && PlayerInfo[killerid][pVampire] == 0 && PlayerInfo[killerid][pLevel] >= 3 && PlayerInfo[killerid][pAlcoholPerk] == 0 && GetPlayerState(killerid) == PLAYER_STATE_ONFOOT) {
						if (PlayerInfo[killerid][zombieKills24hEndTime] > gettime()) {
						    PlayerInfo[killerid][zombieKills24hCounter]++;
							if (PlayerInfo[killerid][zombieKills24hCounter] < 30) {
							    new msgStr[100];
							    format(msgStr,sizeof(msgStr),"Убито %d/30 зараженных. Времени осталось %s",PlayerInfo[killerid][zombieKills24hCounter], Convert(PlayerInfo[killerid][zombieKills24hEndTime] - gettime()));
								SendClientMessage(killerid, COLOR_LIGHTRED, msgStr);
							} else {
							    PlayerInfo[killerid][zombieKills24hEndTime] = 0;
							    PlayerInfo[killerid][zombieKills24hCounter] = 0;
							    for (new z=0;z<50;z++) {
					                PlayerInfo[killerid][pExp]++;
					    			checkPlayerLevel(killerid);
								}
								addPlayerAchieve(killerid,21);
	                            SendClientMessage(killerid, COLOR_LIGHTRED, "НЛО выдало тебе дополнительный опыт!");
							}
						} else {
						    PlayerInfo[killerid][zombieKills24hEndTime] = gettime()+60*60*24;
						    PlayerInfo[killerid][zombieKills24hCounter] = 1;
						    SendClientMessage(killerid, COLOR_LIGHTRED, "Убей 30 топовых зараженных за 24 часа и получи дополнительный опыт! Один уже есть! Время пошло!");
						}
					}
				} else if (dskin == ZOMBIE_SKIN2 && random(4) == 2) {
				    //CreateItem(x1,y1,z1+0.5,108);
	            } else if (dskin == ZOMBIE_SKIN2 && random(6) == 1) {
	                CreateItem(x1,y1,z1+0.5,38);
				} else {
				    CreateItem(x1,y1,z1+0.5,11);
				}*/
				if (random(5) == 1) {
					CreateItem(x1,y1,z1+0.5,11); //сырое мясо
				} else if (random(5) == 1) {
					CreateItem(x1,y1,z1+0.5,61); //голова врага
				} else if (random(75) == 25) {
				    CreateItem(x1,y1,z1+0.5,86); //рука ученого
				}

				if (dskin == ZOMBIE_SKIN_FUEL_FACTORY &&
					PlayerInfo[killerid][pAdmin] < 3 &&
					PlayerInfo[killerid][pVampire] == 0 &&
					PlayerInfo[killerid][pAlcoholPerk] == 0 &&
					GetPlayerState(killerid) == PLAYER_STATE_ONFOOT &&
					PlayerInfo[killerid][pLevel] >= 3 &&
					GetPlayerVirtualWorld(killerid) == 0 &&
					IsPlayerInRangeOfPoint(killerid,125,ZombieSpawnFuelFactory[0], ZombieSpawnFuelFactory[1], ZombieSpawnFuelFactory[2])
					) {
					    FuelFactoryZombieKillCounter[killerid]++;

				    	new playerInfo[7];
				        format(playerInfo,sizeof(playerInfo),"%d/10",FuelFactoryZombieKillCounter[killerid]);
				        GameTextForPlayer(killerid, playerInfo, 3000, 6);

					    if (FuelFactoryZombieKillCounter[killerid] >= 10) {
					        CreateItem(x1,y1,z1+0.5,129); //карта доступа
					        FuelFactoryZombieKillCounter[killerid] = 0;
					    }
				}




			}
			if (ZombiePresentMode == 1) {
	            MeChat(npcid,"Ну вот за что ты так со мной?");
			}

			Actor[actorCounter] = CreateActor(dskin, x1,y1,z1,a1);
			SetActorInvulnerable(Actor[actorCounter], false);
			SetActorHealth(Actor[actorCounter], 0.0);
			SetTimerEx("removeActor", 150000, 0, "i", Actor[actorCounter]);
			actorCounter++;
			if (actorCounter >= 980) {
			    actorCounter = 0;
			}
		}
	}
	RespawnRNPC(npcid);
    return 1;
}


forward ResetDetectRange(playerid);
public ResetDetectRange(playerid)
{
    if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_DUCK)
        {
                GetVictimDetectRange[playerid] = (ZOMBIE_DETECT / 2);
                GetVictimTimerStatus[playerid] = 1;
                GetVictimResetTimer[playerid] = SetTimerEx("ResetDetectRange", 5000, false, "i", playerid);
                return 1;
        }

    GetVictimTimerStatus[playerid] = 0;
    GetVictimDetectRange[playerid] = ZOMBIE_DETECT;
    return 1;
}

forward moveZombieToSpawnPoint(playerid);
public moveZombieToSpawnPoint(playerid) {
	if (ZombieSpawnTime > 0) {
	    ZombieSpawnTime = 0;
	    /*new spawn = random(sizeof(ZombieSpawns));
	    PrevPlayerPos[playerid][PrevPX] = ZombieSpawns[spawn][0];
		PrevPlayerPos[playerid][PrevPY] = ZombieSpawns[spawn][1];
		PrevPlayerPos[playerid][PrevPZ] = ZombieSpawns[spawn][2];
	    PrevPlayerPos1s[playerid][PrevPX] = ZombieSpawns[spawn][0];
		PrevPlayerPos1s[playerid][PrevPY] = ZombieSpawns[spawn][1];
		PrevPlayerPos1s[playerid][PrevPZ] = ZombieSpawns[spawn][2];
		SetPlayerPos(playerid, ZombieSpawns[spawn][0], ZombieSpawns[spawn][1], ZombieSpawns[spawn][2]);
	    printf("[Server] Move ZOMBIE ID:%d to %f-%f-%f",nowZombieConnectID,ZombieSpawns[spawn][0], ZombieSpawns[spawn][1], ZombieSpawns[spawn][2]);*/
	    //RespawnRNPC(playerid);
	    SetRNPCHealth(playerid, 0);
	    printf("[Server] moveZombieToSpawnPoint ZOMBIE ID:%d",playerid);
  	}
	return 1;
}

forward killZombie(playerid,zid);
public killZombie(playerid,zid) {
    SetRNPCHealth(playerid, 0);
    if (GetPlayerSkin(playerid) != ZOMBIE_SKIN_FUEL_FACTORY) {
	    zombieWeapon[zid] = 0;
    	zombieWeaponRange[zid] = 0;
    }
    printf("[Server] killZombie PlayeyID:%d | ZombieID:%d",playerid,zid);
	return 1;
}

forward killAllZombies();
public killAllZombies() {
    new testname[MAX_PLAYER_NAME];
    new zombieConter = 0;
    ZombieNearFlag = 0;
    for(new npcid = 0; npcid < MAX_ZOMBIES; npcid++) {
    	ZombieID[npcid] = INVALID_PLAYER_ID;
    	ZombieAttackTargetId[npcid] = INVALID_PLAYER_ID;
	}
	for(new i=0; i <= GetPlayerPoolSize(); i++) {
	    if (IsPlayerConnected(i) && IsPlayerNPC(i)) {
		    GetPlayerName(i, testname, MAX_PLAYER_NAME);
		    if (strfind(testname, "ToxicMan", true) >= 0 ) {
	            ZombieID[zombieConter] = i;
	            zombieConter++;
	            //printf("[Server] ZombieID[%d] = %d",zombieConter,i);
			}
		}
	}
	new spawnDelay = 500;
	for(new npcid = 0; npcid < MAX_ZOMBIES; npcid++) {
	    if (ZombieID[npcid] != INVALID_PLAYER_ID) {
			//SetRNPCHealth(ZombieID[npcid],0);
		   SetTimerEx("killZombie", spawnDelay, 0, "ii", ZombieID[npcid],npcid);
		   spawnDelay += 1000;
		}
	}
	printf("[Server] Kill all Zombies !");
	return 1;
}
forward moveAllZombiesTo(playerid);
public moveAllZombiesTo(playerid) {
    new testname[MAX_PLAYER_NAME];
    new zombieConter = 0;
    for(new npcid = 0; npcid < MAX_ZOMBIES; npcid++) {
    	ZombieID[npcid] = INVALID_PLAYER_ID;
	}
	for(new i=0; i <= GetPlayerPoolSize(); i++) {
	    if (IsPlayerConnected(i) && IsPlayerNPC(i)) {
		    GetPlayerName(i, testname, MAX_PLAYER_NAME);
		    if (strfind(testname, "ToxicMan", true) >= 0 ) {
	            ZombieID[zombieConter] = i;
	            zombieConter++;
	            //printf("[Server] ZombieID[%d] = %d",zombieConter,i);
			}
		}
	}
	new Float:x,Float:y,Float:z;
	GetPlayerPos(playerid,x,y,z);
	ZombieNearPos[0] = x+25.0;
	ZombieNearPos[1] = y;
	ZombieNearPos[2] = z;
	ZombieNearFlag = 1;
	for(new npcid = 0; npcid < MAX_ZOMBIES; npcid++) {
	    if (ZombieID[npcid] != INVALID_PLAYER_ID) {
	        //SetPlayerPos(ZombieID[npcid],x,y,z);
	        SetRNPCHealth(ZombieID[npcid], 0);
	        //MoveRNPC(ZombieID[npcid], x+50.0, y, z, 500, 1);
		}
	}
	SetTimer("ZombieNearFlagOff", 10000, false);
	printf("[Server] Move all Zombies !");
	return 1;
}

forward moveWeakZombiesTo(playerid);
public moveWeakZombiesTo(playerid) {
    new testname[MAX_PLAYER_NAME];
    new zombieConter = 0;
    for(new npcid = 0; npcid < MAX_ZOMBIES; npcid++) {
    	ZombieID[npcid] = INVALID_PLAYER_ID;
	}
	for(new i=0; i <= GetPlayerPoolSize(); i++) {
	    if (IsPlayerConnected(i) && IsPlayerNPC(i)) {
		    GetPlayerName(i, testname, MAX_PLAYER_NAME);
		    if (strfind(testname, "ToxicMan", true) >= 0 ) {
	            ZombieID[zombieConter] = i;
	            zombieConter++;
	            //printf("[Server] ZombieID[%d] = %d",zombieConter,i);
			}
		}
	}
	new Float:x,Float:y,Float:z;
	GetPlayerPos(playerid,x,y,z);
	ZombieNearPos[0] = x+25.0;
	ZombieNearPos[1] = y;
	ZombieNearPos[2] = z;
	ZombieNearFlag = 1;
	for(new npcid = 0; npcid < MAX_ZOMBIES; npcid++) {
	    if (ZombieID[npcid] != INVALID_PLAYER_ID && GetPlayerSkin(ZombieID[npcid]) == ZOMBIE_SKIN ) {
	        //SetPlayerPos(ZombieID[npcid],x,y,z);
	        SetRNPCHealth(ZombieID[npcid], 0);
	        //MoveRNPC(ZombieID[npcid], x+50.0, y, z, 500, 1);
		}
	}
	SetTimer("ZombieNearFlagOff", 10000, false);
	printf("[Server] Move all Zombies !");
	return 1;
}

forward moveStrongZombiesTo(playerid);
public moveStrongZombiesTo(playerid) {
    new testname[MAX_PLAYER_NAME];
    new zombieWeapons[] = {16,18,0,0};
	new zombieWeaponsRange[] = {20,20,0,0};
    new zombieConter = 0;
    for(new npcid = 0; npcid < MAX_ZOMBIES; npcid++) {
    	ZombieID[npcid] = INVALID_PLAYER_ID;
	}
	for(new i=0; i <= GetPlayerPoolSize(); i++) {
	    if (IsPlayerConnected(i) && IsPlayerNPC(i)) {
		    GetPlayerName(i, testname, MAX_PLAYER_NAME);
		    if (strfind(testname, "ToxicMan", true) >= 0 ) {
	            ZombieID[zombieConter] = i;
	            zombieConter++;
	            //printf("[Server] ZombieID[%d] = %d",zombieConter,i);
			}
		}
	}
	new Float:x,Float:y,Float:z;
	GetPlayerPos(playerid,x,y,z);
	ZombieNearPos[0] = x+25.0;
	ZombieNearPos[1] = y;
	ZombieNearPos[2] = z;
	ZombieNearFlag = 1;
	for(new npcid = 0; npcid < MAX_ZOMBIES; npcid++) {
	    if (ZombieID[npcid] != INVALID_PLAYER_ID && GetPlayerSkin(ZombieID[npcid]) == ZOMBIE_SKIN1 ) {
	        //SetPlayerPos(ZombieID[npcid],x,y,z);
	        new zWeapon = random(sizeof(zombieWeapons));
	        zombieWeapon[npcid] = zombieWeapons[zWeapon];
	        zombieWeaponRange[npcid] = zombieWeaponsRange[zWeapon];
	        SetRNPCHealth(ZombieID[npcid], 0);
	        //MoveRNPC(ZombieID[npcid], x+50.0, y, z, 500, 1);
		}
	}
	SetTimer("ZombieNearFlagOff", 10000, false);
	printf("[Server] Move all Zombies !");
	return 1;
}

forward move3ZombiesTo(playerid);
public move3ZombiesTo(playerid) {
    new testname[MAX_PLAYER_NAME];
    new zombieConter = 0;
    for(new npcid = 0; npcid < MAX_ZOMBIES; npcid++) {
    	ZombieID[npcid] = INVALID_PLAYER_ID;
	}
	for(new i=0; i <= GetPlayerPoolSize(); i++) {
	    if (IsPlayerConnected(i) && IsPlayerNPC(i)) {
		    GetPlayerName(i, testname, MAX_PLAYER_NAME);
		    if (strfind(testname, "ToxicMan", true) >= 0 ) {
	            ZombieID[zombieConter] = i;
	            zombieConter++;
	            //printf("[Server] ZombieID[%d] = %d",zombieConter,i);
			}
		}
	}
	new Float:x,Float:y,Float:z;
	GetPlayerPos(playerid,x,y,z);
	ZombieNearPos[0] = x+20.0;
	ZombieNearPos[1] = y;
	ZombieNearPos[2] = z;
	ZombieNearFlag = 1;
	new ZombieIDs[5][3] = {
	    {0,5,6},
	    {1,7,8},
	    {2,9,10},
	    {3,11,12},
	    {4,13,14}
	};

	zombieWeapon[ZombieID[ZombieIDs[move3ZombiesToCounter][0]]] = 18;
    zombieWeaponRange[ZombieID[ZombieIDs[move3ZombiesToCounter][0]]] = 20;
    zombieWeapon[ZombieID[ZombieIDs[move3ZombiesToCounter][1]]] = 16;
    zombieWeaponRange[ZombieID[ZombieIDs[move3ZombiesToCounter][1]]] = 20;
    zombieWeapon[ZombieID[ZombieIDs[move3ZombiesToCounter][2]]] = 0;
    zombieWeaponRange[ZombieID[ZombieIDs[move3ZombiesToCounter][2]]] = 0;

	for (new zID=0; zID<3; zID++) {
		if (IsPlayerConnected(ZombieID[ZombieIDs[move3ZombiesToCounter][zID]]) && ZombieID[ZombieIDs[move3ZombiesToCounter][zID]] != INVALID_PLAYER_ID) {
	        SetRNPCHealth(ZombieID[ZombieIDs[move3ZombiesToCounter][zID]], 0);
	        ZombieAttackTargetId[ZombieID[ZombieIDs[move3ZombiesToCounter][zID]]] = playerid;
	        SetTimerEx("killZombie", 120000, 0, "ii", ZombieID[ZombieIDs[move3ZombiesToCounter][zID]], ZombieIDs[move3ZombiesToCounter][zID]);
		}
	}
	move3ZombiesToCounter++;
	if (move3ZombiesToCounter > 4) {
	    move3ZombiesToCounter = 0;
	}
	SetTimer("ZombieNearFlagOff", 2000, false);
	printf("[Server] Move 3 Zombies !");
	return 1;
}

forward moveAntiCheatZombiesTo(playerid);
public moveAntiCheatZombiesTo(playerid) {
    new testname[MAX_PLAYER_NAME];
    new zombieConter = 0;
    new anticheatZombieIDs[5];
    new anticheatZCounter = 0;
    for(new npcid = 0; npcid < MAX_ZOMBIES; npcid++) {
    	ZombieID[npcid] = INVALID_PLAYER_ID;
	}
	for(new npcid = 0; npcid < sizeof(anticheatZombieIDs); npcid++) {
    	anticheatZombieIDs[npcid] = INVALID_PLAYER_ID;
	}
	for(new i=0; i <= GetPlayerPoolSize(); i++) {
	    if (IsPlayerConnected(i) && IsPlayerNPC(i)) {
		    GetPlayerName(i, testname, MAX_PLAYER_NAME);
		    if (strfind(testname, "ToxicMan", true) >= 0 ) {
	            ZombieID[zombieConter] = i;
	            if (GetPlayerSkin(ZombieID[zombieConter]) == ZOMBIE_SKIN_ANTI_CHEAT) {
	                anticheatZombieIDs[anticheatZCounter] = ZombieID[zombieConter];
	                anticheatZCounter++;
	            }
	            zombieConter++;
	            //printf("[Server] ZombieID[%d] = %d",zombieConter,i);
			}
		}
	}
	new Float:x,Float:y,Float:z;
	GetPlayerPos(playerid,x,y,z);
	ZombieNearPos[0] = x+100.0;
	ZombieNearPos[1] = y+100.0;
	ZombieNearPos[2] = z;
	ZombieNearFlag = 1;
	for (new zID=0; zID<sizeof(anticheatZombieIDs); zID++) {
		if (IsPlayerConnected(anticheatZombieIDs[zID]) && anticheatZombieIDs[zID] != INVALID_PLAYER_ID) {
	        SetRNPCHealth(anticheatZombieIDs[zID], 0);
		}
	}
	SetTimer("ZombieNearFlagOff", 10000, false);
	printf("[Server] Move AntiCheat Zombies !");
	return 1;
}

forward ZombieNearFlagOff();
public ZombieNearFlagOff() {
    ZombieNearFlag = 0;
    return 1;
}
forward TurnOnZombieProtect(playerid);
public TurnOnZombieProtect(playerid) {
	if (playerZombieDefenceOff[playerid] == 0) {
		PlayerInfo[playerid][pAlcoholPerk] = 1;
		MeChat(playerid,"уверен, что зараженные не замечают его!");
	}
	playerZombieDefenceOff[playerid] = 1;
	MoveDynamicObject(zombieBaseGate,689.0793, -141.7743, 21.5421,5.0);
	return 1;
}
