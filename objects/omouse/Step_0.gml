x = mouse_x
y = mouse_y
if keyboard_check_pressed(ord("E")) {
	scroll = true
	global.rcreate = [{ lo: opzdw }]
}
if keyboard_check_released(ord("E")) {
	scroll = false
	points = opzdw.points
	if array_length(points) > 2 {
		dirs = analyzeDirection(points)
		for (var i = 1; i < array_length(dirs); i++) {
			if dirs[i] == Direction.None {
				array_delete(dirs, i, 1)
			}
		}
		show_debug_message(string(dirs))
		show_debug_message("rightup"+string(Direction.RightUp)+"rightdown"+string(Direction.RightDown)+"leftup"+string(Direction.LeftUp)+"Leftdown"+string(Direction.LeftDown))
		if array_length(dirs) > 3 {
			if dirs[0] == "rightup" && dirs[1] == "rightdown" && dirs[2] == "leftdown" && dirs[3] == "rightdown" {
				show_debug_message("UATSHOENHTU")
				ni = instance_nearest(x, y, odem)
				if (instance_exists(ni) && point_distance(x, y, ni.x, ni.y) < 128) {
				} else {
					if global.mana > 0 {
						global.mana -= 10
						audio_play_sound(asummon, 3, false, opersistent.vol)
						//instance_create_layer(x, y, layer, oimp)  // ocreater
						currentroom = searchroombyxy(opersistent.loc.xx, opersistent.loc.yy)
						array_push(currentroom.r.imps, { xx: omouse.x, yy: omouse.y })
						opersistent.rooms[currentroom.i] = currentroom.r
						global.rcreate = [{ lo: odem }]
						show_debug_message(string(opersistent.rooms))
					}
				}
			}
		}
	}
	/*

	inc = true;
	notinc = true;

	for (var i = 1; i < array_length(points); i++) {
	    if (points[i].xx > points[i-1].xx && points[i].yy > points[i-1].yy) {  // increases top right, decreases bottom right, decreases bottom left
	        notinc = false
	    } else {
	        inc = false
	    }
	}
	if (inc) {
		ni = instance_nearest(x, y, odem)
		if (instance_exists(ni) && point_distance(x, y, ni.x, ni.y) < 128) {
		} else {
			if global.mana > 10 {
				global.mana -= 10
				//instance_create_layer(x, y, layer, oimp)  // ocreater
				currentroom = searchroombyxy(opersistent.loc.xx, opersistent.loc.yy)
				array_push(currentroom.r.imps, { xx: omouse.x, yy: omouse.y })
				opersistent.rooms[currentroom.i] = currentroom.r
				global.rcreate = [{ lo: odem }]
				show_debug_message(string(opersistent.rooms))
			}
		}
	    show_debug_message("All points are always increasing.");
	} else if (notinc) {
		global.rcreate = [{ lo: oboss }]
	    show_debug_message("All points are always not increasing.");
	} else {
	    show_debug_message("The points do not follow a consistent pattern.");
	}
	*/
	instance_destroy(opzdw)
}
if !scroll {
	if instance_exists(obstart) {
		if (place_meeting(x, y, obstart)) {
		    if (mouse_check_button(mb_left) || mouse_check_button(mb_right)) {
		    	room_goto(rstart)
		    }
		}
		if keyboard_check(ord("S")) {
			room_goto(rstart)
		}
	}
	if instance_exists(odooru) {
		if (place_meeting(x, y, odooru)) {
		    if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right)) {
		    	opersistent.odooruc = true
		    }
		}
	}
	if instance_exists(odoord) {
		if (place_meeting(x, y, odoord)) {
		    if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right)) {
		    	opersistent.odoordc = true
		    }
		}
	}
	if instance_exists(odooru) {  // check if we are in a level
		if !place_meeting(x, y, odooru) && !place_meeting(x, y, odoord) && !place_meeting(x, y, owall1) && !place_meeting(x, y, omanaball) {  // make sure we can't place a imp in a wall or door
		    if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right)) {
				ni = instance_nearest(x, y, oimp)
				if (instance_exists(ni) && point_distance(x, y, ni.x, ni.y) < 128) {
				} else {
					if global.mana > 0 {
						global.mana -= 10
				    	//instance_create_layer(x, y, layer, oimp)  // ocreater
						currentroom = searchroombyxy(opersistent.loc.xx, opersistent.loc.yy)
						array_push(currentroom.r.imps, { xx: omouse.x, yy: omouse.y })
						opersistent.rooms[currentroom.i] = currentroom.r
						global.rcreate = [{ lo: oimp }]
						show_debug_message(string(opersistent.rooms))
					}
				}
		    }
		}
	}
}
// summon 2 = correct spawn
if instance_exists(obquit) {
    if (place_meeting(x, y, obquit)) {
    	if (mouse_check_button(mb_left) ||  mouse_check_button(mb_right)) {
    	    game_end()
        }
    }
}
if (place_meeting(x, y, oenableaudio)) {
    if (mouse_check_button(mb_left) ||  mouse_check_button(mb_right)) {
    	opersistent.vol += 0.1
    }
}
if (place_meeting(x, y, oincvol)) {
	if (mouse_button == mb_left || mouse_button == mb_right) {
		opersistent.vol += 0.1
	}
	if mouse_check_button_released(mb_left) || mouse_check_button_released(mb_right) {
		audio_stop_sound(opersistent.tr)
		opersistent.trt = true
	}
}
if (place_meeting(x, y, odecvol)) {
	if (mouse_button == mb_left || mouse_button == mb_right) {
		if opersistent.vol > 0 opersistent.vol -= 0.1
	}
	if mouse_check_button_released(mb_left) || mouse_check_button_released(mb_right) {
		audio_stop_sound(opersistent.tr)
		opersistent.trt = true
	}
}
/*
imp click
[ { xx : 0, yy : 0, type : ref room 2, imps : [ { xx : 336, yy : 259 } ], boss : 1 } ]
imp click
[ { xx : 0, yy : 0, type : ref room 2, imps : [ { xx : 336, yy : 259 },{ xx : 426, yy : 163 } ], boss : 1 } ]
imp click
[ { xx : 0, yy : 0, type : ref room 2, imps : [ { xx : 336, yy : 259 },{ xx : 426, yy : 163 },{ xx : 627, yy : 166 } ], boss : 1 } ]
boss transfer
{ r : { xx : 0, yy : -1, type : ref room 3, imps : [  ], boss : 1 }, i : 1 }
click it seem to have been inserted in the wrong spot not insert it was created twice
[,{ xx : 0, yy : -1, , imps : [ { xx : 589, yy : 355 } ], boss : 0 },{ xx : 0, yy : -1, , imps : [  ], boss : 1 } ]
*/
if opersistent.vol < 0 opersistent.vol = 0