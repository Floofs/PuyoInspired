if (global.paused) exit;

draw_sprite(s_pieces,types[0],round(x),round(y));
if (image_index == 0) draw_sprite(s_pieces,types[1],round(x),round(y)-sprite_get_width(s_pieces));
else draw_sprite(s_pieces,types[1],round(x)+sprite_get_width(s_pieces),round(y));