stock Float:Distance2D(Float:x1, Float:y1, Float:x2, Float:y2, bool:sqrt = true) {
  x1 -= x2;
  x1 *= x1;

  y1 -= y2;
  y1 *= y1;

  x1 += y1;

  return sqrt ? floatsqroot(x1) : x1;
}

stock SetPlayerSkillsToMax(playerid) {
	SetPlayerSkillLevel(playerid, WEAPONSKILL_DESERT_EAGLE, 999);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_MP5, 999);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_AK47, 999);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_M4, 999);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_SHOTGUN, 999);
	return 1;
}

forward SetPlayerSkills(playerid);
public SetPlayerSkills(playerid) {
	if (PlayerInfo[playerid][pDesert] > 999) {
	    PlayerInfo[playerid][pDesert] = 999;
	}
	if (PlayerInfo[playerid][pSmg] > 999) {
	    PlayerInfo[playerid][pSmg] = 999;
	}
	if (PlayerInfo[playerid][pAk] > 999) {
	    PlayerInfo[playerid][pAk] = 999;
	}
	if (PlayerInfo[playerid][pM4] > 999) {
	    PlayerInfo[playerid][pM4] = 999;
	}
	if (PlayerInfo[playerid][pShot] > 999) {
	    PlayerInfo[playerid][pShot] = 999;
	}
	SetPlayerSkillLevel(playerid, WEAPONSKILL_DESERT_EAGLE, PlayerInfo[playerid][pDesert]);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_MP5, PlayerInfo[playerid][pSmg]);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_AK47, PlayerInfo[playerid][pAk]);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_M4, PlayerInfo[playerid][pM4]);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_SHOTGUN, PlayerInfo[playerid][pShot]);
	return 1;
}

stock bigstr(const string[], &idx)
{
    new length = strlen(string);
        while ((idx < length) && (string[idx] <= ' '))
        {
                idx++;
        }
        new offset = idx;
        new result[128];
        while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
        {
                result[idx - offset] = string[idx];
                idx++;
        }
        result[idx - offset] = EOS;
        return result;
}

stock PJ(carid)
{
    new m = GetVehicleModel(carid);
	if(m==534
	||m== 535
	||m== 536
	||m==558
	||m==559
	||m==560
	||m==561
	||m==562
	||m==565
	||m==575
	 ||m== 576
	 ||m== 483
	||m==567)
	{return 1;}
	return 0;
}

stock SuperGt(carid)
{
    new m = GetVehicleModel(carid);
	if(m==411
	||m==415
	||m==429
	||m==451
	||m==477
	||m==480
    ||m==506
    ||m==541
	)
	{return 1;}
	return 0;
}

stock isFourSeatCar(carid)
{
    new m = GetVehicleModel(carid);
	if(m==400
	||m==404
	||m==405
	||m==409
	||m==418
	||m==420
    ||m==421
    ||m==426
   	||m==438
	||m==445
	||m==458
	||m==466
	||m==467
    ||m==470
    ||m==479
   	||m==487
	||m==490
	||m==492
	||m==507
	||m==516
    ||m==529
    ||m==540
   	||m==546
	||m==547
	||m==550
	||m==551
	||m==560
    ||m==561
    ||m==566
    ||m==567
   	||m==579
	||m==580
	||m==585
	||m==596
	||m==597
    ||m==598
    ||m==604

	)
	{return 1;}
	return 0;
}

stock MuscleCar(carid)
{
    new m = GetVehicleModel(carid);
	if(m==402
	||m==475
	||m==542
	||m==603
	||m==434
	||m==555
	||m==602
	||m==558
	||m==559
	||m==560
	||m==561
	||m==562
	||m==565
	||m==409
	||m==413
	||m==414
	||m==416
	||m==427
	||m==428
	||m==440
	||m==442
	||m==459
	||m==470
	||m==482
	||m==483
	||m==489
	||m==490
	||m==499
	||m==528
	||m==552
	||m==554
	||m==582
	||m==588
	||m==599
	||m==609
	||m==578
	){return 1;}
	return 0;
}

stock ExtraCar(carid)
{
    new m = GetVehicleModel(carid);
	if(m==444
	||m==494
	||m==495
	||m==502
	||m==503
	||m==504
	||m==556
	||m==557
	||m==573
	||m==403
	||m==406
	||m==407
	||m==408
	||m==431
	||m==433
	||m==437
	||m==443
	||m==455
	||m==456
	||m==486
	||m==498
	||m==508
	||m==514
	||m==515
	||m==524
	||m==544
	//||m==578
	){return 1;}
	return 0;
}

stock IsABoat(carid)
{
    new m = GetVehicleModel(carid);
	if(m==472
	||m==473
	||m==493
	||m==595
	||m==484
	||m==430
	||m==453
	||m==452
	||m==446
	||m==454
	||m==539
	)
	{
		return 1;
	} else {
		return 0;
	}
}
stock IsABoatS(carid)
{
    new m = carid;
	if(m==472
	||m==473
	||m==493
	||m==595
	||m==484
	||m==430
	||m==453
	||m==452
	||m==446
	||m==454
	||m==539
	)
	{
		return 1;
	} else {
		return 0;
	}
}

stock CanGoToCarRoof(carid)
{
    new m = GetVehicleModel(carid);
	if(m==472
	||m==473
	||m==493
	||m==595
	||m==484
	||m==430
	||m==453
	||m==452
	||m==446
	||m==454
	||m==578
	||m==403
	||m==406
	||m==407
	||m==408
	||m==422
	||m==444
	||m==455
	||m==478
	||m==514
	||m==515
	||m==554
	||m==556
	||m==557
	)
	{
		return 1;
	} else {
		return 0;
	}
}

stock IsABike(carid)
{
    new m = GetVehicleModel(carid);
	if(m==481
	||m==509
	||m==510
	)
	{
		return 1;
	} else {
		return 0;
	}
}

stock IsAMoto(carid)
{
    new m = GetVehicleModel(carid);
	if(m==448
	||m==461
	||m==462
	||m==463
	||m==468
	||m==521
	||m==522
	||m==523
	||m==581
	||m==586
	)
	{
		return 1;
	} else {
		return 0;
	}
}


stock GetXYInBackOfPlayer(const playerid, &Float:x, &Float:y, const Float:distance)
{
new Float:a; GetPlayerPos(playerid, x, y, a); GetPlayerFacingAngle(playerid, a);
if (IsPlayerInAnyVehicle(playerid)) { new vid=GetPlayerVehicleID(playerid);
if (vid > 0 && vid <= MAX_VEHICLES)GetVehicleZAngle(vid, a);}
x -= (distance * floatsin(-a, degrees)); y -= (distance * floatcos(-a, degrees));
}
//==============================================================================






stock IsAPlane(carid)
{
    new m = GetVehicleModel(carid);
	if(m==592
	||m==577
	||m==511
	||m==512
	||m==593
	||m==520
	||m==553
	||m==476
	||m==519
	||m==460
	||m==513
	||m==548
	||m==417
	||m==487
	||m==488
	||m==497
	||m==563
	||m==447
	||m==425
	||m==469
	||m==465
	||m==501
	||m==464){return 1;}
	return 0;
}

stock BroadCast(color,const string[])
{
	SendClientMessageToAll(color, string);
	return 1;
}
forward ABroadCast(color,string[],level);
public ABroadCast(color, string[],level)
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if (PlayerInfo[i][pAdmin] >= level)
			{
				//SendClientMessage(i, color, string);
				SendSplitMessage(i, color, string);
			}
		}
	}
	return 1;
}
forward OOCOff(color,string[]);
public OOCOff(color,string[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    if(!gOoc[i])
		    {
				//SendClientMessage(i, color, string);
				SendSplitMessage(i, color, string);
			}
		}
	}
}

stock LoginMsg(color,const string[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    if(!gLogin[i])
		    {
				SendClientMessage(i, color, string);
			}
		}
	}
}

forward SendAdminMessage(color, string[]);
public SendAdminMessage(color, string[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    if(PlayerInfo[i][pAdmin] >= 1)
		    {
				//SendClientMessage(i, color, string);
				SendSplitMessage(i, color, string);
			}
		}
	}
}

stock SendVipMessage(color, string[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    if(PlayerInfo[i][pDonateRank] >= 1)
		    {
				SendClientMessage(i, color, string);
			}
		}
	}
}

stock PlayerPlayMusic(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		SetTimer("StopMusic", 5000, 0);
		PlayerPlaySound(playerid, 1068, 0.0, 0.0, 0.0);
	}
}

forward StopMusic();
public StopMusic()
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			PlayerPlaySound(i, 1069, 0.0, 0.0, 0.0);
		}
	}
}

stock IsPlayerApplyAnimation(playerid, animation[])
{
    if(!GetPlayerAnimationIndex(playerid)) return 0;
    else
    {
        new animlib[32], animname[32];
        GetAnimationName(GetPlayerAnimationIndex(playerid), animlib, sizeof(animlib), animname, sizeof(animname));
        if(!strcmp(animname, animation, true)) return 1;
    }
    return 0;
}

strtokMode(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}
	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}

forward ProxDetectorS(Float:radi, playerid, targetid);
public ProxDetectorS(Float:radi, playerid, targetid)
{
    if(IsPlayerConnected(playerid)&&IsPlayerConnected(targetid))
	{
		new Float:posx, Float:posy, Float:posz;
		new Float:oldposx, Float:oldposy, Float:oldposz;
		new Float:tempposx, Float:tempposy, Float:tempposz;
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		//radi = 2.0; //Trigger Radius
		GetPlayerPos(targetid, posx, posy, posz);
		tempposx = (oldposx -posx);
		tempposy = (oldposy -posy);
		tempposz = (oldposz -posz);
		//printf("DEBUG: X:%f Y:%f Z:%f",posx,posy,posz);
		if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
		{
			return 1;
		}
	}
	return 0;
}

stock IsMonth31(month)
{
	switch (month)
	{
 		case 1: return 1;
   		case 3: return 1;
        case 5: return 1;
        case 7: return 1;
        case 8: return 1;
        case 10: return 1;
        case 12: return 1;
        default: return 0;
	}
 	return 0;
}

stock IsMonth29(year)
{
	new y = 2000;
 	for(new i = 4; i < 3000; i += 4) if ((y+i) == year) return 1;
  	return 0;
}


stock strvalEx( const string[] ) // fix for strval-bug with > 50 letters.
{
	//
	if( strlen( string ) >= 50 ) return 0; // It will just return 0 if the string is too long
	return strval(string);
}
printr(message[]) {
FixConsole(message);
print(message);
return 1;
}

stock encode_lights(light1, light2, light3, light4)
{
	return light1 | (light2 << 1) | (light3 << 2) | (light4 << 3);
}

forward GiveMoney(playerid, amount);
public GiveMoney(playerid, amount)
{
    PlayerInfo[playerid][pCash] += amount;
    GivePlayerMoney(playerid, amount);
}
forward ResetMoney(playerid);
public ResetMoney(playerid)
{
	PlayerInfo[playerid][pCash] = 0;
	ResetPlayerMoney(playerid);
}

forward PlayerToKvadrat( playerid, Float:min_x, Float:min_y, Float:max_x, Float:max_y );
public PlayerToKvadrat(playerid,Float:min_x,Float:min_y,Float:max_x,Float:max_y)
{
	new Float:xxp,Float:yyp,Float:zzp;
	GetPlayerPos(playerid, xxp, yyp, zzp);
	if((xxp <= max_x && xxp >= min_x) && (yyp <= max_y && yyp >= min_y)) return 1;
	return 0;
}
forward PointToKvadrat(Float:xxp,Float:yyp, Float:min_x, Float:min_y, Float:max_x, Float:max_y );
public PointToKvadrat(Float:xxp,Float:yyp,Float:min_x,Float:min_y,Float:max_x,Float:max_y) {
	if((xxp <= max_x && xxp >= min_x) && (yyp <= max_y && yyp >= min_y)) return 1;
	return 0;
}
stock IsPlayerInArea(playerid, Float:min_x, Float:min_y ,Float:max_x, Float:max_y)
{
new Float:X, Float:Y, Float:Z;
GetPlayerPos(playerid, X, Y, Z);
if(X <= max_x && X >= min_x && Y <= max_y && Y >= min_y) return 1;
return 0;
}
stock CheckPlayerDistanceToVehicle(Float:radi, playerid, vehicleid)
{
	if(IsPlayerConnected(playerid))
	{
	    new Float:PX,Float:PY,Float:PZ,Float:X,Float:Y,Float:Z;
	    GetPlayerPos(playerid,PX,PY,PZ);
	    GetVehiclePos(vehicleid, X,Y,Z);
	    new Float:Distance = (X-PX)*(X-PX)+(Y-PY)*(Y-PY)+(Z-PZ)*(Z-PZ);
	    if(Distance <= radi*radi)
	    {
        return 1;
	    }
	}
	return 0;
}

stock GetGangZoneColor(gangzonex)
{
 new zx;
 switch(GZInfo[gangzonex][gFrakVlad])
 {
  case 12: zx = 0xc12aef93;
  case 13: zx = 0xd4c71893;
  case 15: zx = 0x009F0093;
  case 17: zx = 0x02B9AF93;
  case 18: zx = 0x2c65e193;
  default: zx = 0x7A7A7A7A;
 }

 return zx;
}

stock GetGangZoneColorNew(gangzonex)
{
 new zx;
 /*new playerBase = -1;
 if (gangzonex > 0) {
	 for (new idxs=0; idxs<200;idxs++) {
	    if (Base[idxs][baseid] == gangzonex) {
	        playerBase = idxs;
	        break;
	    }
	 }
 }*/
 new playerBase = gangzonex;
 if (playerBase == -1) {
    //zx = 0xA0522D93;
    zx = 0xFFFFFF00;
 } else {
	 switch(playerBase) {
  //case -1: zx = 0xFFFFFF00;
  case 0: zx = 0xF0F8FF93;
  case 1: zx = 0xFAEBD793;
  case 2: zx = 0x00FFFF93;
  case 3: zx = 0x7FFFD493;
  case 4: zx = 0x0000FF93;
  case 5: zx = 0x8A2BE293;
  case 6: zx = 0x99000093;
  case 7: zx = 0xDEB88793;
  case 8: zx = 0x5F9EA093;
  case 9: zx = 0x7FFF0093;
  case 10: zx = 0xD2691E93;
  case 11: zx = 0x6495ED93;
  case 12: zx = 0x00FFFF93;
  case 13: zx = 0x00008B93;
  case 14: zx = 0x008B8B93;
  case 15: zx = 0xB8860B93;
  case 16: zx = 0xA9A9A993;
  case 17: zx = 0x00640093;
  case 18: zx = 0x8B008B93;
  case 19: zx = 0xFF8C0093;
  case 20: zx = 0x8FBC8F93;
  case 21: zx = 0x483D8B93;
  case 22: zx = 0x2F4F4F93;
  case 23: zx = 0x00CED393;
  case 24: zx = 0x00C7FF93;
  case 25: zx = 0xFF00FF93;
  case 26: zx = 0xFFD70093;
  case 27: zx = 0xDAA52093;
  case 28: zx = 0xADFF2F93;
  case 29: zx = 0xFF69B493;
  case 30: zx = 0x4B00B093;
  case 31: zx = 0xFFFF8293;
  case 32: zx = 0xADD8E693;
  case 33: zx = 0xFFA50093;
  case 34: zx = 0xDDA0DD93;
  case 35: zx = 0x8B451393;
  case 36: zx = 0x00808093;
  case 37: zx = 0xFF634793;
  case 38: zx = 0x3CB37193;
  case 39: zx = 0x00808093;
  case 40: zx = 0xAA3333AA;
  	}
 }
 return zx;
}

