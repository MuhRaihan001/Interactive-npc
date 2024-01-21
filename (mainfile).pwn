#include "npc.pwn"

public OnGamemodeInit()
{
  LoadNpc();
  return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(PRESSED(KEY_NO)) // key "N"
	{
	    new npcid = GetNearestNpc(playerid, 3.5);
	    OnTalkWithNpc(npcid, playerid);
	    
	}
    return 1;
}

forward OnTalkWithNpc(npcid, playerid)
public OnTalkWithNpc(npcid, playerid)
{
	switch(npcid)
	{
	    case 0:
			SendClientMessage(playerid, 0xFFFFFFFF, "Work"); //you can add more later
	}
	return 1;
}
