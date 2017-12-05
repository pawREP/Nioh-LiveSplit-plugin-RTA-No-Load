//RTA No Load plugin v1.2 by B3.
//supported game versions: 
//  - 1.21.01
//  - 1.21.02
//  - 1.21.04
//last updated: 05/12/17

state("Nioh","1.21.01")
{
    byte isLoading  	: 0x206C714; //83 38 00 74 13 42
    byte isLoading2     : 0x1F49D80; // 55 41 56 41 57 48 81 EC 90 00 00 00 48 C7 44 (cmp [7FF767D39D80],bl)
    byte cutscenePlaying: 0x21428CC; //0F B6 05 ?? ?? ?? ?? 88 44 24 50 48 83 C1 20
    byte PrerenderedCutscenePlaying: 0x240A320;//0x23CE8C0 //49 C7 46 08 00 00 00 00 48
}

state("Nioh","1.21.02")
{
    byte isLoading  	: 0x206E734; //83 38 00 74 13 42 (second on in loop)
    byte isLoading2     : 0x1F4BDA0; // 55 41 56 41 57 48 81 EC 90 00 00 00 48 C7 44 (cmp [7FF645A5BDA0],bl)
    byte cutscenePlaying: 0x21448EC; //0F B6 05 ?? ?? ?? ?? 88 44 24 50 48 83 C1 20
    byte PrerenderedCutscenePlaying: 0x22D26C8;//C7 82 3C 80 15 00 00 00 00 00
}

/*state("Nioh","1.21.03")
{
    byte isLoading  	: 0x20A0514; //83 38 00 74 13 42 (second on in loop)
    byte isLoading2     : 0x1F7D250; // 55 41 56 41 57 48 81 EC 90 00 00 00 48 C7 44 (cmp [7FF645A5BDA0],bl)
    byte cutscenePlaying: 0x21766DC; //0F B6 05 ?? ?? ?? ?? 88 44 24 50 48 83 C1 20
    byte PrerenderedCutscenePlaying: 0x//C7 82 3C 80 15 00 00 00 00 00
}*/

state("Nioh","1.21.04")
{
    byte isLoading  	: 0x020A1514; //83 38 00 74 13 42 (second on in loop)
    byte isLoading2     : 0x01F7E250; // 55 41 56 41 57 48 81 EC 90 00 00 00 48 C7 44 (cmp [7FF645A5BDA0],bl)
    byte cutscenePlaying: 0x021776DC; //0F B6 05 ?? ?? ?? ?? 88 44 24 50 48 83 C1 20
    byte PrerenderedCutscenePlaying: 0x023054B8;//8B 44 19 FC 89 41 FC 48 FF CA 75 CE 41
}

init{
    int moduleSize = modules.First().ModuleMemorySize;
    switch(moduleSize){
        case 63537152: 
            version = "1.21.01";
            break;
        case 63545344: 
            version = "1.21.02";
            break;
        /*case 63762432: 
            version = "1.21.03";
            break;*/
        case 63766528: 
            version = "1.21.04";
            break;
       default: 
            version = "1.21.04";
            break;
    }
    print("Nioh.exe version " + version + " detected\nModule size: " + moduleSize);
}

isLoading{
	if(current.isLoading == 1 || current.isLoading2 == 1 || current.cutscenePlaying == 1 || current.PrerenderedCutscenePlaying == 1){
		return true;
	}
    return false;
}