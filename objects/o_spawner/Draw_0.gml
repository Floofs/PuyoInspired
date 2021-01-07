if (global.paused) exit;

var _xx = 140;
var _yy = 48;
var _padding = 4;
var _size = sprite_get_width(s_pieces);

if (player == 1) {
	_xx += 32;
}

//Show the next piece
draw_sliced_stretch(s_boxes,0,_xx-(_padding*2),_yy-(_padding*2),_xx+_size+(_padding*2),_yy+(_size*2)+(_padding*2));

draw_sprite(s_pieces,types[0],_xx+(_size div 2),_yy+(_size * 2));
draw_sprite(s_pieces,types[1],_xx+(_size div 2),_yy+_size-1);

draw_set_halign(fa_center);
draw_set_valign(fa_top);

//Show the garbage count
draw_text_color(x+4,y-27,string(global.garbage[player]),c_black,c_black,c_black,c_black,1);
draw_text_color(x+5,y-28,string(global.garbage[player]),c_black,c_black,c_black,c_black,1);
draw_text(x+4,y-28,string(global.garbage[player]));

//"Next" Text
if (player == 0) {
	draw_text_color(SCREEN_CENTER_X+1,_yy-(_padding*2)-string_height("Next"),"Next",c_black,c_black,c_black,c_black,1);
	draw_text_color(SCREEN_CENTER_X,_yy-(_padding*2)-string_height("Next")+1,"Next",c_black,c_black,c_black,c_black,1);
	draw_text(SCREEN_CENTER_X,_yy-(_padding*2)-string_height("Next"),"Next");
}

//Show Health
if (player == 0) {
	for (var i = 0; i < 3; i++) {
		var _sin = sin(degtorad(t+(30*i)));
		draw_sprite(s_health,(global.player_health[0]-1 >= i),SCREEN_CENTER_X-16+(i*16),SCREEN_CENTER_Y+(_sin*2));	
	}
}
else if (player == 1) {
	for (var i = 0; i < 3; i++) {
		var _sin = sin(degtorad(-t-(30*i)));
		draw_sprite(s_health,(global.player_health[1]-1 >= i)*2,SCREEN_CENTER_X-16+(i*16),SCREEN_CENTER_Y+24+(_sin*2));	
	}
}
	
//Name
var _name = "Player "+string(player+1);
if (is_cpu) _name = "CPU";
_xx = x-(_size*2.5);

draw_text_color(_xx+(3*_size)+1,_yy+(12*_size)-(_padding*2),_name,c_black,c_black,c_black,c_black,1);
draw_text_color(_xx+(3*_size),_yy+(12*_size)-(_padding*2)+1,_name,c_black,c_black,c_black,c_black,1);

draw_text(_xx+(3*_size),_yy+(12*_size)-(_padding*2),_name);