#include <a_samp>
#include <zcmd>
#define COLOR_RED FF0000 //udah ada biasa bawaan gm
new Kencing[MAX_PLAYERS];

epublic: Piss(playerid)
{
	Kencing[playerid] +=1;
	SendClientMessage (playerid, COLOR_RED, "karakter Anda Ingin Kencing{FFFFFF} Gunakan /piss untuk kencing");
	return 1;
}

epublic: WaktuKencing(playerid)
{
	Kencing[playerid] -=1;
	SendClientMessage (playerid, COLOR_RED, "karakter Anda Merasa Lega");
	return 1;
}

public OnPlayerSpawn(playerid)
{
	SetTimerEx("Kencing" 300000, true, "i", playerid);
	return 1;
}

CMD:piss(playerid, params[])
{
	new name[MAX_PLAYER_NAME];
	if(Kencing[playerid] <1) return SendClientMessage(playerid, COLOR_RED, "Anda Belum Ingin Kencing");
	ApplyAnimation(playerid, "PAULNMAC","Piss_loop",3.0,1,1,0,0,0);
    new string[128 + MAX_PLAYER_NAME];
	format(string, sizeof(string), "* %s membuka sleting celana dan mulai pipis.", name);
	ProxDetector(15.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    GameTextForPlayer(playerid, "~g~Sedang Pipis~n~~w~Harap tunggu sebentar...", 5000, 3);
	SetTimerEx("Piss", 5000, false, "i", playerid);
	return 1;
}
