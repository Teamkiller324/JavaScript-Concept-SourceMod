#pragma semicolon 1
#pragma newdecls required
#pragma tabsize 0

#include "javascript_concept.inc"
#include <sdktools>

#define ExampleDBConnection "sourcemod"

JavaScriptConcept_Player Player[MAXPLAYERS];
JavaScriptConcept_Database DB;

// This is a concept of JavaScript-like 'system' or 'arrays'.

public Plugin myinfo = {
	name		= "JavaScript Concept Include Plugin.",
	author		= "Tk /id/Teamkiller324",
	description	= "Concept.",
	version		= "0.01a",
	url			= "https://steamcommunity.com/id/Teamkiller324"
}

public void OnPluginStart()
{
	RegAdminCmd("javascript_concept", JavaScriptConceptCmd, ADMFLAG_ROOT, "JavaScript Concept Command.");
	
	Database.Connect(DBConnect, ExampleDBConnection);
}

Action JavaScriptConceptCmd(int client, int args)
{
	char SteamID2[64];
	GetClientAuthId(client, AuthId_Steam2, SteamID2, sizeof(SteamID2));
	Player[client].String.SteamID2 = SteamID2;
	
	char SteamID3[64];
	GetClientAuthId(client, AuthId_Steam3, SteamID3, sizeof(SteamID3));
	Player[client].String.SteamID3 = SteamID3;
	
	char Playername[64];
	GetClientInfo(client, "name", Playername, sizeof(Playername));
	Player[client].String.Playername = Playername;	
	
	Player[client].Int.UserID = GetClientUserId(client);
	
	PrintToServer("JavaScriptConcept Player Log:");
	PrintToServer(" ");
	PrintToServer("Player[client].String.SteamID2 (%N) returned: \"%s\"", client, SteamID2);
	PrintToServer("Player[client].String.SteamID3 (%N) returned: \"%s\"", client, SteamID3);
	PrintToServer("Player[client].String.Playername (%N) returned \"%s\"", client, Playername);
	PrintToServer("Player[client].Int.UserID (%N) returned: %i", client, Player[client].Int.UserID);
	PrintToServer(" ");
}

void DBConnect(Database database, const char[] error, any data)
{
	char Error[512];
	Format(Error, sizeof(Error), error);
	DB.SQL.Connection = database;
	DB.SQL.Error = Error;
	
	PrintToServer("JavaScriptConcept Database Log:");
	PrintToServer(" ");
	PrintToServer("DB.SQL.Connection returned connnection for \"%s\": \"%i\"", ExampleDBConnection, DB.SQL.Connection);
	PrintToServer("DB.SQL.Error returned: \"%s\"", DB.SQL.Error);
	PrintToServer(" ");
}