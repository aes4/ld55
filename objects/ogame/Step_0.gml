if (keyboard_check_pressed(ord("E"))) {
	instance_create_layer(x, y, "Instances", opzdw)  // might not be "Layer1" I forgot what the default is
}
if (keyboard_check_released(ord("E"))) {
	instance_destroy(opzdw)
}