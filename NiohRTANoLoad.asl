//RTA No Load plugin v2.0 by B3.
//supported game versions: 
//  - 1.21.04
//last updated: 11/12/17

state("Nioh","1.21.04"){
    byte onMap : 0x2171030;
    float missionTimer: 0x20D8588, 0x1E0AAC;
}

init{
    int moduleSize = modules.First().ModuleMemorySize;
    switch(moduleSize){
        case 63766528: 
            version = "1.21.04";
            break;
       default: 
            version = "1.21.04";
            break;
    }
    print("Nioh.exe version " + version + " detected\nModule size: " + moduleSize);
    refreshRate = 29;
}

isLoading{
    if(current.missionTimer==old.missionTimer && current.onMap == 0)
        return true;
    return false;
}