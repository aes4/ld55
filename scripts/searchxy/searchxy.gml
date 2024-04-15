// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function searchxy(xx, yy) {
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