forward DollahScoreUpdate();
public DollahScoreUpdate()
{
	//new LevScore;
	//farm pickup fixer

    for (new i=0; i<200; i++) {
	    if (firePlace[i][fireobjectid1] != 0 && firePlace[i][fireTime] + 90 < gettime()) {
            if (IsValidDynamicObject(firePlace[i][fireobjectid1])) {
		        DestroyDynamicObject(firePlace[i][fireobjectid1]);
		    }
		    if (IsValidDynamicObject(firePlace[i][fireobjectid2])) {
		        DestroyDynamicObject(firePlace[i][fireobjectid2]);
		    }
	        firePlace[i][fireobjectid1] = 0;
	        firePlace[i][fireobjectid2] = 0;
	        firePlace[i][firex] = 0.0;
	        firePlace[i][firey] = 0.0;
	        firePlace[i][firez] = 0.0;
	        firePlace[i][fireTime] = 0;
	    }
		new isBoom = 0;
		if (firePlace[i][fireobjectid1] != 0) {
		    for (new z=0; z<maxLoot; z++) {
     			if (Loot[z][lootid] > 0 && GetDistanceBetweenPoints(Loot[z][lootx],Loot[z][looty],Loot[z][lootz],firePlace[i][firex],firePlace[i][firey],firePlace[i][firez]) < 3.0 && canDestroyLoot(z) && Loot[z][lootVW] == 0) {
                    DestroyDynamicObject(Loot[z][lootid]);
			        Loot[z][lootid] = 0;
			        Loot[z][lootType] = 0;
			        Loot[z][lootUseCount] = 0;
			        Loot[z][lootHealth] = 0;
			        Loot[z][lootTime] = gettime();
			        if(in_arrayInt(Loot[z][lootType],LootBigBoomIds) && isBoom == 0) {
			            CreateExplosion(Loot[z][lootx],Loot[z][looty],Loot[z][lootz], 2, 2.5);
			            isBoom = 1;
			        }
                    createFire(Loot[z][lootx],Loot[z][looty],Loot[z][lootz]);
                }
			}
		}

	}
	for (new i=0; i<200; i++) {
	    if (bombPlace[i][bombobjectid] != 0 && bombPlace[i][bombTime] + 10 < gettime()) {
            if (bombPlace[i][bombPower] < 10) {
                //small bomb
		        for (new z=0; z<sizeof(PlayerWalls); z++) {
					if (PlayerWalls[z][ownerid] > 0 && GetDistanceBetweenPoints(PlayerWalls[z][pwallx],PlayerWalls[z][pwally],PlayerWalls[z][pwallz],bombPlace[i][bombx],bombPlace[i][bomby],bombPlace[i][bombz]) < 5.0 && PlayerWalls[z][pupgrade] == 0) {
		                if (IsValidDynamicObject(PlayerWalls[z][pwallid])) {
					        DestroyDynamicObject(PlayerWalls[z][pwallid]);
					    }
					    PlayerWalls[z][pwallx] = 0.0;
					    PlayerWalls[z][pwally] = 0.0;
					    PlayerWalls[z][pwallz] = 0.0;
					    PlayerWalls[z][pwalla] = 0.0;
					    PlayerWalls[z][ownerid] = 0;
					    PlayerWalls[z][pwallid] = 0;
					    PlayerWalls[z][pupgrade] = 0;
					    PlayerWalls[z][needUpdateWall] = 1;
		   			}
				}
			} else {
			    //big bomb
			    for (new z=0; z<sizeof(PlayerWalls); z++) {
					if (PlayerWalls[z][ownerid] > 0 && GetDistanceBetweenPoints(PlayerWalls[z][pwallx],PlayerWalls[z][pwally],PlayerWalls[z][pwallz],bombPlace[i][bombx],bombPlace[i][bomby],bombPlace[i][bombz]) < 20.0) {
		                if (IsValidDynamicObject(PlayerWalls[z][pwallid])) {
					        DestroyDynamicObject(PlayerWalls[z][pwallid]);
					    }
					    PlayerWalls[z][pwallx] = 0.0;
					    PlayerWalls[z][pwally] = 0.0;
					    PlayerWalls[z][pwallz] = 0.0;
					    PlayerWalls[z][pwalla] = 0.0;
					    PlayerWalls[z][ownerid] = 0;
					    PlayerWalls[z][pwallid] = 0;
					    PlayerWalls[z][pupgrade] = 0;
					    PlayerWalls[z][needUpdateWall] = 1;
		   			}
				}
				for (new z=0; z<sizeof(PlayerGates); z++) {
					if (PlayerGates[z][ownerid] > 0 && GetDistanceBetweenPoints(PlayerGates[z][pgatex],PlayerGates[z][pgatey],PlayerGates[z][pgatez],bombPlace[i][bombx],bombPlace[i][bomby],bombPlace[i][bombz]) < 5.0) {
		                if (IsValidDynamicObject(PlayerGates[z][pgateid])) {
					        DestroyDynamicObject(PlayerGates[z][pgateid]);
					    }
					    PlayerGates[z][pgatex] = 0.0;
					    PlayerGates[z][pgatey] = 0.0;
					    PlayerGates[z][pgatez] = 0.0;
					    PlayerGates[z][pgatea] = 0.0;
					    PlayerGates[z][code] = 1234;
					    PlayerGates[z][ownerid] = 0;
					    PlayerGates[z][pgateid] = 0;
					    PlayerGates[z][needUpdateGate] = 1;
		   			}
				}
			}

			for (new z=0; z<bombPlace[i][bombPower]; z++) {
			    new Float: lootFiresCoord[8] = {1.0,-1.0,3.0,-3.0,5.0,-5.0,10.0,-10.0};
			    new Float:bx = bombPlace[i][bombx]+lootFiresCoord[random(8)];
			    new Float:by = bombPlace[i][bomby]+lootFiresCoord[random(8)];
			    new Float:bz = GetPointZPos(bx, by);
			    CreateExplosion(bx, by , bz, 2, 5.5);
			    createFire(bx, by , bz + 1.0);
			}
			if (IsValidDynamicObject(bombPlace[i][bombobjectid])) {
		        DestroyDynamicObject(bombPlace[i][bombobjectid]);
		    }
	        bombPlace[i][bombobjectid] = 0;
	        bombPlace[i][bombx] = 0.0;
	        bombPlace[i][bomby] = 0.0;
	        bombPlace[i][bombz] = 0.0;
	        bombPlace[i][bombTime] = 0;

	    }
	}


	for(new i = 0; i < GetMaxPlayers(); i++){

	    if (IsPlayerConnected(i) && !IsPlayerNPC(i) && GetPVarInt(i, "true_player") == 1) {

		    /*if (PlayerInfo[i][pBank]+PlayerInfo[i][pCash] < PlayerInfo[i][pBonusMoney]) {
		        PlayerInfo[i][pBonusMoney] = PlayerInfo[i][pBank]+PlayerInfo[i][pCash];
		    }*/

		    //party music
		    /*
			new Float:vehx1, Float:vehy1, Float:vehz1;
			new Float:vehx2, Float:vehy2, Float:vehz2;
			new Float:vehx3, Float:vehy3, Float:vehz3;
			new Float:vehx4, Float:vehy4, Float:vehz4;
	        GetVehiclePos(acars[19], vehx1, vehy1, vehz1);
	        GetVehiclePos(acars[20], vehx2, vehy2, vehz2);
	        GetVehiclePos(acars[21], vehx3, vehy3, vehz3);
	        GetVehiclePos(acars[22], vehx4, vehy4, vehz4);
	        if (IsPlayerInRangeOfPoint(i,60,vehx1,vehy1,vehz1)
				|| IsPlayerInRangeOfPoint(i,60,vehx2,vehy2,vehz2)
				|| IsPlayerInRangeOfPoint(i,60,vehx3,vehy3,vehz3)
				|| IsPlayerInRangeOfPoint(i,100,vehx4,vehy4,vehz4)
				|| IsPlayerInRangeOfPoint(i,100,-2914.8149,470.7207,4.9141) //SF club
				|| IsPlayerInRangeOfPoint(i,50,1401.8612,-1633.7007,50.5333) //center club
				) {
	            if (GetPVarInt(i, "PMusic") != 1) {
	            	SetPVarInt(i, "PMusic", 1);
	            	PlayAudioStreamForPlayer(i,"http://uk02.tc.trance.fm/128");
				}
			} else {
			    if (GetPVarInt(i, "PMusic") == 1) {
	            	StopAudioStreamForPlayer(i);
				}
			    SetPVarInt(i, "PMusic", 0);
			}
			*/


			new ___IP[ 64 ];
	    	GetPlayerIp( i, ___IP, 64 );
	    	if(strcmp( "127.0.0.1", ___IP, true ) == 0) {
		 	//do nothing
	    	} else {
	    	    if(IsPlayerConnected(i) && GetPVarInt(i, "true_player") == 1) {
	    	        /*if (PlayerInfo[i][pLevel] < 10) {
						LevScore = PlayerInfo[i][pAge];
					} else {
					    LevScore = PlayerInfo[i][pLevel];
					}*/
					if (MySQLPlayerID[i] == 1 || !PLAYER_LEVEL_LIMITS_ENABLED) {
					    SetPlayerScore(i, 0);
					} else {
						SetPlayerScore(i, PlayerInfo[i][pLevel]);
					}
					showHungry(i);
				}
	    	}
		}


	}
	return 1;
}