stock GetGZColorF(fnumber)
{
 new zx;
 switch(fnumber)
 {
  case 12: zx =0xf00000AA;
  case 13: zx = 0xf00000AA;
  case 15: zx =0xf00000AA;
  case 17: zx =0xf00000AA;
  case 18: zx = 0xf00000AA;
  default: zx = 0xf00000AA;
 }
 return zx;
}
#pragma unused GangColor
#pragma unused gangkillcount
#pragma unused otvetk
#pragma unused otvetp
#pragma unused taketurfbackcount
#pragma unused ret_memcpy
stock Name(playerid) { new pl[24]; GetPlayerName(playerid,pl,24); return pl; }
stock GetNearestVehicle(playerid) {
	new Float:result = 10000;
	new resultID = -1;
    for(new i=0; i<MAX_VEHICLES; i++) {
        if(GetVehicleModel(i)) {
            new Float:X,Float:Y,Float:Z;
            GetVehiclePos(i,X,Y,Z);
            if(result > GetPlayerDistanceFromPoint(playerid, X, Y, Z)) {
                result = GetPlayerDistanceFromPoint(playerid, X, Y, Z);
                resultID = i;
            }
        }
    }
    return resultID;
}
stock IsInAllowedF(fnumbers)
{
	for(new i =0;i<sizeof(allowedfactions);i++)
	{
		if(fnumbers == allowedfactions[i]) return 1;
	}
	return 0;
}
stock GetGangName(fnumbwer)
{
	new string[256];
	switch(fnumbwer)
	{
		case 15: format(string,sizeof(string),"Groove Street");
		case 17: format(string,sizeof(string),"Los Aztecas");
		case 12: format(string,sizeof(string),"The Ballas");
		case 18: format(string,sizeof(string),"The Rifa");
		case 13: format(string,sizeof(string),"Los Santos Vagos");
		default: format(string,sizeof(string),"Государство");
	}
	return string;
}
stock GetMafiaName(fnumbwer)
{
	new string[256];
	switch(fnumbwer)
	{
		case 6: format(string,sizeof(string),"Yakuza");
		case 14: format(string,sizeof(string),"Russian Mafia");
		case 5: format(string,sizeof(string),"LCN");
	}
	return string;
}

forward Random(min, max);
public Random(min, max)
{
    new a = random(max - min) + min;
    return a;
}

stock GetName(playerid)
{
	new name[MAX_PLAYER_NAME]; GetPlayerName(playerid,name,sizeof(name));
	return name;
}

forward PlayerToPoint(Float:radi, playerid, Float:x, Float:y, Float:z);
public PlayerToPoint(Float:radi, playerid, Float:x, Float:y, Float:z)
{
    if(IsPlayerConnected(playerid))
	{
		new Float:oldposx, Float:oldposy, Float:oldposz;
		new Float:tempposx, Float:tempposy, Float:tempposz;
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		tempposx = (oldposx -x);
		tempposy = (oldposy -y);
		tempposz = (oldposz -z);
		if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
		{
			return 1;
		}
	}
	return 0;
}

stock GetRPName(name[])
{
    new Left[32],Right[32];
    if(strfind(name,"_",true,1) == -1) return 0;

    for(new i ; i < strlen(name); i++)
    if( name[i] <= '9' && name[i] >= '0') return 0;

    new pos = strfind(name,"_",true,-1);
    strmid(Left, name, 0, pos,32);
    strmid(Right, name, pos+1,32,32);

    if(  !(Right[0] >='A' && Right[0] <= 'Z' && Left[0] >='A'&& Left[0] <= 'Z') ) return 0;

    if(strcmp(Right, Left, true) == 0) return 0;

        return 1;
}

new WebSites[][] ={".ws",".ru",".tk",".com","www.",".org",".net",".cc",".рф",".by",".biz",".su",".info"};
stock CheckString(string[])
{
        for(new i = 0;i<sizeof(WebSites);i++)
        {
                if(strfind(string,WebSites[i],true) != -1)
                {
                        return 1;
                }
        }
        return 0;
}
//new delimiters[]={'.', ' ', ',', '*', '/', ';', '\\', '|', ':', '_'};
stock IsIP(const str[])
{
	new digs = 0;
	new prevstep[2];
	new nowstep[2];
	new nowflag = 0;
	new prevflag = 0;
    for(new i=0; i<strlen(str)-1; i++) {
        nowflag = 0;
		prevflag = 0;
        strmid(nowstep, str, i,(i+1),2);
        if (i>0){
            strmid(prevstep, str, (i-1), i,2);
        }
        if (strfind(nowstep, "0", true) >= 0
		|| strfind(nowstep, "1", true) >= 0
		|| strfind(nowstep, "2", true) >= 0
		|| strfind(nowstep, "3", true) >= 0
		|| strfind(nowstep, "4", true) >= 0
		|| strfind(nowstep, "5", true) >= 0
		|| strfind(nowstep, "6", true) >= 0
		|| strfind(nowstep, "7", true) >= 0
		|| strfind(nowstep, "8", true) >= 0
		|| strfind(nowstep, "9", true) >= 0
		) {nowflag = 1;}
		if (strfind(prevstep, "0", true) >= 0
		|| strfind(prevstep, "1", true) >= 0
		|| strfind(prevstep, "2", true) >= 0
		|| strfind(prevstep, "3", true) >= 0
		|| strfind(prevstep, "4", true) >= 0
		|| strfind(prevstep, "5", true) >= 0
		|| strfind(prevstep, "6", true) >= 0
		|| strfind(prevstep, "7", true) >= 0
		|| strfind(prevstep, "8", true) >= 0
		|| strfind(prevstep, "9", true) >= 0
		) {prevflag = 1;}

		if (nowflag == 1 && prevflag == 0) {
		    digs++;
		}

    }

    if (digs >=5) {
	    printf("[Server] IP in string: %s ",str);
		return 1;
	} else {
	    return 0;
	}
}

stock StartSpectate(playerid, specid)
{
    SetPlayerColor(playerid, TEAM_HIT_COLOR);
	for(new x=0; x<GetMaxPlayers(); x++)
	{
	    if(GetPlayerState(x) == PLAYER_STATE_SPECTATING && gSpectateID[x] == playerid)
		{
	       AdvanceSpectate(x);
		}
	}
	if(IsPlayerInAnyVehicle(specid))
	{
		SetPlayerInterior(playerid,GetPlayerInterior(specid));
		antiCheatVirtualWorld[playerid] = GetPlayerVirtualWorld(specid);
		SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(specid));
		TogglePlayerSpectating(playerid, 1);
		PlayerSpectateVehicle(playerid, GetPlayerVehicleID(specid));
		gSpectateID[playerid] = specid;
		gSpectateType[playerid] = ADMIN_SPEC_TYPE_VEHICLE;
	}
	else
	{
		SetPlayerInterior(playerid,GetPlayerInterior(specid));
		antiCheatVirtualWorld[playerid] = GetPlayerVirtualWorld(specid);
		SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(specid));
		TogglePlayerSpectating(playerid, 1);
		PlayerSpectatePlayer(playerid, specid);
		gSpectateID[playerid] = specid;
		gSpectateType[playerid] = ADMIN_SPEC_TYPE_PLAYER;
	}
	/*new ping = GetPlayerPing(specid);
	new Float:health;
	GetPlayerHealth(specid, health);
	new string[100], name[24];
	GetPlayerName(specid,name,sizeof(name));
	new lvl = PlayerInfo[specid][pLevel];
	new warns = PlayerInfo[specid][pWarns];


	format(string, 100, "NAME: %s",name);
    PlayerInfoChatAddString(playerid,string);
    format(string, 100, "HP: %.0f",health);
    PlayerInfoChatAddString(playerid,string);
    format(string, 100, "LVL: %d",lvl);
    PlayerInfoChatAddString(playerid,string);
    format(string, 100, "Warns: %d",warns);
    PlayerInfoChatAddString(playerid,string);
    format(string, 100, "ping: %d",ping);
    PlayerInfoChatAddString(playerid,string);

	if (PlayerInfo[specid][lastShotTime]+120 > gettime()) {
	    format(string, 100, "PLAYER ANTI QUIT: %s",Convert((PlayerInfo[playerid][specid]+120) - gettime()));
	    PlayerInfoChatAddString(playerid,string);
	}
	if (PlayerInfo[specid][antiDrop] > 0) {
		format(string, 100, "PLAYER ANTI DROP: %s",ConvertNoSec(PlayerInfo[specid][antiDrop] - gettime()));
	} else {
	    format(string, 100, "PLAYER ANTI DROP: NO ACTIVE");
	}
	PlayerInfoChatAddString(playerid,string);
	if (PlayerInfo[specid][antiHunger] > 0) {
		format(string, 100, "PLAYER ANTI HUNGER: %s",ConvertNoSec(PlayerInfo[specid][antiHunger] - gettime()));
	} else {
	    format(string, 100, "PLAYER ANTI HUNGER: NO ACTIVE");
	}
	PlayerInfoChatAddString(playerid,string);
	PlayerInfoChatRedraw(playerid);
	*/
	return 1;
}
stock StopSpectate(playerid)
{
	TogglePlayerSpectating(playerid, 0);
	gSpectateID[playerid] = INVALID_PLAYER_ID;
	gSpectateType[playerid] = ADMIN_SPEC_TYPE_NONE;
	GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~w~Recon off",1000,3);
	return 1;
}
stock AdvanceSpectate(playerid)
{
    if(ConnectedPlayers() == 2) { StopSpectate(playerid); return 1; }
	if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING && gSpectateID[playerid] != INVALID_PLAYER_ID) {
	    for(new x=gSpectateID[playerid]+1; x<=GetMaxPlayers(); x++) {
	    	if(x == MAX_PLAYERS) { x = 0; }
	        if(IsPlayerConnected(x) && x != playerid) {
				if(GetPlayerState(x) == PLAYER_STATE_SPECTATING && gSpectateID[x] != INVALID_PLAYER_ID ||
					(GetPlayerState(x) != 1 && GetPlayerState(x) != 2 && GetPlayerState(x) != 3))
				{
					continue;
				}
				else {
					StartSpectate(playerid, x);
					break;
				}
			}
		}
	}
	return 1;
}

//Advancing spectated player to next valid player: BACKWARDS
stock ReverseSpectate(playerid)
{
    if(ConnectedPlayers() == 2) { StopSpectate(playerid); return 1; }
	if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING && gSpectateID[playerid] != INVALID_PLAYER_ID) {
	    for(new x=gSpectateID[playerid]-1; x>=0; x--) {
	    	if(x == 0) { x = GetMaxPlayers(); }
	        if(IsPlayerConnected(x) && x != playerid) {
				if(GetPlayerState(x) == PLAYER_STATE_SPECTATING && gSpectateID[x] != INVALID_PLAYER_ID ||
					(GetPlayerState(x) != 1 && GetPlayerState(x) != 2 && GetPlayerState(x) != 3))
				{
					continue;
				}
				else {
					StartSpectate(playerid, x);
					break;
				}
			}
		}
	}
	return 1;
}
stock ConnectedPlayers()
{
	new count;
	for(new x=0; x<GetMaxPlayers(); x++) {
	    if(IsPlayerConnected(x)) {
			count++;
		}
	}
	return count;
}


stock Convert(number)
{
	new hours = 0, mins = 0, secs = 0, string[100];
	hours = floatround(number / 3600);
	mins = floatround((number / 60) - (hours * 60));
	secs = floatround(number - ((hours * 3600) + (mins * 60)));
	if(hours > 0)
	{
	format(string, 100, "%d:%02d:%02d", hours, mins, secs);
	}
	else
	{
	format(string, 100, "%d:%02d", mins, secs);
	}
	return string;
}

stock ConvertNoSec(number)
{
	new hours = 0, mins = 0, days =0, string[100];
	days = floatround(number / 86400);
	hours = floatround(number / 3600 - (days*24));
	mins = floatround((number / 60) - ((hours * 60) + (days*1440)));
	format(string, 100, "%d дней %d:%02d", days,hours, mins);
	return string;
}

stock TurnPlayerFaceToPlayer(playerid, facingtoid)
{
	new Float:angle;
	new Float:misc = 5.0;
	new Float:x, Float:y, Float:z;
	new Float:ix, Float:iy, Float:iz;
	GetPlayerPos(facingtoid, x, y, z);
	GetPlayerPos(playerid, ix, iy, iz);
	angle = 180.0-atan2(ix-x,iy-y);
	angle += misc;
	misc *= -1;
	SetPlayerFacingAngle(playerid, angle+misc);
}


stock SetPlayerHealthAC(playerid, Float: Health) {
    if(IsPlayerConnected(playerid)) {
        //printf("[Server] SetPlayerHealthAC: %d | %f",playerid,Health);
    
        if (Health > 0) {
	        if (PlayerInfo[playerid][pVampire] == 0 && playerAtEvent1[playerid] == 0 && playerGodMode[playerid] == 0 && playerShowTutorialStep[playerid] == 0
				&& playerSpawnTime[playerid]+5 < gettime() && playerLowLevelAntiKillTime[playerid] < gettime() && sateliteFollowPlayerId != playerid) {
				if (Health > 100 && PlayerInfo[playerid][pAdmin] < 100) {
				    Health = 100.0;
				}
				//if (PlayerInfoTime[playerid] >= gettime()) {
					PlayerInfo[playerid][pHP] = floatround(Health);
		    	    PlayerHealth[playerid] = Health;
				//}
		        SetPlayerHealth(playerid, Health);
			} else {
			    PlayerInfo[playerid][pHP] = 99999;
			    PlayerHealth[playerid] = 99999.9;
		        SetPlayerHealth(playerid, 99999.9);
			}
		} else {
		    PlayerInfo[playerid][pHP] = -10;
		    PlayerHealth[playerid] = -10.0;
	        SetPlayerHealth(playerid, -10.0);
		}
		
    }
    return 1;
}

