for (i = 0; i < array_length(global.create); i++) {
	instance_create_layer(global.create[i].lx, global.create[i].ly, "Instances", global.create[i].lo)
}
global.create = []