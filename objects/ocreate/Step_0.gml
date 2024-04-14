for (i = 0; i < array_length(global.rcreate); i++) {
	instance_create_layer(omouse.x, omouse.y, "Instances", global.rcreate[i].lo)
}
global.rcreate = []