forward CheckArmour();
public CheckArmour()
{
    for(new i = 0; i < GetMaxPlayers(); i++) {
        if(IsPlayerConnected(i) && gPlayerLogged[i] == 1) {
            new Float:armour;
			GetPlayerArmourAC(i, armour);
            if(Armour[i] < armour) {
	            SetPlayerArmour(i, Armour[i]);
    	    } else {
	           Armour[i] = armour;
        	}
        }
    }
    return 1;
}

stock SetPlayerArmourAC(playerid, Float: Arm)
{
    if(IsPlayerConnected(playerid)) {
        //if (PlayerInfoTime[playerid] >= gettime()) {
	        PlayerArmor[playerid] = floatround(Arm, floatround_ceil);
    	    Armour[playerid] = Arm;
		//}
        SetPlayerArmour(playerid, Arm);
    }
    return 1;
}

stock GetPlayerArmourAC(playerid, &Float:armour){
	armour = PlayerArmor[playerid];
	return 1;
}

stock GetPlayerHealthAC(playerid, &Float:health){
    health = PlayerHealth[playerid];
	return 1;
}





stock AnRepairVehicle(vehicleid)
{
	/*for(new i=0; i < MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i))
	    {
	        if(GetPlayerVehicleID(i) == vehicleid && GetPlayerState(i) == PLAYER_STATE_DRIVER)
	        {
	            player_NoCheckTimeVeh[i] = 3;
			}
		}
	}*/
	checkVehHealth[vehicleid] = 1000;
	prevVehHealth[vehicleid] = 1000;
	SetVehicleHealth(vehicleid, 1000);
	new panelsx,doorsx,lightsx,tiresx;
	GetVehicleDamageStatus(vehicleid,panelsx,doorsx,lightsx,tiresx);
	UpdateVehicleDamageStatus(vehicleid, panelsx, doorsx, lightsx, 0);
	checkVehHealthTime[vehicleid] = gettime();
 	RepairVehicle(vehicleid);
	return 1;
}

forward SendHelperMessage(color, string[]);
public SendHelperMessage(color, string[])
{
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        if(IsPlayerConnected(i))
        {
            if(PlayerInfo[i][pHelper] >= 1)
            {
                SendClientMessage(i, color, string);
            }
        }
    }
}

forward HsLog(string[]);
public HsLog(string[])
{
    new entry[256];
    new File:hFile;
    hFile = fopen("ЧС.log", io_append);
    fwrite(hFile, entry);
    fclose(hFile);
}

forward RemovePlayerWeaponGMode(playerid, weaponid);
public RemovePlayerWeaponGMode(playerid, weaponid)
{
   new plyWeapons[12] = 0;
   new plyAmmo[12] = 0;
   for(new slot = 0; slot != 12; slot++)
   {
    new wep, ammo;
    GetPlayerWeaponData(playerid, slot, wep, ammo);

    if(wep != weaponid && ammo != 0)
    {
     GetPlayerWeaponData(playerid, slot, plyWeapons[slot], plyAmmo[slot]);
    }
   }

   SafeResetPlayerWeapons(playerid);
   for(new slot = 0; slot != 12; slot++)
   {
       if(plyAmmo[slot] != 0)
       {
     SafeGivePlayerWeapon(playerid, plyWeapons[slot], plyAmmo[slot]);
    }
   }
   return 1;
}

forward SafeGivePlayerWeapon(plyid, weaponid, ammo);
public SafeGivePlayerWeapon(plyid, weaponid, ammo)
{
   GivePlayerWeapon(plyid, weaponid, ammo);
   return 1;
}

forward SafeResetPlayerWeapons(plyid);
public SafeResetPlayerWeapons(plyid)
{
   ResetPlayerWeapons(plyid);
   return 1;
}

//dialog defense
stock ShowPlayerDialogEx(playerid, dialogid, style, caption[], info[], button1[], button2[])
{
SetPVarInt(playerid, "dialog_id", dialogid);
ShowPlayerDialog(playerid, dialogid, style, caption, info, button1, button2);
return 1;
}

stock ResetPlayerWeaponsEx(playerid,...)
{
	new W[] =
	{
		0,0,1,1,1,1,1,1,1,1,10,10,10,10,10,10,8,8,
		8,0,0,0,2,2,2,3,3,3,4,4,5,5,4,6,6,7,7,7,7,
		8,12,9,9,9,11,11,11,11
	};
	new
		idx = 0,
		tmp = 0,
		weapons,
 	 	args = numargs() - 1,
		bool:Reset[13] = {true,...};
	if(IsPlayerConnected(playerid))
	{
		if(args > 0)
		{
		    if(args <= 46)
		    {
				while(args > idx++)
				{
				    new wep = getarg(idx);

					if(0 <= wep <= 46)
					{
					    GetPlayerWeaponData(playerid,W[wep],weapons,tmp);

						if(weapons == wep)
						{
							Reset[W[wep]] = false;
						}
					}
					else
					{
		   				printf("ResetPlayerWeaponEx warning: invalid argument (argument: #%d)! \"%d\" is not a valid weapon!", idx+1,wep);
					}
				}

				for(new a = 0; a < 13; a ++)
				{
				    if(Reset[a])
				    {
				        GetPlayerWeaponData(playerid,a,weapons,tmp);

				        if(weapons)
				        {
	       					SetPlayerAmmo(playerid,weapons,0);

							weapons = -1;
						}
					}
				    else
				    {
						Reset[a] = true;
				    }
				}
				return 1;
			}
		    print("ResetPlayerWeaponsEx Error: You have specified over 46 weapons! Check for duplicate weapons");
		    return 1;
		}
		ResetPlayerWeapons(playerid);
		return 1;
	}
	return 1;
}

// Returns the index in the array where the needle was found, else if not found at all, returns -1
stock in_array(needle[],array[][], bool:ignorecase = true, arraylength = sizeof(array)) {
    for(new i = 0; i < arraylength; i++) if(!strcmp(needle,array[i],ignorecase)) return true;
    return false;
}

stock in_arrayInt(needle,array[], arraylength = sizeof(array)) {
    for(new i = 0; i < arraylength; i++) if(needle == array[i]) return true;
    return false;
}

new pTakeLootMsg[8][] = {
"В инвентарь [P] был добавлен предмет [I].",
"[I] вполне может пригодиться [P] в хозяйстве.",
"[I] теперь занимает почётное место в инвентаре [P]",
"Ещё вчера [P] даже не мечтал, что в его инвентаре окажется [I]",
"Завидуйте все! У [P] есть [I]",
"Вот это да! Теперь у [P] есть [I]",
"Теперь [I] занимает почётное место среди трофеев [P]",
"Как же повезло, что [I] может лежать среди вещей [P]"};

new pDropLootMsg[8][] = {
"Пожалуй, [I] не такая полезная вещь, чтобы [P] носил её с собой",
"Интересно, а [I] взорвётся, если [P] бросит эту вещь на землю?",
"[I] точно не потеряется, ведь [P] уже записал куда положил эту вещь",
"Как говорится - [I] с возу - [P] легче.",
"Ой, кажется [I] теперь валяется на земле. [P] скучает.",
"Если [I] теперь на земле, то [P] сможет найти что-то полезнее.",
"В принципе, [I] не такая уж и полезная вещь для [P].",
"[I] тихо завидует вещам, которые остались у [P]."};
						
new zombiePresentMsg[8][] = { "С наступающим, братиш!",
						"Иди обниму...",
						"Как-же давно я тебя не видел...",
						"Хватит меня убивать! Давай дружить!",
						"Будь мужиком!",
						"Хочу обнимашек...",
						"Нельзя просто так взять и не убить меня...",
						"Где я? Что происходит?"};
stock MeChat(playerid,text[],type = 0,itemname[]="") {
	//printf("%d - %s - %d - %s",playerid,text,type,itemname);
	if (sateliteUserPlayerId != playerid) {
	 	new string[300], sendername[64]; //, playerString[300];
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if (type == 0) {
		    format(string, sizeof(string), "%s %s", sendername, text);
		} else if (type == 1) {
		    string = str_replace("[P]",sendername,pTakeLootMsg[random(sizeof(pTakeLootMsg))]);
		    //printf("1- %s",string);
		    string = str_replace("[I]",itemname,string);
		    //printf("2- %s",string);
		} else if (type == 2) {
		    string = str_replace("[P]",sendername,pDropLootMsg[random(sizeof(pDropLootMsg))]);
		    string = str_replace("[I]",itemname,string);
		} else if (type == 3) {
		    format(string, sizeof(string), "%s %s", sendername, zombiePresentMsg[random(sizeof(zombiePresentMsg))]);
		}
        //format(playerString, sizeof(playerString), "%s",string);
        //SendClientMessage(playerid, COLOR_PLAYERMSG,playerString);
        //format(playerString, sizeof(playerString), "%s",string);
        SendClientMessage(playerid, COLOR_PURPLE,string);
		//ProxDetector(20.0, playerid, string, COLOR_MECHAT,COLOR_MECHAT,COLOR_MECHAT,COLOR_MECHAT,COLOR_MECHAT);
		//SetPlayerChatBubble(playerid,string,COLOR_MECHAT,30.0,2000);
		SetPlayerChatBubble(playerid,string,COLOR_PURPLE,30.0,2000);
		SetTimerEx("UpdateHackName", 1900, false, "ii", playerid,0);
	}
	updatePlayerInvHUD(playerid);
}

stock itemChat(playerid,text[]) {
	new string[300];
	string = str_replace("[P]",PlayerInfo[playerid][dbName],text);
	SendClientMessage(playerid, COLOR_PURPLE,string);
	if (strfind(string, "[Ошибка]", true) == -1) {
		//SetPlayerChatBubble(playerid,string,COLOR_MECHAT,30.0,2000);
		SetPlayerChatBubble(playerid,string,COLOR_PURPLE,30.0,2000);
 	}
}

forward kickPlayer(playerid);
public kickPlayer(playerid) {
	if (ReklamaTime+1 >= gettime() && (playerConnectTime[playerid]+5) < gettime() ) {
	    printf("[Server] NO Kick Player - id: %d - ReklamaTime in 1sec",playerid);
	    ABroadCast(COLOR_LIGHTRED,"( ! ) Abort Kick! Lag suspicion!",1);
	    kickTime[playerid] = 0;
        kickFlag[playerid] = 0;
	    return 1;
	}
    if(!IsPlayerNPC(playerid) && kickFlag[playerid] == 0) {
        OnPlayerUpdateRLSauronRealSave(playerid);
        //TogglePlayerControllable(playerid, 0);
        //new pkname[MAX_PLAYER_NAME];
		//GetPlayerName(playerid, pkname, sizeof(pkname));
        //printf("[Server] Mark to Kick Player - %s / id: %d",pkname,playerid);
        printf("[Server] Mark to Kick Player - id: %d",playerid);
        kickTime[playerid] = gettime()+1;
        kickFlag[playerid] = 1;
    }
    return 1;
}

//======================Античит=================================================

stock GetWeaponNameEx(id, name[], len) return format(name,len, "%s", GunNames[id]);

stock IsAPistol(gunid)
{
	if(gunid >= 22 && gunid <=24)
	{
	    return 1;
	}
	return 0;
}
stock IsAMelee(gunid)
{
	if(gunid >= 2 && gunid <= 9 )
	{
	    return 1;
	}
	return 0;
}
stock IsAGirlsStuff(gunid)
{
	if(gunid >= 10 && gunid <= 15 || gunid == 46)
	{
	    return 1;
	}
	return 0;
}
stock IsAGrenade(gunid)
{
	if((gunid >= 16 && gunid <= 18) || gunid == 39)
	{
	    return 1;
	}
	return 0;
}
stock IsAShotgun(gunid)
{
	if(gunid >= 25 && gunid <= 27)
	{
	    return 1;
	}
	return 0;
}
stock IsAMachineGun(gunid)
{
	if(gunid == 28 || gunid == 29 || gunid == 32)
	{
	    return 1;
	}
	return 0;
}
stock IsAnAssault(gunid)
{
	if(gunid == 30 || gunid == 31)
	{
	    return 1;
	}
	return 0;
}
stock IsARifle(gunid)
{
	if(gunid == 33 || gunid == 34)
	{
	    return 1;
	}
	return 0;
}
stock IsAHeavyAssault(gunid)//базуки
{
	if(gunid >= 35 && gunid <= 37 )
	{
	    return 1;
	}
	return 0;
}
stock IsAStuff1(gunid)//Баллончик
{
	if(gunid >= 41 && gunid <= 43 )
	{
	    return 1;
	}
	return 0;
}
stock IsAVision(gunid)//Баллончик
{
	if(gunid >= 44 && gunid <= 45 )
	{
	    return 1;
	}
	return 0;
}

stock GiveRichGun(playerid,weaponid,ammo)
{
    PyxiTime[playerid] = 5;
    if(IsAPistol(weaponid))
    {
        PlayerInfo[playerid][pSlot2] = weaponid;
        PlayerInfo[playerid][pSlotammo2] = ammo;
    }
    else if(IsAShotgun(weaponid))
    {
        PlayerInfo[playerid][pSlot3] = weaponid;
        PlayerInfo[playerid][pSlotammo3] = ammo;
    }
    else if(IsAMachineGun(weaponid))
    {
        PlayerInfo[playerid][pSlot4] = weaponid;
        PlayerInfo[playerid][pSlotammo4] = ammo;
    }
    else if(IsAnAssault(weaponid))
    {
        PlayerInfo[playerid][pSlot5] = weaponid;
        PlayerInfo[playerid][pSlotammo5] = ammo;
    }
    else if(IsARifle(weaponid))
    {
        PlayerInfo[playerid][pSlot6] = weaponid;
        PlayerInfo[playerid][pSlotammo6] = ammo;
    }
    else if(IsAHeavyAssault(weaponid))
    {
        PlayerInfo[playerid][pSlot7] = weaponid;
        PlayerInfo[playerid][pSlotammo7] = ammo;
    }
    else if(IsAHeavyAssault(weaponid))
    {
        PlayerInfo[playerid][pSlot7] = weaponid;
        PlayerInfo[playerid][pAmmo7] = ammo;
    }
    else if(IsAGrenade(weaponid))
    {
        PlayerInfo[playerid][pSlot8] = weaponid;
        PlayerInfo[playerid][pSlotammo8] = ammo;
    }
    else if(IsAStuff1(weaponid))
    {
        PlayerInfo[playerid][pSlot9] = weaponid;
        PlayerInfo[playerid][pSlotammo9] = ammo;
    }
    else if(IsAGirlsStuff(weaponid))
    {
        PlayerInfo[playerid][pSlot10] = weaponid;
        PlayerInfo[playerid][pSlotammo10] = ammo;
    } else if (IsAVision(weaponid)) {
        PlayerInfo[playerid][pSlot11] = weaponid;
    }
    GivePlayerWeapon(playerid,weaponid,ammo);
    return 1;
}

