var _size = sprite_get_width(s_pieces);
var _padding = sprite_get_width(s_pieces) div 2;
var _w = 6;
var _h = 12;

//Board is 6x12
//Player 1
var _xx = 72;
var _yy = 42;
if (!end_game) draw_sliced_stretch(s_boxes,0,_xx-_padding,_yy-_padding,_xx+(_w*_size)+_padding,_yy+(_h*_size)+_padding);

if (end_game) {
	var _str = "YAHOO!";
	var _xxx = SCREEN_CENTER_X-(SCREEN_CENTER_X div 2);
	var _yyy = SCREEN_CENTER_Y div 4;
	var _offset = sin(degtorad(t))*4;
	if (global.player_health[0] <= 0) _str = "OH NO...";
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_text_transformed_color(_xxx,_yyy+2+_offset,_str,2,2,0,c_black,c_black,c_black,c_black,1);
	draw_text_transformed_color(_xxx+2,_yyy+_offset,_str,2,2,0,c_black,c_black,c_black,c_black,1);
	
	draw_text_transformed_color(_xxx,_yyy+_offset,_str,2,2,0,c_red,c_red,c_red,c_red,1);
}

//Player 2
_xx = 200;
if (!end_game) draw_sliced_stretch(s_boxes,0,_xx-_padding,_yy-_padding,_xx+(_w*_size)+_padding,_yy+(_h*_size)+_padding);

if (end_game) {
	var _str = "YAHOO!";
	var _xxx = SCREEN_CENTER_X+(SCREEN_CENTER_X div 2);
	var _yyy = SCREEN_CENTER_Y div 4;
	var _offset = sin(degtorad(t))*4;
	if (global.player_health[1] <= 0) _str = "OH NO...";
	
	draw_text_transformed_color(_xxx,_yyy+2-_offset,_str,2,2,0,c_black,c_black,c_black,c_black,1);
	draw_text_transformed_color(_xxx+2,_yyy-_offset,_str,2,2,0,c_black,c_black,c_black,c_black,1);
	
	draw_text_transformed_color(_xxx,_yyy-_offset,_str,2,2,0,c_blue,c_blue,c_blue,c_blue,1);
}

if (global.paused) exit;

if (instance_exists(o_deadzone)) with (o_deadzone) draw_self(); //So the deadzones are drawn on top of the boards