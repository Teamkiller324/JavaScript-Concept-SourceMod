// JavaScript-like concept

/* Player */
enum struct JavaScriptConcept_String_Player
{
	char Playername[64];
	char SteamID2[64];
	char SteamID3[64];
}
enum struct JavaScriptConcept_Int_Player
{
	int UserID;
}
enum struct JavaScriptConcept_Player
{
	JavaScriptConcept_String_Player String;
	JavaScriptConcept_Int_Player Int;
}

/* Database */
enum struct JavaScriptConcept_Database_Info
{
	Database Connection;
	char Error[512];
}
enum struct JavaScriptConcept_Database
{
	JavaScriptConcept_Database_Info SQL;
}