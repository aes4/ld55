oldcolor = draw_get_color()
draw_set_color(c_yellow)
draw_text_transformed(x, y, "volume: " + string(opersistent.vol * 100) + "%", 1.5, 1.5, 0);
draw_set_color(oldcolor)