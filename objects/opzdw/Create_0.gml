//Create surface
surf = surface_create(room_width, room_height);
surface_set_target(surf);
draw_sprite(spzbg, 0, 10, 10);
surface_reset_target();
//Vars
brushSize = 4;