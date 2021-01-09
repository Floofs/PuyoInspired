/// @function draw_sliced_stretch(sprite, subimage, x1, y1, x2, y2)
function draw_sliced_stretch(_sprite, _img, _x1, _y1, _x2, _y2){
	var _size = round(sprite_get_width(_sprite) / 3);
	var _w = _x2 - _x1;
	var _h = _y2 - _y1;
	
	//Middle
	draw_sprite_part_ext(_sprite,_img,_size,_size,1,1,_x1+_size,_y1+_size,_w-(_size*2),_h-(_size*2),c_white,1);
	
	//Corners
	//Top-Left
	draw_sprite_part(_sprite,_img,0,0,_size,_size,_x1,_y1);
	//Top-Right
	draw_sprite_part(_sprite,_img,_size*2,0,_size,_size,_x1+_w-_size,_y1);
	//Bottom-Left
	draw_sprite_part(_sprite,_img,0,_size*2,_size,_size,_x1,_y1+_h-_size);
	//Bottom-Right
	draw_sprite_part(_sprite,_img,_size*2,_size*2,_size,_size,_x1+_w-_size,_y1+_h-_size);
	
	//Edges
	//Left
	draw_sprite_part_ext(_sprite,_img,0,_size,_size,1,_x1,_y1+_size,1,_h-(_size*2),c_white,1);
	//Right
	draw_sprite_part_ext(_sprite,_img,_size*2,_size,_size,1,_x1+_w-_size,_y1+_size,1,_h-(_size*2),c_white,1);
	//Top
	draw_sprite_part_ext(_sprite,_img,_size,0,1,_size,_x1+_size,_y1,_w-(_size*2),1,c_white,1);
	//Bottom
	draw_sprite_part_ext(_sprite,_img,_size,_size*2,1,_size,_x1+_size,_y1+_h-_size,_w-(_size*2),1,c_white,1);
}
	
/// @function resize_window(scale)
function resize_window(_scale) {
	if (_scale*G_WIDTH < display_get_width())
	&& (_scale*G_HEIGHT < display_get_height()) {
		window_set_fullscreen(false);
		window_set_size(G_WIDTH*_scale,G_HEIGHT*_scale);
		with (o_data) alarm[0] = 1;
	}
	else {
		window_set_fullscreen(true);
	}
}
