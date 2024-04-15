if instance_exists(omouse) {
	if (place_meeting(x, y, omouse)) {
		if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right)) {
			global.mana += 10
		    instance_destroy(self)
		}
	}
}