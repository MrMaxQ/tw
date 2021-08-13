
forward DeleteItemFromInventory(playerid,itemid);
public DeleteItemFromInventory(playerid,itemid) {
    PlayerInventory[playerid][itemid][itemType] = 0;
    PlayerInventory[playerid][itemid][itemCount] = 0;
    PlayerInventory[playerid][itemid][itemLock] = 0;
    PlayerInventory[playerid][itemid][itemHealth] = 0;
    for (new z=itemid; z<PlayerInventoryMaxLimit; z++) {
		PlayerInventory[playerid][z][itemType] = PlayerInventory[playerid][z+1][itemType];
		PlayerInventory[playerid][z][itemCount] = PlayerInventory[playerid][z+1][itemCount];
		PlayerInventory[playerid][z][itemLock] = PlayerInventory[playerid][z+1][itemLock];
		PlayerInventory[playerid][z][itemHealth] = PlayerInventory[playerid][z+1][itemHealth];
	}
	//PlayerUseLootID[playerid] = 0;
	return 1;
}

forward UseItemFromInventory(playerid,itemid);
public UseItemFromInventory(playerid,itemid) {
    if (PlayerInventory[playerid][itemid][itemCount] <= 1) {
        PlayerInventory[playerid][itemid][itemType] = 0;
        PlayerInventory[playerid][itemid][itemCount] = 0;
    	PlayerInventory[playerid][itemid][itemLock] = 0;
    	PlayerInventory[playerid][itemid][itemHealth] = 0;
	    for (new z=itemid; z<PlayerInventoryMaxLimit; z++) {
			PlayerInventory[playerid][z][itemType] = PlayerInventory[playerid][z+1][itemType];
			PlayerInventory[playerid][z][itemCount] = PlayerInventory[playerid][z+1][itemCount];
			PlayerInventory[playerid][z][itemLock] = PlayerInventory[playerid][z+1][itemLock];
			PlayerInventory[playerid][z][itemHealth] = PlayerInventory[playerid][z+1][itemHealth];
		}
    } else {
        PlayerInventory[playerid][itemid][itemCount]--;
	}
	//PlayerUseLootID[playerid] = 0;
	return 1;
}

forward getPlayerInventorySize(playerid);
public getPlayerInventorySize(playerid){
	new invTotalSize = 0;
    for (new z=1; z<PlayerInventoryMaxLimit; z++) {
        if (PlayerInventory[playerid][z][itemType] > 0) {
            invTotalSize +=InventoryName[PlayerInventory[playerid][z][itemType]][InvSize];
        }
	}
	return invTotalSize;
}


forward getVehInventorySize(curvehid);
public getVehInventorySize(curvehid){
	new invTotalSize = 0;
	for (new z=0; z<VipCarCount;z++) {
	    if (curvehid == VipCar[z][vehid]) {
		    for (new i=1; i<50; i++) {
		        if (VehInventory[z][i][itemType] > 0) {
		            invTotalSize +=InventoryName[VehInventory[z][i][itemType]][InvSize];
		        }
			}
			return invTotalSize;
		}
	}
	return 0;
}

forward DeleteItemFromVeh(curvehid,itemid);
public DeleteItemFromVeh(curvehid,itemid) {
    for (new z=0; z<VipCarCount;z++) {
	    if (curvehid == VipCar[z][vehid]) {
		    VehInventory[z][itemid][itemType] = 0;
		    VehInventory[z][itemid][itemCount] = 0;
		    VehInventory[z][itemid][itemHealth] = 0;
		    for (new i=itemid; i<100; i++) {
				VehInventory[z][i][itemType] = VehInventory[z][i+1][itemType];
				VehInventory[z][i][itemCount] = VehInventory[z][i+1][itemCount];
				VehInventory[z][i][itemHealth] = VehInventory[z][i+1][itemHealth];
			}
			return 1;
		}
	}
	return 1;
}