stock GetSRVMoney(playerid)
{
	return PlayerInfo[playerid][pCash];
}

public Delgun(playerid)
{
	PyxiTime[playerid] = 5;
	PlayerInfo[playerid][pSlot1] = 0;//Оружие слот 2
	PlayerInfo[playerid][pSlot2] = 0;//Оружие слот 2
	PlayerInfo[playerid][pSlot3] = 0;//Оружие слот 2
	PlayerInfo[playerid][pSlot4] = 0;//Оружие слот 2
	PlayerInfo[playerid][pSlot5] = 0;//Оружие слот 2
	PlayerInfo[playerid][pSlot6] = 0;//Оружие слот 2
	PlayerInfo[playerid][pSlot7] = 0;//Оружие слот 2
	PlayerInfo[playerid][pSlot8] = 0;//Оружие слот 2
	PlayerInfo[playerid][pSlot9] = 0;//Оружие слот 2
	PlayerInfo[playerid][pSlot10] = 0;//Оружие слот 2
	PlayerInfo[playerid][pSlot11] = 0;//Оружие слот 2
	PlayerInfo[playerid][pSlotammo2] = 0;//Оружие слот 2
	PlayerInfo[playerid][pSlotammo3] = 0;//Оружие слот 2
	PlayerInfo[playerid][pSlotammo4] = 0;//Оружие слот 2
	PlayerInfo[playerid][pSlotammo5] = 0;//Оружие слот 2
	PlayerInfo[playerid][pSlotammo6] = 0;//Оружие слот 2
	PlayerInfo[playerid][pSlotammo7] = 0;//Оружие слот 2
	PlayerInfo[playerid][pSlotammo8] = 0;//Оружие слот 2
	PlayerInfo[playerid][pSlotammo9] = 0;//Оружие слот 2
	PlayerInfo[playerid][pSlotammo10] = 0;//Оружие слот 2
	PlayerInfo[playerid][pSlotammo11] = 0;//Оружие слот 2
	ResetPlayerWeaponsEx(playerid,46);
	return 1;
}

stock SetPosInFrontOfPlayer(playerid,giveplayerid,Float:distance)
{
    new Float:x,Float:y,Float:z,Float:a;
    GetPlayerPos(playerid, x, y,z);GetPlayerFacingAngle(playerid, a);
    x += (distance * floatsin(-a, degrees));
    y += (distance * floatcos(-a, degrees));
    SetPlayerPos(giveplayerid,x,y,z);SetPlayerFacingAngle(giveplayerid,a);
}
stock GetWeaponModel(weaponid)
{
    switch(weaponid)
    {
        case 1:
            return 331;

        case 2..8:
            return weaponid+331;

        case 9:
            return 341;

        case 10..15:
            return weaponid+311;

        case 16..18:
            return weaponid+326;

        case 22..29:
            return weaponid+324;

        case 30,31:
            return weaponid+325;

        case 32:
            return 372;

        case 33..45:
            return weaponid+324;

        case 46:
            return 371;
    }
    return 0;
}

stock GetXYInFrontOfPlayer(playerid, &Float:x, &Float:y, Float:distance) {
new Float:a;
GetPlayerPos(playerid, x, y, a);
	if (IsPlayerInAnyVehicle(playerid)) {
		GetVehicleZAngle(GetPlayerVehicleID(playerid), a);
	} else {
		GetPlayerFacingAngle(playerid, a);
	}
x += (distance * floatsin(-a, degrees));
y += (distance * floatcos(-a, degrees));
return 1;
}

stock IsNumeric(const string[])
{
	for (new i = 0, j = strlen(string); i < j; i++)
	{
		if (string[i] > '9' || string[i] < '0') return 0;
	}
	return 1;
}

stock ReturnUser(text[], playerid = INVALID_PLAYER_ID) {
	new pos = 0;
	while (text[pos] < 0x21) // Strip out leading spaces
	{
		if (text[pos] == 0) return INVALID_PLAYER_ID; // No passed text
		pos++;
	}
	new userid = INVALID_PLAYER_ID;
	if (IsNumeric(text[pos])) // Check whole passed string
	{
		// If they have a numeric name you have a problem (although names are checked on id failure)
		userid = strval(text[pos]);
		if (userid >=0 && userid < MAX_PLAYERS)
		{
			if(!IsPlayerConnected(userid))
			{
				/*if (playerid != INVALID_PLAYER_ID)
				{
					SendClientMessage(playerid, 0xFF0000AA, "User not connected");
				}*/
				userid = INVALID_PLAYER_ID;
			}
			else
			{
				return userid; // A player was found
			}
		}
		/*else
		{
			if (playerid != INVALID_PLAYER_ID)
			{
				SendClientMessage(playerid, 0xFF0000AA, "Invalid user ID");
			}
			userid = INVALID_PLAYER_ID;
		}
		return userid;*/
		// Removed for fallthrough code
	}
	// They entered [part of] a name or the id search failed (check names just incase)
	new len = strlen(text[pos]);
	new count = 0;
	new name[MAX_PLAYER_NAME];
	for (new i = 0; i < MAX_PLAYERS; i++)
	{
		if (IsPlayerConnected(i))
		{
			GetPlayerName(i, name, sizeof (name));
			if (strcmp(name, text[pos], true, len) == 0) // Check segment of name
			{
				if (len == strlen(name)) // Exact match
				{
					return i; // Return the exact player on an exact match
					// Otherwise if there are two players:
					// Me and MeYou any time you entered Me it would find both
					// And never be able to return just Me's id
				}
				else // Partial match
				{
					count++;
					userid = i;
				}
			}
		}
	}
	if (count != 1)
	{
		if (playerid != INVALID_PLAYER_ID)
		{
			if (count)
			{
				SendClientMessage(playerid, 0xFF0000AA, "Multiple users found, please narrow earch");
			}
			else
			{
				SendClientMessage(playerid, 0xFF0000AA, "No matching user found");
			}
		}
		userid = INVALID_PLAYER_ID;
	}
	return userid; // INVALID_USER_ID for bad return
}

stock AudioMess(id,rad,str[]) {
    new Float:px,Float:py,Float:pz;
    GetPlayerPos(id,px,py,pz);
    new stream[256];
    format(stream,sizeof(stream),"http://translate.google.kg/translate_tts?ie=UTF-8&q=%s&tl=ru&prev=input",str);
    for(new i=0; i != MAX_PLAYERS; i++) {
        if(IsPlayerInRangeOfPoint(i,rad,px,py,pz) && GetPlayerVirtualWorld(id) == GetPlayerVirtualWorld(i)) {
            PlayAudioStreamForPlayer(i,stream);
        }
    }
    return 1;
}

forward Float: GetPointZPos(const Float: fX, const Float: fY, &Float: fZ = 0.0);
stock Float: GetPointZPos(const Float: fX, const Float: fY, &Float: fZ = 0.0) {
        if(!((-3000.0 < fX < 3000.0) && (-3000.0 < fY < 3000.0))) {
                return 0.0;
        }
        static
                File: s_hMap
        ;
        if(!s_hMap) {
                s_hMap = fopen("SAfull.hmap", io_read);

                if(!s_hMap) {
                        return 0.0;
                }
        }
        new
                afZ[1]
        ;
        fseek(s_hMap, ((6000 * (-floatround(fY, floatround_tozero) + 3000) + (floatround(fX, floatround_tozero) + 3000)) << 1));
        fblockread(s_hMap, afZ);

        return (fZ = ((afZ[0] >>> 16) * 0.01));
}

forward IsAFoods(playerid);
public IsAFoods(playerid)
{

if(IsPlayerInRangeOfPoint(playerid, 2, -2420.219, 984.578, 44.297)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, -2420.180, 985.945, 44.297)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 2225.203, -1153.422, 1025.906)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 2576.703, -1284.430, 1061.094)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 2155.906, 1606.773, 1000.055)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 2209.906, 1607.195, 1000.055)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 2222.203, 1606.773, 1000.055)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 495.969, -24.320, 1000.734)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 501.828, -1.430, 1000.734)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 373.828, -178.141, 1000.734)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 330.680, 178.500, 1020.070)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 331.922, 178.500, 1020.070)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 350.906, 206.086, 1008.477)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 361.563, 158.617, 1008.477)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 371.594, 178.453, 1020.070)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 374.891, 188.977, 1008.477)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 2155.844, 1607.875, 1000.063)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 2202.453, 1617.008, 1000.063)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 2209.242, 1621.211, 1000.063)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 2222.367, 1602.641, 1000.063)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 500.563, -1.367, 1000.734)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 379.039, -178.883, 1000.734)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 2480.86,-1959.27,12.9609)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 1634.11,-2237.53,12.8906)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 2139.52,-1161.48,23.3594)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 2153.23,-1016.15,62.2344)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, -1350.12,493.859,10.5859)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, -2229.19,286.414,34.7031)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 1659.46,1722.86,10.2188)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 2647.7,1129.66,10.2188)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 2845.73,1295.05,10.7891)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 1398.84,2222.61,10.4219)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, -1455.12,2591.66,55.2344)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, -76.0312,1227.99,19.125)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 662.43,-552.164,15.7109)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, -253.742,2599.76,62.2422)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 2271.73,-76.4609,25.9609)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 1789.21,-1369.27,15.1641)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 1729.79,-1943.05,12.9453)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 2060.12,-1897.64,12.9297)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 1928.73,-1772.45,12.9453)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 2325.98,-1645.13,14.2109)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 2352.18,-1357.16,23.7734)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 1154.73,-1460.89,15.1562)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, -1350.12,492.289,10.5859)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, -2118.97,-423.648,34.7266)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, -2118.62,-422.414,34.7266)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, -2097.27,-398.336,34.7266)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, -2092.09,-490.055,34.7266)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, -2063.27,-490.055,34.7266)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, -2005.65,-490.055,34.7266)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, -2034.46,-490.055,34.7266)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, -2068.56,-398.336,34.7266)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, -2039.85,-398.336,34.7266)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, -2011.14,-398.336,34.7266)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, -1980.79,142.664,27.0703)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 2319.99,2532.85,10.2188)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 1520.15,1055.27,10.00)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 2503.14,1243.7,10.2188)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 2085.77,2071.36,10.4531)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, -862.828,1536.61,21.9844)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, -14.7031,1175.36,18.9531)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, -253.742,2597.95,62.2422)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 201.016,-107.617,0.898438)) return 1;
else if(IsPlayerInRangeOfPoint(playerid, 2, 1277.84,372.516,18.9531)) return 1;
else return 0;
}

forward SetPlayerWeapons(playerid);
public SetPlayerWeapons(playerid)
{
	if(IsPlayerConnected(playerid))	{
			ResetPlayerWeapons(playerid);
			if (PlayerInfo[playerid][pSlot11] > 0)
			{
			GiveRichGun(playerid, PlayerInfo[playerid][pSlot11], 1);
		//	PlayerInfo[playerid][pSlot8] = 0; PlayerInfo[playerid][pSlotammo8] = 0;
			}

	}
	return 1;
}

forward SetPlayerToTeamColor(playerid);
public SetPlayerToTeamColor(playerid)//ЦВЕТА Фракциям
{

        if (PlayerInfo[playerid][pVampire] == 1) {
            SetPlayerColor(playerid, COLOR_REDD);
		} else if (playerAtEvent1[playerid] == 1) {
            SetPlayerColor(playerid, COLOR_YELLOW);
        } else {
            SetPlayerColor(playerid, TEAM_HIT_COLOR);
        }



        /*
		switch(PlayerInfo[playerid][pMember])
		{
		//case 0:	SetPlayerColor(playerid, TEAM_HIT_COLOR);
		case 0:	SetPlayerColor(playerid, COLOR_WHITE);
        case 1: SetPlayerColor(playerid, COLOR_DBLUE);
       	case 2: SetPlayerColor(playerid, 0x313131AA);
       	case 3: SetPlayerColor(playerid, COLOR_GREEN);
       	case 4,28,30: SetPlayerColor(playerid, 0xA52A2AFF);
       	case 5: SetPlayerColor(playerid, 0xDDA701FF);
       	case 6: SetPlayerColor(playerid, COLOR_REDD);
       	case 7,27,29: SetPlayerColor(playerid, 0x103c57FF);
       	case 8: SetPlayerColor(playerid, 0xB313E7FF);
       	case 9: SetPlayerColor(playerid, 0xFF830000);
       	case 10: SetPlayerColor(playerid, COLOR_DBLUE);
       	case 11: SetPlayerColor(playerid, 0x139BECFF);
       	case 12: SetPlayerColor(playerid, 0x8813E7FF);
       	case 13: SetPlayerColor(playerid, 0xDBD604AA);
       	case 14: SetPlayerColor(playerid, COLOR_GRAD1);
       	case 15: SetPlayerColor(playerid, 0x009F00AA);
       	case 16: SetPlayerColor(playerid, 0x40848BAA);
       	case 17: SetPlayerColor(playerid, TEAM_AZTECAS_COLOR);
       	case 18: SetPlayerColor(playerid, 0x83BFBFAA);
       	case 19: SetPlayerColor(playerid, COLOR_GREEN);
       	case 20: SetPlayerColor(playerid, 0xE6284EFF);
       	case 21: SetPlayerColor(playerid, COLOR_DBLUE);
       	case 22: SetPlayerColor(playerid, 0x83BFBFAA);
		case 23: SetPlayerColor(playerid, COLOR_GREEN);
		case 24: SetPlayerColor(playerid, 0xB313E7FF);
		case 25: SetPlayerColor(playerid, 0xB313E7FF);
		case 26: SetPlayerColor(playerid, COLOR_GREY);
		case 31: SetPlayerColor(playerid, 0xc1731fFF);
		case 32: SetPlayerColor(playerid, 0xb3d245FF);
		case 33: SetPlayerColor(playerid, 0x282828FF);
 		}
 		*/
 	return 1;
}

forward GetClosestPlayer(p1);
public GetClosestPlayer(p1)
{
	new x,Float:dis,Float:dis2,player;
	player = -1;
	dis = 99999.99;
	for (x=0;x<GetMaxPlayers();x++)	{
		if(IsPlayerConnected(x) && !IsPlayerNPC(x)) {
			if(x != p1) {
                if(PlayerInfo[x][pAdmin] > 100) continue;
				dis2 = GetDistanceBetweenPlayers(x,p1);
				if(dis2 < dis && dis2 != -1.00) {
					dis = dis2;
					player = x;
				}
			}
		}
	}
	return player;
}

