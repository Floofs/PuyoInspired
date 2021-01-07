var _col = c_white;
switch (image_index) {
	case 1: _col = c_red; break;
	case 2: _col = c_blue; break;
	case 3: _col = c_yellow; break;
	case 4: _col = c_green; break;
	case 5: _col = c_fuchsia; break;
}
if (_col != c_white) {
	part_type_color1(global.particle_blob,_col);
	part_particles_create(global.particle_sys,x,y-(sprite_get_width(sprite_index) div 2),global.particle_blob,8);
	gc_collect();
}

if (instance_exists(o_piece)) {
	with (o_piece) {
		if (player == other.player) visited = false;	
	}
}

if (type == 0) exit;

var _left = instance_place(x-sprite_get_width(sprite_index),y,o_piece);
var _right = instance_place(x+sprite_get_width(sprite_index),y,o_piece);
var _top = instance_place(x,y-sprite_get_width(sprite_index),o_piece);
var _bottom = instance_place(x,y+sprite_get_width(sprite_index),o_piece);

if (instance_exists(_left) && _left.type == 0) {
	with (_left) popped = true;	
}

if (instance_exists(_right) && _right.type == 0) {
	with (_right) popped = true;	
}

if (instance_exists(_top) && _top.type == 0) {
	with (_top) popped = true;	
}

if (instance_exists(_bottom) && _bottom.type == 0) {
	with (_bottom) popped = true;	
}