forward PutItemToVeh(curvehid,newItemType,newItemCount,newItemHealth);
public PutItemToVeh(curvehid,newItemType,newItemCount,newItemHealth) {
    for (new z=0; z<VipCarCount;z++) {
	    if (curvehid == VipCar[z][vehid]) {
	        for (new i=1; i<100; i++) {
				if (VehInventory[z][i][itemType] == 0) {
			        VehInventory[z][i][itemType] = newItemType;
			        VehInventory[z][i][itemCount] = newItemCount;
			        VehInventory[z][i][itemHealth] = newItemHealth;
			        return 1;
				}
			}
		}
	}
	return 1;
}

forward DeleteItemFromCase(caseId,itemid);
public DeleteItemFromCase(caseId,itemid) {
    PlayerCaseLoot[caseId][itemid][playerCaseLootType] = 0;
    PlayerCaseLoot[caseId][itemid][playerCaseLootUseCount] = 0;
    PlayerCaseLoot[caseId][itemid][playerCaseLootHealth] = 0;
    for (new i=itemid; i<99; i++) {
        PlayerCaseLoot[caseId][i][playerCaseLootType] = PlayerCaseLoot[caseId][i+1][playerCaseLootType];
        PlayerCaseLoot[caseId][i][playerCaseLootUseCount] = PlayerCaseLoot[caseId][i+1][playerCaseLootUseCount];
        PlayerCaseLoot[caseId][i][playerCaseLootHealth] = PlayerCaseLoot[caseId][i+1][playerCaseLootHealth];
	}
	PlayerCase[caseId][playerCaseNeedUpdate] = 1;
	return 1;
}

forward PutItemToCase(caseId,newItemType,newItemCount,newItemHealth);
public PutItemToCase(caseId,newItemType,newItemCount,newItemHealth) {
    for (new i=1; i<100; i++) {
		if (PlayerCaseLoot[caseId][i][playerCaseLootType] == 0) {
	        PlayerCaseLoot[caseId][i][playerCaseLootType] = newItemType;
	        PlayerCaseLoot[caseId][i][playerCaseLootUseCount] = newItemCount;
	        PlayerCaseLoot[caseId][i][playerCaseLootHealth] = newItemHealth;
	        PlayerCase[caseId][playerCaseNeedUpdate] = 1;
	        PlayerCase[caseId][playerCaseTime] = gettime();
	        return 1;
		}
	}
	return 1;
}

forward PutItemToInventory(playerid,newItemType,newItemCount,newItemHealth);
public PutItemToInventory(playerid,newItemType,newItemCount,newItemHealth) {

    new invTotalSize = getPlayerInventorySize(playerid);
	if (invTotalSize+InventoryName[newItemType][InvSize] < PlayerInfo[playerid][PlayerInventoryLimit]) {
		for (new z=1; z<PlayerInventoryMaxLimit; z++) {
			if (PlayerInventory[playerid][z][itemType] == 0) {
		        PlayerInventory[playerid][z][itemType] = newItemType;
		        PlayerInventory[playerid][z][itemCount] = newItemCount;
		        PlayerInventory[playerid][z][itemLock] = 0;
		        PlayerInventory[playerid][z][itemHealth] = newItemHealth;
		        return 1;
			}
		}
	} else {
	    new Float:dx1,Float:dy1,Float:dz1;
		GetPlayerPos(playerid,dx1,dy1,dz1);
	    CreateItem(dx1,dy1,dz1,newItemType,newItemHealth);
	}
	//PlayerUseLootID[playerid] = 0;
	return 1;
}


forward isPlayerHaveAItem(playerid,itemID);
public isPlayerHaveAItem(playerid,itemID) {
    new isHaveGun = -1;
    for (new i=0; i<PlayerInventoryMaxLimit; i++) {
		if (PlayerInventory[playerid][i][itemType] == itemID) {
		    isHaveGun = i;
		    break;
  		}
	}
	return isHaveGun;
}

forward getPlayerItemCount(playerid,itemID);
public getPlayerItemCount(playerid,itemID) {
    new isHaveGun = 0;
    for (new i=0; i<PlayerInventoryMaxLimit; i++) {
		if (PlayerInventory[playerid][i][itemType] == itemID) {
		    isHaveGun = PlayerInventory[playerid][i][itemCount];
		    break;
  		}
	}
	return isHaveGun;
}