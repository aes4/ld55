move_towards_point(oboss.x, oboss.y, 2.2)
if place_meeting(x, y, oboss) {
	opersistent.bosshealth -= 1
	hp -= 1
	if hp == 0 {
		instance_destroy(self)
	}
}