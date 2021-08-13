//срань всякая

forward createSatelite();
public createSatelite() {
    satelite[0] = CreateObject(19321, 0,0,500, 0,0,0);
    satelite[1] = CreateObject(3062, 0,0,0,0,0,0);
    satelite[2] = CreateObject(3062, 0,0,0,0,0,0);
    for(new aa=3; aa<=30; aa++) satelite[aa] = CreateObject(19444, 0,0,0,0,0,0);
    satelite[31] = CreateObject(1596, 0,0,0,0,0,0);
    satelite[32] = CreateObject(1596, 0,0,0,0,0,0);
    SetObjectMaterial(satelite[0],0,16093,"a51_ext","banding9_64HV",0);
    SetObjectMaterial(satelite[0],1,16093,"a51_ext","banding9_64HV",0);
    for(new aa=0; aa<=2; aa++) SetObjectMaterial(satelite[aa],0,16093,"a51_ext","banding9_64HV",0);
    for(new aa=3; aa<=16; aa++) SetObjectMaterial(satelite[aa],0,1697,"moregenroofstuff","solar_panel_1",-1);
    for(new aa=17; aa<=30; aa++) SetObjectMaterial(satelite[aa],0,16093,"a51_ext","banding9_64HV",0);
    for(new aa=31; aa<=32; aa++) SetObjectMaterial(satelite[aa],4,914,"industrialext","CJ_VENT1",-1);
    for(new aa=31; aa<=32; aa++) SetObjectMaterial(satelite[aa],0,914,"industrialext","CJ_VENT1",-1);
    AttachObjectToObject(satelite[1],satelite[0],-1.528991,-3.532958,-0.093999,0.000000,0.000000,-138.000000,1);
    AttachObjectToObject(satelite[2],satelite[0],2.707122,-4.591552,-0.093999,0.000000,0.000000,138.000000,1);
    AttachObjectToObject(satelite[3],satelite[0],-2.937591,0.000000,0.000000,0.000000,90.000000,90.000000,1);
    AttachObjectToObject(satelite[4],satelite[0],-5.197692,0.000000,0.000000,0.000000,90.000000,90.000000,1);
    AttachObjectToObject(satelite[5],satelite[0],-7.457580,0.000000,0.000000,0.000000,90.000000,90.000000,1);
    AttachObjectToObject(satelite[6],satelite[0],-9.717590,0.000000,0.000000,0.000000,90.000000,90.000000,1);
    AttachObjectToObject(satelite[7],satelite[0],2.881500,0.000000,0.000000,0.000000,90.000000,90.000000,1);
    AttachObjectToObject(satelite[8],satelite[0],5.001007,0.000000,0.000000,0.000000,90.000000,90.000000,1);
    AttachObjectToObject(satelite[9],satelite[0],7.141906,0.000000,0.000000,0.000000,90.000000,90.000000,1);
    AttachObjectToObject(satelite[10],satelite[0],9.281707,0.000000,0.000000,0.000000,90.000000,90.000000,1);
    AttachObjectToObject(satelite[11],satelite[0],-11.673278,0.000000,0.517000,35.000000,90.000000,90.000000,1);
    AttachObjectToObject(satelite[12],satelite[0],11.258026,0.000000,0.517000,-35.000000,90.000000,90.000000,1);
    AttachObjectToObject(satelite[13],satelite[0],0.000000,-5.757934,-1.457000,0.000000,90.000000,90.000000,1);
    AttachObjectToObject(satelite[14],satelite[0],0.000000,-9.657470,-1.457000,0.000000,90.000000,90.000000,1);
    AttachObjectToObject(satelite[15],satelite[0],2.021911,-9.657470,-0.987001,-35.000000,90.000000,90.000000,1);
    AttachObjectToObject(satelite[16],satelite[0],-1.979187,-9.657470,-0.987001,35.000000,90.000000,90.000000,1);
    AttachObjectToObject(satelite[17],satelite[0],-2.937591,0.000000,-0.180000,0.000000,90.000000,90.000000,1);
    AttachObjectToObject(satelite[18],satelite[0],-5.197692,0.000000,-0.180000,0.000000,90.000000,90.000000,1);
    AttachObjectToObject(satelite[19],satelite[0],-7.457580,0.000000,-0.180000,0.000000,90.000000,90.000000,1);
    AttachObjectToObject(satelite[20],satelite[0],-9.717590,0.000000,-0.180000,0.000000,90.000000,90.000000,1);
    AttachObjectToObject(satelite[21],satelite[0],2.881500,0.000000,-0.180000,0.000000,90.000000,90.000000,1);
    AttachObjectToObject(satelite[22],satelite[0],5.001007,0.000000,-0.180000,0.000000,90.000000,90.000000,1);
    AttachObjectToObject(satelite[23],satelite[0],7.141906,0.000000,-0.180000,0.000000,90.000000,90.000000,1);
    AttachObjectToObject(satelite[24],satelite[0],9.281707,0.000000,-0.180000,0.000000,90.000000,90.000000,1);
    AttachObjectToObject(satelite[25],satelite[0],-11.673278,0.000000,0.336999,35.000000,90.000000,90.000000,1);
    AttachObjectToObject(satelite[26],satelite[0],11.258026,0.000000,0.336999,-35.000000,90.000000,90.000000,1);
    AttachObjectToObject(satelite[27],satelite[0],0.000000,-5.757934,-1.637001,0.000000,90.000000,90.000000,1);
    AttachObjectToObject(satelite[28],satelite[0],0.000000,-9.657470,-1.637001,0.000000,90.000000,90.000000,1);
    AttachObjectToObject(satelite[29],satelite[0],2.021911,-9.657470,-1.166999,-35.000000,90.000000,90.000000,1);
    AttachObjectToObject(satelite[30],satelite[0],-1.979187,-9.657470,-1.166999,35.000000,90.000000,90.000000,1);
    AttachObjectToObject(satelite[31],satelite[0],0.000000,-0.046997,4.031999,0.000000,0.000000,0.000000,1);
    AttachObjectToObject(satelite[32],satelite[0],0.000000,6.142456,0.892999,-90.000000,0.000000,0.000000,1);
}

