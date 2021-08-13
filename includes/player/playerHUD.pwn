forward showHungry(playerid);
public showHungry(playerid) {
	if (!IsPlayerConnected(playerid)) return 1;
	if (IsPlayerNPC(playerid)) return 1;
	if (PlayerInfo[playerid][pHungry] > 4000) {
	    PlayerInfo[playerid][pHungry] = 4000;
	}
	if (PlayerInfo[playerid][pThirsty] > 4000) {
	    PlayerInfo[playerid][pThirsty] = 4000;
	}
	if (PlayerInfo[playerid][pVampire] == 0) {
		if (PlayerInfo[playerid][pHungry] < 0) {
		    PlayerInfo[playerid][pHungry] = 0;
		    new Float:newHP;
			GetPlayerHealthAC(playerid,newHP);
			newHP -= 2.0;

			if (newHP <= 0) {
			    trueKill[playerid] = 1;
			    playerSpawnCheat[playerid] = 0;
			    newHP = -10.0;
			    printf("[Server] True Kill %s[%d] | reason: hunger", PlayerInfo[playerid][dbName],playerid);
			    if (PlayerInfo[playerid][pHungerSkill] < 15) {
				    PlayerInfo[playerid][pHungerSkill]--;
				}
			    if (PlayerInfo[playerid][pHungerSkill] < 0) {
				    PlayerInfo[playerid][pHungerSkill] = 0;
				}
			}
			SetPlayerHealthAC(playerid, newHP);
			SetPlayerHealth(playerid, newHP);
			PlayerInfo[playerid][pHP] = floatround(newHP);
			PlayerHealth[playerid] = newHP;
		}
		if (PlayerInfo[playerid][pThirsty] < 0) {
		    PlayerInfo[playerid][pThirsty] = 0;
		    new Float:newHP;
			GetPlayerHealthAC(playerid,newHP);
			newHP -= 2.0;

			if (newHP <= 0) {
			    trueKill[playerid] = 1;
			    playerSpawnCheat[playerid] = 0;
			    newHP = -10.0;
			    printf("[Server] True Kill %s[%d] | reason: thirsty", PlayerInfo[playerid][dbName],playerid);
			}
			SetPlayerHealthAC(playerid, newHP);
			SetPlayerHealth(playerid, newHP);
			PlayerInfo[playerid][pHP] = floatround(newHP);
			PlayerHealth[playerid] = newHP;
		}
		if (showHungryTime[playerid]+50 < gettime()) {
		    if (PlayerInfo[playerid][pHungry] == 0) {
				MeChat(playerid,"сильно хочет есть!");
			}
			if (PlayerInfo[playerid][pThirsty] == 0) {
				MeChat(playerid,"сильно хочет пить!");
			}
			showHungryTime[playerid] = gettime();
		}
	} else if (PlayerInfo[playerid][pHungry] < 500 && PlayerInfo[playerid][pVampire] == 1) {
		if (PlayerInfo[playerid][pHungry] <= 0) {
		    PlayerInfo[playerid][pVampire] = 0;
		    RemovePlayerWeaponGMode(playerid, 1);
		    SetPlayerSkin(playerid,PlayerInfo[playerid][pChar]);
		    trueKill[playerid] = 1;
		    playerSpawnCheat[playerid] = 0;
		    printf("[Server] True Kill %s[%d] | reason: Vampire hunger", PlayerInfo[playerid][dbName],playerid);
		    SetPlayerHealthAC(playerid, -1000.0);
		    SetPlayerHealth(playerid, -1000.0);
			PlayerInfo[playerid][pHP] = -1000;
			PlayerHealth[playerid] = -1000.0;
            PlayerInfo[playerid][pSick] = 0;
            PlayerInfo[playerid][pHospital] = 0;
			MeChat(playerid,"умер от недостатка крови!");
		}
		SendClientMessage(playerid, COLOR_LIGHTRED, "уверен, что без крови скоро умрет!");
	}
	new Float:out = float(100-(PlayerInfo[playerid][pHungry]/40));
	if (out < 0) {
	    out = 2.0;
	}
	if (out > 100) {
	    out = 100.0;
	}
	out = 100.0 - out;

	SetPlayerProgressBarValue(playerid,barHungry[playerid],out);
	UpdatePlayerProgressBar(playerid,barHungry[playerid]);

	new Float:outT = float(100-(PlayerInfo[playerid][pThirsty]/40));
	if (outT < 0) {
	    outT = 2.0;
	}
	if (outT > 100) {
	    outT = 100.0;
	}
	outT = 100.0 - outT;

	SetPlayerProgressBarValue(playerid,barThirsty[playerid],outT);
	UpdatePlayerProgressBar(playerid,barThirsty[playerid]);
	/*
	SetPlayerProgressBarValue(playerid,barStamina[playerid],float(stamina[playerid]*2));
	UpdatePlayerProgressBar(playerid,barStamina[playerid]);*/
	return 1;
}


