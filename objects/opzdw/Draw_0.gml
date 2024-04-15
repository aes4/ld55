//Draw to surface
if (mouse_check_button(mb_left)){
 surface_set_target(surf);
 draw_set_color(c_yellow)
 //draw_sprite(spzbg, 0, 48, 48);
 // if surface 0 <= x <= surface 256
 // if surface 0y <= x <= surface 256
 // eventually change these value based on where opzdw is
 if data.xx <= mouse_x and mouse_x <= (data.xx + 128 - 10) and data.yy <= mouse_y <= (data.yy + 128 - 10) {
	array_push(points, { xx: mouse_x, yy: mouse_y })
	line(mouse_x, mouse_y, mxp, myp, brushSize);
	//draw_circle(mouse_x, mouse_y, brushSize, false);
 }
 draw_set_color(c_yellow)

 surface_reset_target();
}

//Draw surface
draw_surface(surf, 0, 0);