forward ShowInfo(playerid, header[],info[]);
public ShowInfo(playerid, header[],info[]) {
	    new iDialogStr[5000];
	    new iDialogHeader[100];
	    format(iDialogHeader,sizeof(iDialogHeader), "{FFFFFF}%s",header);
        format(iDialogStr,sizeof(iDialogStr), "{FFFFFF}%s",info);
		ShowPlayerDialogEx(playerid, 10349, DIALOG_STYLE_MSGBOX, iDialogHeader, iDialogStr, "Ok", "");
}

forward EmailDelivered(index, response_code, data[]); //forward response callback, so pawno doesnt say there is some undefinded symbol

public EmailDelivered(index, response_code, data[]) {
    new buffer[128];
    if(response_code == 200) {
        format(buffer, sizeof(buffer), "EMAIL Status: %s", data);//In game will print Status: Email delivered
    } else {
        format(buffer, sizeof(buffer), "EMAIL Status: Undelivered Response Code: %d", response_code);//Else will print error code, see reference
    }
    printf("[Server] %s",buffer);
    return 1;
}

forward GEOIPCheck(index, response_code, data[]);
public GEOIPCheck(index, response_code, data[]) {
    new buffer[128];
    new tempData[100];
    if(response_code == 200) {
        format(buffer, sizeof(buffer), "GEOIP answer: %s", data);
        format(tempData, sizeof(tempData), "%s", data);
        printf("[Server] %s",buffer);
        if (strlen(tempData) <= 10) {
           		printf("[Server] GEOIP - Kick - %s",data);
           		//SendClientMessage(index, COLOR_ORANGERED, "У НЛО есть подозрения, что вы используете прокси-сервер! Попробуйте подключиться к серверу без использования прокси!");
				//SendClientMessage(index, COLOR_ORANGERED, "");
				//SendClientMessage(index, COLOR_ORANGERED, "Если ничего не помогает - пишите на форум - "FORUMURL" и НЛО попробует решить возникшую проблему.");
				SendClientMessage(index, 0xA9C4E4FF, "");
				SendClientMessage(index, 0xA9C4E4FF, "Server closed the connection.");
	            for (new z=0;z<1000;z++) {
		            GameTextForPlayer(index, "•¤¶§!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", (z+1)*1000, z);
				}
	            kickTime[index] = gettime()+4;
		        kickFlag[index] = 2;
		}

		return 1;
    } else {
        format(buffer, sizeof(buffer), "GEOIP request undelivered. Response Code: %d", response_code);//Else will print error code, see reference
        printf("[Server] %s",buffer);
        return 1;
    }


}

forward AnotherServerBanCheck(index, response_code, data[]);
public AnotherServerBanCheck(index, response_code, data[]) {
    new buffer[128];
    new tempData[100];
    if(response_code == 200) {
        format(buffer, sizeof(buffer), "AnotherServerBanCheck answer: %s", data);
        format(tempData, sizeof(tempData), "%s", data);
        printf("[Server] %s",buffer);
        if (strlen(tempData) <= 10) {
           		printf("[Server] AnotherServerBanCheck - Kick - %s",data);
           		SendClientMessage(index, 0xA9C4E4FF, "Внимание! Ваш аккаунт заблокирован на сервере "SERVERNAME"!");
	            SendClientMessage(index, 0xA9C4E4FF, "Обратитесь к администратору сервера "SERVERNAME" для снятия блокировки!");
	            kickTime[index] = gettime()+4;
		        kickFlag[index] = 2;
		}

		return 1;
    } else {
        format(buffer, sizeof(buffer), "AnotherServerBanCheck request undelivered. Response Code: %d", response_code);
        printf("[Server] %s",buffer);
        return 1;
    }


}

//d3d9.dll
function OnClientCheckResponse(playerid, actionid, memaddr, retndata) {
	switch(retndata) {
		case 0xA: printf("[SERVER] ----->>>>> ID %d d3d9.dll check FALSE <<<<<-----",playerid);
	}
	return true || false; // nie wiem
}

AntiDeAMX()
{
    new a[][] =
    {
        "Unarmed (Fist)",
        "Brass K"
    };
    #pragma unused a
}