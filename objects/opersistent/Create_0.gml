loc = {  xx: 0, yy: 0 }  // camera location

r = {  // next time rooms should be a global
	xx: 0,
	yy: 0,
	type: rstart,
	boss: false,  // is the boss in the room
	imps: []  // remember this mistake the perfect tracking is as simple as [{xx: yy:}] this keeps the amount and the position
}
rooms = [r]
gamestart = false
firstroom = false
walked = false  // not implemented yet
bosshealth = 10000
bossxx = 100  // we only need to update this before the boss gets delete when leaving the room he is in
bossyy = 100

odooruc = false
odoordc = false
global.create = []
global.rcreate = []


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