forward PayDay();
public PayDay() {
        if ((MySQLsavetime+2) > gettime()) {
		    needpayday = 1;
		    printf("[Server] PayDay() - waiting");
		    return 1;
	    }
        new begintime = tickcount();
        ReklamaTime = gettime();
        MySQLsavetime = gettime();
        mysql_set_character_set("cp1251",connection);
    	mysql_query("SET NAMES cp1251");
		mysql_free_result(connection);
		printf("[Server] Update DB Encoding.");

		ResetMissles();

		createTreasure();

		/*new nowOnline = 1;
        for(new i = 0; i<GetMaxPlayers(); i++) {
			if (IsPlayerConnected(i) && GetPVarInt(i, "true_player_hp") == 1 && !IsPlayerNPC(i) && gPlayerLogged[i] == 1) {
			    nowOnline++;
			}
		}*/

 		new halfOnline = (1 + floatround((nowOnline/2), floatround_ceil));

 		//trainChatly += halfOnline;
 		trainChatly += nowOnline;
 		if (trainChatly > 500) {
 		    trainChatly = 500;
 		}
 		printf("[Server] Add Train Chatly: %d (+%d)",trainChatly,halfOnline);

		chernuhaFuel += halfOnline;
		//chernuhaFuel++;
		if (chernuhaFuel > 600) {
		    chernuhaFuel = 600;
		}
		printf("[Server] Add fuel to chernuha tank: %d (+%d)",chernuhaFuel,halfOnline);

        new nowTime = gettime();
        new droppedLoot = 0;
        new lootAtHouses = 0;
        new lootAtBases = 0;
        new lootAtInterriorDrop = 0;
        new hour, minute, second;
		gettime(hour, minute, second);

		//clans
		for (new i=0; i<sizeof(Clan);i++) {
		    if (Clan[i][clanLevel] == 1) {
		        Clan[i][clanChatly] -= 1;
		    } else if (Clan[i][clanLevel] > 1) {
		        Clan[i][clanChatly] -= 2;
		    }
		    if (Clan[i][clanChatly] < 0) {
		        //clan -1 level
		    }
		}
		saveClansData();

        if (nowOnline >= 12 && chernuhaLastSpawn+3300 < gettime() && hour >=15 && hour <=20) {
	        chernuhaLastSpawn = gettime();
	        chernuhaNeedToSpawn = 1;
	        printf("[SERVER] CHERNUHA START SPAWN PROCESS!");
	        SendClientMessageToAll(0xAA3333AA, "НЛО: Внимание! Зафиксирована сейсмическая активность! Спаун чернухи ожидается через 5 минут!");
		}

        if (nowOnline <= 3) {

	        for (new i=0; i<maxLoot; i++) {
	            if (Loot[i][lootType] > 0) {
	                if (Distance2D(0.0, 0.0,Loot[i][lootx],Loot[i][looty]) < 10.0) {
	                    if (logs == 1) {
				        	printf("Drop Zero Loot Type=%d",Loot[i][lootType]);
				        }
				        DestroyDynamicObject(Loot[i][lootid]);
					    Loot[i][lootid] = 0;
				        Loot[i][lootType] = 0;
				        Loot[i][lootHealth] = 0;
				        Loot[i][lootUseCount] = 0;
				        Loot[i][lootTime] = gettime();
				        droppedLoot++;
				    }

				    if (Loot[i][lootType] == 90 || Loot[i][lootType] == 91 || Loot[i][lootType] == 92) {
	                    if (logs == 1) {
				        	printf("Drop Quest Loot Type=%d",Loot[i][lootType]);
				        }
				        DestroyDynamicObject(Loot[i][lootid]);
					    Loot[i][lootid] = 0;
				        Loot[i][lootType] = 0;
				        Loot[i][lootHealth] = 0;
				        Loot[i][lootUseCount] = 0;
				        Loot[i][lootTime] = gettime();
				        droppedLoot++;
				    }

				    if (GetDistanceBetweenPoints(Loot[i][lootx],Loot[i][looty],Loot[i][lootz],-219.7144,1410.6461,27.7734) < 50.0) {
				        if (logs == 1) {
					        printf("Drop Cheaters Loot Type=%d",Loot[i][lootType]);
						}
				        DestroyDynamicObject(Loot[i][lootid]);
					    Loot[i][lootid] = 0;
				        Loot[i][lootType] = 0;
				        Loot[i][lootHealth] = 0;
				        Loot[i][lootUseCount] = 0;
				        Loot[i][lootTime] = gettime();
				        droppedLoot++;
				    }

			        new Float:maxZPoint = GetPointZPos(Loot[i][lootx],Loot[i][looty]);
			        new lootAtInterrior = 0;
			        for (new z=0; z<sizeof(intEnter); z++) {
						if(GetDistanceBetweenPoints(Loot[i][lootx],Loot[i][looty],Loot[i][lootz], intEnter[z][0],intEnter[z][1],intEnter[z][2]) < 50) { //interrior
						    lootAtInterrior = 1;
						    break;
						}
					}

			    	if ((Loot[i][lootz]-maxZPoint) > 5.0 && GetDistanceBetweenPoints(Loot[i][lootx],Loot[i][looty],Loot[i][lootz],351.1646, -149.4086, 1091.7585) > 100.0 && lootAtInterrior == 0 && Loot[i][lootVW] == 0) { //new bunker
			    	    if (logs == 1) {
				    	    printf("Drop Too High Loot Type=%d",Loot[i][lootType]);
						}
				        DestroyDynamicObject(Loot[i][lootid]);
					    Loot[i][lootid] = 0;
				        Loot[i][lootType] = 0;
				        Loot[i][lootHealth] = 0;
				        Loot[i][lootUseCount] = 0;
				        Loot[i][lootTime] = gettime();
				        droppedLoot++;
			    	}
	            }
	            if (Loot[i][lootType] > 0 && (Loot[i][lootTime]+172800 < nowTime || ( Loot[i][lootTime]+21600 < nowTime && in_arrayInt(Loot[i][lootType],lootTypesNoLiveTime)) )) {


	                new canDropLoot = 1;

	                if (GetDistanceBetweenPoints(Loot[i][lootx],Loot[i][looty],Loot[i][lootz],984.56, -2173.33, 13.65) < 15.0 && Loot[i][lootVW] == 0) {
	                    canDropLoot = 0;
                        lootAtHouses++;
	                }
                    if (canDropLoot == 1) {
		                for (new idxs=0; idxs<PlayerHouseCount;idxs++) {
		                    if (PlayerHouse[idxs][houseType] > 0) {
			                    if (GetDistanceBetweenPoints(Loot[i][lootx],Loot[i][looty],Loot[i][lootz],PlayerHouse[idxs][phousex],PlayerHouse[idxs][phousey],PlayerHouse[idxs][phousez]) < 10.0 && Loot[i][lootVW] == 0) {
			                        canDropLoot = 0;
			                        lootAtHouses++;
			                        break;
			                    }
							}
						}
					}
					if (canDropLoot == 1) {
						for (new idxs=0; idxs<200;idxs++) {
					        if (Base[idxs][baseid] > 0 && GetDistanceBetweenPoints(Loot[i][lootx],Loot[i][looty],Loot[i][lootz],Base[idxs][basex],Base[idxs][basey],Base[idxs][basez]) < 20.0 && Loot[i][lootVW] == 0) {
					            canDropLoot = 0;
					            lootAtBases++;
		               			break;
					        }
						}
					}
					if (canDropLoot == 1) {
						for (new idxs=0; idxs<sizeof(intEnter);idxs++) { //interrior
					        if (GetDistanceBetweenPoints(Loot[i][lootx],Loot[i][looty],Loot[i][lootz],intEnter[idxs][0],intEnter[idxs][1],intEnter[idxs][2]) < 50.0) {
					            canDropLoot = 0;
					            lootAtInterriorDrop++;
		               			break;
					        }
						}
					}
					if (canDropLoot == 1) {
					    DestroyDynamicObject(Loot[i][lootid]);
					    Loot[i][lootid] = 0;
				        Loot[i][lootType] = 0;
				        Loot[i][lootHealth] = 0;
				        Loot[i][lootUseCount] = 0;
				        Loot[i][lootTime] = gettime();
				        droppedLoot++;
					}
	            }
			}
	        printf("[Server] Drop Old Loot: %d items | Locked loot Houses: %d - Bases: %d - Interrior: %d",droppedLoot,lootAtHouses,lootAtBases,lootAtInterriorDrop);
		}

		//printf("DDD:%d / %d",nowOnline,Random(1,nowOnline));
		new fuelHist;
		if (nowOnline >= 1) {
			new addMaxFuel = 0;
			if (nowOnline < 5) {
			    addMaxFuel = 5;
			} else {
			    addMaxFuel = nowOnline;
			}
			if (addMaxFuel > 15) {
			    addMaxFuel = 15;
			}

			/*if (addMaxFuel > 20) {
			    addMaxFuel = 20;
			}*/

			new minusMaxFuel = 0;
			if (nowOnline > 10) {
				minusMaxFuel = 0 - addMaxFuel;
				if (minusMaxFuel < MINUS_MAX_FUEL) {
				    minusMaxFuel = MINUS_MAX_FUEL;
				}
			}

			//minusMaxFuel += FUEL_AT_GAS_ADDON;
            addMaxFuel += FUEL_AT_GAS_ADDON;

            printf("[Server] Max Fuel to add -> %d - %d",minusMaxFuel,addMaxFuel);
			for(new b = 0; b < sizeof(SBizzInfo); b++) {
			    if (SBizzInfo[b][sbProducts] < 0) {
				    SBizzInfo[b][sbProducts] = 0;
				}
				fuelHist = SBizzInfo[b][sbProducts];

				SBizzInfo[b][sbProducts] += Random(minusMaxFuel,addMaxFuel);
				if (SBizzInfo[b][sbProducts] > MAX_FUEL_AT_GAS_STATION) {
					    SBizzInfo[b][sbProducts] = Random(1,(5+addMaxFuel));
					    printf("[Server] Reset Fuel on gas station #%d: %d -> %d",b,fuelHist, SBizzInfo[b][sbProducts]);
				}

				if (SBizzInfo[b][sbProducts] <= 0) {
				    SBizzInfo[b][sbProducts] = 0;
				}
				for (new idxs=0; idxs<200;idxs++) {
			        if (Base[idxs][baseid] > 0 && GetDistanceBetweenPoints(SBizzInfo[b][sbEntranceX], SBizzInfo[b][sbEntranceY], SBizzInfo[b][sbEntranceZ],Base[idxs][basex],Base[idxs][basey],Base[idxs][basez]) < 200) {
                        SBizzInfo[b][sbProducts] = 0;
                        printf("[Server] Gas station #%d is near Clan Base. Remove fuel!",b);
                        break;
			        }
				}

				if (logs == 1) {
					printf("[Server] Add Fuel to gas station #%d: %d -> %d (+%d)",b,fuelHist, SBizzInfo[b][sbProducts], (SBizzInfo[b][sbProducts]-fuelHist));
				}
			}
		} else {
		    printf("[Server] No Add Fuel - no online (((");
		}



        //SaveLoot();
        /*SavePHouses();
        SavePWalls();
        SaveWood();
        SavePGates();
        SaveBases();
        SavePObjects();
        SaveOil();*/




		for (new i=0; i<MAX_VEHICLES;i++) {
	    	if(IsValidObject(Turn[i][0])) {DestroyObject(Turn[i][0]);}
		    if(IsValidObject(Turn[i][1])) {DestroyObject(Turn[i][1]);}
		    if(IsValidObject(Turn[i][2])) {DestroyObject(Turn[i][2]);}
		    if(IsValidObject(Turn[i][3])) {DestroyObject(Turn[i][3]);}
		}


        carRefreshCounter++;

	    if (carRefreshCounter >=8) {

	        mysql_query("UPDATE `"TABLENAME"` SET isOnline = 0 WHERE isOnline = 1");
			mysql_free_result(connection);

			for (new z=0; z<sizeof(intInfo); z++) {
			    if (intInfo[z][intTime] < gettime()) {
			        intInfo[z][intTime] = -1;
			        intInfo[z][intOwner] = -1;
			        intInfo[z][intIsOpen] = 0;
			        DestroyDynamicMapIcon(intInfo[z][intIcon]);
				    intInfo[z][intIcon] = CreateDynamicMapIcon(intEnter[z][3],intEnter[z][4],intEnter[z][5],31,0,0,0,-1,300);
			        printf("[Server] REMOVE INTERRIOR #%d OWNER",z);
			    }
			}

	        carRefreshCounter = 0;
	        new Float:vehx, Float:vehy, Float:vehz, Float:veha;
			for (new i=0; i<VipCarCount;i++) {
			    new canFix = 1;
			    new inCarPlayerId = -1;
			    GetVehicleParamsEx(VipCar[i][vehid],engine,lights,alarm,doors,bonnet,boot,objective);
			    if (!engine) {
					for(new z=0; z <= GetPlayerPoolSize(); z++) {
		                if (z != INVALID_PLAYER_ID && IsPlayerConnected(z) && IsPlayerInVehicle(z, VipCar[i][vehid])) {
		                    /*if (logs == 1) {
			                    printf("[Server] Can't fix car [%s]#%d - player inside!",VipCar[i][descr],i);
							}*/
		                    canFix = 0;
		                    inCarPlayerId = z;
		                    break;
		                }
		            }
				} else {
				    //printf("[Server] Can't fix car [%s]#%d - engine is on!",VipCar[i][descr],i);
				    canFix = 0;
				}



                if (((VipCar[i][OwnerOrg] >= 0 && VipCar[i][superLock] == 3) || (VipCar[i][carOwnerId] > 0 && VipCar[i][superLock] == 1)) && VipCar[i][carOwnerTime] < gettime()) {
                    VipCar[i][OwnerOrg] = -2;
                    VipCar[i][carOwnerId] = 0;

                    VipCar[i][SX] = VipCar[i][ParkX];
					VipCar[i][SY] = VipCar[i][ParkY];
					VipCar[i][SZ] = VipCar[i][ParkZ];
					VipCar[i][SA] = VipCar[i][ParkA];
					VipCar[i][PlX] = VipCar[i][ParkX];
					VipCar[i][PlY] = VipCar[i][ParkY];
					VipCar[i][PlZ] = VipCar[i][ParkZ];
					VipCar[i][PlA] = VipCar[i][ParkA];
					VipCar[i][superLock] = 1;

					Fuell[VipCarIds[i]] = SetVehicleFuelValue(VipCarIds[i]);
			    	VipCar[i][VehFuel] = SetVehicleFuelValue(VipCarIds[i]);
			    	vehRepairDistance[VipCarIds[i]] = 0.0;
				    vehWheelsDistance[VipCarIds[i]] = 0.0;
				    checkVehHealth[VipCarIds[i]] = 1000.0;
					prevVehHealth[VipCarIds[i]] = 1000.0;
					SetVehicleHealth(VipCarIds[i], 1000.0);

                    ReLoadVipCar(i);
                    printf("[DEBUG] RELOAD CAR #21");

                    printf("[Server] REMOVE DONATE-CAR OWNER [%s]#%d",VipCar[i][descr],i);
                    if (inCarPlayerId >= 0) {
                        SendClientMessage(inCarPlayerId, COLOR_LIGHTRED, "Время аренды авто вышло!");
                        printf("[Server] REMOVE DONATE-CAR OWNER [%s]#%d :: SEND MESSAGE TO PLAYER ID:%d",VipCar[i][descr],i,inCarPlayerId);
                    }
                }
		        if (canFix == 1) {
		            GetVehiclePos(VipCar[i][vehid], vehx, vehy, vehz);
			        GetVehicleZAngle(VipCar[i][vehid], veha);

		            if (GetVehicleModel(VipCar[i][vehid]) == 578 || (GetVehicleModel(VipCar[i][vehid]) == 554 && VipCar[i][ExtraTuning] == 1)) {
		                new needRespawn = 0;
		                for (new z1=0; z1<sizeof(PlayerWalls); z1++) {
							if (PlayerWalls[z1][ownerid] > 0 && GetDistanceBetweenPoints(PlayerWalls[z1][pwallx],PlayerWalls[z1][pwally],PlayerWalls[z1][pwallz],vehx, vehy, vehz) < 50.0) {
				                needRespawn = 1;
				                break;
				   			}
						}
						if (needRespawn == 0) {
							for (new z1=0; z1<sizeof(PlayerGates); z1++) {
								if (PlayerGates[z1][ownerid] > 0 && GetDistanceBetweenPoints(PlayerGates[z1][pgatex],PlayerGates[z1][pgatey],PlayerGates[z1][pgatez],vehx, vehy, vehz) < 50.0) {
					                needRespawn = 1;
					                break;
					   			}
							}
						}
						if (needRespawn == 0) {
							for (new idxs=0; idxs<200;idxs++) {
						        if (Base[idxs][baseid] > 0 && GetDistanceBetweenPoints(Base[idxs][basex],Base[idxs][basey],Base[idxs][basez],vehx, vehy, vehz) < 70.0) {
						            needRespawn = 1;
					                break;
						        }
							}
						}
						if (needRespawn == 1) {
						    new vehicleid = VipCar[i][vehid];
							//new whileTry = 0;
							new i1 = VipCarFastId[vehicleid];
						    /*VipCar[i1][PlZ] = 0.0;
						    while (whileTry < 10 && (VipCar[i1][PlZ] < 5.0 || VipCar[i1][PlZ] > 30.0)) {
						        VipCar[i1][PlX] = floatround(Random(-2000,2000));
						        VipCar[i1][PlY] = floatround(Random(-2000,2000));
						        VipCar[i1][PlZ] = GetPointZPos(VipCar[i1][PlX], VipCar[i1][PlY]) + 1.0;
						        whileTry++;
						        if (whileTry >= 10) {
						            break;
						        }
						    }
						    if (whileTry >= 10) {
						        VipCar[i1][PlX] = floatround(Random(-20,20));
								VipCar[i1][PlY] = floatround(Random(-20,20));
								VipCar[i1][PlZ] = floatround(Random(4,10));
							}*/
							new DFTspaenId = random(sizeof(DTFspawnPoints));
							VipCar[i1][SX] = DTFspawnPoints[DFTspaenId][0];
							VipCar[i1][SY] = DTFspawnPoints[DFTspaenId][1];
							VipCar[i1][SZ] = DTFspawnPoints[DFTspaenId][2];
							VipCar[i1][PlX] = VipCar[i1][SX];
                            VipCar[i1][PlY] = VipCar[i1][SY];
                            VipCar[i1][PlZ] = VipCar[i1][SZ];
							VipCar[i1][SA] = VipCar[i1][PlA];
							ReLoadVipCar(VipCarFastId[vehicleid]);
							printf("[DEBUG] RELOAD CAR #8");
							printf("[Server] respawn DFT-30 / rocket car [DB ID:%d]",i);
						}

		            }
		            if (VipCar[i][ctime]+129600 < gettime() && VipCar[i][isEgnitionLocked] > 0 /*&& VipCar[i][lastUsePlayerID] != 1  1=my mysql id*/ && VipCar[i][superLock] == 0) {
              			VipCar[i][isEgnitionLocked] = 0;
		                printf("[Server] Remove car Key [%s]#%d <<<<<<",VipCar[i][descr],i);
		            }

				    new Float:maxZPoint = GetPointZPos(vehx, vehy);
			    	if ((VipCar[i][PlZ]-maxZPoint) > 16.0 && !IsABoatS(VipCar[i][VCModel])) {
			    	    printf("[Server] Fix car [%s]#%d - Too High %f <<<<<<",VipCar[i][descr],i,(VipCar[i][PlZ]-maxZPoint));
						if (VipCar[i][superLock] != 2) {
				    	    VipCar[i][PlX] = VipCar[i][SX];
			 				VipCar[i][PlY] = VipCar[i][SY];
			 				VipCar[i][PlZ] = VipCar[i][SZ];
			 				VipCar[i][PlA] = VipCar[i][SA];
						}


				        SetVehiclePos(VipCar[i][vehid], VipCar[i][PlX],VipCar[i][PlY], VipCar[i][PlZ]);
				        ReLoadVipCar(i);
				        printf("[DEBUG] RELOAD CAR #9");
				        printf("[Server] New Car Place [%f | %f | %f]",VipCar[i][PlX],VipCar[i][PlY],VipCar[i][PlZ]);
				        //printf("VZ=%f MZ=%f | %f",vehz,maxZPoint,(vehz-maxZPoint));

					} else if ((VipCar[i][PlZ] <= -10.0 || vehz <= -10.0 /*|| (VipCar[i][PlZ]-maxZPoint) < 0.1*/) && !IsABoatS(VipCar[i][VCModel])) {
					    printf("[Server] Fix car [%s]#%d - Too Low %f | %f | %f <<<<<<",VipCar[i][descr],i,VipCar[i][PlZ],vehz,(VipCar[i][PlZ]-maxZPoint));
					    if (VipCar[i][PlZ] <= 0.1) {
							if (VipCar[i][superLock] == 0) {
							    VipCar[i][isEgnitionLocked] = 0;
							    printf("[Server] Car Lock Removed!");
							}
					    }
                        if (VipCar[i][superLock] != 2) {
							VipCar[i][PlX] = VipCar[i][SX];
			 				VipCar[i][PlY] = VipCar[i][SY];
			 				VipCar[i][PlZ] = VipCar[i][SZ];
			 				VipCar[i][PlA] = VipCar[i][SA];
						}
				        SetVehiclePos(VipCar[i][vehid], VipCar[i][PlX],VipCar[i][PlY], VipCar[i][PlZ]);
				        ReLoadVipCar(i);
				        printf("[DEBUG] RELOAD CAR #10");
				        printf("[Server] New Car Plase [%f | %f | %f]",VipCar[i][PlX],VipCar[i][PlY],VipCar[i][PlZ]);
					} else if (VipCar[i][superLock] != 2 && (GetDistanceBetweenPoints(-201.4470, 23.3807, 2.0770,vehx, vehy, vehz) < 100.0 || GetDistanceBetweenPoints(3284.9004, -226.4004, 7.2000,vehx, vehy, vehz) < 400.0)) { //green zone
					    new vehicleid = VipCar[i][vehid];
						new i1 = VipCarFastId[vehicleid];
					    new DFTspaenId = random(sizeof(DTFspawnPoints));
						VipCar[i1][SX] = DTFspawnPoints[DFTspaenId][0];
						VipCar[i1][SY] = DTFspawnPoints[DFTspaenId][1];
						VipCar[i1][SZ] = DTFspawnPoints[DFTspaenId][2];
						VipCar[i1][PlX] = VipCar[i1][SX];
                        VipCar[i1][PlY] = VipCar[i1][SY];
                        VipCar[i1][PlZ] = VipCar[i1][SZ];
						VipCar[i1][SA] = VipCar[i1][PlA];
						ReLoadVipCar(VipCarFastId[vehicleid]);
						printf("[DEBUG] RELOAD CAR #11");
						printf("[Server] Fix car [%s]#%d - CAR AT GREEN ZONE <<<<<<",VipCar[i][descr],i);
					} else if (VipCar[i][superLock] == 2) {
 					    VipCar[i][SX] = VipCar[i][ParkX];
						VipCar[i][SY] = VipCar[i][ParkY];
						VipCar[i][SZ] = VipCar[i][ParkZ];
						VipCar[i][SA] = VipCar[i][ParkA];
						VipCar[i][PlX] = VipCar[i][ParkX];
						VipCar[i][PlY] = VipCar[i][ParkY];
						VipCar[i][PlZ] = VipCar[i][ParkZ];
						VipCar[i][PlA] = VipCar[i][ParkA];
					    ReLoadVipCar(VipCarFastId[VipCar[i][vehid]]);
					    printf("[DEBUG] RELOAD CAR #22");
		            } /*else {
		                VipCar[i][PlX] = vehx;
						VipCar[i][PlY] = vehy;
						VipCar[i][PlZ] = vehz;
						VipCar[i][PlA] = veha;
		            }*/


			    }
			}
		}

		//carSetupWithoutFuel("TW", VipCarIds);
		SaveVipCars();


		OnPropUpdate();
		needpayday = 0;
		new PDhour, PDminute, PDsecond;
		gettime(PDhour, PDminute, PDsecond);
		//prevhour = PDhour;
		MySQLMoneyInfo();
		new updatetime = tickcount() - begintime;
		//mysqlErrorsCount = 0;
		MySQLsavetime = gettime();
		printf("[Server] PayDay() - end in %d ms", updatetime);
		ReklamaTime = gettime();
	return 1;
}

