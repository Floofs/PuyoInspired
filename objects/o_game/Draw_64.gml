draw_set_halign(fa_left);
draw_set_valign(fa_top);
//draw_text(4,0,"FPS: "+string(round(fps_real)));

if (global.paused) {
	var _str = "PAUSED";
	var _offset = sin(degtorad(t))*8;
	var _xx = SCREEN_CENTER_X;
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_text_transformed_color(_xx,SCREEN_CENTER_Y+2+_offset,_str,2,2,0,c_black,c_black,c_black,c_black,1);
	draw_text_transformed_color(_xx+2,SCREEN_CENTER_Y+_offset,_str,2,2,0,c_black,c_black,c_black,c_black,1);
	
	draw_text_transformed_color(_xx,SCREEN_CENTER_Y+_offset,_str,2,2,0,c_white,c_white,c_white,c_white,1);
}
else if (!end_game) && (!instance_exists(o_ready)) {
	switch (global.mode) {
		case gamemode.flip: {
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			
			draw_text_transformed(SCREEN_CENTER_X,SCREEN_CENTER_Y+16,floor(flip_timer/room_speed),2,2,0);
		} break;
	} 
}