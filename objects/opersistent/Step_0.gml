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



if gamestart {
	// game started
	//game_end()
    if odoortopc {
		// save current state of room (two different saves) increase boss health to discourage long travels?
		// one if you have been in the room before (in array)
		// one if you havn't been in the room before (not in array)  Update: should add to array on move so this can't happen
		/*
		if searchroombyxy(loc.xx, loc.yy) == "roomnotfound" { // two options here since we gen the new room here we can add it to array already so I will temp scrap this code unless there is another reason
		}
		*/
		bosshealth += 10
		// right now there is nothing to save update: stuff to save
		currentroom = searchroombyxy(loc.xx, loc.yy)
		if currentroom.r.boss {
			bossxx = 100
			bossyy = 100
			instance_destroy(oboss)
		}
			
		loc.yy += 1
		// we have to check if we have been in this room before if we have refence array if not gen room
		currentroom = searchroombyxy(loc.xx, loc.yy)
		if currentroom == "roomnotfound" {
			// gen room values/store them
			newroomdata = {
				xx: loc.xx,
				yy: loc.yy,
				type: rdefault,  // this will eventually be like random.choice in python except the room can have a 0 -> 1 % chance of appearing
				boss: 0,  // boss will probably modifiy these values as he moves between rooms
				// because of this boss might have to be persistent but kept hidden if not in a room with the camera
				imps: 0  // this might also be a bit confusing I will come with strategy later
			}
			array_push(rooms, newroomdata)
			room_goto(newroomdata.type)
		} else {  // we have been in this room before and have to spawn stuff based on currentroom values
			// if there is a boss spawn it at it's location
			room_goto(currentroom.r.type)
			if currentroom.r.boss {
				instance_create_layer(bossxx, bossyy, "Instances", oboss)  // now the boss can room around
			}
			// we will do the same once enemies get added
		}
		// instance creation stuff if depending if we have or have not been in this room before goes here
		odoortopc = false
    }
}