forward splitSauron(const strsrc[], strdest[][], delimiter);
public splitSauron(const strsrc[], strdest[][], delimiter)
{
	new i, li;
	new aNum;
	new len;
	while(i <= strlen(strsrc)){
	    if(strsrc[i]==delimiter || i==strlen(strsrc)){
	        len = strmid(strdest[aNum], strsrc, li, i, 128);
	        strdest[aNum][len] = 0;
	        li = i+1;
	        aNum++;
		}
		i++;
	}
	return 1;
}

forward ProxDetector(Float:radi, playerid, string[],col1,col2,col3,col4,col5);
public ProxDetector(Float:radi, playerid, string[],col1,col2,col3,col4,col5)
{
	if(IsPlayerConnected(playerid))
	{
		new Float:posx, Float:posy, Float:posz;
		new Float:oldposx, Float:oldposy, Float:oldposz;
		new Float:tempposx, Float:tempposy, Float:tempposz;
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		//radi = 2.0; //Trigger Radius
		for(new i = 0; i < MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i))
			{
				if(!BigEar[i])
				{
				if(GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(i))
				{
					GetPlayerPos(i, posx, posy, posz);
					tempposx = (oldposx -posx);
					tempposy = (oldposy -posy);
					tempposz = (oldposz -posz);
					//printf("DEBUG: X:%f Y:%f Z:%f",posx,posy,posz);
					if (((tempposx < radi/16) && (tempposx > -radi/16)) && ((tempposy < radi/16) && (tempposy > -radi/16)) && ((tempposz < radi/16) && (tempposz > -radi/16)))
					{
						//SendClientMessage(i, col1, string);
						SendSplitMessage(i, col1, string);
					}
					else if (((tempposx < radi/8) && (tempposx > -radi/8)) && ((tempposy < radi/8) && (tempposy > -radi/8)) && ((tempposz < radi/8) && (tempposz > -radi/8)))
					{
						//SendClientMessage(i, col2, string);
						SendSplitMessage(i, col2, string);
					}
					else if (((tempposx < radi/4) && (tempposx > -radi/4)) && ((tempposy < radi/4) && (tempposy > -radi/4)) && ((tempposz < radi/4) && (tempposz > -radi/4)))
					{
						//SendClientMessage(i, col3, string);
						SendSplitMessage(i, col3, string);
					}
					else if (((tempposx < radi/2) && (tempposx > -radi/2)) && ((tempposy < radi/2) && (tempposy > -radi/2)) && ((tempposz < radi/2) && (tempposz > -radi/2)))
					{
						//SendClientMessage(i, col4, string);
						SendSplitMessage(i, col4, string);
					}
					else if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
					{
						//SendClientMessage(i, col5, string);
						SendSplitMessage(i, col5, string);
					}
					}
				}
				else
				{
					//SendClientMessage(i, col1, string);
					SendSplitMessage(i, col1, string);
				}
			}
		}
	}//not connected
	return 1;
}

forward ClearAnim(playerid);
public ClearAnim(playerid)
{
ApplyAnimation(playerid,"CARRY","crry_prtial",4.0,0,0,0,0,0,1);
return 1;
}

forward Float:getObjectOffset (objectid);
public Float:getObjectOffset (objectid) {
	new Float:offset = 0.0;
	if (objectid == 1481) {
	    offset = -0.5;
	} else if (objectid == 2103) {
	    offset = -1.0;
	} else if (objectid == 1763) {
	    offset = -1.0;
	} else if (objectid == 1647) {
	    offset = -0.9;
	} else if (objectid == 2126) {
	    offset = -1.0;
	} else if (objectid == 3524) {
	    offset = 0.0;
	} else if (objectid == 1452) {
	    offset = 0.0;
	} else if (objectid == 3091) {
	    offset = -0.5;
	} else if (objectid == 2780) {
	    offset = -1.0;
	}


	return offset;
}

forward AntiSobeit(playerid);
public AntiSobeit(playerid) {
    new Float:x, Float:y, Float:z;
    GetPlayerCameraFrontVector(playerid, x, y, z);
    #pragma unused x
    #pragma unused y

    if (PlayerInfo[playerid][pGod] > 10) {
	    SendClientMessage(playerid, COLOR_LIGHTRED, "Вы были забанены по подозрению в читерстве. (Код ошибки: 999)");
	   	//SendClientMessage(playerid, COLOR_LIGHTRED, "Удалите ВСЕ ДОПОЛНИТЕЛЬНЫЕ ПРОГРАММЫ ДЛЯ GTA:SA, чтобы продолжить игру на сервере!");
	    PlayerInfo[playerid][pLocked] = 1;
	 	PlayerInfo[playerid][pUnLockTime] = gettime() + 1209600;
	 	UpdatePropForUserStr("banReason","Sobeit auto ban",PlayerInfo[playerid][dbName]);
	 	UpdatePropForUserInt("banedByAdmin",0,PlayerInfo[playerid][dbName]);
	 	OnPlayerUpdateRLSauronRealSave(playerid);
		new string[60];
		format(string,sizeof(string),"( ! ) Player id=%d подозрение в использовнии Sobeit - ban!",playerid);
		printf(string);
		ABroadCast(COLOR_LIGHTRED,string,1);
	   	printf("[Server] AntiSobeit test FALED!!! - BAN !!! <<<===");
   	}

    if(z < -0.8) {
	   // hacker. send some messages nad give ban
   		PlayerInfo[playerid][pCheatCounter]+=20;
   		PlayerInfo[playerid][pGod]++;
        PlayerInfo[playerid][pSpawnX] = float(Random(-2400,2800));
		PlayerInfo[playerid][pSpawnY] = float(Random(-2140,1100));
		PlayerInfo[playerid][pSpawnZ] = 550.0;
   	    OnPlayerUpdateRLSauronRealSave(playerid);
		SendClientMessage(playerid, COLOR_LIGHTRED, "Удалите ВСЕ ДОПОЛНИТЕЛЬНЫЕ ПРОГРАММЫ ДЛЯ GTA:SA, чтобы продолжить игру на сервере!");
		printf("[Server] AntiSobeit test FALED by %s[%d] %d/11",PlayerInfo[playerid][dbName],playerid,PlayerInfo[playerid][pGod]);
	   	kickPlayer(playerid);
    } else {
        TogglePlayerControllable(playerid, 1);
        playerSpawnCheat[playerid] = 0;
        printf("[Server] AntiSobeit test passed!");
    }
    return 1;
}

stock FetchMissleSlot(objectid)
{

        for(new i = 0; i < MAX_MISSLES; i ++)
        {

            if(missles[i] == objectid) return i;

        }
        return -1;

}

stock ResetMissles()
{

        for(new i = 0; i < MAX_MISSLES; i ++) missles[i] = -1;

}

stock FetchNextMissleSlot()
{

        for(new i = 0; i < MAX_MISSLES; i ++)
        {

            if(missles[i] == -1) return i;

        }
        return -1;

}

stock SetObjectToFaceCords(objectid, Float:x1, Float:y1, Float:z1)
{

    //   SetObjectToFaceCords() By LucifeR   //

    new Float:x2,Float:y2,Float:z2;
    GetObjectPos(objectid, x2,y2,z2);

    new Float:DX = floatabs(x2-x1);
    new Float:DY = floatabs(y2-y1);
    new Float:DZ = floatabs(z2-z1);

    new Float:yaw = 0;
    new Float:pitch = 0;

    if(DY == 0 || DX == 0)
    {

        if(DY == 0 && DX > 0)
                {
                yaw = 00;
            pitch = 0;
                }
        else if(DY == 0 && DX < 0)
                {

                        yaw = 180;
            pitch = 180;

                }
        else if(DY > 0 && DX == 0)
                {

                        yaw = 90;
            pitch = 90;

                }
        else if(DY < 0 && DX == 0)
                {
                yaw = 270;
            pitch = 270;

                }
        else if(DY == 0 && DX == 0)
                {
                yaw = 0;
                pitch = 0;
                }

    }
    else
    {
                yaw = atan(DX/DY);
                pitch = atan(floatsqroot(DX*DX + DZ*DZ) / DY);
        if(x1 > x2 && y1 <= y2)
                {

                yaw = yaw + 90;
            pitch = pitch - 45;

                }
        else if(x1 <= x2 && y1 < y2)
                {

                yaw = 90 - yaw;
            pitch = pitch - 45;

                }
        else if(x1 < x2 && y1 >= y2)
                {

            yaw = yaw - 90;
            pitch = pitch - 45;

                }
        else if(x1 >= x2 && y1 > y2)
                {

                yaw = 270 - yaw;
            pitch = pitch + 315;

                }
        if(z1 < z2)
        {

                pitch = 360-pitch;

        }
        SetObjectRot(objectid, 0, 0, yaw);
        SetObjectRot(objectid, 0, pitch, yaw+90);

        }

}

forward missleFire(playa);
public missleFire(playa) {
    new slot = FetchNextMissleSlot();
	if(slot > -1) {
        new Float:X, Float:Y, Float:Z;
        GetPlayerPos(playa,X,Y,Z);
        missles[slot] = CreateObject(345,X+200.0,Y+200.0,Z+200.0,0.0,0.0,0.0);
        SetObjectToFaceCords(missles[slot], X, Y, Z);
        new bangTime = MoveObject(missles[slot],X,Y,Z,MISSLE_SPEED);
        SetTimerEx("missleBang", bangTime, false, "fff",X,Y,Z);
        lastMissleAttackTime[playa] = gettime();
	}
	return 1;
}

forward missleBang(Float:X, Float:Y, Float:Z);
public missleBang(Float:X, Float:Y, Float:Z) {
    CreateExplosion(X,Y,Z,2,BLAST_RADIUS);
	return 1;
}

forward missleFireCar(playerid, Float:range);
public missleFireCar(playerid, Float:range) {
    new slot = FetchNextMissleSlot();
	if(slot > -1) {
	    if (IsPlayerInAnyVehicle(playerid)) {
            //if (GetVehicleModel(GetPlayerVehicleID(playerid)) == 443) {

			    new Float:Xmissle,Float:Ymissle,Float:Zmissle,Float:Xplayer,Float:Yplayer,Float:Zplayer;
		        GetPlayerPos(playerid, Xplayer, Yplayer, Zplayer);
			 	Xmissle = Xplayer;
				Ymissle = Yplayer;
				GetXYInFrontOfPlayer(playerid, Xmissle, Ymissle, range);
				Xmissle = Xmissle+float(Random(-15,15));
				Ymissle = Ymissle+float(Random(-15,15));
				Zmissle = GetPointZPos(Xmissle, Ymissle);
		        missles[slot] = CreateObject(345,Xplayer,Yplayer,Zplayer+5.0,0.0,0.0,0.0);
		        SetObjectToFaceCords(missles[slot], Xmissle, Ymissle, Zmissle);
		        new bangTime = MoveObject(missles[slot],Xmissle, Ymissle, Zmissle, 200.0);
		        SetTimerEx("missleBang", bangTime, false, "fff",Xmissle, Ymissle, Zmissle);
			//}
		}
	}
	return 1;
}

forward missleClanFire(misslebaseid);
public missleClanFire(misslebaseid) {
    new slot = FetchNextMissleSlot();
	if(slot > -1) {
        new Float:X = Base[misslebaseid][basex]+float(Random(-30,30));
        new Float:Y = Base[misslebaseid][basey]+float(Random(-30,30));
        new Float:Z = Base[misslebaseid][basez]+float(Random(-1,3));
        missles[slot] = CreateObject(345,0.0,0.0,1500.0,0.0,0.0,0.0);
        SetObjectToFaceCords(missles[slot], X, Y, Z);
        MoveObject(missles[slot],X,Y,Z,MISSLE_SPEED);
	}
	return 1;
}

forward openMissleDoor();
public openMissleDoor() {
	if (missleDoorStatus == 1) {
	    MoveObject(missleDoor, 1353.85, -1757.75, 14.01,0.3,   0.00, 0.00, 90.00);
    	missleDoorStatus = 0;
	}
	SetTimer("closeMissleDoor", 10000, false);
	return 1;
}

forward closeMissleDoor();
public closeMissleDoor() {
    if (missleDoorStatus == 0) {
	    MoveObject(missleDoor, 1351.99, -1757.75, 14.01,0.3,   0.00, 0.00, 90.00);
    	missleDoorStatus = 1;
	}
	SetTimer("openMissleDoor60", 120000, false);
	return 1;
}

forward openMissleDoor60();
public openMissleDoor60() {
	if (missleDoorStatus == 1) {
	    MoveObject(missleDoor, 1353.85, -1757.75, 14.01,0.3,   0.00, 0.00, 90.00);
    	missleDoorStatus = 0;
	}
	SetTimer("closeMissleDoor60", 10000, false);
	return 1;
}

forward closeMissleDoor60();
public closeMissleDoor60() {
    if (missleDoorStatus == 0) {
	    MoveObject(missleDoor, 1351.99, -1757.75, 14.01,0.3,   0.00, 0.00, 90.00);
    	missleDoorStatus = 1;
	}
	return 1;
}

