global.cloc = {  xx: 0, yy: 0 }  // camera location
global.bloc = { xx: 0, yy: 0 }  // boss location

r = {  // next time rooms should be a global
	xx: 0,
	yy: 0,
	type: rstart,
	boss: false,  // is the boss in the room
	imps: []  // remember this mistake the perfect tracking is as simple as [{xx: yy:}] this keeps the amount and the position
}
global.rooms = []
global.gamestart = false
global.bosshealth = 10000

//odooruc = false
//odoordc = false
global.cre = {}


function searchroombyxy(xx, yy) {
	room_found = false
	for (i = 0; i < array_length(rooms); i++) {
		if rooms[i].xx == xx && rooms[i].yy == yy {
			room_found = true
			return { r: rooms[i], i: i }
		}
	}
	if !room_found {
		return "roomnotfound"
	}
}
