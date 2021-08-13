//
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {

    if(IsPlayerNPC(playerid)) return 1;

	if (preRestartTimer > 0) {
		return 1;
	}

	/*if (playerDeathIn[playerid] > 0) {
		return 1;
	}*/

	if (playerShowTutorialStep[playerid] > 0 && (newkeys & KEY_JUMP) && !(oldkeys & KEY_JUMP)) {
	    ShowPlayerDialogEx(playerid,TUTORIAL_END,DIALOG_STYLE_MSGBOX,"��������","��������� � ����?", "��", "���");
		return 1;
	}

	/*if (IsPlayerInRangeOfPoint(playerid, 100, 702.8103, -113.6644, 19.9949)) { //zombie base
	    if((newkeys & KEY_JUMP) && !IsPlayerInAnyVehicle(playerid)) {
	        PlayerPressedJump[playerid]++;
	        SetTimerEx("PressJumpReset", 3000, false, "i", playerid); // Makes it where if they dont spam the jump key, they wont fall
	        if(PlayerPressedJump[playerid] == 3) {
	            ApplyAnimation(playerid, "PED", "BIKE_fall_off", 4.1, 0, 1, 1, 1, 0, 1); // applies the fallover animation
	            TogglePlayerControllable(playerid, 0);
	            SetTimerEx("PressJump", 9000, false, "i", playerid); // Timer for how long the animation lasts
	        }
	    }
	}*/


    if(newkeys & KEY_SPRINT) {
		if(gPlayerUsingLoopingAnim[playerid] == 1) {
			gPlayerUsingLoopingAnim[playerid] = 0;
    		ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 0);
        }
	}

	if (GetPlayerState(playerid) == PLAYER_STATE_PASSENGER && GetPlayerVehicleID(playerid) == Train && newkeys & KEY_CROUCH) {
	    new invStr[2000];
	    new amount;
		for (new z=1; z<PlayerInventoryMaxLimit; z++) {
		    if (PlayerInventory[playerid][z][itemType] > 0 && InventoryName[PlayerInventory[playerid][z][itemType]][invHealth] == 0 && PlayerInventory[playerid][z][itemLock] == 0 &&
				PlayerInventory[playerid][z][itemType] != 40 && PlayerInventory[playerid][z][itemType] != 70 &&
				PlayerInventory[playerid][z][itemType] != 9 && PlayerInventory[playerid][z][itemType] != 20) {
		        amount = PlayerInventory[playerid][z][itemCount];
				if (amount > 3) {
					amount = 3;
	    		}
				format(invStr, sizeof(invStr), "%s{D1DBD0}%s / ������� �� %d ������\n",invStr, InventoryName[PlayerInventory[playerid][z][itemType]][InvName], amount);
			}
		}
  		ShowPlayerDialogEx(playerid, DIALOG_TYPE_TRAIN_SELL, DIALOG_STYLE_LIST, "������� ���� ��������", invStr, "������", "�����");
		return 1;
	}

	if(PRESSED(KEY_SECONDARY_ATTACK)&& GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {

	    if(IsPlayerInRangeOfPoint(playerid,4.0, 311.1917,-199.5948,-10.8841)) { //������� ������� �����
            new itemslist[1500];
		    new dHeader[100];
	        if (PlayerInfo[playerid][chatly] >= coainShopItems[0][1]) {
	            format(itemslist, sizeof(itemslist), "{009933}1. ����� ����� / ����: %d ������\n",coainShopItems[0][1]);
			} else {
			    format(itemslist, sizeof(itemslist), "{CC0000}1. ����� ����� / ����: %d ������\n",coainShopItems[0][1]);
			}
	        for (new i=1; i< sizeof(coainShopItems); i++) {
	            if (PlayerInfo[playerid][cocainTradeCount] >= coainShopItems[i][1]) {
		            format(itemslist, sizeof(itemslist), "%s{009933}%d. %s / ����: %d �������\n",itemslist, (i+1), InventoryName[coainShopItems[i][0]][InvName],coainShopItems[i][1]);
				} else {
				    format(itemslist, sizeof(itemslist), "%s{CC0000}%d. %s / ����: %d �������\n",itemslist, (i+1), InventoryName[coainShopItems[i][0]][InvName],coainShopItems[i][1]);
				}
	        }
	        format(dHeader, sizeof(dHeader), "����: %d ������� �����",PlayerInfo[playerid][cocainTradeCount]);

			ShowPlayerDialogEx(playerid, DIALOG_TYPE_COCAIN_SHOP, DIALOG_STYLE_LIST, dHeader, itemslist, "�������", "�����");
            return 1;
        }


	}


	//ALT
    if (GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
        if (newkeys & 1024) {
            new lootTakeStr[3000];
            new found = 0;
            if (PlayerFishing[playerid] == 1) {
                return 1;
            }
            if(IsPlayerInRangeOfPoint(playerid,3.0, -576.3741,2622.6160,65.7042)) { //desert cave food
                if (playerDesertBunker[playerid] == 0) {
                    SendClientMessage(playerid, COLOR_WHITE, "�� �� ��������� ������� �������!");
					return 1;
                }
                if (PlayerInfo[playerid][pHungry] < 4000) {
	                PlayerInfo[playerid][pHungry] = 4000;
	                PlayerInfo[playerid][pThirsty] = 4000;
	                showHungry(playerid);
	                MeChat(playerid,"������ � ������� �� ������!");
				} else {
				    SendClientMessage(playerid, COLOR_WHITE, "�� �� �������!");
				}
				return 1;
            }

            if(IsPlayerInRangeOfPoint(playerid,3.0, -458.8391,2601.3142,50.6875) || IsPlayerInRangeOfPoint(playerid,3.0, -463.4341,2601.0330,51.2797)) { //desert ddoor
                if (playerDesertBunker[playerid] == 0) {
                    SendClientMessage(playerid, COLOR_WHITE, "�� �� ��������� ������� �������!");
                    return 1;
                }
                if (desertDoorStatus == 1) { //down
		            MoveObject(desertDoor, -461.0315, 2593.1523, 46.7290,1.0,   6.01605685,0.00000000,90.24073814);
		            desertDoorStatus = 0;
		            SetTimer("closeDdoor", 15000, 0);
				} else {
				    SendClientMessage(playerid, COLOR_WHITE, "������ ��� �������!");
				}

				return 1;
            }

            if(IsPlayerInRangeOfPoint(playerid,3.0, -552.6922,2616.0737,53.5156)) { //desert replicator
                if (playerDesertBunker[playerid] == 0) {
                    SendClientMessage(playerid, COLOR_WHITE, "�� �� ��������� ������� �������!");
                    return 1;
                }
                if ((newSpawnHelpTime[playerid]+10) < gettime()) {
	                ShowPlayerDialogEx(playerid, DIALOG_TYPE_DESERT_REPLICATOR, DIALOG_STYLE_LIST, "���������� ������� ������", "�����\n������\nGPS ���������", "������", "�����");
	                return 1;
				} else {
				    SendClientMessage(playerid, COLOR_WHITE, "���� ������� �����������! ���������...");
				}

            }

            if(IsPlayerInRangeOfPoint(playerid,3.0, -546.3381,2593.7454,57.4933)) { //desert manage
                /*if (playerDesertBunker[playerid] == 0) {
                    SendClientMessage(playerid, COLOR_WHITE, "�� �� ��������� ������� �������!");
                    return 1;
                }*/
                ShowPlayerDialogEx(playerid, DIALOG_TYPE_DESERT_MANAGE, DIALOG_STYLE_LIST, "����� ���������� ��������", "�������/������� ������\n�������/������� ���\n���/���� Skynet ������\n�������� �������� ������\n����������� � ������� (500 �.)", "������", "�����");
                return 1;
            }

            if(IsPlayerInRangeOfPoint(playerid,3.0, -561.6459,2616.2354,53.6157) && SKILL_SELLER_ENABLED) { //skillseller
                ShowPlayerDialogEx(playerid, DIALOG_SKILL_SELLER, DIALOG_STYLE_LIST, "��������� ������ ������", "��������\n��������\nAK-47", "������", "�����");
                return 1;
            }




            if(treasureTime > 0 && IsPlayerInRangeOfPoint(playerid,5.0, treasureX,treasureY,treasureZ)) { //����
                if (GetPlayerWeapon(playerid) == 6) {
                    //createTreasure();
                    treasureTime = 0;
                    new Float:dx1,Float:dy1,Float:dz1;
					GetPlayerPos(playerid,dx1,dy1,dz1);
                    CreateItem(dx1,dy1,dz1,30);
                    if (random(2) == 1) {
	                    CreateItem(dx1,dy1,dz1,55);
	                    CreateItem(dx1,dy1,dz1,18);
	                    CreateItem(dx1,dy1,dz1,18);
	                    CreateItem(dx1,dy1,dz1,13);
					} else {
					    CreateItem(dx1,dy1,dz1,98);
	                    CreateItem(dx1,dy1,dz1,38);
	                    CreateItem(dx1,dy1,dz1,38);
	                    CreateItem(dx1,dy1,dz1,37);
					}
	                if (random(2) == 1) {
	                    CreateItem(dx1,dy1,dz1,29);
	                } else {
	                    CreateItem(dx1,dy1,dz1,107);
	                }
                    addPlayerAchieve(playerid,24);
                    MeChat(playerid,"����� ����!");
                } else {
                    MeChat(playerid,"������, ��� ����� ����� � ���� ������!");
                }

			}

            if(IsPlayerInRangeOfPoint(playerid,2.0, 2840.5049,-2372.7612,31.0078)) { //�������
                new itemslist[1000];
			    new dHeader[100];

   		        if (PlayerInfo[playerid][chernuhaAmount] >= 1) {
		            format(itemslist, sizeof(itemslist), "%s{009933} 1 = 200 ������ �������\n",itemslist);
				} else {
        			format(itemslist, sizeof(itemslist), "%s{CC0000} 1 = 200 ������ �������\n",itemslist);
				}

                if (PlayerInfo[playerid][chernuhaAmount] >= 3) {
		            format(itemslist, sizeof(itemslist), "%s{009933} 3 = ����\n",itemslist);
				} else {
        			format(itemslist, sizeof(itemslist), "%s{CC0000} 3 = ����\n",itemslist);
				}

		        format(dHeader, sizeof(dHeader), "������� � ���������: %d",PlayerInfo[playerid][chernuhaAmount]);
				ShowPlayerDialogEx(playerid, DIALOG_CHERNUHA, DIALOG_STYLE_LIST, dHeader, itemslist, "�������", "�����");
                return 1;
            }

            if (IsPlayerNPC(questHostId) && GetDistanceBetweenPlayers(playerid,questHostId) < 3){
                ShowPlayerDialogEx(playerid, DIALOG_QUEST, DIALOG_STYLE_LIST, "���������", "������, �� ���?\n��� � ���� ������?\n��� �� ������ ��� ������?\n����� ���� ������ ��� ����?\n� ������, ��� ���� ����� �������� ���-���.", "�������", "<< �����");
                return 1;
            }

            /*if(IsPlayerInRangeOfPoint(playerid,2.0, 1406.1023,-1312.9668,8.5669)) { //bunkeractor
	            ShowPlayerDialogEx(playerid, DIALOG_BUNKER_ACTOR_1_1, DIALOG_STYLE_LIST, "������", "������������. �� ���?\n� ���� ���� ������!", "�������", "<< �����");
                return 1;
            }*/
            if ((newSpawnHelpTime[playerid]+2) < gettime()) {
	            if(IsPlayerInRangeOfPoint(playerid,3.0, -2392.01440, -2173.84839, 33.52730)) { //chatly bank
		            ShowPlayerDialogEx(playerid, DIALOG_CHATLY_BANK, DIALOG_STYLE_LIST, "�����-����", "������ ����\n���� �����", "�������", "");
		            newSpawnHelpTime[playerid] = gettime();
	                return 1;
	            }
	            if(IsPlayerInRangeOfPoint(playerid,3.0, 1436.4883,1640.5436,1002.4581) && (DEFENCE_SUIT_IS_ENABLE || PlayerInfo[playerid][pAdmin] > 100)) { //defence suit
		            ShowPlayerDialogEx(playerid, DIALOG_DEFENCE_SUIT, DIALOG_STYLE_LIST, "�������� ������", "������ �������� ������ (3.000)\n������ ������ ������ �� ������ ���� (2.000)\n������ ������ ������ �� �-������ (1.000)\n������ ������ ����������� ����� (4.000)\n������ ������ ������ �� ���������� (2.500)\n�������� ������� ������ (500)", "�������", "");
		            newSpawnHelpTime[playerid] = gettime();
	                return 1;
	            }
			}

			//interrior
			if ((newSpawnHelpTime[playerid]+2) < gettime()) {
			    for (new z=0; z<sizeof(intEnter); z++) {
		            if(IsPlayerInRangeOfPoint(playerid,3.0, intEnter[z][0],intEnter[z][1],intEnter[z][2])) { //interrior exit
		                if (MySQLPlayerID[playerid] == intInfo[z][intOwner]) {
		                    intIdPlayerAt[playerid] = z;
							new houseSettingString[200];
		                    format(houseSettingString,sizeof(houseSettingString), "�����\n�������/�������\n������� %s",ConvertNoSec(intInfo[z][intTime] - gettime()));
		                    ShowPlayerDialogEx(playerid, DIALOG_INTERRIOR_SETTINGS, DIALOG_STYLE_LIST, "���", houseSettingString, "�������", "");
		                } else {
				            TogglePlayerControllable(playerid, 0);
				            isTeleported[playerid] = 1;
			                isFreezed[playerid] = 1;
	                        SetPlayerPos(playerid,intEnter[z][3],intEnter[z][4],intEnter[z][5]);
	                        SetTimerEx("ContrOn", 700, 0, "i", playerid);
						}
						newSpawnHelpTime[playerid] = gettime();
		                return 1;
		            } else if(IsPlayerInRangeOfPoint(playerid,3.0, intEnter[z][3],intEnter[z][4],intEnter[z][5])) { //interrior enter
		                if (MySQLPlayerID[playerid] == intInfo[z][intOwner] || intInfo[z][intIsOpen] == 1) {
		                    TogglePlayerControllable(playerid, 0);
		                    isTeleported[playerid] = 1;
			                isFreezed[playerid] = 1;
	                        SetPlayerPos(playerid,intEnter[z][0],intEnter[z][1],intEnter[z][2]);
	                        SetTimerEx("ContrOn", 700, 0, "i", playerid);
		                } else if (intInfo[z][intOwner] == -1) {
	                        intIdPlayerAt[playerid] = z;
	                        ShowPlayerDialogEx(playerid, DIALOG_BUY_INTERRIOR, DIALOG_STYLE_MSGBOX, "���", "����������� ����: 50\n��������� 50�/������\n\n������?", "��", "���");
		                } else {
		                    SendClientMessage(playerid, COLOR_LIGHTRED, "�������!");
		                }
		                newSpawnHelpTime[playerid] = gettime();
		                return 1;
		            }
				}
				if (IsPlayerInRangeOfPoint(playerid,5.0, 335.4427, -194.8883, 1098.1077)) { //new bunker
				    TogglePlayerControllable(playerid, 0);
				    isTeleported[playerid] = 1;
	                isFreezed[playerid] = 1;
                    SetPlayerPos(playerid,-125.3152, 2259.5139, 29.1283);
                    newSpawnHelpTime[playerid] = gettime();
                    SetTimerEx("playerAtNewBunkerRemove", 1000, 0, "i", playerid);
                    SetTimerEx("ContrOn", 700, 0, "i", playerid);
				}

				if (myHomeIsOpen == 1 && IsPlayerInRangeOfPoint(playerid,5.0, 268.7112, 1889.6230, -29.6491)) { //myhome
				    TogglePlayerControllable(playerid, 0);
				    isTeleported[playerid] = 1;
	                isFreezed[playerid] = 1;
	                playerAtStarGate[playerid] = 1;
                    SetPlayerPos(playerid,1347.5944, 1677.8090, 1026.6581);
                    newSpawnHelpTime[playerid] = gettime();
                    SetTimerEx("ContrOn", 700, 0, "i", playerid);
				}

				if (IsPlayerInRangeOfPoint(playerid,5.0, 1347.5944, 1677.8090, 1026.6581)) { //myhome
				    TogglePlayerControllable(playerid, 0);
				    isTeleported[playerid] = 1;
	                isFreezed[playerid] = 1;
	                playerAtStarGate[playerid] = 0;
                    SetPlayerPos(playerid,268.7112, 1889.6230, -29.6491);
                    newSpawnHelpTime[playerid] = gettime();
                    SetTimerEx("ContrOn", 700, 0, "i", playerid);
				}
			}


			//short messages actors
			if ((newSpawnHelpTime[playerid]+2) < gettime()) {
			    for (new actorId=0; actorId<sizeof(talkingActor); actorId++) {
		            if(IsPlayerInRangeOfPoint(playerid,2.0, talkingActor[actorId][tActorX],talkingActor[actorId][tActorY],talkingActor[actorId][tActorZ])) {
						ShowPlayerDialogEx(playerid, 10349, DIALOG_STYLE_MSGBOX, talkingActor[actorId][dialogHeader], talkingActor[actorId][dialogContent], "Ok", "");
						newSpawnHelpTime[playerid] = gettime();
		                return 1;
		            }
				}
			}

            /*if(IsPlayerInRangeOfPoint(playerid,2.0, -181.1633, -45.7535, 3.0873)) { //bunkeractor1
	            ShowPlayerDialogEx(playerid, DIALOG_BUNKER_ACTOR_1, DIALOG_STYLE_LIST, "�������� ���������", "�� ���?\n��� ����� �����\n��� ��� ����� ���������?\n� ���� ���-�� ������?", "�������", "");
                return 1;
            }
            if(IsPlayerInRangeOfPoint(playerid,2.0, -252.0848, -45.5056, 3.0855)) { //bunkeractor2
	            ShowPlayerDialogEx(playerid, DIALOG_BUNKER_ACTOR_2, DIALOG_STYLE_LIST, "���������� �������", "�� ���?\n��� � ���� �����?\n��� ��� ����� ������?\n��� ��� � ��� �����������?\n��� ����� �������?", "�������", "");
                return 1;
            }
            if(IsPlayerInRangeOfPoint(playerid,2.0, -163.5039, -12.6035, 3.1186)) { //bunkeractor3
	            ShowPlayerDialogEx(playerid, DIALOG_BUNKER_ACTOR_3, DIALOG_STYLE_LIST, "�����", "�� ���?\n� ������ ����. ���� ��� ������?\n� ��� ���� �����������? ����� ���...\n� ���� ���-�� ������?", "�������", "");
                return 1;
            }
            if(IsPlayerInRangeOfPoint(playerid,2.0, -168.5709, -9.9038, 5.9816)) { //bunkeractor4
	            ShowPlayerDialogEx(playerid, DIALOG_BUNKER_ACTOR_4, DIALOG_STYLE_LIST, "�������� �����������", "�� ���?\n��� ����� ����������?\n��� ��� ����? ���� � ������ � ��������?\n��� ��� ����� ������? ����� � ��� ����?", "�������", "");
                return 1;
            }*/

            if(IsPlayerInRangeOfPoint(playerid,2.0, -28.9380,-2498.8518,36.6484)) { //bar chatly
                new itemslist[1500];
			    new dHeader[100];
		        for (new i=0; i< sizeof(chatlyShopItems); i++) {
		            if (PlayerInfo[playerid][chatly] >= chatlyShopItems[i][1]) {
			            format(itemslist, sizeof(itemslist), "%s{009933}%d. %s / ����: %d\n",itemslist, (i+1), InventoryName[chatlyShopItems[i][0]][InvName],chatlyShopItems[i][1]);
					} else {
					    format(itemslist, sizeof(itemslist), "%s{CC0000}%d. %s / ����: %d\n",itemslist, (i+1), InventoryName[chatlyShopItems[i][0]][InvName],chatlyShopItems[i][1]);
					}
		        }
		        format(dHeader, sizeof(dHeader), "�������: %d ������",PlayerInfo[playerid][chatly]);

				ShowPlayerDialogEx(playerid, DIALOG_TYPE_CHATLY_SHOP, DIALOG_STYLE_LIST, dHeader, itemslist, "�������", "�����");
                return 1;
            }
            if(IsPlayerInRangeOfPoint(playerid,2.0, -21.89360, -2510.99243, 36.63400)) { //bar chatly 1
                new itemslist[1500];
			    new dHeader[100];
		        for (new i=0; i< sizeof(chatlyShop1Items); i++) {
		            if (PlayerInfo[playerid][chatly] >= chatlyShop1Items[i][1]) {
			            format(itemslist, sizeof(itemslist), "%s{009933}%d. %s / ����: %d\n",itemslist, (i+1), InventoryName[chatlyShop1Items[i][0]][InvName],chatlyShop1Items[i][1]);
					} else {
					    format(itemslist, sizeof(itemslist), "%s{CC0000}%d. %s / ����: %d\n",itemslist, (i+1), InventoryName[chatlyShop1Items[i][0]][InvName],chatlyShop1Items[i][1]);
					}
		        }
		        format(dHeader, sizeof(dHeader), "�������: %d ������",PlayerInfo[playerid][chatly]);

				ShowPlayerDialogEx(playerid, DIALOG_TYPE_CHATLY_SHOP_1, DIALOG_STYLE_LIST, dHeader, itemslist, "�������", "�����");
                return 1;
            }
            if(IsPlayerInRangeOfPoint(playerid,2.0, -37.64802, -2487.73169, 36.63612)) { //bar chatly 2
                new itemslist[1500];
			    new dHeader[100];
		        for (new i=0; i< sizeof(chatlyShop2Items); i++) {
		            if (PlayerInfo[playerid][chatly] >= chatlyShop2Items[i][1]) {
			            format(itemslist, sizeof(itemslist), "%s{009933}%d. %s / ����: %d\n",itemslist, (i+1), InventoryName[chatlyShop2Items[i][0]][InvName],chatlyShop2Items[i][1]);
					} else {
					    format(itemslist, sizeof(itemslist), "%s{CC0000}%d. %s / ����: %d\n",itemslist, (i+1), InventoryName[chatlyShop2Items[i][0]][InvName],chatlyShop2Items[i][1]);
					}
		        }
		        format(dHeader, sizeof(dHeader), "�������: %d ������",PlayerInfo[playerid][chatly]);

				ShowPlayerDialogEx(playerid, DIALOG_TYPE_CHATLY_SHOP_2, DIALOG_STYLE_LIST, dHeader, itemslist, "�������", "�����");
                return 1;
            }

            if(IsPlayerInRangeOfPoint(playerid,3.0, 2860.0735, 2570.4543, 9.8185)) { //products for bar delivery
                /*new invTotalSize = getPlayerInventorySize(playerid);
				if (invTotalSize+InventoryName[110][InvSize] < PlayerInfo[playerid][PlayerInventoryLimit]) {
		            PutItemToInventory(playerid,110,1,0);
					MeChat(playerid,"���� �������� ��� ���� � ������ ��� �� ����� ������ �������!");
		        } else {
				    MeChat(playerid,"�� ����� ����� ��������� ����� � �������!");
				}*/
				return 1;
            }


            /*if(noobGatesStatus == 1 && IsPlayerInRangeOfPoint(playerid,15.0, -228.5871, 130.0791, 3.1500)) { //green zone gates
                //if (PlayerInfo[playerid][pLevel] <= 3 || PlayerInfo[playerid][pAdmin] >= 8) {
		            noobOpenMainGate();
		            SendClientMessage(playerid, COLOR_LIGHTRED, ">>> ������ �����������...");
				//} else {
				//    SendClientMessage(playerid, COLOR_LIGHTRED, ">>> �� �� ������ ������� ������!");
				//}
                return 1;
            }*/

            if ((newSpawnHelpTime[playerid]+5) < gettime()) {
	            for (new i=0; i<sizeof(newSpawn); i++) {
	                if (IsPlayerInRangeOfPoint(playerid,15.0,newSpawn[i][0],newSpawn[i][1],newSpawn[i][2])) {
	                    ShowPlayerDialogEx(playerid, DIALOG_SPAWN_NEW, DIALOG_STYLE_LIST, SERVERNAME, "� ��� ���� ����?\n� ���� ������?\n��� �����������\n���� �����. ��� ������� ����?\n��� �������� ����?\n��� ��������� � ��������������?\n��� � ��� ����� ����?\n���������� �����", "�������", "");
	                    newSpawnHelpTime[playerid] = gettime();
	                    return 1;
	                }
	            }
			}

            if(IsPlayerInRangeOfPoint(playerid,2.0, -1377.8251,1488.3325,11.2031)) {
			    new itemslist[1000];
			    new dHeader[100];
			    new playerBase = -1;
				for (new idxs=0; idxs<200;idxs++) {
				    if (Base[idxs][baseid] == PlayerInfo[playerid][pMember]) {
				        playerBase = idxs;
				        break;
				    }
				}
				new ZoneItemPrice = 1;
				new zoneMoney = 0;
				if (playerBase >= 0) {
				    zoneMoney = Base[playerBase][territoryCount];
				} else {
				    return 1;
				}
			    format(itemslist, sizeof(itemslist), "%s{0066FF}����������\n",itemslist);
			    if (zoneMoney >= ZoneItemPrice*2) {
			        format(itemslist, sizeof(itemslist), "%s{009933} ������� � ��������� [����:%d]\n",itemslist,ZoneItemPrice*2);
				} else {
		     		format(itemslist, sizeof(itemslist), "%s{CC0000} ������� � ��������� [����:%d]\n",itemslist,ZoneItemPrice*2);
				}
				if (zoneMoney >= ZoneItemPrice*3) {
			        format(itemslist, sizeof(itemslist), "%s{009933} �������� [����:%d]\n",itemslist,ZoneItemPrice*3);
				} else {
		     		format(itemslist, sizeof(itemslist), "%s{CC0000} �������� [����:%d]\n",itemslist,ZoneItemPrice*3);
				}
				if (zoneMoney >= ZoneItemPrice*2) {
			        format(itemslist, sizeof(itemslist), "%s{009933} ������� � ��������� [����:%d]\n",itemslist,ZoneItemPrice*2);
				} else {
		     		format(itemslist, sizeof(itemslist), "%s{CC0000} ������� � ��������� [����:%d]\n",itemslist,ZoneItemPrice*2);
				}
				if (zoneMoney >= ZoneItemPrice*4) {
			        format(itemslist, sizeof(itemslist), "%s{009933} �������� [����:%d]\n",itemslist,ZoneItemPrice*4);
				} else {
		     		format(itemslist, sizeof(itemslist), "%s{CC0000} �������� [����:%d]\n",itemslist,ZoneItemPrice*4);
				}
				if (zoneMoney >= ZoneItemPrice*3) {
			        format(itemslist, sizeof(itemslist), "%s{009933} ������� � �������� [����:%d]\n",itemslist,ZoneItemPrice*3);
				} else {
		     		format(itemslist, sizeof(itemslist), "%s{CC0000} ������� � �������� [����:%d]\n",itemslist,ZoneItemPrice*3);
				}
				if (zoneMoney >= ZoneItemPrice*4) {
			        format(itemslist, sizeof(itemslist), "%s{009933} �������� [����:%d]\n",itemslist,ZoneItemPrice*4);
				} else {
		     		format(itemslist, sizeof(itemslist), "%s{CC0000} �������� [����:%d]\n",itemslist,ZoneItemPrice*4);
				}
				if (zoneMoney >= ZoneItemPrice*7) {
			        format(itemslist, sizeof(itemslist), "%s{009933} ��� ������ [����:%d]\n",itemslist,ZoneItemPrice*7);
				} else {
		     		format(itemslist, sizeof(itemslist), "%s{CC0000} ��� ������ [����:%d]\n",itemslist,ZoneItemPrice*7);
				}
				if (zoneMoney >= ZoneItemPrice*7) {
			        format(itemslist, sizeof(itemslist), "%s{009933} ������� � �� ���� [����:%d]\n",itemslist,ZoneItemPrice*7);
				} else {
		     		format(itemslist, sizeof(itemslist), "%s{CC0000} ������� � �� ���� [����:%d]\n",itemslist,ZoneItemPrice*7);
				}
				if (zoneMoney >= ZoneItemPrice*10) {
			        format(itemslist, sizeof(itemslist), "%s{009933} �� ���� [����:%d]\n",itemslist,ZoneItemPrice*10);
				} else {
		     		format(itemslist, sizeof(itemslist), "%s{CC0000} �� ���� [����:%d]\n",itemslist,ZoneItemPrice*10);
				}
				if (zoneMoney >= ZoneItemPrice*5) {
			        format(itemslist, sizeof(itemslist), "%s{009933} ������� � ����������� �������� [����:%d]\n",itemslist,ZoneItemPrice*5);
				} else {
		     		format(itemslist, sizeof(itemslist), "%s{CC0000} ������� � ����������� �������� [����:%d]\n",itemslist,ZoneItemPrice*5);
				}
				if (zoneMoney >= ZoneItemPrice*10) {
			        format(itemslist, sizeof(itemslist), "%s{009933} ����������� �������� [����:%d]\n",itemslist,ZoneItemPrice*10);
				} else {
		     		format(itemslist, sizeof(itemslist), "%s{CC0000} ����������� �������� [����:%d]\n",itemslist,ZoneItemPrice*10);
				}
				if (zoneMoney >= ZoneItemPrice*10) {
			        format(itemslist, sizeof(itemslist), "%s{009933} ���������� [����:%d]\n",itemslist,ZoneItemPrice*10);
				} else {
		     		format(itemslist, sizeof(itemslist), "%s{CC0000} ���������� [����:%d]\n",itemslist,ZoneItemPrice*10);
				}
				if (zoneMoney >= ZoneItemPrice*25) {
			        format(itemslist, sizeof(itemslist), "%s{009933} ������� ���������� [����:%d]\n",itemslist,ZoneItemPrice*25);
				} else {
		     		format(itemslist, sizeof(itemslist), "%s{CC0000} ������� ���������� [����:%d]\n",itemslist,ZoneItemPrice*25);
				}

			    format(dHeader, sizeof(dHeader), "�� ����� ����� - %d ",zoneMoney);
				ShowPlayerDialogEx(playerid, DIALOG_ITEM_TERRITORY, DIALOG_STYLE_LIST, dHeader, itemslist, "�������", "�����");
				return 1;

			}

            if(IsPlayerInRangeOfPoint(playerid,2.0, 2334.2524, 16.0235, 25.4823) && ((PlayerInfo[playerid][lastQuest3Time] + 3600 >= gettime() && PlayerInfo[playerid][quest3Status] == 1) || PlayerInfo[playerid][pAdmin] > 100)) {
                if (centralMoneyDoor1Status == 1) {
                    centralMoneyDoor1Status = 0;
                    MoveDynamicObject(centralMoneyDoor1,2335.95, 15.35, 27.17,0.5);
                    SetTimer("closeCentralDoor1", 10000, false);
                }/* else {
                    centralMoneyDoor1Status = 1;
                    MoveDynamicObject(centralMoneyDoor1,2335.95, 17.07, 27.17,0.5);
                }*/
                return 1;
            }
            if(IsPlayerInRangeOfPoint(playerid,5.0,2356.0884, 19.6368, 12.8777) && ((PlayerInfo[playerid][lastQuest3Time] + 3600 >= gettime() && PlayerInfo[playerid][quest3Status] == 1) || PlayerInfo[playerid][pAdmin] > 100)) {
                if (centralMoneyDoor2Status == 1) {
                    centralMoneyDoor2Status = 0;
                    MoveDynamicObject(centralMoneyDoor21, 2358.30, 19.07, 13.10,0.1,   90.00, 0.00, 0.00);
					MoveDynamicObject(centralMoneyDoor22, 2358.30, 19.07, 16.06,0.1,   90.00, 0.00, 0.00);
					SetTimer("closeCentralDoor2", 20000, false);
                }/* else {
                    centralMoneyDoor2Status = 1;
                    MoveDynamicObject(centralMoneyDoor21, 2358.30, 19.07, 14.60,0.1,   90.00, 0.00, 0.00);
					MoveDynamicObject(centralMoneyDoor22, 2358.30, 19.07, 14.60,0.1,   90.00, 0.00, 0.00);
                }*/
                return 1;
            }

            if(IsPlayerInRangeOfPoint(playerid,3.5,2367.4070, 19.6072, 12.8784) && PlayerInfo[playerid][lastQuest3Time] + 3600 >= gettime() && PlayerInfo[playerid][quest3Status] == 1) {
                if (quest3BoxIsTaken[playerid] == 0) {
                    quest3BoxIsTaken[playerid] = 1;
	                new Float:dx1,Float:dy1,Float:dz1;
					GetPlayerPos(playerid,dx1,dy1,dz1);
					CreateItem(dx1,dy1,dz1,91);
	                MeChat(playerid,"����� ������ ������� ��� ������! ");
	                return 1;
				}/* else {
				    MeChat(playerid,"������, ��� ������ ������ ������� ��� ���!");
				}*/

            }


            if(IsPlayerInRangeOfPoint(playerid,2.5,caseCoord[0],caseCoord[1],caseCoord[2]) && caseCoord[0] != 0.0 && caseCoord[1] != 0.0) {
				if (PlayerInfo[playerid][pVampire] <=0 && PlayerInfo[playerid][pAdmin] <=2) {
	                SetPlayerAttachedObject(playerid,6,1210,5,0.299999,0.099999,0.000000,0.000000,-83.000000,0.000000,1.000000,1.000000,1.000000);
	                PlayerInfo[playerid][pCaseTime] = 599;
	                if(IsValidObject(caseObject)){ DestroyObject(caseObject); }
	                caseCoord[0] = 0.0;
					caseCoord[1] = 0.0;
	                new caseMsg[100];
		   			format(caseMsg, sizeof(caseMsg), "%s ����� ����! ����� ������� �� �����!",PlayerInfo[playerid][dbName]);
	                SendClientMessageToAll(COLOR_ORANGERED, caseMsg);
	                SendClientMessageToAll(COLOR_ORANGERED, "���� ��������� ����� 10 �����, ���� �� ������� � ������ ����!");
	                SendClientMessageToAll(COLOR_ORANGERED, "������ ���� ����� �������� �������������� ����!");
	                return 1;
				} else {
				    MeChat(playerid,"�� ����� ����� ����!");
				}
			}

            //new Float:xZ,Float:yZ,Float:zZ;
            //GetDynamicObjectPos(BonusBoxObj[0],xZ,yZ,zZ);
            if(IsPlayerInRangeOfPoint(playerid,3.0,BonusBox[0],BonusBox[1],BonusBox[2]) && BonusBox[0] != 0.0) {
	            BonusBox[2] = BonusBox[2]+1.0;
				switch (random(2)) {
                	case 0: {
                	    CreateItem(BonusBox[0],BonusBox[1],BonusBox[2],6);
                	    CreateItem(BonusBox[0],BonusBox[1],BonusBox[2],3);
                	    CreateItem(BonusBox[0],BonusBox[1],BonusBox[2],23);
                	    CreateItem(BonusBox[0],BonusBox[1],BonusBox[2],24);
                	    CreateItem(BonusBox[0],BonusBox[1],BonusBox[2],24);
                	    CreateItem(BonusBox[0],BonusBox[1],BonusBox[2],21);
                	    CreateItem(BonusBox[0],BonusBox[1],BonusBox[2],19);
                	    CreateItem(BonusBox[0],BonusBox[1],BonusBox[2],19);
                	    new randWeapon = random(4);
                	    if (randWeapon == 3) {
							if (3 == random(7)) {
		                	    CreateItem(BonusBox[0],BonusBox[1],BonusBox[2],66);
		                	    addPlayerAchieve(playerid,2);
							} else {
		                	    CreateItem(BonusBox[0],BonusBox[1],BonusBox[2],60);
		                	    CreateItem(BonusBox[0],BonusBox[1],BonusBox[2],60);
							}
						} else {
						    CreateItem(BonusBox[0],BonusBox[1],BonusBox[2],79);
						}
                	    MeChat(playerid,"����� ���� � ������������ �������!");
                	}
                	case 1: {
                	    CreateItem(BonusBox[0],BonusBox[1],BonusBox[2],13);
                	    CreateItem(BonusBox[0],BonusBox[1],BonusBox[2],18);
                	    CreateItem(BonusBox[0],BonusBox[1],BonusBox[2],18);
                	    CreateItem(BonusBox[0],BonusBox[1],BonusBox[2],37);
                	    CreateItem(BonusBox[0],BonusBox[1],BonusBox[2],38);
                	    CreateItem(BonusBox[0],BonusBox[1],BonusBox[2],41);
                	    CreateItem(BonusBox[0],BonusBox[1],BonusBox[2],42);
                	    new randWeapon = random(3);
                	    if (randWeapon == 0) {
	                	    //CreateItem(BonusBox[0],BonusBox[1],BonusBox[2],68);
	                	    CreateItem(BonusBox[0],BonusBox[1],BonusBox[2],76);
						} else if (randWeapon == 1) {
						    CreateItem(BonusBox[0],BonusBox[1],BonusBox[2],72);
						} else if (randWeapon == 2) {
						    CreateItem(BonusBox[0],BonusBox[1],BonusBox[2],73);
						    if (3 == random(5)) {
                                CreateItem(BonusBox[0],BonusBox[1],BonusBox[2],68);
						    }
						}
                	    MeChat(playerid,"����� ���� � �������!");
                	}
                }

                BonusBox[0] = 0.0;
                BonusBox[1] = 0.0;
                BonusBox[2] = 0.0;
                if (IsValidDynamicObject(BonusBoxObj[0])) {
			        DestroyDynamicObject(BonusBoxObj[0]);
			    }
			    if (IsValidDynamicObject(BonusBoxObj[1])) {
			        DestroyDynamicObject(BonusBoxObj[1]);
			    }
                //GangZoneHideForAll(BonusBoxZone);
                GangZoneDestroy(BonusBoxZone);
                BonusBoxIsActive = 0;
			    return 1;
			}

            for (new idxs=0; idxs<PlayerHouseCount;idxs++) {
                if (PlayerHouse[idxs][houseType] > 0 && IsPlayerInRangeOfPoint(playerid,13.0,PlayerHouse[idxs][phousex],PlayerHouse[idxs][phousey],PlayerHouse[idxs][phousez]) && PlayerHouse[idxs][ownerid] != MySQLPlayerID[playerid] && PlayerHouse[idxs][ownerid] > 0  && PlayerInfo[playerid][pAdmin] < 8) {
                    MeChat(playerid,"������, ��� ��� �� ��� ��� (((");
                    return 1;
                }
			}
			for (new idxs=0; idxs<200;idxs++) {
		        if (Base[idxs][baseid] > 0 && IsPlayerInRangeOfPoint(playerid,25.0,Base[idxs][basex],Base[idxs][basey],Base[idxs][basez]) && PlayerInfo[playerid][pMember] != Base[idxs][baseid] &&  PlayerInfo[playerid][pAdmin] < 8) {
		            MeChat(playerid,"������, ��� ��� �� ���� ��� ����� (");
		            return 1;
		        }
			}

			if (IsPlayerInRangeOfPoint(playerid,20.0,841.3795, -1738.1542, 16.0375) && PlayerInfo[playerid][pAdmin] < 8) {
	            MeChat(playerid,"������, ��� �� �� ������� �����������...");
	            return 1;
	        }

			new nearveh = GetNearestVehicle(playerid);
		    new Float:x,Float:y,Float:z;
    	    GetVehiclePos(nearveh,x,y,z);
			if (PlayerToPoint(4.0, playerid,x,y,z) && TrunkInfo[nearveh][tOpened] == 1) {
          		if(IsPlayerInAnyVehicle(playerid)) {
           			MeChat(playerid,"������, ��� ����� ����� �� ����!");
              		return 1;
       			}

       			/*new invVehTotalSize = getVehInventorySize(nearveh);
				if (invVehTotalSize+InventoryName[PlayerInventory[playerid][PlayerUseLootID[playerid]][itemType]][InvSize] < (SetVehicleFuelValue(nearveh)/2)) {
	       			new msgStr[100];
		            format(msgStr, sizeof(msgStr), "������� %s � ��������!",Loot[dropLootID][lootName]);
		            MeChat(playerid,msgStr);
		            PutItemToVeh(nearveh,InventoryName[PlayerInventory[playerid][PlayerUseLootID[playerid]][itemType]][InvType],PlayerInventory[playerid][PlayerUseLootID[playerid]][itemCount]);
		            DeleteItemFromInventory(playerid,PlayerUseLootID[playerid]);
				} else {
				    MeChat(playerid,"�����, ��� ������ ��� ����� � ���������!");
				}*/
				new invTotalSize = 0;
				for (new zz=0; zz<VipCarCount;zz++) {
				    if (nearveh == VipCar[zz][vehid]) {
				        for (new i=0; i<100; i++) {
							if (VehInventory[zz][i][itemType] > 0) {
							    format(lootTakeStr, sizeof(lootTakeStr), "%s%s\n",lootTakeStr, InventoryName[VehInventory[zz][i][itemType]][InvName]);
							    invTotalSize +=InventoryName[VehInventory[zz][i][itemType]][InvSize];
                                found = 1;
							}
						}
					}
				}
				if (found == 1) {
		   			LoopingAnim(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,0);
		   			new header[100];
		   			format(header, sizeof(header), "����� �� ��������� %d/%d",invTotalSize, (floatround(SetVehicleFuelValue(nearveh)/2)-1));


					ShowPlayerDialogEx(playerid, DIALOG_TYPE_TAKE_VEH_LOOT, DIALOG_STYLE_LIST, header, lootTakeStr, "�����", "�����");
				} else {
					MeChat(playerid,"�� ����� ������ � ���������!");
				}
			    return 1;
			}


			for (new idxs=0; idxs<sizeof(PlayerCase);idxs++) {
		        if (PlayerCase[idxs][playerCaseIsOpen] == 1 && IsPlayerInRangeOfPoint(playerid,1.0,PlayerCase[idxs][playerCaseX],PlayerCase[idxs][playerCaseY],PlayerCase[idxs][playerCaseZ])) {
		            if(IsPlayerInAnyVehicle(playerid)) {
	           			MeChat(playerid,"������, ��� ����� ����� �� ����!");
	              		return 1;
	       			}
	       			new invTotalSize = 0;
	       			for (new i=0; i<100; i++) {
						if (PlayerCaseLoot[idxs][i][playerCaseLootType] > 0) {
						    format(lootTakeStr, sizeof(lootTakeStr), "%s%s\n",lootTakeStr, InventoryName[PlayerCaseLoot[idxs][i][playerCaseLootType]][InvName]);
						    invTotalSize +=InventoryName[PlayerCaseLoot[idxs][i][playerCaseLootType]][InvSize];
                            found = 1;
						}
					}
					if (found == 1) {
			   			LoopingAnim(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,0);
			   			new header[100];
			   			format(header, sizeof(header), "����� �� ������� %d/%d",invTotalSize, PlayerCase[idxs][playerCaseSize]);
						ShowPlayerDialogEx(playerid, DIALOG_TYPE_TAKE_CASE_LOOT, DIALOG_STYLE_LIST, header, lootTakeStr, "�����", "�����");
					} else {
						MeChat(playerid,"�� ����� ������ � �������!");
					}
					return 1;
		        }
			}


            for (new i=0; i<maxRandomLoot; i++) {
                if (RandomLoot[i][lootid] > 0 && IsPlayerInRangeOfPoint(playerid,1.5,RandomLoot[i][lootx],RandomLoot[i][looty],RandomLoot[i][lootz]) && RandomLoot[i][lootVW] == GetPlayerVirtualWorld(playerid)) {
                    //SendClientMessage(playerid, COLOR_WHITE, "LOOT!");
                    format(lootTakeStr, sizeof(lootTakeStr), "%s%s\n",lootTakeStr, RandomLoot[i][lootName]);
                    found = 1;
                }
			}
			for (new i=0; i<maxLoot; i++) {
                if (Loot[i][lootid] > 0 && IsPlayerInRangeOfPoint(playerid,1.5,Loot[i][lootx],Loot[i][looty],Loot[i][lootz]) && Loot[i][lootVW] == GetPlayerVirtualWorld(playerid)) {
                    //SendClientMessage(playerid, COLOR_WHITE, "LOOT!");
                    format(lootTakeStr, sizeof(lootTakeStr), "%s%s\n",lootTakeStr, Loot[i][lootName]);
                    found = 1;
                }
			}
			if (found == 1) {
	   			LoopingAnim(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,0);
				ShowPlayerDialogEx(playerid, DIALOG_TYPE_TAKE_RANDOM_LOOT, DIALOG_STYLE_LIST, "�����", lootTakeStr, "�����", "�����");
			}
			return 1;
        } else if (newkeys & 65536) {

            /*if(GetPlayerAnimationIndex(playerid)) {
                new animlib[32], animname[32];
	        	GetAnimationName(GetPlayerAnimationIndex(playerid),animlib,32,animname,32);
    	    	if(strfind(animname, "jump", true) != -1 || strfind(animname, "fall", true) != -1) {
    	        	return 1;
				}
    	    }*/

    	    new Float: PosX, Float: PosY, Float: PosZ;
			GetPlayerPos(playerid, PosX, PosY, PosZ);
			//printf("%f",PosZ);
			playerInWater[playerid] = 0;
			if (PosZ <= 0.0 && GetPlayerVirtualWorld(playerid) == 0) {
			    if(GetPlayerAnimationIndex(playerid)) {
					new specAnimlib[32], specAnimname[32];
			        GetAnimationName(GetPlayerAnimationIndex(playerid), specAnimlib, sizeof(specAnimlib), specAnimname, sizeof(specAnimname));
			        //printf("%s %s",specAnimlib,specAnimname);
			        if(strfind(specAnimlib, "SWIM", true) != -1 || strfind(specAnimname, "Swim_Tread", true) != -1) {
			            playerInWater[playerid] = 1;
			        }
		   		}
			}

            if (PlayerFishing[playerid] == 1) {
                return 1;
            }
            if (IsPlayerInRangeOfPoint(playerid,20.0,841.3795, -1738.1542, 16.0375) && PlayerInfo[playerid][pAdmin] < 8) {
	            MeChat(playerid,"������, ��� �� �� ������� �����������...");
	            return 1;
	        }
            new invStr[4000];
            new invTotalSize = 0;
			for (new z=1; z<PlayerInventoryMaxLimit; z++) {
			    if (PlayerInventory[playerid][z][itemType] > 0) {
			        new brokeStr[30];
					if (InventoryName[PlayerInventory[playerid][z][itemType]][invHealth] > 0) {
						if (PlayerInventory[playerid][z][itemHealth] <=0) {
						    format(brokeStr, sizeof(brokeStr), " {FF0000}������");
						    PlayerInventory[playerid][z][itemHealth] = 0;
						} else {
						    format(brokeStr, sizeof(brokeStr), " {009933}�:%d",PlayerInventory[playerid][z][itemHealth]);
						}
					}
					if (PlayerInventory[playerid][z][itemCount] > 1) {
					    if (PlayerInventory[playerid][z][itemCount] < 100000) {
						    if (PlayerInventory[playerid][z][itemLock] > 0) {
	                            format(invStr, sizeof(invStr), "%s{FF9900}%s [���: %d / ���: %d]%s\n",invStr, InventoryName[PlayerInventory[playerid][z][itemType]][InvName],InventoryName[PlayerInventory[playerid][z][itemType]][InvSize],PlayerInventory[playerid][z][itemCount],brokeStr);
				        	} else {
						        format(invStr, sizeof(invStr), "%s{D1DBD0}%s [���: %d / ���: %d]%s\n",invStr, InventoryName[PlayerInventory[playerid][z][itemType]][InvName],InventoryName[PlayerInventory[playerid][z][itemType]][InvSize],PlayerInventory[playerid][z][itemCount],brokeStr);
							}
						} else {
						    format(invStr, sizeof(invStr), "%s{D1DBD0}%s [���: %d / #%d]%s\n",invStr, InventoryName[PlayerInventory[playerid][z][itemType]][InvName],InventoryName[PlayerInventory[playerid][z][itemType]][InvSize],PlayerInventory[playerid][z][itemCount],brokeStr);
						}
					} else {
					    if (PlayerInventory[playerid][z][itemLock] > 0) {
					        format(invStr, sizeof(invStr), "%s{FF9900}%s [���: %d]%s\n",invStr, InventoryName[PlayerInventory[playerid][z][itemType]][InvName],InventoryName[PlayerInventory[playerid][z][itemType]][InvSize],brokeStr);
					    } else {
						    format(invStr, sizeof(invStr), "%s{D1DBD0}%s [���: %d]%s\n",invStr, InventoryName[PlayerInventory[playerid][z][itemType]][InvName],InventoryName[PlayerInventory[playerid][z][itemType]][InvSize],brokeStr);
						}
					}
			        invTotalSize +=InventoryName[PlayerInventory[playerid][z][itemType]][InvSize];
				}
			}
			new invHeader[40];
			format(invHeader, sizeof(invHeader), "� ��������� ����� �����: [%d/%d]",invTotalSize, (PlayerInfo[playerid][PlayerInventoryLimit]-1));
			if (invTotalSize > 0) {
				ShowPlayerDialogEx(playerid, DIALOG_TYPE_INVENTARY, DIALOG_STYLE_LIST, invHeader, invStr, "������", "�����");
				LoopingAnim(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,0);
			} else {
			    ShowPlayerDialogEx(playerid, DIALOG_TYPE_INVENTARY_EMPTY, DIALOG_STYLE_LIST, invHeader, "�����", "������", "�����");
			}

			return 1;
        }
    }
	new playerVehicleID = GetPlayerVehicleID(playerid);
	if(playerVehicleID > 0 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER && VipCarBooster[playerVehicleID] > 0 && (newkeys & KEY_ACTION || newkeys & KEY_FIRE)) {
	    new component;
	    component = GetVehicleComponentInSlot(playerVehicleID, CARMODTYPE_NITRO);
	    if (component == 1010) {
	        RemoveVehicleComponent(playerVehicleID,1010);
	        AddVehicleComponent(playerVehicleID, 1010);
	    } else {
	        AddVehicleComponent(playerVehicleID, 1010);
	    }
	    return 1;
	}


	/*if (PlayerInfo[playerid][pAdmin] >= 100 && !IsPlayerInAnyVehicle(playerid) && newkeys & 262144) {

	}*/

	//----------------------------------------

	if (playerVehicleID > 0 && (newkeys & KEY_ACTION)&&(IsPlayerInAnyVehicle(playerid))&&(GetPlayerState(playerid)==PLAYER_STATE_DRIVER))
	{
	    if (GetVehicleModel(playerVehicleID) == 525 || PlayerInfo[playerid][pAdmin] >= 100) {
		    new Float:pX,Float:pY,Float:pZ;
	    	GetPlayerPos(playerid,pX,pY,pZ);
		    new Float:vX,Float:vY,Float:vZ;
		    new Found=0;
	    	new vid=0;
	        while((vid<MAX_VEHICLES)&&(!Found)) {
		        vid++;
	    	    GetVehiclePos(vid,vX,vY,vZ);
	            if ((floatabs(pX-vX)<7.0)&&(floatabs(pY-vY)<7.0)&&(floatabs(pZ-vZ)<7.0)&&(vid!=playerVehicleID)) {
		            Found=1;
	                if (IsTrailerAttachedToVehicle(playerVehicleID)) {
		                DetachTrailerFromVehicle(playerVehicleID);
	                } else {
	    	        	AttachTrailerToVehicle(vid,playerVehicleID);
					}
	            }
	        }
	        if (!Found) {
	        }
	    }
	}

    //if (newkeys == 262144) OnPlayerCommandText(playerid,"/radiofm"); //262144 - ��� id ������� R

    if (newkeys == KEY_CROUCH) { // 2 ��� �� ������, �� �������
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
		    showLog[playerid] = 1;
		    if (PlayerInfo[playerid][pAdmin] > 100) {
		        ShowPlayerDialogEx(playerid, DIALOG_TYPE_CAR_WORKSHOP, DIALOG_STYLE_LIST, "��������������", DIALOG_TYPE_CAR_WORKSHOP_TEXT, "�����", "�������");
			}
			showLog[playerid] = 0;
		}
	}
	if (newkeys == 16) {

	}



	//if((newkeys & KEY_SPRINT && newkeys & KEY_JUMP)) {
	if (PlayerInfo[playerid][pPain] == 1 && newkeys & KEY_JUMP) {
	    if(!IsPlayerInAnyVehicle(playerid)) {
	        //if(BunnyHoppingTime[playerid] > 15) {
		        SetCameraBehindPlayer(playerid);
		 		//BunnyHoppingTime[playerid] = 0;
		    	ClearAnimations(playerid, 1);
		    	clearanim[playerid] = 15;
		   		ApplyAnimation(playerid, "PED", "FLOOR_hit_f", 4.1, 0, 1, 1, 1, 1400, 1);
        	//}
        	//BunnyHoppingTime[playerid] += 5;
        }
	}

	if(newkeys & KEY_FIRE
		|| (newkeys & KEY_SPRINT && newkeys & KEY_FIRE )
		|| (newkeys & KEY_SPRINT && newkeys & KEY_SECONDARY_ATTACK)
		|| newkeys & KEY_ACTION && newkeys & KEY_HANDBRAKE
		) {
		//all ways to "fire"
	}


   	if(newkeys & KEY_HANDBRAKE  && newkeys & KEY_SECONDARY_ATTACK ) {

	} else if (newkeys == KEY_SUBMISSION) {
		OnPlayerCommandText(playerid,"/en");
		return 1;
	} else if (newkeys & 65536) {
        if(playerVehicleID > 0 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
            new carMenu[500];
            format(carMenu,sizeof(carMenu), "{009900}�������/��������� ���������\n{FF9900}�������/������� ��������\n{CCFFCC}�������/������� �����\n{CCFFCC}���/���� ����\n{FF6600}��������� ����(�� ��������)\n{FFFFFF}�������/������� ����\n{FF9900}���/���� ����");
            if ((VipCar[VipCarFastId[playerVehicleID]][OwnerOrg] >= 0 || VipCar[VipCarFastId[playerVehicleID]][carOwnerId] > 0) && VipCar[VipCarFastId[playerVehicleID]][carOwnerTime] > gettime()) {
			    format(carMenu,sizeof(carMenu), "%s\n{009900}������� %s",carMenu,ConvertNoSec(VipCar[VipCarFastId[playerVehicleID]][carOwnerTime] - gettime()));
			} else if ((VipCar[VipCarFastId[playerVehicleID]][superLock] == 1 || VipCar[VipCarFastId[playerVehicleID]][superLock] == 3) && (getCarDonatePriceForPlayer(playerVehicleID,VipCarFastId[playerVehicleID]) > 0 || getCarDonatePriceForClan(playerVehicleID,VipCarFastId[GetPlayerVehicleID(playerid)]) > 0) && VipCarFastId[playerVehicleID] >= 10) {
			    format(carMenu,sizeof(carMenu), "%s\n{009900}������ ��� ����",carMenu);
			} else {
			    format(carMenu,sizeof(carMenu), "%s\n ---",carMenu);
			}
            if (GetVehicleModel(playerVehicleID) == 554 && VipCar[VipCarFastId[playerVehicleID]][ExtraTuning] == 1) {
	            format(carMenu,sizeof(carMenu), "%s\n{FF0000}������ (��������: %d)",carMenu,VipCar[VipCarFastId[playerVehicleID]][rocket]);
			}
            ShowPlayerDialogEx(playerid, DIALOG_TYPE_DO_VEH, DIALOG_STYLE_LIST, "���������� �����������",carMenu,"OK", "�������");
			return 1;
  		}
	} else if (newkeys & 131072) {
	    if (IsPlayerInRangeOfPoint(playerid,3.0,154.2840,-1945.3433,4.5971)) {
	        new Float:xZ,Float:yZ,Float:zZ;
	        GetObjectPos(SubmarineObj,xZ,yZ,zZ);
	        CP[playerid] = 0;
			SendClientMessage(playerid, COLOR_WHITE, "����� �� ����� �������� ������� ������");
			SetPlayerCheckpoint(playerid, xZ,yZ,zZ,5);
			MeChat(playerid,"��������� �� ��� �� �����, ��� ��������� ��������!");
	        return 1;
	    }
	    if(PlayerInfo[playerid][pAdmin] > 7) {
			if (IsPlayerInRangeOfPoint(playerid,3.0,984.58, -2169.15, 13.28)) {
			    if (basedoor1IsOpen == 0) {
				    basedoor1IsOpen = 1;
				    MoveDynamicObject(basedoor1,985.20, -2168.68, 12.20,1,  0.00, 0.00, -612.3571);
				    return 1;
				} else {
				    basedoor1IsOpen = 0;
				    MoveDynamicObject(basedoor1,985.20, -2168.68, 12.21,1,  0.00, 0.00, -512.52);
				    return 1;
				}
			} else if (IsPlayerInRangeOfPoint(playerid,3.0,984.69, -2179.32, 13.65)) {
			    if (basedoor2IsOpen == 0) {
				    basedoor2IsOpen = 1;
				    MoveDynamicObject(basedoor2,985.41, -2179.06, 12.36,1,  0.00, 0.00, -406.2609);
				    return 1;
				} else {
				    basedoor2IsOpen = 0;
				    MoveDynamicObject(basedoor2,985.41, -2179.06, 12.37,1,  0.00, 0.00, -512.52);
				    return 1;
				}
			} else if (IsPlayerInRangeOfPoint(playerid,3.0,979.81, -2175.34, 16.10)) {
			    if (basedoor3IsOpen == 0) {
				    basedoor3IsOpen = 1;
				    MoveDynamicObject(basedoor3,980.56, -2174.96, 15.09,1,  0.00, 0.00, -610.9795);
				    return 1;
				} else {
				    basedoor3IsOpen = 0;
				    MoveDynamicObject(basedoor3,980.56, -2174.96, 15.10,1,  0.00, 0.00, -512.52);
				    return 1;
				}
			}
	    }
	    if (IsPlayerInRangeOfPoint(playerid,20.0,841.3795, -1738.1542, 16.0375) && PlayerInfo[playerid][pAdmin] < 8) {
            MeChat(playerid,"������, ��� �� �� ������� �����������...");
            return 1;
        }
	    if (PlayerActiveUseMenu[playerid] == 0) {
	        ShowPlayerDialogEx(playerid, DIALOG_TYPE_DO, DIALOG_STYLE_LIST, "��������",DIALOG_TYPE_DO_MENU,"������", "�����");
	    } else if (PlayerActiveUseMenu[playerid] == 1) {
	        if (PlayerInfo[playerid][pBonus] == 1 && PlayerInfo[playerid][pBonusMoney] == 0) {
		        ShowPlayerDialogEx(playerid, DIALOG_TYPE_DO_HOUSE, DIALOG_STYLE_LIST, "����","{ff5a00}���������� ��������� ��� [3-30 �����,5��.]\n{ff5a00}���������� ��������� ����� [10 ����]\n{ff5a00}��������� ���\n{ff5a00}����������� ���\n{01c10e}������ ����\n{01c10e}��� ����\n{cf1f1f}��������� ���\n{ff8800}�����-���","OK", "�����");
		    } else {
		        ShowPlayerDialogEx(playerid, DIALOG_TYPE_DO_HOUSE, DIALOG_STYLE_LIST, "����","{ff5a00}���������� ��������� ��� [3-30 �����,5��.]\n{ff5a00}���������� ��������� ����� [10 ����]\n{ff5a00}��������� ���\n{ff5a00}����������� ���\n{01c10e}������ ����\n{01c10e}��� ����\n{cf1f1f}��������� ���","OK", "�����");
			}
	    } else if (PlayerActiveUseMenu[playerid] == 2) {
	        ShowPlayerDialogEx(playerid, DIALOG_TYPE_DO_WALL, DIALOG_STYLE_LIST, "�����","{c0ff00}��������� �����(1 ������)\n{8cba00}����������� �����\n{8cba00}��������� �����\n{8cba00}������� �����\n{8cba00}�������� �����\n{8cba00}������� ������� �� �����\n{8cba00}������� ������� �� �����\n{8cba00}�������� ����� (����� ������)","OK", "�����");
	    } else if (PlayerActiveUseMenu[playerid] == 3) {
	        ShowPlayerDialogEx(playerid, DIALOG_TYPE_DO_GATE, DIALOG_STYLE_LIST, "������","{0090ff}��������� ������(3 ������)\n{016dc1}����������� ������\n{016dc1}��������� ������\n{016dc1}�������� ��� �����","OK", "�����");
	    } else if (PlayerActiveUseMenu[playerid] == 4) {
	        ShowPlayerDialogEx(playerid, DIALOG_TYPE_DO_BASE, DIALOG_STYLE_LIST, "����",
			"{ff8800}������������ ���������� (����� � ���)\n{A3A375}������� ����/��������� ���� �����(60 ������+15 �������)\n{A3A375}����������� ����\n{A3A375}�������� ��� �����\n{A3A375}�������� ������������ �����\n{A3A375}������ ������ �����\n{A3A375}������� � ����\n{A3A375}�������� ����\n{A3A375}������� �� ����� (����� ������)\n{A3A375}������� �� ����� (����� �������)\n{CC0000}������\n{A3A375}������� ���� (20 ������+30 �������)\n����� �� �����\n�������� ����\n����������\n{A3A375}���������� >>",
			"OK", "�����");
	    } else if (PlayerActiveUseMenu[playerid] == 5) {
	        ShowPlayerDialogEx(playerid, DIALOG_TYPE_DO_OBJECTS, DIALOG_STYLE_LIST, "�������","{0090ff}����������\n{016dc1}�����������\n{016dc1}����������","OK", "�����");
		} else if (PlayerActiveUseMenu[playerid] == 6) {
         	ShowPlayerDialogEx(playerid, DIALOG_TYPE_DO_OIL, DIALOG_STYLE_LIST, "�����","{ff5a00}��������� �������� �����(30 ������)\n{ff5a00}��������� �������� �����\n{cf1f1f}��������� �������� �����\n{01c10e}������ �������� �����\n{01c10e}��� ��� �����\n{8cba00}�������� ����� (20 ������)\n{CC0000}������","OK", "�����");
		} else if (PlayerActiveUseMenu[playerid] == 7) {
			//ShowPlayerDialogEx(playerid, DIALOG_TYPE_DO_TERRITORY, DIALOG_STYLE_LIST, "����������","{ff5a00}������ ��� ��� ����������\n{A3A375}������ ������ ����������\n{CC0000}������ �� �����������","OK", "�����");
   			ShowPlayerDialogEx(playerid, DIALOG_TYPE_DO_CASE, DIALOG_STYLE_LIST, "�������","{ff5a00}���������� ������\n{A3A375}�������/������� ������\n{A3A375}������� ������\n{CC0000}���������� ������\n{A3A375}������","OK", "�����");
		}

	    /*ShowPlayerDialogEx(playerid, DIALOG_TYPE_DO, DIALOG_STYLE_LIST, "��������",
		"{01c10e}������� ������\n{01c10e}������� ������\n{ff8800}��������� ������\n{ff8800}��������� ������\n{ff5a00}���������� ��������� ��� [3-30 �����]\n{ff5a00}��������� ���\n{c0ff00}��������� �����(1 ������)\n{8cba00}����������� �����\n{8cba00}��������� �����\n{8cba00}������� �����\n{8cba00}�������� �����\n{8cba00}������� ������� �� �����\n{0090ff}��������� ������(3 ������)\n{016dc1}����������� ������\n{016dc1}��������� ������\n{016dc1}�������� ��� �����",
		"������", "�����");*/
	    showLog[playerid] = 1;
		//OnPlayerCommandText(playerid,"/lock");
		showLog[playerid] = 0;
		return 1;
	}/* else if (newkeys & 256) {
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
		    showLog[playerid] = 1;
			//OnPlayerCommandText(playerid,"/neon");
			LeftTurn(GetPlayerVehicleID(playerid));
			showLog[playerid] = 0;
			return 1;
  		}
	} else if (newkeys & 64) {
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
		    showLog[playerid] = 1;
			RightTurn(GetPlayerVehicleID(playerid));
			showLog[playerid] = 0;
			return 1;
  		}
	}*/



	return 1;
}
