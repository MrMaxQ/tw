public OnVehicleDeath(vehicleid, killerid) {
	new i = VipCarFastId[vehicleid];
	GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
    /*new whileTry = 0;
	VipCar[i][PlZ] = 0.0;
    while (whileTry < 5 && (VipCar[i][PlZ] < 3.0 || VipCar[i][PlZ] > 50.0)) {
        VipCar[i][PlX] = floatround(Random(-150,800));
        VipCar[i][PlY] = floatround(Random(680,2550));
        VipCar[i][PlZ] = GetPointZPos(VipCar[i][PlX], VipCar[i][PlY]);
        whileTry++;
        if (whileTry >= 5) {
            break;
        }
    }
    if (whileTry >= 5) {
        VipCar[i][PlX] = floatround(Random(-20,20));
		VipCar[i][PlY] = floatround(Random(-20,20));
		VipCar[i][PlZ] = floatround(Random(4,10));
	}*/
	if(engine) {
		if (VipCar[i][superLock] == 0) {
		    vehRepairDistance[vehicleid] = 10000.0;
		    vehWheelsDistance[vehicleid] = 10000.0;
		    checkVehHealth[vehicleid] = 400.0;
			prevVehHealth[vehicleid] = 400.0;
			SetVehicleHealth(vehicleid, 400.0);
		} else if (VipCar[i][superLock] == 2) {
	   	    vehRepairDistance[vehicleid] = 0.0;
		    vehWheelsDistance[vehicleid] = 0.0;
		    checkVehHealth[vehicleid] = 1000.0;
			prevVehHealth[vehicleid] = 1000.0;
			SetVehicleHealth(vehicleid, 1000.0);
		}
	    if (VipCar[i][superLock] != 2) {
		    Fuell[vehicleid] = 0.0;
	    	VipCar[i][VehFuel] = 0.0;
		} else {
		    Fuell[vehicleid] = SetVehicleFuelValue(vehicleid);
	    	VipCar[i][VehFuel] = SetVehicleFuelValue(vehicleid);
		}
		if (VipCar[i][superLock] != 2) {
			if (GetVehicleModel(vehicleid) == 578) {
			    new DFTspaenId = random(sizeof(DTFspawnPoints));
				VipCar[i][SX] = DTFspawnPoints[DFTspaenId][0];
				VipCar[i][SY] = DTFspawnPoints[DFTspaenId][1];
				VipCar[i][SZ] = DTFspawnPoints[DFTspaenId][2];
				VipCar[i][PlX] = VipCar[i][SX];
				VipCar[i][PlY] = VipCar[i][SY];
				VipCar[i][PlZ] = VipCar[i][SZ];
			} else {
				VipCar[i][PlX] = VipCar[i][SX];
				VipCar[i][PlY] = VipCar[i][SY];
				VipCar[i][PlZ] = VipCar[i][SZ];
			}
			VipCar[i][PlA] = VipCar[i][SA];
		}
	}
	ReLoadVipCar(VipCarFastId[vehicleid]);
	printf("[DEBUG] RELOAD CAR #15");
	printf("[ CAR ]  OnVehicleDeath Reload Car#%d",VipCarFastId[vehicleid]);
	return 1;
}


