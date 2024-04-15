if instance_exists(oboss) && !oboss.dead {
	move_towards_point(oboss.x, oboss.y, 2.2)
	if place_meeting(x, y, oboss) {
		sprite_index = simpattack
		if hp > 1 {
			opersistent.bosshealth -= 1
		}
		hp -= 1
		if hp == 0 {
			dead = true
			//instance_destroy(self)
		}
		speed = 0
	}
} else {
	sprite_index = simpidle
	// move toward nearest door after boss leaves
	/*
	tid = noone
	nd = -1
	tol = [odooru, odoord]
	for (i = 0; i < array_length(tol); i++) {
		oid = tol[i]
		iid = instance_nearest(x, y, oid)
		dist = point_distance(x, y, iid.x, iid.y)
		if nd == -1 || dist < nd {
			nd = dist
			tid = iid
		}
	}
	if tid != noone && instance_exists(tid) {
		if !place_meeting(x, y, tid) {
			move_towards_point(tid.x, tid.y, 2)
		} else {
			//transfer
			if place_meeting(x, y, odoord) { // going down so since y = -y then we add room_height - 128 (2 wall tiles)
				// clear values in oper.rooms
				for (i = 0; i < array_length(opersistent.rooms); i++) {
					if opersistent.rooms[i].boss == true {
						br = { r: opersistent.rooms[i], i: i }
					}
				}
				br.r.boss = false
				opersistent.rooms[br.i] = br.r  // now br is no long "br"
				//show_debug_message("ASEUNTHNTHESTNOAHSNTUHEOA")
				//show_debug_message(string(br))
				// making sure values are set correctly for the next room in the transfer process (add)
				nr = searchxy(br.r.xx, br.r.yy - 1)  //yy not set
				if nr == "roomnotfound" {
					// gen room
					nrd = {
						xx: br.r.xx,
						yy: br.r.yy - 1,
						type: rdefault,
						boss: true,
						imps: []
					}
					array_push(opersistent.rooms, nrd)
				} else {
					nr.r.boss = true
					opersistent.rooms[nr.i] = nr.r
				}
				//clear room
				//show_debug_message(string(opersistent.rooms))
				opersistent.bossxx = room_width / 2
				opersistent.bossyy = 100
				instance_destroy(self)
			}
		}
	}*/
}
if dead {
	sprite_index = simpdead
	if image_index == 2 {
		image_speed = 0
	}
}