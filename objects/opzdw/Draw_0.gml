//Draw to surface
if (mouse_check_button(mb_left)){
 surface_set_target(surf);
 //draw_sprite(spzbg, 0, 48, 48);
 // if surface 0 <= x <= surface 256
 // if surface 0y <= x <= surface 256
 // eventually change these value based on where opzdw is
 if 0 <= mouse_x and mouse_x <= 256 and 256 <= mouse_y <= 0 {
	draw_circle(mouse_x, mouse_y, brushSize, false);
 }

 surface_reset_target();
}

//Draw surface
draw_surface(surf, 0, 0);