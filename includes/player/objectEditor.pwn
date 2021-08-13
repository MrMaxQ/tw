#include <YSI\y_hooks>

public OnPlayerEditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz) {
	if (playerEditObjectId[playerid] < 0) {
	    return 1;
	}
	if(response == EDIT_RESPONSE_FINAL)	{
	    new Float:maxZPoint = GetPointZPos(x,y);
	    if (z > (maxZPoint+10.0)) {
	        SendClientMessage(playerid, COLOR_LIGHTRED, "Не возможно переместить так высоко!");
	        MoveDynamicObject(PlayerObject[playerEditObjectId[playerid]][pobjectid],PlayerObject[playerEditObjectId[playerid]][pobjectx],PlayerObject[playerEditObjectId[playerid]][pobjecty],PlayerObject[playerEditObjectId[playerid]][pobjectz],1.0,0.0,0.0,PlayerObject[playerEditObjectId[playerid]][pobjecta]);
	        playerEditObjectId[playerid] = -1;
	        return 1;
	    }

	    PlayerObject[playerEditObjectId[playerid]][pobjectx] = x;
	    PlayerObject[playerEditObjectId[playerid]][pobjecty] = y;
	    PlayerObject[playerEditObjectId[playerid]][pobjectz] = z;
	    PlayerObject[playerEditObjectId[playerid]][pobjecta] = rz;
	    PlayerObject[playerEditObjectId[playerid]][needUpdateObject] = 1;
	    MoveDynamicObject(PlayerObject[playerEditObjectId[playerid]][pobjectid],PlayerObject[playerEditObjectId[playerid]][pobjectx],PlayerObject[playerEditObjectId[playerid]][pobjecty],PlayerObject[playerEditObjectId[playerid]][pobjectz],1.0,0.0,0.0,PlayerObject[playerEditObjectId[playerid]][pobjecta]);
	    MeChat(playerid,"переместил объект");
	    playerEditObjectId[playerid] = -1;
	    SavePObjects();
	} else if(response == EDIT_RESPONSE_CANCEL) {
        MoveDynamicObject(PlayerObject[playerEditObjectId[playerid]][pobjectid],PlayerObject[playerEditObjectId[playerid]][pobjectx],PlayerObject[playerEditObjectId[playerid]][pobjecty],PlayerObject[playerEditObjectId[playerid]][pobjectz],1.0,0.0,0.0,PlayerObject[playerEditObjectId[playerid]][pobjecta]);
        playerEditObjectId[playerid] = -1;
	}
	return 1;
}

hook OnPlayerClickTextDraw(playerid, Text:clickedid) {

	if (_:clickedid == INVALID_TEXT_DRAW && objectCreateVisible[playerid] == 1) {
	    hideBuildObjectDialogTD(playerid);
		return 1;
	}

	new buildObjectClickId = -1;
    for (new i=0; i < sizeof(createObjectsData); i++) {
        if(clickedid == objectCreateTDObj[i]) {
            buildObjectClickId = i;
            break;
        }
    }

    if (buildObjectClickId >= 0) {
        if (PLAYER_LEVEL_LIMITS_ENABLED && PlayerInfo[playerid][pLevel] < 10 && PlayerInfo[playerid][pAdmin] < 100) {
	        SendClientMessage(playerid, COLOR_LIGHTRED, "Создавать объекты возможно с 10 уровня!");
	        hideBuildObjectDialogTD(playerid);
	        return 1;
	    }
	    if(GetPlayerState(playerid)!=PLAYER_STATE_ONFOOT) {
	        SendClientMessage(playerid, COLOR_LIGHTRED, "нужно выйти из транспорта!");
	        hideBuildObjectDialogTD(playerid);
	        return 1;
		}
		if (IsPlayerInRangeOfPoint(playerid,90.0,984.56, -2173.33, 13.65) && PlayerInfo[playerid][pAdmin] < 100) {
			MeChat(playerid,"боится строить на кладбище!");
			hideBuildObjectDialogTD(playerid);
			return 1;
		}
		if (buildCheck(playerid)) {
		    MeChat(playerid,"не может сделать в этом заколдованном месте!");
		    hideBuildObjectDialogTD(playerid);
			return 1;
		}

		for (new idxs=0; idxs<200;idxs++) {
	        if (IsPlayerInRangeOfPoint(playerid,50.0,Base[idxs][basex],Base[idxs][basey],Base[idxs][basez]) && PlayerInfo[playerid][pMember] != Base[idxs][baseid] && Base[idxs][baseid] > 0) {
	            MeChat(playerid,"боится строить рядом с чужой базой!");
	            hideBuildObjectDialogTD(playerid);
				return 1;
	        }
		}

  		if (buildObjectClickId >=0 && buildObjectClickId < sizeof(createObjectsData)) {
  		    if (PlayerInfo[playerid][chatly] < createObjectsData[buildObjectClickId][objectPrice]) {
  		        MeChat(playerid,"не хватает чатлов!");
  		        hideBuildObjectDialogTD(playerid);
				return 1;
  		    }
  		    PlayerInfo[playerid][chatly] -= createObjectsData[buildObjectClickId][objectPrice];
  		    new newObjID = 0;
		    while (PlayerObject[newObjID][pobjecttype] != 0) {
		        newObjID++;
		    }
		    new Float:x1,Float:y1,Float:z1,Float:a1;
			GetPlayerPos(playerid,x1,y1,z1);
			GetPlayerFacingAngle(playerid, a1);
			PlayerObject[newObjID][pobjecttype] = createObjectsData[buildObjectClickId][objectObject];
		    PlayerObject[newObjID][pobjectx] = x1+1.0;
		    PlayerObject[newObjID][pobjecty] = y1;
		    PlayerObject[newObjID][pobjectz] = (z1+createObjectsData[buildObjectClickId][objectOffset]);
		    PlayerObject[newObjID][pobjecta] = a1;
		    PlayerObject[newObjID][ownerid] = MySQLPlayerID[playerid];
		    PlayerObject[newObjID][pobjectid] = CreateDynamicObject(PlayerObject[newObjID][pobjecttype], PlayerObject[newObjID][pobjectx],PlayerObject[newObjID][pobjecty],PlayerObject[newObjID][pobjectz],   0.00, 0.00, PlayerObject[newObjID][pobjecta]);
		    PlayerObject[newObjID][needUpdateObject] = 1;
		    hideBuildObjectDialogTD(playerid);
		    return 1;
  		}
    }

    return 1;
}

showBuildObjectDialogTD(playerid) {
	for (new i=0; i < sizeof(createObjectsData); i++) {
	    TextDrawShowForPlayer(playerid, objectCreateTDObj[i]);
	    TextDrawShowForPlayer(playerid, objectCreateTDText[i]);
	}
	SelectTextDraw(playerid, 0xA3B4C5FF);
	objectCreateVisible[playerid] = 1;
	return 1;
}

hideBuildObjectDialogTD(playerid) {
	for (new i=0; i < sizeof(createObjectsData); i++) {
	    TextDrawHideForPlayer(playerid, objectCreateTDObj[i]);
	    TextDrawHideForPlayer(playerid, objectCreateTDText[i]);
	}
	CancelSelectTextDraw(playerid);
	objectCreateVisible[playerid] = 0;
	return 1;
}



