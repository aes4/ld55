if (keyboard_check(vk_escape)) {
    game_end()
}
if room_get_name(room) == "rstart" && !gamestart {
	gamestart = true
	instance_create_layer(x, y, "Instances", oboss)
	updateroom = searchroombyxy(0, 0)
	updateroom.r.boss = true
	rooms[updateroom.i] = updateroom.r
}

if trt {
	tr = audio_play_sound(amain, 0, true, opersistent.vol)
    trt = false
}

if gamestart {
	if manacounter < 175 {
		manacounter += 1
	} else {
		global.rcm = true
		manacounter = 0
	}
	// game started
    if odooruc {  // <-- there was a way to not need to do this but because I forgot already I'm working on other stuff if it works don't fix it
		// save current state of room, increase boss health to discourage long travels?
		bosshealth += 10
		currentroom = searchroombyxy(loc.xx, loc.yy)
		if currentroom.r.boss {  // if instance exists cause boss can leave the room and delete itself
			if instance_exists(oboss) {
				bossxx = oboss.x
				bossyy = oboss.y
			}
		}
		ti = instance_number(oimp);
		for (var i = 0; i < ti; i++) {
			inst = instance_find(oimp, i)
			currentroom.r.imps[i].xx = inst.x
			currentroom.r.imps[i].yy = inst.y
		}
		// now in a different "room"
		loc.yy += 1
		// we have to check if we have been in this room before with rooms array if not gen room
		currentroom = searchroombyxy(loc.xx, loc.yy)
		if currentroom == "roomnotfound" {
			// gen room values/store them
			newroomdata = {
				xx: loc.xx,
				yy: loc.yy,
				type: rdefault,  // this will eventually be like random.choice in python except the room can have a 0 -> 1 % chance of appearing
				boss: 0,  // boss will probably modifiy these values as he moves between rooms or maybe something more advanced
				imps: []  // this might also be a bit confusing I will come with strategy later
			}
			array_push(rooms, newroomdata)
			room_goto(newroomdata.type)
		} else {  // we have been in this room before and have to spawn stuff based on currentroom values
			// if there is a boss spawn it at it's location
			room_goto(currentroom.r.type)
			if currentroom.r.boss {
				array_push(global.create, { lx: bossxx, ly: bossyy, lo: oboss })
			}
			// we will do the same once enemies get added update: enemies added
			for (i = 0; i < array_length(currentroom.r.imps); i++ ) {
				array_push(global.create, {lx: currentroom.r.imps[i].xx, ly: currentroom.r.imps[i].yy, lo: oimp})
			}
		}
		odooruc = false
    }
	if odoordc { // maybe functions later only diff between this code and ^ is loc.yy + or - = 1 also careful of odoordx
		// save current state of room (two different saves) increase boss health to discourage long travels?
		bosshealth += 10
		currentroom = searchroombyxy(loc.xx, loc.yy)
		if currentroom.r.boss {
			if instance_exists(oboss) {
				bossxx = oboss.x
				bossyy = oboss.y
			}
		}
		ti = instance_number(oimp)
		for (var i = 0; i < ti; i++) {
			inst = instance_find(oimp, i)
			currentroom.r.imps[i].xx = inst.x
			currentroom.r.imps[i].yy = inst.y
		}
		// now in a different "room"
		loc.yy -= 1
		// we have to check if we have been in this room before with rooms array if not gen room
		currentroom = searchroombyxy(loc.xx, loc.yy)
		show_debug_message(currentroom)
		if currentroom == "roomnotfound" {
			// gen room values/store them
			newroomdata = {
				xx: loc.xx,
				yy: loc.yy,
				type: rdefault,  // this will eventually be like random.choice in python except the room can have a 0 -> 1 % chance of appearing
				boss: 0,  // boss will probably modifiy these values as he moves between rooms or maybe something more advanced
				imps: []  // this might also be a bit confusing I will come with strategy later
			}
			array_push(rooms, newroomdata)
			room_goto(newroomdata.type)
		} else {  // we have been in this room before and have to spawn stuff based on currentroom values
			// if there is a boss spawn it at it's location
			room_goto(currentroom.r.type)
			if currentroom.r.boss { // isn't createed
				array_push(global.create, { lx: bossxx, ly: bossyy, lo: oboss })
			}
			// we will do the same once enemies get added update: enemies added
			for (i = 0; i < array_length(currentroom.r.imps); i++ ) {
				array_push(global.create, {lx: currentroom.r.imps[i].xx, ly: currentroom.r.imps[i].yy, lo: oimp})
			}
		}
		odoordc = false
	}
}