forward UpdateSpeedometr(playerid);
public UpdateSpeedometr(playerid) {
	if (playerid == INVALID_PLAYER_ID || IsPlayerNPC(playerid)) {
	    KillTimer(STimer[playerid]);
	}
    if (playerid != INVALID_PLAYER_ID && IsPlayerConnected(playerid) && gPlayerLogged[playerid] == 1 && !IsPlayerNPC(playerid)) {
		new vehicleid = GetPlayerVehicleID(playerid);

    	if(vehicleid > 0 && VipCarFastId[vehicleid] >= 0) {
    	    new playerState = GetPlayerState(playerid);
	        /*if (playerState==PLAYER_STATE_PASSENGER) {
	        //if ((playerSpawnTime[playerid]+2) < gettime()) {
		        new Float:nowPlayerInVehPos[3];
	            GetPlayerPos(playerid, nowPlayerInVehPos[0],nowPlayerInVehPos[1],nowPlayerInVehPos[2]);
				new Float:playerInCarCheckDist = Distance2D(nowPlayerInVehPos[0], nowPlayerInVehPos[1],prevPlayerInVehPos[playerid][0], prevPlayerInVehPos[playerid][1]);
		        if (prevPlayerInVehPos[playerid][0] != 0.0) {
		            if ( playerInCarCheckDist > 55.0 && PlayerInfo[playerid][pAdmin] < 100) {
			            prevPlayerInVehPosCounter[playerid]++;
			            if (prevPlayerInVehPosCounter[playerid] > 2) {
			                printf("( ! ) RELOAD CAR#%d - 2DPDist = %f (now: %f,%f | old: %f,%f)",VipCarFastId[vehicleid],playerInCarCheckDist,nowPlayerInVehPos[0], nowPlayerInVehPos[1],prevPlayerInVehPos[playerid][0], prevPlayerInVehPos[playerid][1]);
			                new errorStr[100];
			                format(errorStr,sizeof(errorStr),"( ! ) FAST PL IN UPD SPD %s[%d]!" ,PlayerInfo[playerid][dbName],playerid);
							ABroadCast(COLOR_LIGHTRED,errorStr,1);
							SendClientMessage(playerid, COLOR_LIGHTRED, "Вы были кикнуты по подозрению в читерстве. (Код ошибки: 184) (FPCM)");
						    SendClientMessage(playerid, COLOR_LIGHTRED, "Удалите чит программу, чтобы продолжить игру на сервере");
							kickPlayer(playerid);
			            }
					}
				}
				prevPlayerInVehPos[playerid][0]= nowPlayerInVehPos[0];
		        prevPlayerInVehPos[playerid][1]= nowPlayerInVehPos[1];
		        prevPlayerInVehPos[playerid][2]= nowPlayerInVehPos[2];
			}*/

			new Float:nowVehPos[3];
			GetVehiclePos(vehicleid, nowVehPos[0],nowVehPos[1],nowVehPos[2]);

			GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);

			/*if (vehicleid == Train && PlayerInfo[playerid][pAdmin] < 100 && playerState == PLAYER_STATE_DRIVER) {
			    RemovePlayerFromVehicleRich(playerid);
			    SetVehicleParamsEx(vehicleid,VEHICLE_PARAMS_OFF,lights,alarm,doors,bonnet,boot,objective);
			}*/
			new Float:carCheckDist = Distance2D(nowVehPos[0], nowVehPos[1],prevVehPos[vehicleid][0], prevVehPos[vehicleid][1]);

			if (prevVehPos[vehicleid][0] != 0.0/* && PlayerInfoTime[playerid] >= gettime()*/ && ((ReklamaTime+3) < gettime() && nowOnline <= 3)) {
			    //if (GetDistanceBetweenPoints(nowVehPos[0], nowVehPos[1], nowVehPos[2],prevVehPos[vehicleid][0], prevVehPos[vehicleid][1], prevVehPos[vehicleid][2]) > 100.0) {
			    if (((carCheckDist > 25.0 && VipCar[VipCarFastId[vehicleid]][Boost] == 0 && PlayerInfo[playerid][pAdmin] < 100) || (carCheckDist > 55.0 && VipCar[VipCarFastId[vehicleid]][Boost] > 0)) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER && PlayerInfo[playerid][pAdmin] < 100 /*&& IsLocked[vehicleid] == 0*/) {
			        prevVehPosCounter[playerid]++;
			        if (prevVehPosCounter[playerid] > 3) {
				        printf("( ! ) RELOAD CAR#%d - 2DDist = %f (now: %f,%f | old: %f,%f)",VipCarFastId[vehicleid],carCheckDist,nowVehPos[0], nowVehPos[1],prevVehPos[vehicleid][0], prevVehPos[vehicleid][1]);
				        RemovePlayerFromVehicleRich(playerid);
				        LockCar(vehicleid);
						IsLocked[vehicleid] = 1;
				        SetTimerEx("ReLoadVipCar", 5000, 0, "i", VipCarFastId[vehicleid]);
				        printf("[DEBUG] RELOAD CAR #16");
				        //ReLoadVipCar(VipCarFastId[vehicleid]);
				        PlayerInfoTime[playerid] = gettime() - 1;
						new errorStr[100];
				     	format(errorStr,sizeof(errorStr),"( ! ) FAST CAR %s[%d]! CAR RELOADED!",PlayerInfo[playerid][dbName],playerid);
						ABroadCast(COLOR_LIGHTRED,errorStr,1);
                        PlayerInfo[playerid][pCheatCounter]+=20;
					    SendClientMessage(playerid, COLOR_LIGHTRED, "Вы были кикнуты по подозрению в читерстве. (Код ошибки: 183) (FCM)");
					    SendClientMessage(playerid, COLOR_LIGHTRED, "Удалите чит программу, чтобы продолжить игру на сервере");
						kickPlayer(playerid);
					}
			    }
			}

  			prevVehPos[vehicleid][0] = nowVehPos[0];
	        prevVehPos[vehicleid][1] = nowVehPos[1];
	        prevVehPos[vehicleid][2] = nowVehPos[2];




		    	new curVehSpeed;
		    	new Float:curVehSpeedF;
		    	new Float:ST[4];
		    	GetVehicleVelocity(vehicleid,ST[0],ST[1],ST[2]);
		    	curVehSpeed = floatround(floatsqroot(floatpower(floatabs(ST[0]), 2.0) + floatpower(floatabs(ST[1]), 2.0) + floatpower(floatabs(ST[2]), 2.0)) * 100.3);
		    	curVehSpeedF = floatround(floatsqroot(floatpower(floatabs(ST[0]), 2.0) + floatpower(floatabs(ST[1]), 2.0) + floatpower(floatabs(ST[2]), 2.0)) * 100.3);

	    	if (curVehSpeed > 5.0 && (Fuell[vehicleid] <=0 || !engine)) {
		        SetVehicleVelocity( vehicleid, 0.0, 0.0, 0.0 );
		        if (engineIsStopping[vehicleid] < gettime()) {
		            needRefreshCar[vehicleid]++;
		            if (needRefreshCar[vehicleid] >=15) {
		                needRefreshCar[vehicleid] = 0;
			        	new i = VipCarFastId[vehicleid];
				 		SetVehiclePos(vehicleid, VipCar[i][PlX],VipCar[i][PlY],VipCar[i][PlZ]);
					}
				}
		    }

            if (playerState == PLAYER_STATE_DRIVER) {
                if ((VipCar[VipCarFastId[vehicleid]][superLock] == 1 && VipCar[VipCarFastId[vehicleid]][carOwnerId] != MySQLPlayerID[playerid] && PlayerInfo[playerid][pAdmin] < 8) ||
					(VipCar[VipCarFastId[vehicleid]][superLock] == 2 && PlayerInfo[playerid][pLevel] > 15 && PlayerInfo[playerid][pAdmin] < 8) ||
					(VipCar[VipCarFastId[vehicleid]][superLock] == 4 && PlayerInfo[playerid][pAdmin] < 3)) {
					if (VipCar[VipCarFastId[vehicleid]][superLock] != 1 && VipCar[VipCarFastId[vehicleid]][superLock] != 3) {
		                RemovePlayerFromVehicleRich(playerid);
					}
		        	SetVehicleParamsEx(vehicleid,VEHICLE_PARAMS_OFF,lights,alarm,doors,bonnet,boot,objective);
	        	}

				new Float:carHealth;
			    GetVehicleHealth(vehicleid,carHealth);

			    new Float:spd[3], Float:hls;
			    GetVehicleVelocity( vehicleid, spd[0], spd[1], spd[2] );
	        	if( carHealth < BE_MIN_HLS || vehRepairDistance[vehicleid] > 9000) {
			        if( floatabs(spd[0]) > floatabs(spd[1])) {
			            if( floatabs(spd[ 0 ]) > BE_MAX_SPD ) {
			                hls = BE_MAX_SPD / floatabs(spd[ 0 ]);
			                SetVehicleVelocity( vehicleid, spd[0]*hls, spd[1]*hls, spd[2] );
			            }
			        } else {
			            if( floatabs(spd[ 1 ]) > BE_MAX_SPD ) {
			                hls = BE_MAX_SPD / floatabs(spd[ 1 ]);
			                SetVehicleVelocity( vehicleid, spd[0]*hls, spd[1]*hls, spd[2] );
			            }
			        }
				}
		        //printf("[VEL] %f %f %f", spd[0], spd[1], spd[2]);
			    checkVehHealthCounter[vehicleid] = checkVehHealthCounter[vehicleid]+1;
			    if (checkVehHealthCounter[vehicleid] >10) {
			        if (VipCar[VipCarFastId[vehicleid]][autoFix] == 1) {
					    checkVehHealth[vehicleid] = 1000;
						prevVehHealth[vehicleid] = 1000;
						SetVehicleHealth(vehicleid, 1000);
						new panelsx,doorsx,lightsx,tiresx;
						GetVehicleDamageStatus(vehicleid,panelsx,doorsx,lightsx,tiresx);
						UpdateVehicleDamageStatus(vehicleid, panelsx, doorsx, lightsx, 0);
						checkVehHealthTime[vehicleid] = gettime();
						vehRepairDistance[vehicleid] -=1000.0;
					    vehWheelsDistance[vehicleid] -=1000.0;
					 	RepairVehicle(vehicleid);
					}
		            if (checkVehHealth[vehicleid] > 255 && checkVehHealth[vehicleid] < carHealth && (checkVehHealthTime[vehicleid] - gettime()) < -3 && kickFlag[playerid] == 0 && !PlayerToPoint(35.0,playerid,1622.8246,-1808.5894,13.2991) && PlayerInfo[playerid][pAdmin] < 100 && PlayerInfo[playerid][pVIPtime] < gettime()) {
	                    //SendClientMessage(playerid,COLOR_LIGHTRED,"[UFO] Вы были кикнуты по подозрению в читерстве [Ремонт авто]");
						new string[100];
				 		new sendername[MAX_PLAYER_NAME];
						GetPlayerName(playerid, sendername, sizeof(sendername));
						format(string, 256, "( ! ) %s | CarRepair CAR#%d",sendername,VipCarFastId[vehicleid]);
						ABroadCast(COLOR_LIGHTRED,string,100);
						printf(string);
						/*SetVehicleHealth(vehicleid,255);
				        prevVehHealth[vehicleid] = 255;
				        checkVehHealth[vehicleid] = 255;*/
				        GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
						SetVehicleParamsEx(vehicleid,VEHICLE_PARAMS_OFF,lights,alarm,doors,bonnet,boot,objective);
						/*vehRepairDistance[vehicleid] =10000;
						vehWheelsDistance[vehicleid] =10000;*/
			        	zavodis[playerid] = 0;
			        	PlayerInfo[playerid][pCheatCounter]+=5;
			        	ReLoadVipCar(VipCarFastId[vehicleid]);
			        	printf("[DEBUG] RELOAD CAR #17");
			        	carRepairKickCounter[playerid]++;
			        	if (carRepairKickCounter[playerid] > 3) {
			        	    PlayerInfo[playerid][pCheatCounter]++;
			    			OnPlayerUpdateRLSauronRealSave(playerid);
						    SendClientMessage(playerid, COLOR_LIGHTRED, "НЛО выдает вам `желтую` карточку!");
	   						kickPlayer(playerid);
						}
		            }
		            if (PlayerInfoTime[playerid] >= gettime() && !IsPlayerInRangeOfPoint(playerid,120.0,-2315.0142, 1828.5471, 15.1451) && !IsPlayerInRangeOfPoint(playerid,460.0,3284.9004, -226.4004, 7.2000)) {
			            if (!IsAPlane(vehicleid)) {
			                new Float:nowZmax = GetPointZPos(nowVehPos[0], nowVehPos[1]);
			                new flyCheatFlag = 0;
			                if (spd[2] > -0.2) {
				                if (!PlayerToKvadrat(playerid, -3483.6650, 150.7067, -2850.5889, 709.7571) && !IsPlayerInRangeOfPoint(playerid,240.0,-237.7365, -3150.1836, 3.9903) /*&& !IsPlayerInRangeOfPoint(playerid,70.0,-140.0534, -2954.0635, -0.0350)*/ ) {
									if (!IsABoat(vehicleid) && nowZmax <=0.0 && nowVehPos[2] > 1.5) {
									    checkVehFlyCounter[playerid] = checkVehFlyCounter[playerid] + 2;
									    printf("( ! ) CAR#%d - Max Z = 0.0 now Z = %f |FlyCounter %d/5| %s[%d]",VipCarFastId[vehicleid],nowVehPos[2],checkVehFlyCounter[playerid],PlayerInfo[playerid][dbName],playerid);
									    flyCheatFlag = 1;
									} else if (nowVehPos[2]-nowZmax > 10.0) {
									    checkVehFlyCounter[playerid]++;
									    flyCheatFlag = 1;
									    printf("( ! ) CAR#%d - Max Z = %f now Z = %f |FlyCounter %d/5| %s[%d]",VipCarFastId[vehicleid],nowZmax,nowVehPos[2],checkVehFlyCounter[playerid],PlayerInfo[playerid][dbName],playerid);
									}
								}
							}
							if (nowVehPos[2]-nowZmax > 5.0) {
							    checkVehFlyCounterLongTime[playerid]++;
							    flyCheatFlag = 1;
							}
							if (flyCheatFlag == 1 && (checkVehFlyCounter[playerid] > 4 || checkVehFlyCounterLongTime[playerid] > 60)) {
								//checkVehFlyCounter[playerid] = 0;
								checkVehFlyCounterLongTime[playerid] = 0;
								MeChat(playerid,"уверен, что на авто нужно ездить по земле!");
								PlayerInfo[playerid][pCheatCounter]++;
				    			OnPlayerUpdateRLSauronRealSave(playerid);
							    SendClientMessage(playerid, COLOR_LIGHTRED, "НЛО выдает вам `желтую` карточку!");
				                RemovePlayerFromVehicleRich(playerid);
						        ReLoadVipCar(VipCarFastId[vehicleid]);
						        printf("[DEBUG] RELOAD CAR #18");
						        PlayerInfoTime[playerid] = gettime() - 1;
						        new string[200];
						        format(string,sizeof(string),"( ! ) %s[%d] подозренее на езду по воздуху!",PlayerInfo[playerid][dbName],playerid);
				    			ABroadCast(COLOR_LIGHTRED,string,1);
						        printf("( ! ) RELOAD CAR#%d - Max Z = 0.0 now Z = %f",VipCarFastId[vehicleid],nowVehPos[2]);
								if (checkVehFlyCounter[playerid] > 10) {
								    PlayerInfo[playerid][pCheatCounter]+=30;
								    checkVehFlyCounter[playerid] = 0;
							        kickPlayer(playerid);
								}
							}
			            }
					}
		            //printf("%f | %f | %d",checkVehHealth[vehicleid],carHealth,checkVehHealthTime[vehicleid] - gettime());
		            checkVehHealthCounter[vehicleid] = 0;
				}


			    if (curVehSpeed > 5.0 && !engine) {
			        SetVehicleVelocity( vehicleid, 0.0, 0.0, 0.0 );
			        new i = VipCarFastId[vehicleid];
				    if (vehicleid == VipCar[i][vehid] && ((!isHaveCarKey(playerid,i) && VipCar[i][isEgnitionLocked] > 0) || VipCar[i][carOwnerId] != MySQLPlayerID[playerid] || Fuell[vehicleid] < 0 || vehRepairDistance[vehicleid] > 9999)) {
				 		SetVehiclePos(vehicleid, VipCar[i][PlX],VipCar[i][PlY],VipCar[i][PlZ]);
					}
			    }

                if (VipCar[VipCarFastId[vehicleid]][autoFix] == 1 && Fuell[vehicleid] < 10.0) {
                    Fuell[vehicleid] = 15.0;
                }

		    	//sauron fuel - fix
			    if (Fuell[vehicleid] < 0 && engine && engineIsStopping[vehicleid] < gettime()) {
					if (!IsAPlane(vehicleid)) {
					    engineIsStopping[vehicleid] = gettime() + 2;
				        new i = VipCarFastId[vehicleid];
			        	new Float:vehx, Float:vehy, Float:vehz ,Float:veha;
				        GetVehiclePos(vehicleid, vehx, vehy, vehz);
				        GetVehicleZAngle(vehicleid, veha);
				        //if (VipCar[i][superLock] != 2) {
					        VipCar[i][PlX] = vehx;
			 				VipCar[i][PlY] = vehy;
					 		VipCar[i][PlZ] = vehz;
					 		VipCar[i][PlA] = veha;
						//}
				 		VipCar[i][ctime] = gettime();
				 		Fuell[vehicleid] = 0.0;
				 		VipCar[i][VehFuel] = 0.0;
				 		RemovePlayerFromVehicleRich(playerid);
				 		if (logs == 1) {
					 		printf("[ CAR ]  CAR#%d Prarked on 0 Fuel.",i);
						}
					}
					SetVehicleParamsEx(vehicleid,VEHICLE_PARAMS_OFF,lights,alarm,doors,bonnet,boot,objective);
		        	zavodis[playerid] = 0;
			    }

			    if (carHealth < 255 && engineIsStopping[vehicleid] < gettime()) {
			        SetVehicleHealth(vehicleid,255);
			        prevVehHealth[vehicleid] = 255;
			        checkVehHealth[vehicleid] = 255;
			        carHealth = 255;
			        new i = VipCarFastId[vehicleid];
		        	new Float:vehx, Float:vehy, Float:vehz ,Float:veha;
			        GetVehiclePos(vehicleid, vehx, vehy, vehz);
			        GetVehicleZAngle(vehicleid, veha);
			        engineIsStopping[vehicleid] = gettime() + 2;
			        //if (VipCar[i][superLock] != 2) {
				        VipCar[i][PlX] = vehx;
		 				VipCar[i][PlY] = vehy;
				 		VipCar[i][PlZ] = vehz;
				 		VipCar[i][PlA] = veha;
					//}
			 		VipCar[i][ctime] = gettime();
			 		if (logs == 1) {
				 		printf("[ CAR ]  CAR#%d Prarked on Engine Damage",i);
					}
					if ((checkVehHealthTime[vehicleid] - gettime()) < -3) { //zombie car attack
				 		RemovePlayerFromVehicleRich(playerid);
					}
		        	SetVehicleParamsEx(vehicleid,VEHICLE_PARAMS_OFF,lights,alarm,doors,bonnet,boot,objective);
					if (zavodis[playerid] != 0) {
			        	vehRepairDistance[vehicleid] +=1000;
			        	SendClientMessage(playerid, COLOR_PLAYERMSG, "Повреждение двигателя!");
					}
		        	zavodis[playerid] = 0;
			    } else if (carHealth > 1000) {
			        SetVehicleHealth(vehicleid,1000);
			        carHealth = 1000;
			        prevVehHealth[vehicleid] = 1000;
			        checkVehHealth[vehicleid] = 1000;
			    }

	  		    if (vehWheelsDistance[vehicleid] > 9999) {
	  		        new panelsx,doorsx,lightsx,tiresx;
				    GetVehicleDamageStatus(vehicleid,panelsx,doorsx,lightsx,tiresx);
				    if (tiresx == 0 || tiresx == 7 || tiresx == 11) {
						UpdateVehicleDamageStatus(vehicleid, panelsx, doorsx, lightsx, random(13));
	                }
	  		    }

	  		    if (vehRepairDistance[vehicleid] > 10000 && engine && engineIsStopping[vehicleid] < gettime()) {
				    new i = VipCarFastId[vehicleid];
		        	new Float:vehx, Float:vehy, Float:vehz ,Float:veha;
			        GetVehiclePos(vehicleid, vehx, vehy, vehz);
			        GetVehicleZAngle(vehicleid, veha);
			        engineIsStopping[vehicleid] = gettime() + 2;

			        if (VipCar[i][superLock] == 0) {
						VipCar[i][isEgnitionLocked] = 0;
					}
			        //if (VipCar[i][superLock] != 2) {
				        VipCar[i][PlX] = vehx;
		 				VipCar[i][PlY] = vehy;
				 		VipCar[i][PlZ] = vehz;
				 		VipCar[i][PlA] = veha;
					//}
			 		VipCar[i][ctime] = gettime();
			 		if ((checkVehHealthTime[vehicleid] - gettime()) < -3) { //zombie car attack
			 			RemovePlayerFromVehicleRich(playerid);
					}
			 		if (logs == 1) {
				 		printf("[ CAR ]  CAR#%d Prarked on Full Engine Damage",i);
					}
		        	SetVehicleParamsEx(vehicleid,VEHICLE_PARAMS_OFF,lights,alarm,doors,bonnet,boot,objective);
	               	//SendClientMessage(playerid, COLOR_LIGHTRED, "Двигатель полностью сломан! Замок выпал из авто!");
					SendClientMessage(playerid, COLOR_PLAYERMSG, "Двигатель сломался, отремонтируйте его, чтобы продолжить движение.");
		        	zavodis[playerid] = 0;
		        	vehRepairDistance[vehicleid] = 10000;
			    }

			    new carMaxSpeed = vehicleMaxSpeed(vehicleid);
                if (carMaxSpeed > 0 && curVehSpeed > carMaxSpeed && VipCarBooster[vehicleid] == 0) {
                    carSpeedCheatCounter[playerid]++;
                    if (carSpeedCheatCounter[playerid] > 10) {
	                    RemovePlayerFromVehicleRich(playerid);
    	                SetTimerEx("EngineOff", 100, 0, "i", VipCar[VipCarFastId[vehicleid]][vehid]);
    	                carSpeedCheatCounter[playerid] = 0;
        	            SendClientMessage(playerid, COLOR_LIGHTRED, "Выпрыгнул из авто от страха! Боится ехать так бысто!");
        	            carSpeedCheatDestroyCounter[playerid]++;
        	            if (carSpeedCheatDestroyCounter[playerid] > 4) {
        	                carSpeedCheatDestroyCounter[playerid] = 0;
        	                printf("[DEBUG] RELOAD CAR -> FAST MOVE");
        	                ReLoadVipCar(VipCarFastId[vehicleid]);
        	                printf("[DEBUG] RELOAD CAR #19");
        	            }
					}
                }

				if (curVehSpeed >= 140 && PlayerInfoTime[playerid] >= gettime()) {
				    if(!IsAPlane(vehicleid) && kickFlag[playerid] != 1 && PlayerInfo[playerid][pAdmin] < 100) {
				        if (curVehSpeed >= 140 && VipCarBooster[vehicleid] <= 1) {
					        //PlayerInfo[playerid][pWarns] += 1;
						    SendClientMessage(playerid, COLOR_LIGHTRED, "Вы были кикнуты по подозрению в читерстве. (Код ошибки: 001)");
						    SendClientMessage(playerid, COLOR_LIGHTRED, "Удалите чит программу, чтобы продолжить игру на сервере");
						    printf("[Server] kickPlayer - reason: speed cheat");
						    PlayerInfo[playerid][pCheatCounter]+=30;
						    RemovePlayerFromVehicleRich(playerid);
							kickPlayer(playerid);
						}
						if (curVehSpeed >= 235 && VipCarBooster[vehicleid] <= 2) {
					        //PlayerInfo[playerid][pWarns] += 1;
						    SendClientMessage(playerid, COLOR_LIGHTRED, "Вы были кикнуты по подозрению в читерстве. (Код ошибки: 002)");
						    SendClientMessage(playerid, COLOR_LIGHTRED, "Удалите чит программу, чтобы продолжить игру на сервере");
						    printf("[Server] kickPlayer - reason: speed cheat");
						    PlayerInfo[playerid][pCheatCounter]+=30;
						    RemovePlayerFromVehicleRich(playerid);
							kickPlayer(playerid);
						}
						if (curVehSpeed >= 335 && VipCarBooster[vehicleid] <= 3) {
					        //PlayerInfo[playerid][pWarns] += 1;
						    SendClientMessage(playerid, COLOR_LIGHTRED, "Вы были кикнуты по подозрению в читерстве. (Код ошибки: 003)");
						    SendClientMessage(playerid, COLOR_LIGHTRED, "Удалите чит программу, чтобы продолжить игру на сервере");
						    printf("[Server] kickPlayer - reason: speed cheat");
						    PlayerInfo[playerid][pCheatCounter]+=30;
						    RemovePlayerFromVehicleRich(playerid);
							kickPlayer(playerid);
						}
				    }
				}

			    new Float:carFuelGet = 0.0;
				new Float:vehWheelsDistanceKoef = 1.5;
			    new MaxFuel = SetVehicleFuelValue(vehicleid);
			    if (MaxFuel > 400) {
			        MaxFuel = 400;
			    }
			    if(!IsABike(vehicleid) && engine) {
			        if (curVehSpeed >0 ){
			            if(SuperGt(vehicleid)) {
			                carFuelGet = ST[2]/13;
			            } else {
				            carFuelGet = ST[2]/20;
						}
					    if (carFuelGet <= -0.0005) {
					        carFuelGet = -0.0005;
					    }
				        carFuelGet += 0.0007; //0.0005

				        if(isFourSeatCar(vehicleid)) {
			                carFuelGet += 0.0003;
					    }

						if(SuperGt(vehicleid)) {
			                carFuelGet += 0.003;
						} else if(MuscleCar(vehicleid)) {
			                carFuelGet += 0.002;
						} else if(ExtraCar(vehicleid) || IsABoat(vehicleid)) {
			                carFuelGet += 0.004;
			                //carFuelGet = carFuelGet*2;
						} else if (IsAMoto(vehicleid)) {
	                        carFuelGet = carFuelGet/1.5;
	                        vehWheelsDistanceKoef = 3.5;
						} else if (IsAPlane(vehicleid)) {
						    carFuelGet += 0.01;
			                carFuelGet = carFuelGet*2;
						}

						//carFuelGet += 0.00007*curVehSpeed;
						new Float:carFuelGetA = float( MaxFuel) / 2500000;
						carFuelGet += (0.00002+carFuelGetA)*curVehSpeedF;
						if (IsAPlane(vehicleid)) {
						    carFuelGet = carFuelGet/3;
						}
						if (GetVehicleModel(vehicleid) == 578) {
						    carFuelGet += 0.001;
						}

					    if (curVehSpeed > 75) {
						    carFuelGet += 0.001;
						}
						/*if (curVehSpeed > 140) {
						    carFuelGet = carFuelGet*2;
						}*/
						if (GetVehicleModel(vehicleid) == 462) {
						    carFuelGet = carFuelGet/2;
						}
						if (GetVehicleModel(vehicleid) == 554 && VipCar[VipCarFastId[vehicleid]][ExtraTuning] == 1) {
						    carFuelGet = carFuelGet*2;
						}
						if (MaxFuel > 200) {
						    carFuelGet = carFuelGet*2;
						}
						if (VipCar[VipCarFastId[vehicleid]][superLock] == 1 || VipCar[VipCarFastId[vehicleid]][superLock] == 3) {
						    carFuelGet = carFuelGet/2;
						}
						if (PlayerInfo[playerid][skillDamage] > 0) {
						    new Float:fuelSkill = (100 - float(PlayerInfo[playerid][skillDamage]*2))/100;
						    carFuelGet = carFuelGet * fuelSkill;
						}
						
				    	Fuell[vehicleid] -= carFuelGet;
						carFuelGet = carFuelGet*1000;
						format(str4, sizeof(str4),"~r~Eco:~w~ %.1f",carFuelGet);
					} else {
					    carFuelGet += 0.0002;
					    new Float:carFuelGetB = float( MaxFuel) / 200000;
					    carFuelGet = carFuelGet + carFuelGetB;
					    if(isFourSeatCar(vehicleid)) {
			                carFuelGet += 0.0001;
					    }
						if(SuperGt(vehicleid)) {
			                carFuelGet += 0.0002;
						} else if(MuscleCar(vehicleid)) {
			                carFuelGet += 0.0005;
						} else if(ExtraCar(vehicleid) || IsABoat(vehicleid)) {
			                carFuelGet += 0.0007;
						} else if (IsAPlane(vehicleid)) {
						    carFuelGet += 0.001;
						}
						if (MaxFuel > 200) {
						    carFuelGet = carFuelGet*2;
						}
						if (VipCar[VipCarFastId[vehicleid]][superLock] == 1 || VipCar[VipCarFastId[vehicleid]][superLock] == 3) {
						    carFuelGet = carFuelGet/2;
						}
						Fuell[vehicleid] -= carFuelGet;
						carFuelGet = carFuelGet*1000;
						format(str4, sizeof(str4),"~r~Eco:~w~ %.1f",carFuelGet);
					}
				} else {
				    format(str4, sizeof(str4),"");
				}



				if (carHealth >=1000) {
				    format(str6, sizeof(str6),"~g~100.0%s","%");
				} else if (carHealth >= 600 && carHealth < 1000) {
				    format(str6, sizeof(str6),"~y~0%.1f%s",carHealth/10,"%");
				} else if (carHealth >= 350 && carHealth < 600) {
				    format(str6, sizeof(str6),"~r~0%.1f%s",carHealth/10,"%");
				} else if (carHealth < 350) {
				    format(str6, sizeof(str6),"~r~000.1%s","%");
				}
				new spdstr[5];
				format(spdstr, sizeof(spdstr),"%d",curVehSpeed);
				//format(str1, sizeof(str1),"%d",curVehSpeed);
				format(str2, sizeof(str2),"~r~Fuel:~w~ %.1f",Fuell[vehicleid]);
				vehDistance[vehicleid] = vehDistance[vehicleid] + (0.00015*curVehSpeed);
				if (curVehSpeed <= 60) {
				    vehRepairDistance[vehicleid] += (0.0008*curVehSpeedF);
				    vehWheelsDistance[vehicleid] += (0.0012*curVehSpeedF)*vehWheelsDistanceKoef;
	            } else if (curVehSpeed > 60 && curVehSpeed <= 90) {
				    vehRepairDistance[vehicleid] += (0.001*curVehSpeedF);
				    vehWheelsDistance[vehicleid] += (0.0015*curVehSpeedF)*vehWheelsDistanceKoef;
				} else if (curVehSpeed > 90 && curVehSpeed <= 130) {
				    vehRepairDistance[vehicleid] += (0.002*curVehSpeedF);
				    vehWheelsDistance[vehicleid] += (0.004*curVehSpeedF)*vehWheelsDistanceKoef;
				} else if (curVehSpeed > 130 && curVehSpeed <= 180) {
				    vehRepairDistance[vehicleid] += (0.005*curVehSpeedF);
				    vehWheelsDistance[vehicleid] += (0.01*curVehSpeedF)*vehWheelsDistanceKoef;
				} else if (curVehSpeed > 180 && curVehSpeed <= 250) {
				    vehRepairDistance[vehicleid] += (0.02*curVehSpeedF);
				    vehWheelsDistance[vehicleid] += (0.08*curVehSpeedF)*vehWheelsDistanceKoef;
				} else if (curVehSpeed > 250) {
				    vehRepairDistance[vehicleid] += (0.04*curVehSpeedF);
				    vehWheelsDistance[vehicleid] += (0.15*curVehSpeedF)*vehWheelsDistanceKoef;
				}

				if (GetVehicleModel(vehicleid) == 470 && VipCar[VipCarFastId[vehicleid]][superLock] == 0) {
				    vehRepairDistance[vehicleid] += (0.005*curVehSpeedF);
				    vehWheelsDistance[vehicleid] += (0.02*curVehSpeedF);
				}

				if (carHealth < 300) {
				    vehRepairDistance[vehicleid] += (0.01*curVehSpeedF);
				    vehWheelsDistance[vehicleid] += (0.04*curVehSpeedF)*vehWheelsDistanceKoef;
				}

				if (vehRepairDistance[vehicleid] > 10001.0) {
				    vehRepairDistance[vehicleid] = 10001.0;
				    if (VipCar[VipCarFastId[vehicleid]][superLock] == 0) {
						VipCar[VipCarFastId[vehicleid]][isEgnitionLocked] = 0;
					}
				}

				if (vehRepairDistance[vehicleid] < 0.0) {
				    vehRepairDistance[vehicleid] = 0.0;
				}

				if (vehWheelsDistance[vehicleid] > 10001.0) {
				    vehWheelsDistance[vehicleid] = 10001.0;
				}

				if (vehWheelsDistance[vehicleid] < 0.0) {
				    vehWheelsDistance[vehicleid] = 0.0;
				}

				VipCar[VipCarFastId[vehicleid]][VehFuel] = Fuell[vehicleid];
				VipCar[VipCarFastId[vehicleid]][Distance] = vehDistance[vehicleid];
				VipCar[VipCarFastId[vehicleid]][RepairDistance] = vehRepairDistance[vehicleid];
				VipCar[VipCarFastId[vehicleid]][WheelsDistance] = vehWheelsDistance[vehicleid];

				if (vehDistance[vehicleid] < 10) {
					format(str5, sizeof(str5), "00000%.1f",vehDistance[vehicleid]);
				} else if (vehDistance[vehicleid] >= 10 && vehDistance[vehicleid] < 100) {
					format(str5, sizeof(str5), "0000%.1f",vehDistance[vehicleid]);
				} else if (vehDistance[vehicleid] >= 100 && vehDistance[vehicleid] < 1000) {
					format(str5, sizeof(str5), "000%.1f",vehDistance[vehicleid]);
				} else if (vehDistance[vehicleid] >= 1000 && vehDistance[vehicleid] < 10000) {
					format(str5, sizeof(str5), "00%.1f",vehDistance[vehicleid]);
				} else if (vehDistance[vehicleid] >= 10000 && vehDistance[vehicleid] < 100000) {
					format(str5, sizeof(str5), "0%.1f",vehDistance[vehicleid]);
	            } else if (vehDistance[vehicleid] >= 100000) {
					format(str5, sizeof(str5), "%.1f",vehDistance[vehicleid]);
				}

			    //format(str5, sizeof(str5), "%s",locked);
			    format(str3, sizeof(str3), "KM/H");
				new Float:engineLive = (10000 - vehRepairDistance[vehicleid]) /100;
	            SetPlayerProgressBarValue(playerid,BarEngine[playerid],engineLive);
				UpdatePlayerProgressBar(playerid,BarEngine[playerid]);

				new Float:wheelsLive = ((10000 - vehWheelsDistance[vehicleid]) /100);
				SetPlayerProgressBarValue(playerid,BarWheels[playerid],wheelsLive);
				UpdatePlayerProgressBar(playerid,BarWheels[playerid]);

				PlayerTextDrawSetString(playerid,EcoShow[playerid],str4);
				//PlayerTextDrawSetString(playerid,SpeedShow[playerid],str1);
				PlayerTextDrawSetString(playerid,SpeedShow[playerid],spdstr);
				PlayerTextDrawSetString(playerid,FuelShow[playerid],str2);
				PlayerTextDrawSetString(playerid,StatusShow[playerid],str5);
				PlayerTextDrawSetString(playerid,KMShow[playerid],str3);
				PlayerTextDrawSetString(playerid,HealthShow[playerid],str6);
			}
		}
	}
}

