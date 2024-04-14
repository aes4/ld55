// roam
if dir == "u" {
	if !place_meeting(x, y - vel, owall1) {
		y -= vel
	}
}
if dir == "d" {
	if !place_meeting(x, y + vel, owall1) {
		y += vel
	}
}
if dir == "l" {
	if !place_meeting(x - vel, y, owall1) {
		x -= vel
	}
}
if dir == "r" {
	if !place_meeting(x + vel, y, owall1) {
		x += vel
	}
}
if center {
	speed = 0
	if !(room_width/2 - 4 < x && x < room_width/2 + 4 && room_height/2 + 4 > y && y > room_height/2 - 4) {
		move_towards_point(room_width/2, room_height/2, 2)
	} else {
		stall -= 1
		if stall == 0 {
			center = false
		}
	}
} else {
	// pick random dir
	y += vel
}