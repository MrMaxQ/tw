//лут

stock CreateItem(Float: fX,Float: fY,Float: fZ,itemID, health = 999, vw = 0) {
	new dropLootID = 0;
    while (Loot[dropLootID][lootType] > 0) {
        dropLootID++;
    }
	Loot[dropLootID][lootType] = InventoryName[itemID][InvType];
	format(Loot[dropLootID][lootName],30, InventoryName[itemID][InvName]);
	Loot[dropLootID][lootobjectid] = InventoryName[itemID][InvObject];
	Loot[dropLootID][lootx] = fX+lootRandCoord[random(3)];
	Loot[dropLootID][looty] = fY+lootRandCoord[random(3)];
	Loot[dropLootID][lootz] = fZ;
	Loot[dropLootID][lootVW] = vw;
	Loot[dropLootID][lootUseCount] = InventoryName[itemID][InvUseCount];
	if (health == 999) {
		Loot[dropLootID][lootHealth] = InventoryName[itemID][invHealth];
	} else {
	    Loot[dropLootID][lootHealth] = InventoryName[itemID][invHealth];
	}
	if (Loot[dropLootID][lootType] == 13 ||
		Loot[dropLootID][lootType] == 31 ||
		Loot[dropLootID][lootType] == 35 ||
		Loot[dropLootID][lootType] == 37 ||
		Loot[dropLootID][lootType] == 39 ||
		Loot[dropLootID][lootType] == 41 ||
		Loot[dropLootID][lootType] == 43 ||
		Loot[dropLootID][lootType] == 45 ||
		Loot[dropLootID][lootType] == 47 ||
		Loot[dropLootID][lootType] == 62 ||
		Loot[dropLootID][lootType] == 75 ||
		Loot[dropLootID][lootType] == 77 ||
		Loot[dropLootID][lootType] == 87 ||
		Loot[dropLootID][lootType] == 89) {
	    Loot[dropLootID][lootid] = CreateDynamicObject(Loot[dropLootID][lootobjectid], Loot[dropLootID][lootx],Loot[dropLootID][looty],Loot[dropLootID][lootz]+InventoryName[Loot[dropLootID][lootType]][InvZcoord],   90.00, 0.00, random(180),Loot[dropLootID][lootVW],-1,-1,LOOT_DRAW_DISTANCE,LOOT_DRAW_DISTANCE);
	} else if (Loot[dropLootID][lootType] == 16) {
	    Loot[dropLootID][lootid] = CreateDynamicObject(Loot[dropLootID][lootobjectid], Loot[dropLootID][lootx],Loot[dropLootID][looty],Loot[dropLootID][lootz]+InventoryName[Loot[dropLootID][lootType]][InvZcoord],   0.00, 30.00, random(180),Loot[dropLootID][lootVW],-1,-1,LOOT_DRAW_DISTANCE,LOOT_DRAW_DISTANCE);
    } else if (Loot[dropLootID][lootType] == 48 || Loot[dropLootID][lootType] == 59 || Loot[dropLootID][lootType] == 60 || Loot[dropLootID][lootType] == 21 || Loot[dropLootID][lootType] == 71 || Loot[dropLootID][lootType] == 78 || Loot[dropLootID][lootType] == 107) {
	    Loot[dropLootID][lootid] = CreateDynamicObject(Loot[dropLootID][lootobjectid], Loot[dropLootID][lootx],Loot[dropLootID][looty],Loot[dropLootID][lootz]+InventoryName[Loot[dropLootID][lootType]][InvZcoord],   0.00, 270.00, random(180),Loot[dropLootID][lootVW],-1,-1,LOOT_DRAW_DISTANCE,LOOT_DRAW_DISTANCE);
	} else {
		Loot[dropLootID][lootid] = CreateDynamicObject(Loot[dropLootID][lootobjectid], Loot[dropLootID][lootx],Loot[dropLootID][looty],Loot[dropLootID][lootz]+InventoryName[Loot[dropLootID][lootType]][InvZcoord],   0.00, 0.00, random(180),Loot[dropLootID][lootVW],-1,-1,LOOT_DRAW_DISTANCE,LOOT_DRAW_DISTANCE);
	}
	Loot[dropLootID][lootTime] = gettime();
	return 1;
}

forward sizeOfLootInHouse(houseid);
public sizeOfLootInHouse(houseid) {
	new loot = 0;
    for (new z=0; z<maxLoot; z++) {
		if (Loot[z][lootid] > 0 && GetDistanceBetweenPoints(Loot[z][lootx],Loot[z][looty],Loot[z][lootz],PlayerHouse[houseid][phousex],PlayerHouse[houseid][phousey],PlayerHouse[houseid][phousez]) < 10.0 && Loot[z][lootVW] == 0) {
            loot++;
        }
	}
	return loot;

}

forward sizeOfLootInInterrior(interriorId);
public sizeOfLootInInterrior(interriorId) {
	new loot = 0;
    for (new z=0; z<maxLoot; z++) {
		if (Loot[z][lootid] > 0 && GetDistanceBetweenPoints(Loot[z][lootx],Loot[z][looty],Loot[z][lootz],intEnter[interriorId][0],intEnter[interriorId][1],intEnter[interriorId][2]) < 50.0) {
            loot++;
        }
	}
	return loot;

}

forward sizeOfLootInBase(checkbaseid);
public sizeOfLootInBase(checkbaseid) {
	new loot = 0;
    for (new z=0; z<maxLoot; z++) {
		if (Loot[z][lootid] > 0 && GetDistanceBetweenPoints(Loot[z][lootx],Loot[z][looty],Loot[z][lootz],Base[checkbaseid][basex],Base[checkbaseid][basey],Base[checkbaseid][basez]) < 20.0 && Loot[z][lootVW] == 0) {
            loot++;
        }
	}
	return loot;

}

forward sizeOfLootInCase(caseId);
public sizeOfLootInCase(caseId) {
	new loot = 0;
    for (new z=0; z<100; z++) {
		if (PlayerCaseLoot[caseId][z][playerCaseLootType] > 0) {
            loot += InventoryName[PlayerCaseLoot[caseId][z][playerCaseLootType]][InvSize];
        }
	}
	return loot;

}