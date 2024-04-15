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
		sprite_index = sbosswalkleft
	} else {
		sprite_index = sbossidle
		stall -= 1
		if stall == 0 {
			center = false
		}
	}
} else {
	if !dead {
		sprite_index = sbossattack
	}
	// pick random dir
	//y += vel
}
if dead {
	sprite_index = sbd
}
if opersistent.bosshealth < 0 && !dead{
	sprite_index = sbossdead
	audio_play_sound(adeath, 5, false, opersistent.vol)
	instance_create_layer(x, y - 20, "Instances", owin)
	audio_play_sound(awin, 5, false, opersistent.vol)
	audio_stop_sound(opersistent.tr)
	dead = true
}
// transfer
/*
if place_meeting(x, y, odoord) { // going down so since y = -y then we add room_height - 128 (2 wall tiles)
	// put values in per room
	for (i = 0; i < array_length(opersistent.rooms); i++) {
		if opersistent.rooms[i].boss == true {
			br = { r: opersistent.rooms[i], i: i }
		}
	}
	br.r.boss = false
	opersistent.rooms[br.i] = br.r  // now br is no long "br"
	//show_debug_message("ASEUNTHNTHESTNOAHSNTUHEOA")
	//show_debug_message(string(br))
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
	//show_debug_message(string(opersistent.rooms))
	opersistent.bossxx = room_width / 2
	opersistent.bossyy = 100
	instance_destroy(self)
}
/*
THIS CODE HAD ME ON A GOOSE CHASE IT'S BEEN HOURS WHY IMAGINE CONSOLE.LOGING 25 TIMES ACROSS 7 FILES
I ALMOST REMADE EVERYTHING FROM SCRATCH BUT THAT WOULD TAKE LONGER, EVEN TRIED TO FORCE IT BY
REMOVING DUPLICATES INSTEAD OF FIGURING OUT WHY IT DUPLICATED sorry caps
___________________________________________
############################################################################################
ERROR in
action number 1
of  Step Event0
for object oboss:

unable to convert string "roomnotfound" to integer
 at gml_Object_oboss_Step_0 (line 53) -                      yy: nr.r.yy,
############################################################################################
gml_Object_oboss_Step_0 (line 53)

___________________________________________
############################################################################################
ERROR in
action number 1
of  Step Event0
for object oboss:

Variable <unknown_object>.yy(100009, -2147483648) not set before reading it.
 at gml_Object_oboss_Step_0 (line 46) -        nr = searchxy(br.xx, br.yy - 1)
############################################################################################
gml_Object_oboss_Step_0 (line 46)
*/
