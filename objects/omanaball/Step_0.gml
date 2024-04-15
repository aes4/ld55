if instance_exists(omouse) {
	if (place_meeting(x, y, omouse)) {
		if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right)) {
			global.mana += 20
			audio_play_sound(amana, 3, false, opersistent.vol)
		    instance_destroy(self)
		}
	}
}