forward sendRadioMessage(playerid,message[]);
public sendRadioMessage(playerid,message[]) {
		new string[500];
  		if (strlen(PlayerInfo[playerid][pRankName]) > 1) {
		    //format(string, sizeof(string), "{FFA200}CH%d[{7FB151}%s{FFA200}:%d] {90EC3E}%s",PlayerInfo[playerid][pPnumber],PlayerInfo[playerid][pRankName],playerid,message);
		    //format(string, sizeof(string), "{FF8C00}[Рация] {FFFFE0}%s[%d]|CH%d:{DCDCDC}%s",PlayerInfo[playerid][pRankName],playerid,PlayerInfo[playerid][pPnumber],message);
		    format(string, sizeof(string), "{FF8C00}[Рация] {7FB151}%s[%d]|CH%d:{90EC3E}%s",PlayerInfo[playerid][pRankName],playerid,PlayerInfo[playerid][pPnumber],message);
		} else {
			//format(string, sizeof(string), "{FFA200}CH%d[ID:%d] {90EC3E}%s",PlayerInfo[playerid][pPnumber],playerid,message);
			//format(string, sizeof(string), "{99FF00}CH{006633}%d{99FF00}[{006633}ID:%d{99FF00}]{999900} %s",PlayerInfo[playerid][pPnumber],playerid,message);
			//format(string, sizeof(string), "{FF8C00}[Рация] {FFFFE0}ID:%d|CH%d:{DCDCDC}%s",playerid,PlayerInfo[playerid][pPnumber],message);
			format(string, sizeof(string), "{FF8C00}[Рация] {7FB151}ID:%d|CH%d:{90EC3E}%s",playerid,PlayerInfo[playerid][pPnumber],message);
		}
		new HighestPlayerId = GetPlayerPoolSize();
		new isPlayerHaveRadio[MAX_PLAYERS];
		for(new y=0; y <= HighestPlayerId; y++) { // (note the condition change from < to <=)
			if(IsPlayerConnected(y)) {
			    if (PlayerInfo[playerid][pPnumber] == PlayerInfo[y][pPnumber] || PlayerInfo[y][pAdmin] > 100 || BigEar[y]) {
				    //new msgIsSend = false;
					for (new z=0; z<PlayerInventoryMaxLimit; z++) {
						if ((PlayerInventory[y][z][itemType] == 9 || PlayerInfo[y][adminDefence] == 1) && gPlayerLogged[y] == 1) {
				    		//SendClientMessage(y, COLOR_LIGHTRED, string);
				    		SendSplitMessage(y, 0x99990000, string);
				    		isPlayerHaveRadio[y] = 1;
			    			//msgIsSend = true;
			    			break;
	  					}
					}
				  	/*if (!msgIsSend && gPlayerLogged[y] == 1 && PlayerInfo[y][pAdmin] == 0) {
					    MeChat(y,"хочет найти рацию!");
					}*/
				}
			}
		}

		//игроки без рации и рядом тоже слышат, что говорят в рацию
		for(new y=0; y <= HighestPlayerId; y++) {
			if(IsPlayerConnected(y) && isPlayerHaveRadio[y] != 1) {
			    for(new i=0; i <= HighestPlayerId; i++) {
					if(IsPlayerConnected(i) && GetPlayerState(i) != PLAYER_STATE_SPECTATING && isPlayerHaveRadio[i] == 1 && GetDistanceBetweenPlayers(y,i) <= 4.0) {
					    format(string, sizeof(string), "{FFA200}Из рации %s [{7FB151}%s{FFA200}:%d] {90EC3E}%s",PlayerInfo[i][dbName],PlayerInfo[playerid][pRankName],playerid,message);
					    SendSplitMessage(y, 0x90EC3EAA, string);
					    break;
					}
				}
			}
		}

		/*format(string, sizeof(string), "в рацию: %s",result);
		MeChat(playerid,string);*/
		printf("[RADIO]  %s[%d]CH%d : %s",PlayerInfo[playerid][dbName],playerid,PlayerInfo[playerid][pPnumber],message);
		return 1;
}
forward SpectateIn1Sec(playerid, specid);
public SpectateIn1Sec(playerid, specid) {
	StartSpectate(playerid, specid);
	return 1;
}

forward RemoveAntiDrop(playerid);
public RemoveAntiDrop(playerid) {
	//PlayerInfo[playerid][antiDrop] = 0;
	tempAntiDrop[playerid] = 0;
	return 1;
}

forward enableWeaponCheck(val);
public enableWeaponCheck(val) {
	disableWeaponCheck = 0;
	return 1;
}

forward SetPlayerNameSauron(playerid,name[]);
public SetPlayerNameSauron(playerid,name[]) {
	if (PlayerInfo[playerid][pVIPtime] > gettime() && PlayerInfo[playerid][pAdmin] < 100) {
	    new test1name[70];
	    format(test1name,sizeof(test1name), "[V]%s",name);
	    SetPlayerName(playerid, test1name);
	    //printf("[SERVER] SetPlayerNameSauron(%d,%s)",playerid,test1name);
	} else {
		SetPlayerName(playerid, name);
		//printf("[SERVER] SetPlayerNameSauron(%d,%s)",playerid,name);
	}

	return 1;
}

forward closeCentralDoor1();
public closeCentralDoor1() {
    centralMoneyDoor1Status = 1;
    MoveDynamicObject(centralMoneyDoor1,2335.95, 17.07, 27.17,0.5);
	return 1;
}

forward closeCentralDoor2();
public closeCentralDoor2() {
    centralMoneyDoor2Status = 1;
    MoveDynamicObject(centralMoneyDoor21, 2358.30, 19.07, 14.60,0.1,   90.00, 0.00, 0.00);
	MoveDynamicObject(centralMoneyDoor22, 2358.30, 19.07, 14.60,0.1,   90.00, 0.00, 0.00);
	return 1;
}
forward createChernuha();
public createChernuha() {
	CreateExplosion(-323.4750,1852.0859,42.5078,2,50.0);
	CreateExplosion(-320.0645,1865.1963,42.5078,2,50.0);
	CreateExplosion(-319.8092,1858.8455,42.5078,2,50.0);
	CreateExplosion(-327.0945,1870.9230,42.5078,2,50.0);
	CreateExplosion(-334.3867,1869.6892,42.5078,2,50.0);
	CreateExplosion(-337.9032,1865.8038,42.5078,2,50.0);
	CreateExplosion(-339.2237,1858.5714,42.5078,2,50.0);
	CreateExplosion(-335.0396,1852.5243,42.5078,2,50.0);
	
	SetTimer("createChernuhaExplosion", 500, 0);
	SetTimer("createChernuhaExplosion", 1500, 0);
	SetTimer("createChernuhaExplosion", 2500, 0);
	SetTimer("createChernuhaExplosion", 5000, 0);
	SetTimer("createChernuhaExplosion", 6000, 0);
	
	/*for(new i = 0; i<GetMaxPlayers(); i++) {
		if (IsPlayerConnected(i) && GetPVarInt(i, "true_player_hp") == 1 && gPlayerLogged[i] == 1 && PlayerInfo[i][pAdmin] < 100) {
		    trueKill[i] = 1;
	        SetPlayerHealthAC(i, -10.0);
			PlayerInfo[i][pHP] = -10;
			PlayerHealth[i] = -10.0;
		}
	}*/

    new cherhuhaStawnTime = MoveObject(chernuhaCover,-332.4200, 1859.3700, 28.3763,1.5, 0.000000, 0.000000, 0.0);
    SetTimer("spawnChernuha", cherhuhaStawnTime, 0);
    printf("[SERVER] PREPARE CHERNUHA SPAWN!");
	return 1;
}
forward createChernuhaExplosion();
public createChernuhaExplosion() {
	CreateExplosion(-323.4750,1852.0859,42.5078,2,150.0);
	CreateExplosion(-320.0645,1865.1963,42.5078,2,150.0);
	CreateExplosion(-319.8092,1858.8455,42.5078,2,150.0);
	CreateExplosion(-327.0945,1870.9230,42.5078,2,150.0);
	CreateExplosion(-334.3867,1869.6892,42.5078,2,150.0);
	CreateExplosion(-337.9032,1865.8038,42.5078,2,150.0);
	CreateExplosion(-339.2237,1858.5714,42.5078,2,150.0);
	CreateExplosion(-335.0396,1852.5243,42.5078,2,150.0);
	return 1;
}
forward spawnChernuha();
public spawnChernuha() {
    CreateItem(-329.1369,1860.7988,44.3828,93);
    SetTimer("resetSpawnChernuha", 600000, 0);
    printf("[SERVER] SPAWN CHERNUHA!");
	return 1;
}
forward resetSpawnChernuha();
public resetSpawnChernuha() {
    MoveObject(chernuhaCover, -332.42, 1859.37, 41.01,1.5, 0.00, 0.00, 0.00);
    for (new idxs=0; idxs<maxLoot;idxs++) {
	    if (Distance2D(-329.1369,1860.7988,Loot[idxs][lootx],Loot[idxs][looty]) < 10.0 && Loot[idxs][lootType]>0 && Loot[idxs][lootVW] == 0) {
	        if (IsValidDynamicObject(Loot[idxs][lootid])) {
		        DestroyDynamicObject(Loot[idxs][lootid]);
		    }
	        printf("[SERVER] CHERNUHA RESET - Drop Loot OBJ Type=%d",Loot[idxs][lootType]);
		    Loot[idxs][lootid] = 0;
	        Loot[idxs][lootType] = 0;
	        Loot[idxs][lootHealth] = 0;
	        Loot[idxs][lootUseCount] = 0;
	        Loot[idxs][lootTime] = gettime();
	    }

	}
	printf("[SERVER] CHERNUHA RESET!");
	return 1;
}
forward removeActor(actorid);
public removeActor(actorid) {
	if(IsValidActor(actorid)) {
    DestroyActor(actorid);
	}
	return 1;
}

forward getPlayerZone(playerid);
public getPlayerZone(playerid) {
	if (IsPlayerNPC(playerid)) return -1;
	new Float: ZoneX = -3000.0;
	new Float: ZoneY = -3000.0;
	for (new i=0; i<900; i++) {
	    if (i%30 == 0 && i > 0) {
			ZoneX = -3000.0;
			ZoneY += 200.0;
		}
		if (PlayerToKvadrat( playerid, ZoneX, ZoneY, (ZoneX+200.0), (ZoneY+200.0))) {
		    return i;
		}
		ZoneX += 200.0;

	}
	return -1;
}

forward getPointZone(Float:px,Float:py);
public getPointZone(Float:px,Float:py) {
	new Float: ZoneX = -3000.0;
	new Float: ZoneY = -3000.0;
	for (new i=0; i<900; i++) {
	    if (i%30 == 0 && i > 0) {
			ZoneX = -3000.0;
			ZoneY += 200.0;
		}
		if (PointToKvadrat(px,py , ZoneX, ZoneY, (ZoneX+200.0), (ZoneY+200.0))) {
		    return i;
		}
		ZoneX += 200.0;

	}
	return -1;
}
forward getBaseZoneId(baseId);
public getBaseZoneId(baseId) {
	for (new idxs=0; idxs<200;idxs++) {
	    if (Base[idxs][baseid] == baseId) {
	        return idxs;
	    }
	}
	return -1;
}

forward checkNearZone(zoneid,zoneOwnerId);
public checkNearZone(zoneid,zoneOwnerId) {
	if ((zoneid-30) > 0) {
	    if (zoneOwner[(zoneid-30)] == zoneOwnerId) {
	        return true;
	    }
	}
	if ((zoneid+30) < 899) {
	    if (zoneOwner[(zoneid+30)] == zoneOwnerId) {
	        return true;
	    }
	}
	if (zoneid % 30 != 0 && zoneid > 1) {
	    if (zoneOwner[(zoneid-1)] == zoneOwnerId) {
	        return true;
	    }
	}
	if ((zoneid+1) % 30 != 0 && zoneid < 899) {
	    if (zoneOwner[(zoneid+1)] == zoneOwnerId) {
	        return true;
	    }
	}
	return false;
}

forward endZoneBattle(zoneid);
public endZoneBattle(zoneid) {
	new Float: ZoneX = -3000.0;
	new Float: ZoneY = -3000.0;
	new winner = -1;
	new newZoneOwner = -1;
	for (new i=0; i<200; i++) {
	    zoneWinner[i] = 0;
	}
	for (new i=0; i<900; i++) {
	    if (i%30 == 0 && i > 0) {
			ZoneX = -3000.0;
			ZoneY += 200.0;
		}
		if (i == zoneid) {
		    new HighestPlayerId = GetPlayerPoolSize();
			for(new z=0; z <= HighestPlayerId; z++) {
				if (IsPlayerConnected(z) && GetPVarInt(z, "true_player_hp") == 1 && !IsPlayerNPC(z) && gPlayerLogged[z] == 1 && PlayerInfo[z][pMember] >0 && PlayerToKvadrat(z, ZoneX, ZoneY, (ZoneX+200.0), (ZoneY+200.0)) && PlayerInfo[z][pVampire] == 0 && PlayerInfo[z][adminDefence] == 0) {
                    zoneWinner[getBaseZoneId(PlayerInfo[z][pMember])]++;
				}
			}
			break;
		}
		ZoneX += 200.0;
	}
	for (new i=0; i<200; i++) {
	    if (zoneWinner[i] > 0 && zoneWinner[i] > winner ) {
		    winner = zoneWinner[i];
	        newZoneOwner = i;
	    }
	}
	zoneOwner[zoneid] = newZoneOwner;
	GangZoneStopFlashForAll(zone[zoneid]);
	zoneIsUnderAttack = 0;
	zoneIsUnderAttackTime = 0;
	for (new i=0; i<900; i++) {
		GangZoneShowForAll(zone[i],GetGangZoneColorNew(zoneOwner[i]));
	}
	zoneIdIsUnderAttack = -1;
	SaveZoneOwner();
	if (newZoneOwner >=0) {
	    new msg[200];
	    format(msg, sizeof(msg), "НЛО: Внимание! Территорию захватил клан %s!",Base[newZoneOwner][nickPrefix]);
		SendClientMessageToAll(0xAA3333AA, msg);
		printf("[Server] Territory win - %s",Base[newZoneOwner][nickPrefix]);
	} else {
	    SendClientMessageToAll(0xAA3333AA, "НЛО: Внимание! Территорию никто не захватил!");
	    printf("[Server] Territory no win!");
	}
	return 1;
}