forward OnVehicleDamageStatusUpdate(vehicleid, playerid);
public OnVehicleDamageStatusUpdate(vehicleid, playerid) {

	

	if (VipCar[VipCarFastId[vehicleid]][autoFix] == 1) {
	    checkVehHealth[vehicleid] = 1000;
		prevVehHealth[vehicleid] = 1000;
		SetVehicleHealth(vehicleid, 1000);
		new panelsx,doorsx,lightsx,tiresx;
		GetVehicleDamageStatus(vehicleid,panelsx,doorsx,lightsx,tiresx);
		UpdateVehicleDamageStatus(vehicleid, panelsx, doorsx, lightsx, 0);
		checkVehHealthTime[vehicleid] = gettime();
		vehRepairDistance[GetPlayerVehicleID(playerid)] -=1000.0;
	    vehWheelsDistance[GetPlayerVehicleID(playerid)] -=1000.0;
	 	RepairVehicle(vehicleid);
	} else {
		new Float:carHealth;
	    GetVehicleHealth(vehicleid,carHealth);
	    if (prevVehHealth[vehicleid] < 255) {
		    prevVehHealth[vehicleid] = carHealth;
		    checkVehHealth[vehicleid] = carHealth;
	    }

	    new Float: Damage = prevVehHealth[vehicleid] - carHealth;
	    Damage = floatabs(Damage);
	    prevVehHealth[vehicleid] = carHealth;

	    /*if (carHealth < 900) {
			if (carHealth+(Damage/8) < prevVehHealth[vehicleid]) {
			    SetVehicleHealth(vehicleid,carHealth+(Damage/8));
			}
		}*/

	    if (carHealth < 255) {
	        SetVehicleHealth(vehicleid,255);
	        prevVehHealth[vehicleid] = 255;
	        checkVehHealth[vehicleid] = 255;
	    }
	    if (carHealth > 1000) {
	        SetVehicleHealth(vehicleid,1000);
	        prevVehHealth[vehicleid] = 1000;
	        checkVehHealth[vehicleid] = 1000;
	    }
	    /*if (vehRepairDistance[vehicleid] > 10000) {
	        checkVehHealth[vehicleid] = 379;
			prevVehHealth[vehicleid] = 379;
			SetVehicleHealth(vehicleid, 379);

	    }*/
	    checkVehHealth[vehicleid] = carHealth;
	    VipCar[VipCarFastId[vehicleid]][VehHealth] = checkVehHealth[vehicleid];

	    //GetVehicleHealth(vehicleid,checkVehHealth[vehicleid]);
	    checkVehHealthTime[vehicleid] = gettime();
	    //printf("%f | %f | %f",prevVehHealth[vehicleid],Damage,carHealth+(Damage/8));
    }
    VipCar[VipCarFastId[vehicleid]][VehFuel] = Fuell[vehicleid];
    return 1;
}

