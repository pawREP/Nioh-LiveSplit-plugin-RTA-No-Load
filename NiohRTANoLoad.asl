//RTA No Load plugin v1.0 by B3.
//supported game versions: 
//  - 1.21.1
//
//last updated: 12/11/17

state("Nioh","1.21.1")
{
    byte isLoading  	: 0x206C714; //83 38 00 74 13 42
    byte isLoading2     : 0x1F49D80; // 55 41 56 41 57 48 81 EC 90 00 00 00 48 C7 44 (cmp [7FF767D39D80],bl)
    byte cutscenePlaying: 0x21428CC; //0F B6 05 ?? ?? ?? ?? 88 44 24 50 48 83 C1 20
}

init{
    int moduleSize = modules.First().ModuleMemorySize;
    switch(moduleSize){
        case 63537152: 
            version = "1.21.1";
            break;
       default: 
            version = "";
            System.Windows.Forms.MessageBox.Show("The Nioh version you are running is not supported");
            break;
    }
}

isLoading{
	if(current.isLoading == 0x01 || current.isLoading2 == 0x01 || current.cutscenePlaying == 0x01){
		return true;
	}
    return false;
}