stock endZoneBattleNew(zoneid) {

	printf("[DEBUG] endZoneBattleNew %d",zoneid);

    new Float: ZoneX = -3000.0;
	new Float: ZoneY = -3000.0;
	new winnerOnZoneStay = -1;
	new winnerOnZoneStayClanId = -1;
	for (new i=0; i<200; i++) {
	    zoneWinner[i] = 0;
	}
	printf("[DEBUG] endZoneBattleNew STEP 1");
	for (new i=0; i<900; i++) {
	    if (i%30 == 0 && i > 0) {
			ZoneX = -3000.0;
			ZoneY += 200.0;
		}
		if (i == zoneid) {
		    new HighestPlayerId = GetPlayerPoolSize();
			for(new z=0; z <= HighestPlayerId; z++) {
				if (IsPlayerConnected(z) && GetPVarInt(z, "true_player_hp") == 1 && !IsPlayerNPC(z) && gPlayerLogged[z] == 1 && PlayerInfo[z][pMember] >0 && PlayerToKvadrat(z, ZoneX, ZoneY, (ZoneX+200.0), (ZoneY+200.0)) && PlayerInfo[z][pVampire] == 0 && PlayerInfo[z][adminDefence] == 0 && PlayerInfo[z][pAdmin] < 100) {
                    zoneWinner[getBaseZoneId(PlayerInfo[z][pMember])]++;
				}
			}
			break;
		}
		ZoneX += 200.0;
	}
	printf("[DEBUG] endZoneBattleNew STEP 2");
	for (new i=0; i<200; i++) {
	    if (zoneWinner[i] > 0 && zoneWinner[i] > winnerOnZoneStay ) {
		    winnerOnZoneStay = zoneWinner[i];
	        winnerOnZoneStayClanId = i;
	    }
	}
    printf("[DEBUG] endZoneBattleNew STEP 3");
	new winner = -1;
	new newZoneOwner = -1;
	for (new i=0; i<200; i++) {
	    if (zoneClanKills[i] > 0 && zoneClanKills[i] > winner ) {
		    winner = zoneClanKills[i];
	        newZoneOwner = i;
	    }
	}
    printf("[DEBUG] endZoneBattleNew STEP 4");
	if (newZoneOwner >= 0 && zoneWinner[newZoneOwner] <= 0) { //если победителей нет на зоне
	    newZoneOwner = winnerOnZoneStayClanId;
	} else if (winnerOnZoneStayClanId >= 0) {
	    newZoneOwner = winnerOnZoneStayClanId;
	}
    printf("[DEBUG] endZoneBattleNew STEP 4.1");
	zoneOwner[zoneid] = newZoneOwner;
	GangZoneStopFlashForAll(zone[zoneid]);

	zoneIsUnderAttack = 0;
	zoneIsUnderAttackTime = 0;
	printf("[DEBUG] endZoneBattleNew STEP 4.2");
	for (new i=0; i<900; i++) {
		GangZoneShowForAll(zone[i],GetGangZoneColorNew(zoneOwner[i]));
	}
	zoneIdIsUnderAttack = -1;
	printf("[DEBUG] endZoneBattleNew STEP 5");
	SaveZoneOwner();
	printf("[DEBUG] endZoneBattleNew STEP 6");
	if (newZoneOwner >=0) {
	    new msg[200];
	    format(msg, sizeof(msg), "НЛО: Внимание! Территорию захватил клан %s!",Base[newZoneOwner][nickPrefix]);
		SendClientMessageToAll(0xAA3333AA, msg);
		printf("[Server] Territory win - %s",Base[newZoneOwner][nickPrefix]);
	} else {
	    SendClientMessageToAll(0xAA3333AA, "НЛО: Внимание! Территорию никто не захватил!");
	    printf("[Server] Territory no win!");
	}
	printf("[DEBUG] endZoneBattleNew STEP 7");
	return 1;
}

#define EX_SPLITLENGTH 118

stock SendSplitMessage(playerid, color, final[]) {
	new buffer[EX_SPLITLENGTH+5];
	new len = strlen(final);
	if(len>EX_SPLITLENGTH) {
	    new times = (len/EX_SPLITLENGTH);
		for(new i = 0; i < times+1; i++) {
			strdel(buffer, 0, EX_SPLITLENGTH+5);
			if(len-(i*EX_SPLITLENGTH)>EX_SPLITLENGTH) {
				strmid(buffer, final, EX_SPLITLENGTH*i, EX_SPLITLENGTH*(i+1));
				format(buffer, sizeof(buffer), "%s ...", buffer);
			} else {
			    strmid(buffer, final, EX_SPLITLENGTH*i, len);
			}
			SendClientMessage(playerid, color, buffer);
		}
	} else {
		SendClientMessage(playerid, color, final);
	}
}

forward bridgeCrushFix();
public bridgeCrushFix() {
	if (bridgeCrushFlag == 1) {
	    MoveObject(bridgeCrush,-1143.71, 2696.84, 48.73,1,   0.0, 0.00, 186.6403);
	    bridgeCrushFlag = 0;
	    printf("[SERVER] BRIDGE FIXED!");
	}
	return 1;
}



forward bridge2Step2();
public bridge2Step2() {
	bridge2Crush[4] = CreateDynamicObject(2780, 63.03, -1544.77, 5.07,   0.00, 0.00, 98.34);
	bridge2Crush[5] = CreateDynamicObject(2780, 59.65, -1533.74, 5.56,   0.00, 0.00, 95.94);
	bridge2Crush[6] = CreateDynamicObject(2780, 54.66, -1522.74, 5.17,   0.00, 0.00, 101.28);
	bridge2Crush[7] = CreateDynamicObject(2780, 49.04, -1522.34, 5.66,   0.00, 0.00, -136.74);
	bridge2Crush[8] = CreateDynamicObject(2780, 44.46, -1532.80, 4.54,   0.00, 0.00, -123.48);
	bridge2Crush[9] = CreateDynamicObject(2780, 41.53, -1542.52, 4.33,   0.00, 0.00, 256.98);
	bridge2Crush[10] = CreateDynamicObject(2780, 62.11, -1538.64, 7.34,   0.00, 0.00, 96.72);
	bridge2Crush[11] = CreateDynamicObject(2780, 58.19, -1530.22, 5.32,   0.00, 0.00, 102.42);
	bridge2Crush[12] = CreateDynamicObject(2780, 43.17, -1535.09, 6.25,   0.00, 0.00, 270.72);
	bridge2Crush[13] = CreateDynamicObject(2780, 47.63, -1524.97, 4.89,   0.00, 0.00, -119.22);
	printf("[SERVER] BRIDGE 2 STEP 2!");
	SetTimer("bridge2Step3", 500000, 0);
	return 1;
}

forward bridge2Step3();
public bridge2Step3() {
	new Float:down = 40.0;
    MoveDynamicObject(bridge2Crush[0],52.50, -1626.20, (4.65-down),0.3);
    MoveDynamicObject(bridge2Crush[1],52.54, -1628.40, (14.71-down),0.3);
    MoveDynamicObject(bridge2Crush[2],53.11, -1701.23, (23.70-down),0.3);
    MoveDynamicObject(bridge2Crush[3],54.20, -1689.72, (26.58-down),0.3);

	MoveDynamicObject(bridge2Crush[4], 63.03, -1544.77, (5.07-down),0.3);
	MoveDynamicObject(bridge2Crush[5], 59.65, -1533.74, (5.56-down),0.3);
	MoveDynamicObject(bridge2Crush[6], 54.66, -1522.74, (5.17-down),0.3);
	MoveDynamicObject(bridge2Crush[7], 49.04, -1522.34, (5.66-down),0.3);
	MoveDynamicObject(bridge2Crush[8], 44.46, -1532.80, (4.54-down),0.3);
	MoveDynamicObject(bridge2Crush[9], 41.53, -1542.52, (4.33-down),0.3);
	MoveDynamicObject(bridge2Crush[10], 62.11, -1538.64, (7.34-down),0.3);
	MoveDynamicObject(bridge2Crush[11], 58.19, -1530.22, (5.32-down),0.3);
	MoveDynamicObject(bridge2Crush[12], 43.17, -1535.09, (6.25-down),0.3);
	MoveDynamicObject(bridge2Crush[13], 47.63, -1524.97, (4.89-down),0.3);
	printf("[SERVER] BRIDGE 2 STEP 3!");
	SetTimer("bridge2CrushFix", 120000, 0);
	return 1;
}

forward bridge2CrushFix();
public bridge2CrushFix() {
	if (bridge2CrushFlag == 1) {
	    MoveDynamicObject(bridge2Crush[0],105.38, -3132.22, 4.65,1000.0);
	    MoveDynamicObject(bridge2Crush[1],105.38, -3134.53, 14.71,1000.0);
	    MoveDynamicObject(bridge2Crush[2],105.99, -3207.12, 23.70,1000.0);
	    MoveDynamicObject(bridge2Crush[3],107.07, -3195.56, 26.58,1000.0);
        DestroyDynamicObject(bridge2Crush[4]);
        DestroyDynamicObject(bridge2Crush[5]);
        DestroyDynamicObject(bridge2Crush[6]);
        DestroyDynamicObject(bridge2Crush[7]);
        DestroyDynamicObject(bridge2Crush[8]);
        DestroyDynamicObject(bridge2Crush[9]);
        DestroyDynamicObject(bridge2Crush[10]);
        DestroyDynamicObject(bridge2Crush[11]);
        DestroyDynamicObject(bridge2Crush[12]);
        DestroyDynamicObject(bridge2Crush[13]);
	    bridge2CrushFlag = 0;
	    printf("[SERVER] BRIDGE 2 FIXED!");
	}
	return 1;
}

forward tunnelCrushFix();
public tunnelCrushFix() {
	if (tunnelCrushFlag == 1) {
	    MoveDynamicObject(tunnelCrush[0],-1032.60, -964.31, 64.16, 0.5);
        MoveDynamicObject(tunnelCrush[1],-1025.80, -977.69, 82.59, 0.5);
        MoveDynamicObject(tunnelCrush[2],-1046.71, -957.49, 81.29, 0.5);
	    tunnelCrushFlag = 0;
	    printf("[SERVER] TUNNEL FIXED!");
	}
	return 1;
}

forward sendPlayerToEvent(i);
public sendPlayerToEvent(i) {
	playerAtEvent1[i] = 1;
    playerUpdateCounter[i] = 0;
    playerHPAtEvent1[i] = 200;
    dostup[i] = 0;
    NewSpawnPlayer(i);
    Event1Players++;
    return 1;
}

forward removeBaseMoveLock(playerid);
public removeBaseMoveLock(playerid) {
    moveBaseLock[playerid] = 0;
	return 1;
}

forward getMaxLootAtBase(baseId);
public getMaxLootAtBase(baseId) {
	/*if (Base[baseId][territoryOwn] > 50) {
	    return Base[baseId][territoryOwn]+300;
	}*/
	
	new result = 300;
	new addon = 0; //addon = Base[baseId][baseUpgrade]*50;
	if (Base[baseId][baseUpgrade] == 2) {
		addon = 50;
	} else if (Base[baseId][baseUpgrade] == 3) {
		addon = 100;
	} else if (Base[baseId][baseUpgrade] == 4) {
		addon = 150;
	}
	
	return (result+addon);
	
	/*if (Base[baseId][baseUpgrade] > 2) {
	    return 500;
	} else {
		return 400;
	}*/

}

forward skynetDefence(playerid);
public skynetDefence(playerid) {
    new missleFireTime = 300;
    for (new z=0; z<30; z++) {
        SetTimerEx("missleFire", missleFireTime, 0, "i", playerid);
        missleFireTime += 300;
	}
	return 1;

}

forward spawnLootAtNewBunker();
public spawnLootAtNewBunker() {
    printf("[SERVER] SPAWN NEW BUNKER LOOT:");
    for (new idxs=0; idxs<maxLoot;idxs++) {
	    if (Loot[idxs][lootType]>0 && GetDistanceBetweenPoints(Loot[idxs][lootx],Loot[idxs][looty],Loot[idxs][lootz],351.1646, -149.4086, 1091.7585) <= 100.0 && Loot[idxs][lootVW] == 0) {
	        if (IsValidDynamicObject(Loot[idxs][lootid])) {
		        DestroyDynamicObject(Loot[idxs][lootid]);
		    }
	        printf("[SERVER] DROP NEW BUNKER LOOT - Drop Loot OBJ Type=%d",Loot[idxs][lootType]);
		    Loot[idxs][lootid] = 0;
	        Loot[idxs][lootType] = 0;
	        Loot[idxs][lootHealth] = 0;
	        Loot[idxs][lootUseCount] = 0;
	        Loot[idxs][lootTime] = gettime();
	    }

	}

	if (random(20) == 5) {
	    CreateItem(363.9042,-122.8035,1091.0000,66); //уран
	    printf("[SERVER] SPAWN NEW BUNKER LOOT - ADD URAN");
	}
	
	if (random(10) == 5) {
        CreateItem(330.9391,-94.9499,1082.0000,73); //патроны шайтан
        printf("[SERVER] SPAWN NEW BUNKER LOOT - ADD SHAITAN AMMO");
	} else {
	    CreateItem(330.9391,-94.9499,1082.0000,88); //патроны mp-5
	}
    if (random(10) == 5) {
	    CreateItem(332.6318,-95.1153,1082.0000,76); //патроны ак-47
	    printf("[SERVER] SPAWN NEW BUNKER LOOT - ADD AK-47 AMMO");
	} else {
	    CreateItem(332.6318,-95.1153,1082.0000,88); //патроны mp-5
	}
	
	
    CreateItem(334.5367,-94.9302,1082.0000,55); //большая взрывчатка
    CreateItem(335.5979,-93.0021,1082.9506,55); //большая взрывчатка
    CreateItem(333.0308,-93.1606,1082.9506,88); //патроны mp-5
    CreateItem(329.9040,-93.0611,1082.9506,88); //патроны mp-5
    
    CreateItem(339.2589,-175.3495,1098.3193,38);
	CreateItem(349.2111,-151.6072,1090.5000,38);
	CreateItem(349.0870,-144.1666,1090.5000,42);
	CreateItem(351.8968,-129.9961,1085.8516,42);
	CreateItem(336.5078,-124.8215,1085.8516,46);
	CreateItem(319.5687,-116.3128,1086.3218,65);
	CreateItem(327.9090,-105.8403,1085.8516,67);
	CreateItem(325.3857,-105.8218,1083.0837,18);
	CreateItem(365.5945,-139.3971,1091.5815,18);
	CreateItem(366.2278,-145.1829,1091.5034,18);
	CreateItem(369.8991,-161.6111,1090.0000,103);
	CreateItem(366.5824,-135.9618,1092.0555,105);

    
	return 1;
}

forward serverStartUpdates();
public serverStartUpdates() {
    mysql_query("UPDATE `users` SET isOnline = 0");
	mysql_free_result(connection);
	SaveStat();
	return 1;
}

stock GetWeaponSlot(weaponid){
	new slot;
	switch(weaponid) {
		case 0,1: slot = 0;
		case 2 .. 9: slot = 1;
		case 10 .. 15: slot = 10;
		case 16 .. 18, 39: slot = 8;
		case 22 .. 24: slot =2;
		case 25 .. 27: slot = 3;
		case 28, 29, 32: slot = 4;
		case 30, 31: slot = 5;
		case 33, 34: slot = 6;
		case 35 .. 38: slot = 7;
		case 40: slot = 12;
		case 41 .. 43: slot = 9;
		case 44 .. 46: slot = 11;
	}
	return slot;
}

//forward createTreasure();
stock createTreasure() {
    treasureX = float(Random(-3000,3000));
    treasureY = float(Random(-3000,3000));
    treasureZ = GetPointZPos(treasureX,treasureY);
	while (treasureZ < 1.5 || treasureZ > 60) {
        treasureX = float(Random(-3000,3000));
    	treasureY = float(Random(-3000,3000));
	    treasureZ = GetPointZPos(treasureX,treasureY);
    }
    treasureTime = gettime();
	return 1;
}