forward SpeedboostForPlayer(i);
public SpeedboostForPlayer(i) {
    boosTimerFlag[i] = 1;
	new vehicle;
    vehicle = GetPlayerVehicleID(i);
    if (vehicle > 0) {
		if(IsPlayerConnected(i) && !IsPlayerNPC(i) && Fuell[vehicle] > 0 && VipCarBooster[vehicle] > 0) {
		    if (IsPlayerInRangeOfPoint(i,460.0,3284.9004, -226.4004, 7.2000)  && PlayerInfo[i][pAdmin] < 100) { //race track
			    return 1;
			}
	        new Keys,up,down;
	        GetPlayerKeys(i,Keys,up,down);
	        if(Keys &= 4) {
	            if(GetPlayerState(i) == PLAYER_STATE_DRIVER) {
	                new Float:x,Float:y,Float:z,spdLimitMax,spdLimitMin,spdBoost;
	                GetVehicleVelocity(vehicle,x,y,z);
	                spdLimitMax = VipCarBooster[vehicle];
	                spdLimitMin = 0-VipCarBooster[vehicle];
	                //spdBoost = 16;
	                spdBoost = 40-VipCarBoosterAcc[vehicle];
	                /*if (GetVehicleModel(GetPlayerVehicleID(i)) == 411) {
	                    spdLimitMax = 3;
		                spdLimitMin = -3;
	                }*/
	                if (x<=spdLimitMax && y<=spdLimitMax && z<=spdLimitMax && x>=spdLimitMin && y>=spdLimitMin && z>=spdLimitMin) {
             			SetVehicleVelocity(GetPlayerVehicleID(i),x+(x / spdBoost),y+(y / spdBoost),z+(z / (spdBoost*2)));
					}
	            }
	        }
		}
	}

	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	if(!IsPlayerNPC(playerid)) {
		SetPVarInt(playerid, "NoAB", 1);
    	SetVehicleParamsForPlayer(vehicleid, playerid, 0, gCarLock[vehicleid]);
	    PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
    	Refueling[playerid] = 0;
    }
}

