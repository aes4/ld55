x = mouse_x
y = mouse_y
if instance_exists(obstart) {
    if (place_meeting(x, y, obstart)) {
    	if (mouse_check_button(mb_left) || mouse_check_button(mb_right)) {
    		room_goto(rstart)
    	}
    }
	if keyboard_check(ord("S")) {
		room_goto(rstart)
	}
}
if instance_exists(odooru) {
    if (place_meeting(x, y, odooru)) {
    	if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right)) {
    		opersistent.odooruc = true
    	}
    }
}
if instance_exists(odoord) {
    if (place_meeting(x, y, odoord)) {
    	if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right)) {
    		opersistent.odoordc = true
    	}
    }
}
if instance_exists(odooru) {
    if !place_meeting(x, y, odooru) && !place_meeting(x, y, odoord) && !place_meeting(x, y, owall1) {
    	if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right)) {
    		instance_create_layer(x, y, layer, oimp)
    	}
    }
}