stock NYDFT(carid) {
    
    
    for (new i=0; i<=30; i++) {
	    if (IsValidDynamicObject(CarExtraObjects[carid][i])) {
	        DestroyDynamicObject(CarExtraObjects[carid][i]);
		}
	}
    
	CarExtraObjects[carid][0] = CreateDynamicObject(1251, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    CarExtraObjects[carid][1] = CreateDynamicObject(19315, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    CarExtraObjects[carid][2] = CreateDynamicObject(19315, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    CarExtraObjects[carid][3] = CreateDynamicObject(19315, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    CarExtraObjects[carid][4] = CreateDynamicObject(19315, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    CarExtraObjects[carid][5] = CreateDynamicObject(1736, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    CarExtraObjects[carid][6] = CreateDynamicObject(1736, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    CarExtraObjects[carid][7] = CreateDynamicObject(1736, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    CarExtraObjects[carid][8] = CreateDynamicObject(1736, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    CarExtraObjects[carid][9] = CreateDynamicObject(19439, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);

    CarExtraObjects[carid][10] = CreateDynamicObject(1408, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    CarExtraObjects[carid][11] = CreateDynamicObject(1408, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    CarExtraObjects[carid][12] = CreateDynamicObject(1724, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    CarExtraObjects[carid][13] = CreateDynamicObject(2745, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    CarExtraObjects[carid][14] = CreateDynamicObject(19439, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    CarExtraObjects[carid][15] = CreateDynamicObject(19439, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    CarExtraObjects[carid][16] = CreateDynamicObject(19439, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    CarExtraObjects[carid][17] = CreateDynamicObject(19439, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    CarExtraObjects[carid][18] = CreateDynamicObject(19054, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    CarExtraObjects[carid][19] = CreateDynamicObject(19055, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    CarExtraObjects[carid][20] = CreateDynamicObject(19058, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    CarExtraObjects[carid][21] = CreateDynamicObject(19056, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    CarExtraObjects[carid][22] = CreateDynamicObject(19065, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    CarExtraObjects[carid][23] = CreateDynamicObject(1251, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    CarExtraObjects[carid][24] = CreateDynamicObject(1251, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    CarExtraObjects[carid][25] = CreateDynamicObject(1319, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    CarExtraObjects[carid][26] = CreateDynamicObject(1319, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    CarExtraObjects[carid][27] = CreateDynamicObject(1319, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    CarExtraObjects[carid][28] = CreateDynamicObject(1319, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    CarExtraObjects[carid][29] = CreateDynamicObject(1319, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    CarExtraObjects[carid][30] = CreateDynamicObject(1319, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);

    AttachDynamicObjectToVehicle(CarExtraObjects[carid][0], carid, 0.000000, 1.699998, 0.634999, 0.000000, 0.000000, 0.000000); //Object Model: 1251 |
	AttachDynamicObjectToVehicle(CarExtraObjects[carid][1], carid, 0.374999, 4.085045, 0.344999, -1.004999, 1.005000, 88.439956); //Object Model: 19315 |
	AttachDynamicObjectToVehicle(CarExtraObjects[carid][2], carid, -0.389999, 4.085045, 0.344999, -1.004999, 1.005000, 88.439956); //Object Model: 19315 |
	AttachDynamicObjectToVehicle(CarExtraObjects[carid][3], carid, -0.389999, 2.195002, 0.344999, -1.004999, 1.005000, 88.439956); //Object Model: 19315 |
	AttachDynamicObjectToVehicle(CarExtraObjects[carid][4], carid, 0.359999, 2.195002, 0.344999, -1.004999, 1.005000, 88.439956); //Object Model: 19315 |
	AttachDynamicObjectToVehicle(CarExtraObjects[carid][5], carid, 0.359999, 2.590011, 0.704999, -1.004999, 1.005000, 175.875076); //Object Model: 1736 |
	AttachDynamicObjectToVehicle(CarExtraObjects[carid][6], carid, -0.344999, 2.590011, 0.704999, -1.004999, 1.005000, 175.875076); //Object Model: 1736 |
	AttachDynamicObjectToVehicle(CarExtraObjects[carid][7], carid, -0.344999, 4.440053, 0.704999, -1.004999, 1.005000, 175.875076); //Object Model: 1736 |
	AttachDynamicObjectToVehicle(CarExtraObjects[carid][8], carid, 0.399999, 4.440053, 0.704999, -1.004999, 1.005000, 175.875076); //Object Model: 1736 |
	AttachDynamicObjectToVehicle(CarExtraObjects[carid][9], carid, 0.000000, 0.014999, 0.624999, 24.119993, 91.454948, 0.000000); //Object Model: 19439 |

	AttachDynamicObjectToVehicle(CarExtraObjects[carid][10], carid, 1.459998, -1.769998, 0.869999, -152.759963, 0.000000, 90.824928); //Object Model: 1408 |
	AttachDynamicObjectToVehicle(CarExtraObjects[carid][11], carid, -1.429998, -1.769998, 0.869999, -205.020217, 0.000000, 90.824928); //Object Model: 1408 |
	AttachDynamicObjectToVehicle(CarExtraObjects[carid][12], carid, 0.549999, -0.584999, 0.329999, -358.785949, 0.000000, 178.260070); //Object Model: 1724 |
	AttachDynamicObjectToVehicle(CarExtraObjects[carid][13], carid, 0.029999, -0.050000, 0.789999, -404.011169, 4.019999, 190.320129); //Object Model: 2745 |
	AttachDynamicObjectToVehicle(CarExtraObjects[carid][14], carid, -0.509999, -1.389998, 0.454999, -359.790954, 91.454948, 450.616394); //Object Model: 19439 |
	AttachDynamicObjectToVehicle(CarExtraObjects[carid][15], carid, -0.509999, -2.640012, 0.454999, -359.790954, 91.454948, 450.616394); //Object Model: 19439 |
	AttachDynamicObjectToVehicle(CarExtraObjects[carid][16], carid, 0.519999, -2.640012, 0.454999, -359.790954, 91.454948, 450.616394); //Object Model: 19439 |
	AttachDynamicObjectToVehicle(CarExtraObjects[carid][17], carid, 0.519999, -1.369999, 0.454999, -359.790954, 91.454948, 450.616394); //Object Model: 19439 |
	AttachDynamicObjectToVehicle(CarExtraObjects[carid][18], carid, 0.519999, -1.369999, 1.104999, -361.800964, -2.009999, 358.155944); //Object Model: 19054 |
	AttachDynamicObjectToVehicle(CarExtraObjects[carid][19], carid, -0.754999, -1.369999, 1.104999, -361.800964, -2.009999, 358.155944); //Object Model: 19055 |
	AttachDynamicObjectToVehicle(CarExtraObjects[carid][20], carid, -0.714999, -3.770038, 1.104999, -361.800964, -2.009999, 358.155944); //Object Model: 19058 |
	AttachDynamicObjectToVehicle(CarExtraObjects[carid][21], carid, 0.734999, -3.770038, 1.104999, -361.800964, -2.009999, 358.155944); //Object Model: 19056 |
	AttachDynamicObjectToVehicle(CarExtraObjects[carid][22], carid, 0.085000, -0.659999, 1.769998, 1.004999, 17.084999, 94.469940); //Object Model: 19065 |
	AttachDynamicObjectToVehicle(CarExtraObjects[carid][23], carid, -1.149999, -1.889998, -0.439999, 1.004999, 17.084999, 1.005000); //Object Model: 1251 |
	AttachDynamicObjectToVehicle(CarExtraObjects[carid][24], carid, 1.119999, -1.889998, -0.439999, 1.004999, 17.084999, 1.005000); //Object Model: 1251 |
	AttachDynamicObjectToVehicle(CarExtraObjects[carid][25], carid, -1.224999, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000); //Object Model: 1319 |
	AttachDynamicObjectToVehicle(CarExtraObjects[carid][26], carid, 1.079999, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000); //Object Model: 1319 |
	AttachDynamicObjectToVehicle(CarExtraObjects[carid][27], carid, 1.079999, -3.960043, 0.000000, 0.000000, 0.000000, 0.000000); //Object Model: 1319 |
	AttachDynamicObjectToVehicle(CarExtraObjects[carid][28], carid, -1.164999, -3.960043, 0.000000, 0.000000, 0.000000, 0.000000); //Object Model: 1319 |
	AttachDynamicObjectToVehicle(CarExtraObjects[carid][29], carid, 0.994999, 1.904998, -0.129999, -53.265010, -1.004999, 6.030002); //Object Model: 1319 |
	AttachDynamicObjectToVehicle(CarExtraObjects[carid][30], carid, -1.279998, 1.904998, -0.129999, -53.265010, -1.004999, 6.030002); //Object Model: 1319 |
	LinkVehicleToInterior(carid, 6);
}

forward bridgeRockBlockFix(id);
public bridgeRockBlockFix(id) {
	if (bridgeRockBlockFlag[id] == 1) {
	    MoveDynamicObject(bridgeRockBlock[id],bridgeRockBlockCoords[id][0], bridgeRockBlockCoords[id][1], bridgeRockBlockCoords[id][3], 0.5);
        bridgeRockBlockFlag[id] = 0;
	    printf("[SERVER] ROCK BLOCK #%d FIXED!",id);
	}
    return 1;
}
forward removeServerPassword();
public removeServerPassword() {
	//if(gettime() >= 1499598000) {
		SendRconCommand("password 0");
		SendRconCommand("hostname "SERVERNAME" Survival");
		//SendRconCommand("password 100500");
		//SendRconCommand("hostname "SERVERNAME" Технические работы");
	//} else {
		//SendRconCommand("password 1412");
		//SendRconCommand("hostname "SERVERNAME" Технические работы");
	//}
	gunCarCanConnect = 1;
	killAllZombies();
	//SetTimer("serverWipeInProgress",1000,1);
	return 1;
}

new serverWipeProgress = 0;
forward serverWipeInProgress();
public serverWipeInProgress() {
    serverWipeProgress++;
    new srvHostName[100];
    format(srvHostName, sizeof(srvHostName), "hostname  "SERVERNAME" Survival | Почти готово");
    for (new i=0; i < serverWipeProgress; i++) {
    	format(srvHostName, sizeof(srvHostName), "%s.",srvHostName);
    }
    //format(srvHostName, sizeof(srvHostName), "%s]",srvHostName);
    SendRconCommand(srvHostName);
	if (serverWipeProgress > 3) {
	    serverWipeProgress = 0;
	}
}

forward serverShutDown();
public serverShutDown() {
    SendRconCommand("exit");
	return 1;
}

forward closeDdoor();
public closeDdoor() {
    MoveObject(desertDoor, -461.03149400,2593.15234400,56.66737400,1.0,6.01605685,0.00000000,90.24073814);
    desertDoorStatus = 1;
	return 1;
}

forward moveChair(Float: fX,Float: fY,Float: fZ);
public moveChair(Float: fX,Float: fY,Float: fZ) {
    MoveDynamicObject(ZChairObj[0],0.000000+fX, -0.259999+fY, 0.138999+fZ,1.5, 0.000000, 0.000000, 180.000000);
    MoveDynamicObject(ZChairObj[1], -0.028999+fX, -0.349999+fY, 0.598999+fZ,1.5, 270.000000, 0.000000, 0.000000);
    MoveDynamicObject(ZChairObj[2], 0.008999+fX, -0.310000+fY, 1.139000+fZ,1.5, 270.000000, 0.000000, -90.000000);
    MoveDynamicObject(ZChairObj[3], 0.128999+fX, 0.000000+fY, 0.250000+fZ,1.5, 0.000000, 90.000000, -5.000000);
    MoveDynamicObject(ZChairObj[4], -0.128999+fX, 0.000000+fY, 0.259000+fZ,1.5, 0.000000, 90.000000, 5.000000);
    MoveDynamicObject(ZChairObj[5], 0.239999+fX, -0.400000+fY, 0.658999+fZ,1.5, -115.000000, 90.000000, 90.000000);
    MoveDynamicObject(ZChairObj[6], -0.300000+fX, -0.400000+fY, 0.509000+fZ,1.5, -111.000000, 90.000000, -90.000000);
	return 1;
}

forward SetCamBack(playerid);
public SetCamBack(playerid)

{
    if(IsPlayerConnected(playerid))
    {
		new Float:plocx,Float:plocy,Float:plocz;
		GetPlayerPos(playerid, plocx, plocy, plocz);
		SetPlayerPos(playerid, -1863.15, -21.6598, 1060.15); // Warp the player
		SetPlayerInterior(playerid,14);
	}
}

forward FixHour(hour);
public FixHour(hour)
{
	hour = timeshift+hour;
	if (hour < 0)
	{
		hour = hour+24;
	}
	else if (hour > 23)
	{
		hour = hour-24;
	}
	shifthour = hour;
	return 1;
}

stock GetStringText(const string[],idx,text[128])//Abit modified strtok function to return string after 1st blank space
{
    new length = strlen(string);
    while ((idx < length) && (string[idx] <= ' ')) { idx++; }
    new offset = idx; new result[128];
    while ((idx < length) && ((idx - offset) < (sizeof(result) - 1))) { result[idx - offset] = string[idx]; idx++; }
    result[idx - offset] = EOS;
    text = result;
    return result;
}

LoopingAnim(playerid,animlib[],animname[], Float:AnimSpeed, looping, lockx, locky, lockz, lp) {
    gPlayerUsingLoopingAnim[playerid] = 1;
    ApplyAnimation(playerid, animlib, animname, AnimSpeed, looping, lockx, locky, lockz, lp);
}

forward createFire(Float:fx,Float:fy,Float:fz);
public createFire(Float:fx,Float:fy,Float:fz) {
	for (new i=0; i<200; i++) {
	    if (firePlace[i][fireobjectid1] == 0) {
	        firePlace[i][fireobjectid1] = CreateDynamicObject(841, fx,fy,fz-1.0,0.00, 0.00, random(180));
	        firePlace[i][fireobjectid2] = CreateDynamicObject(18688, fx,fy,fz-2.0,0.00, 0.00, random(180));
	        firePlace[i][firex] = fx;
	        firePlace[i][firey] = fy;
	        firePlace[i][firez] = fz;
	        firePlace[i][fireTime] = gettime();
	        return 1;
	    }
	}
	return 1;
}

forward createBomb(Float:fx,Float:fy,Float:fz,power);
public createBomb(Float:fx,Float:fy,Float:fz,power) {
	for (new i=0; i<200; i++) {
	    if (bombPlace[i][bombobjectid] == 0) {
	        bombPlace[i][bombobjectid] = CreateDynamicObject(1654, fx,fy,fz-0.88,0.00, 0.00, random(180));
	        bombPlace[i][bombx] = fx;
	        bombPlace[i][bomby] = fy;
	        bombPlace[i][bombz] = fz;
	        bombPlace[i][bombTime] = gettime();
	        bombPlace[i][bombPower] = power;
	        return 1;
	    }
	}
	return 1;
}