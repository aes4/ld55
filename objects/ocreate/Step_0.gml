for (i = 0; i < array_length(global.rcreate); i++) {
	instance_create_layer(omouse.x, omouse.y, "Instances", global.rcreate[i].lo)
}
global.rcreate = []

// force fix
/*
structs = opersistent.rooms
for (i = 0; i < array_length(opersistent.rooms) - 1; i++) {
    // compare struct
    currentStruct = structs[i];
    for (j = i + 1; j < array_length(structs);) {
        compareStruct = structs[j];
        if (currentStruct.r.xx == compareStruct.r.xx && currentStruct.r.yy == compareStruct.r.yy) {
            structs = array_delete(structs, j, 1);
        } else {
            j++;
        }
    }
}
opersistent.rooms = structs
*/