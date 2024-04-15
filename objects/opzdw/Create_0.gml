//Create surface
mxp = mouse_x;
myp = mouse_y;
data = { xx: mouse_x, yy: mouse_y }
surf = surface_create(room_width, room_height);
surface_set_target(surf);
draw_sprite(spzbg, 0, data.xx - 10, data.yy - 10);
surface_reset_target();
//Vars
brushSize = 4;
points = []