forward PlayerInfoClearChat(playerid);
public PlayerInfoClearChat(playerid) {
	for (new i=0; i<15;i++) {
	    strmid(PlayerInfoChatText[playerid][i], " ", 0, 50);
	}
	return 1;
}
forward PlayerInfoRenewChat(playerid);
public PlayerInfoRenewChat(playerid) {
    PlayerInfoClearChat(playerid);
    if (showStats[playerid] == 1) {
		new infostr[50];
		format(infostr, 50, "HUMAN Killed: %d",PlayerInfo[playerid][pKills]);
		PlayerInfoChatAddString(playerid,infostr);
		format(infostr, 50, "DEER Killed: %d / INFECTED Killed: %d",PlayerInfo[playerid][pDeerKills],PlayerInfo[playerid][zombieKilled]);
		PlayerInfoChatAddString(playerid,infostr);
		/*format(infostr, 50, "INFECTED Killed: %d",PlayerInfo[playerid][zombieKilled]);
		PlayerInfoChatAddString(playerid,infostr);*/
		if (PlayerInfo[playerid][cocainTime] > 0 && PlayerInfo[playerid][cocainTime] > gettime()) {
		    format(infostr, 50, "Desert Eagle SKILL: COCAINE");
			PlayerInfoChatAddString(playerid,infostr);
			format(infostr, 50, "Shotgun SKILL: COCAINE");
			PlayerInfoChatAddString(playerid,infostr);
			format(infostr, 50, "MP5 SKILL: COCAINE");
			PlayerInfoChatAddString(playerid,infostr);
			format(infostr, 50, "AK-47 SKILL: COCAINE");
			PlayerInfoChatAddString(playerid,infostr);
		} else {
			format(infostr, 50, "Desert Eagle SKILL: %d/999",PlayerInfo[playerid][pDesert]);
			PlayerInfoChatAddString(playerid,infostr);
			format(infostr, 50, "Shotgun SKILL: %d/999",PlayerInfo[playerid][pShot]);
			PlayerInfoChatAddString(playerid,infostr);
			format(infostr, 50, "MP5 SKILL: %d/999",PlayerInfo[playerid][pSmg]);
			PlayerInfoChatAddString(playerid,infostr);
			format(infostr, 50, "AK-47 SKILL: %d/999",PlayerInfo[playerid][pAk]);
			PlayerInfoChatAddString(playerid,infostr);
		}
		format(infostr, 50, "Hunger SKILL: %d/15",PlayerInfo[playerid][pHungerSkill]);
		PlayerInfoChatAddString(playerid,infostr);
		if (PlayerInfo[playerid][pParrot] == 1) {
			format(infostr, 50, "Parrot SKILL: %d",PlayerInfo[playerid][pParrotExp]);
			PlayerInfoChatAddString(playerid,infostr);
			format(infostr, 50, "Parrot hunger: %d/1000",PlayerInfo[playerid][pParrotHunger]);
			PlayerInfoChatAddString(playerid,infostr);
		} else {
		    //format(infostr, 50, "Hunger SKILL: %d/15",PlayerInfo[playerid][pHungerSkill]);
			//PlayerInfoChatAddString(playerid,infostr);
		}
		if (PlayerInfo[playerid][defenceSuit] == 1) {
		    format(infostr, 50, "DEFENCE SUIT ENERGY: %d/1000",PlayerInfo[playerid][defenceSuitEnergy]);
			PlayerInfoChatAddString(playerid,infostr);
		} else {
			PlayerInfoChatAddString(playerid," ");
		}
		if (PlayerInfo[playerid][defenceSuit] == 1) {
		    format(infostr, 50, "SUIT MODULES:");
		    if (PlayerInfo[playerid][defenceSuitPainDef] == 1) {
			    format(infostr, 50, "%s PD",infostr);
			}
			if (PlayerInfo[playerid][defenceSuitVirusDef] == 1) {
			    format(infostr, 50, "%s VD",infostr);
			}
			if (PlayerInfo[playerid][defenceSuitArmourRegen] == 1) {
			    format(infostr, 50, "%s AR",infostr);
			}
			if (PlayerInfo[playerid][defenceSuitZombieDef] == 1) {
			    format(infostr, 50, "%s ZD",infostr);
			}
		PlayerInfoChatAddString(playerid,infostr);
		} else {
		PlayerInfoChatAddString(playerid," ");
		}
		format(infostr, 50, "MEAT AT SUBMARINE: %d",PlayerInfo[playerid][pMeatAccount]);
		PlayerInfoChatAddString(playerid,infostr);
		/*if (PlayerInfo[playerid][antiDrop] > 0) {
			format(infostr, 50, "ANTI DROP: %s",ConvertNoSec(PlayerInfo[playerid][antiDrop] - gettime()));
		} else {
		    format(infostr, 50, "ANTI DROP: NO ACTIVE");
		}*/
		if (PlayerInfo[playerid][pVIPtime] > 0) {
			format(infostr, 50, "VIP: %s",ConvertNoSec(PlayerInfo[playerid][pVIPtime] - gettime()));
		} else {
		    format(infostr, 50, "VIP: NO ACTIVE");
		}

		PlayerInfoChatAddString(playerid,infostr);
		if (PlayerInfo[playerid][antiHunger] > 0) {
			format(infostr, 50, "ANTI HUNGER: %s",ConvertNoSec(PlayerInfo[playerid][antiHunger] - gettime()));
		} else {
		    format(infostr, 50, "ANTI HUNGER: NO ACTIVE");
		}
		PlayerInfoChatAddString(playerid,infostr);
		format(infostr, 50, "CHATLY: %d / CASH: %d RUR",PlayerInfo[playerid][chatly], PlayerInfo[playerid][realMoney]);
		PlayerInfoChatAddString(playerid,infostr);
		if (PlayerInfo[playerid][lastShotTime]+120 > gettime()) {
		    /*PlayerInfoChatAddString(playerid," ");
		    format(infostr, 50, "~r~ANTI QUIT: %s",Convert((PlayerInfo[playerid][lastShotTime]+120) - gettime()));
		    PlayerInfoChatAddString(playerid,infostr);*/
		    new newstring[50];
		    format(newstring, 50, "~r~ANTI QUIT: %s",Convert((PlayerInfo[playerid][lastShotTime]+120) - gettime()));
		    GameTextForPlayer(playerid, newstring, 1500, 6);
		}
	}
	PlayerInfoChatRedraw(playerid);
	return 1;
}

