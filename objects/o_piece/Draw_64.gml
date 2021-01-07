/*
if (type > 0) && (grounded) {
	var _size = sprite_get_width(s_pieces);
	var _col = c_white;
	switch (type) {
		case 1: _col = c_red; break;
		case 2: _col = c_blue; break;
		case 3: _col = c_yellow; break;
		case 4: _col = c_lime; break;
		case 5: _col = c_fuchsia; break;
	}
	
	//Connect below
	if (place_meeting(x,y+_size,o_piece)) {
		var _inst = instance_place(x,y+_size,o_piece);
		if (_inst != noone && _inst.type == type) {
			draw_line_width_color(x-1,y-(_size div 2),x-1,y+(_size div 2),2,_col,_col);
		}
	}
	
	//Connect to the right
	if (place_meeting(x+_size,y,o_piece)) {
		var _inst = instance_place(x+_size,y,o_piece);
		if (_inst != noone && _inst.type == type) {
			draw_line_width_color(x,y-(_size div 2),x+(_size),y-(_size div 2),2,_col,_col);
		}
	}
}
*/