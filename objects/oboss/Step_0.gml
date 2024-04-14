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