forward AFKProcessor();
public AFKProcessor() {
	new HighestPlayerId = GetPlayerPoolSize();
	for(new x=0; x <= HighestPlayerId; x++) { // (note the condition change from < to <=)
		if(IsPlayerConnected(x)) {
    		if(PlayerEx[x][ChekEx] < PlayerEx[x][TickEx]) {
			    if(PlayerEx[x][AFKEx] == true) {
				    PlayerEx[x][VarEx] = 0;
				    PlayerEx[x][AFKEx] = false;
    			}
    		}
    		if(PlayerEx[x][AFKEx] == true) {
				PlayerEx[x][VarEx]++;

				SetPVarInt(x, "player_hp_cheat", 0); //godmod
				if (PlayerInfo[x][lastShotTime]+120 > gettime()) {
				    PlayerInfo[x][lastShotTime] = gettime()-1;
				}
    		}
		    /*if (PlayerInfo[x][pAdmin] <= 7) {
			    if(PlayerEx[x][VarEx] > 180) {
				    SendClientMessage(x,COLOR_REDD,"[AFK]: Вы были отсоеденены от сервера");
				    printf("[Server] kickPlayer - reason: AFK | PlayerID=%d",x);
				    kickPlayer(x);
				    PlayerEx[x][VarEx] = 0;
				}
			}*/
	        if (needTakeDamage[x] > 0 && PlayerEx[x][VarEx] > 2 && PlayerInfo[x][pLevel] < 3) {
	            PlayerInfo[x][lastShotTime] = gettime();
	            printf("[Server] Kill Player %s [%d] - AFK with needTakeDamage!",PlayerInfo[x][dbName],x);
	            trueKill[x] = 1;
	            playerSpawnCheat[x] = 0;
                DropAllPlayerLootAndKill(x);
		        SetPlayerHealthAC(x, -1000.0);
				PlayerInfo[x][pHP] = -1000;
				PlayerHealth[x] = -1000.0;
                //kickPlayer(x);
	        }
		    if(PlayerEx[x][VarEx] > 1) {
			    new stringF[50];
			    format(stringF,sizeof(stringF),"[AFK] [%s]",Convert(PlayerEx[x][VarEx]));
			    SetPlayerChatBubble(x, stringF, COLOR_GREEN, 30.0, 1200);
			    SetPVarInt(x, "player_hp_cheat", 0); //godmod
			    if (PlayerEx[x][VarEx] > 10 && PlayerInfo[x][lastShotTime]+120 > gettime()) {
			        DropAllPlayerLootAndKill(x);
			    }
		    }
  		}
	}
	return 1;
}
