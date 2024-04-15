vel = 1.4
dir = "n"
center = true
stall = 50
// move room?
function searchroombyxy(xx, yy) {
	room_found = false
	for (i = 0; i < array_length(opersistent.rooms); i++) {
		if opersistent.rooms[i].xx == xx && opersistent.rooms[i].yy == yy {
			room_found = true
			return { r: opersistent.rooms[i], i: i }
		}
	}
	if !room_found {
		return "roomnotfound"
	}
}
dead = false
deadcount = 0