public OnVehicleMod(playerid,vehicleid,componentid)
{
		if(PlayerInfo[playerid][pAdmin] < 100 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			new string[128];
			new plname[MAX_PLAYER_NAME];
			GetPlayerName(playerid,plname,MAX_PLAYER_NAME);
			SendClientMessage(playerid,COLOR_LIGHTRED,"Вы были кикнуты по подозрению в читерстве ( Код ошибки: 5599)");
			format(string, 256, "- Кикнут %s тюнингует свое авто собейтом",plname);
			ABroadCast(COLOR_LIGHTRED,string,1);
			RemoveVehicleComponent(vehicleid,componentid);
			PlayerInfo[playerid][pCheatCounter]+=30;
			//OOCOff(COLOR_YELLOW,string);
			printf("[Server] kickPlayer - reason: car upgrade");
			kickPlayer(playerid);
		}
	return 1;
}

public OnVehicleSpawn(vehicleid) {

	if(ZChair == vehicleid) {
		AddVehicleComponent(vehicleid, 1009);
		LinkVehicleToInterior(ZChair, 1);
	}
	if(ZCar == vehicleid) {
		AddVehicleComponent(vehicleid, 1009);
		LinkVehicleToInterior(ZCar, 1);
	}

	if(NYCar == vehicleid) {
		AddVehicleComponent(vehicleid, 1009);
		LinkVehicleToInterior(NYCar, 6);
	}

	/*VipCar[VipCarFastId[vehicleid]][VehFuel] = Fuell[vehicleid];
	VipCar[VipCarFastId[vehicleid]][Distance] = vehDistance[vehicleid];
	VipCar[VipCarFastId[vehicleid]][RepairDistance] = vehRepairDistance[vehicleid];
	VipCar[VipCarFastId[vehicleid]][WheelsDistance] = vehWheelsDistance[vehicleid];
	*/
	if (VipCarFastId[vehicleid] >= 0 && GetVehicleDistanceFromPoint(vehicleid, VipCar[VipCarFastId[vehicleid]][PlX], VipCar[VipCarFastId[vehicleid]][PlY], VipCar[VipCarFastId[vehicleid]][PlZ]) > 10.0) {
		ReLoadVipCar(VipCarFastId[vehicleid]);
		printf("[Server] RELOAD CAR #%d - DISTANCE MORE THAN 10 ON VEHILCE SPAWN",VipCarFastId[vehicleid]);
	}

	return true;
}
