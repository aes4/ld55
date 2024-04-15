hpp = opersistent.bosshealth / opersistent.bosshealthcap
hbw = 200
hbh = 20
hx = room_width/2 - hbw/2
hy = 100
draw_rectangle_colour(hx, hy, hx + (hbw * hpp), hy + hbh, c_red, c_red, c_maroon, c_maroon, false);
mp = global.mana / 100
mbw = 200
mbh = 20
mx = room_width/2 - hbw/2
my = hy + 30

draw_rectangle_colour(mx, my, mx + (mbw * mp), my + mbh, c_blue, c_blue, c_navy, c_navy, false);

/*
ox = instance_name.x - health_bar_width / 2; // Centering the bar above the instance
oy = instance_name.y - 50; // Adjust the offset as needed

// Drawing the Overhead Health Bar
draw_rectangle_colour(overhead_x, overhead_y, overhead_x + (health_bar_width * health_percentage), overhead_y + health_bar_height / 2, c_green, c_green, c_dark_green, c_dark_green, false);
*/