forward PlayerInfoChatUpdate(playerid,newstring[]);
public PlayerInfoChatUpdate(playerid,newstring[]) {
    if (!IsPlayerConnected(playerid)) return 1;
	if (IsPlayerNPC(playerid)) return 1;
	if (gPlayerLogged[playerid] == 0) return 1;
	for (new i=0; i<14;i++) {
	    strmid(PlayerInfoChatText[playerid][i], PlayerInfoChatText[playerid][i+1], 0, 50);
	}
	strmid(PlayerInfoChatText[playerid][14], newstring, 0, 50);

	new output[1000];
	for (new i=0; i<15;i++) {
	    format(output,sizeof(output),"%s%s~n~",output,PlayerInfoChatText[playerid][i]);
	}
	PlayerTextDrawSetString(playerid,PlayerInfoChat[playerid],output);
	return 1;
}
forward PlayerInfoChatAddString(playerid,newstring[]);
public PlayerInfoChatAddString(playerid,newstring[]) {
    if (!IsPlayerConnected(playerid)) return 1;
	if (IsPlayerNPC(playerid)) return 1;
	if (gPlayerLogged[playerid] == 0) return 1;
	for (new i=0; i<14;i++) {
	    strmid(PlayerInfoChatText[playerid][i], PlayerInfoChatText[playerid][i+1], 0, 50);
	}
	strmid(PlayerInfoChatText[playerid][14], newstring, 0, 50);
	return 1;
}
forward PlayerInfoChatRedraw(playerid);
public PlayerInfoChatRedraw(playerid) {
    if (!IsPlayerConnected(playerid)) return 1;
	if (IsPlayerNPC(playerid)) return 1;
	if (gPlayerLogged[playerid] == 0) return 1;
	new output[1000];
	for (new i=0; i<15;i++) {
	    format(output,sizeof(output),"%s%s~n~",output,PlayerInfoChatText[playerid][i]);
	}
	PlayerTextDrawSetString(playerid,PlayerInfoChat[playerid],output);
	return 1;
}

forward updatePlayerInvHUD(playerid);
public updatePlayerInvHUD(playerid) {

    new invTotalSize = 0;
	for (new z=1; z<PlayerInventoryMaxLimit; z++) {
	    if (PlayerInventory[playerid][z][itemType] > 0) {
	        invTotalSize +=InventoryName[PlayerInventory[playerid][z][itemType]][InvSize];
		}
	}

	new invHeader[40];
	format(invHeader, sizeof(invHeader), "¬ инвентаре можно найти: [%d/%d]",invTotalSize, (PlayerInfo[playerid][PlayerInventoryLimit]-1));

	new str[30];
	format(str,sizeof(str),"INV %d/%d",invTotalSize,(PlayerInfo[playerid][PlayerInventoryLimit]-1));
    PlayerTextDrawSetString(playerid,textInv[playerid], str);

    new Float:curInv = float(invTotalSize*100/(PlayerInfo[playerid][PlayerInventoryLimit]-1));
	SetPlayerProgressBarValue(playerid,barInv[playerid],curInv);
	UpdatePlayerProgressBar(playerid,barInv[playerid]);
    return 1;
}