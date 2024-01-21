#define MAX_NPC 	(200)

enum e_npc
{
	NPC_ID,
	NPC_SKIN,
	Float: NPC_X,
	Float: NPC_Y,
	Float: NPC_Z,
	Float: NPC_R
}
new g_npc[MAX_NPC][e_npc];

new Float: npc_pos[][5] = //Float: X, Float Y, Float Z, and Float Rotate
{
	{1763.9133,	-1906.4153,	13.6419,	349.9007,	23.0}
};

stock LoadNpc()
{
	for(new i; i<sizeof npc_pos; i++)
	{
	    g_npc[i][NPC_X] = npc_pos[i][0];
	    g_npc[i][NPC_Y] = npc_pos[i][1];
	    g_npc[i][NPC_Z] = npc_pos[i][2];
	    g_npc[i][NPC_R] = npc_pos[i][3];
	    g_npc[i][NPC_SKIN] = floatround(npc_pos[i][4]);
	    g_npc[i][NPC_ID] = CreateActor(g_npc[i][NPC_SKIN], g_npc[i][NPC_X], g_npc[i][NPC_Y], g_npc[i][NPC_Z], g_npc[i][NPC_R]);
	    Create3DTextLabel("{ffffff}Tekan '{ffff00}N{ffffff}' Untuk berinteraksi",0x1E90FFFF, npc_pos[i][0], npc_pos[i][1], npc_pos[i][2], 50.0, 0);
		CreateDynamicCP(g_npc[i][NPC_X], g_npc[i][NPC_Y], g_npc[i][NPC_Z], 1.9, _, _, _, 2.0);
	    if(i >= MAX_NPC)
	        break;
	}
	print("[RyuX] Semua Npc Telah Di muat");
	return 1;
}

stock GetNearestNpc(playerid, Float: dist = 15.0)
{
	if(dist == 0.0)
		dist = FLOAT_INFINITY;

	new npc = -1;
	new Float: my_dist;

	for(new idx; idx < sizeof g_npc-1; idx ++)
	{
		my_dist = GetPlayerDistanceFromPoint(playerid, g_npc[idx][NPC_X], g_npc[idx][NPC_Y], g_npc[idx][NPC_Z]);
		if(my_dist < dist)
		{
			dist = my_dist,
			npc = idx;
		}
	}
	return npc;
}
