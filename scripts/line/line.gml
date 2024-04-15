// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function line(x1, y1, x2, y2, radius) {
	dir = point_direction(x1, y1, x2, y2);
	dist = point_distance(x1, y1, x2, y2);

	for (var i=0; i<=dist; i++) {
		xx = x1 + lengthdir_x(i, dir);
		yy = y1 + lengthdir_y(i, dir);
		draw_circle(xx, yy, radius, false);
	}
}