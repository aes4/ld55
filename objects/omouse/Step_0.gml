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
if instance_exists(odoortop) {
    if (place_meeting(x, y, odoortop)) {
    	if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right)) {
    		opersistent.odoortopc = true
    	}
    }
}