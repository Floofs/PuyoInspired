if (global.paused) exit;

if (!active) {
	x = ((round(x) div sprite_get_width(s_pieces)) * sprite_get_width(s_pieces))+(sprite_get_width(s_pieces) div 2);
	
	var _xx = x;
	var _yy = floor(y);
	with (instance_create_layer(_xx,_yy,layer,o_piece)) {
		image_index = other.types[0];
		player = other.player;
	}
	
	//For stacked or singles
	if (image_index == 0) _yy -= sprite_get_width(s_pieces);
	else _xx += sprite_get_width(s_pieces);
	
	with (instance_create_layer(_xx,_yy,layer,o_piece)) {
		image_index = other.types[1];
		player = other.player;
	}
	
	global.wait_timer[@ player] = room_speed div 16;
	
	instance_destroy();
	exit;
}

#region Controls
var _kLeft = o_controller.kLeft;
var _kRight = o_controller.kRight;
var _kDown = o_controller.kDown;
var _kSwap = o_controller.kAccept;
var _kSwapCounter = o_controller.kCancel;

#region CPU input
if (is_cpu) {
	_kLeft = 0;
	_kRight = 0;
	_kDown = 0;
	_kSwap = 0;
	_kSwapCounter = 0;
	var _size = sprite_get_width(s_pieces);
	
	var _checkRight = (x < cpu_target_x-(_size div 2));
	var _checkLeft = (x > cpu_target_x+(_size div 2));
	if (_checkRight && !_checkLeft) _kRight = 1;
	else if (_checkLeft && !_checkRight) _kLeft = 1;
	
	if ((y < cpu_target_y-(_size*2)) || (y > cpu_target_y)) _kDown = 1;
	
	if (cpu_timer > 0) {
		cpu_timer--;
	}
	else {
		cpu_timer = 0;
		if (cpu_target_type == types[1] && types[1] != types[0]) || (image_index == 1) {
			_kSwapCounter = 1;
			cpu_timer = 5;
		}
	}
}
#endregion

if (_kLeft && !_kRight) {
	hsp -= 1;
}
else if (_kRight && !_kLeft) {
	hsp += 1;
}
else {
	var _xx = ((x div sprite_get_width(s_pieces)) * sprite_get_width(s_pieces))+(sprite_get_width(s_pieces) div 2);
	x = approach(x,_xx,4);
	hsp = 0;
}
hsp = clamp(hsp,-2,2);

if (_kDown) vsp = 3; else vsp = 0.5;
#endregion

#region Collision
if (place_meeting(x+hsp,y,p_solid)) {
	while (!place_meeting(x+sign(hsp),y,p_solid)) {
		x += sign(hsp);
	}
	hsp = 0;
}
x += hsp;

if (place_meeting(x,y+vsp,p_solid)) {
	while (!place_meeting(x,y+sign(vsp),p_solid)) {
		y += sign(vsp);	
	}
	vsp = 0;
	if (timer <= 0) active = false; else timer--;
}
y += vsp;
if (!place_meeting(x,y+1,p_solid)) timer = 10;
#endregion

#region Swapping
if (_kSwap && !_kSwapCounter) {
	if (image_index == 0) {
		if (place_meeting(x+sprite_get_width(s_pieces),y,p_solid)) {
			if (!place_meeting(x-sprite_get_width(s_pieces),y,p_solid)) {
				x -= sprite_get_width(s_pieces);
				image_index = 1;
			}
		}
		else {
			image_index = 1;	
		}
	}
	else {
		var _temp = types[1];
		types[@ 1] = types[0];
		types[@ 0] = _temp;
		image_index = 0;
	}
}
else if (_kSwapCounter && !_kSwap) {
	if (image_index == 0) {
		if (place_meeting(x+sprite_get_width(s_pieces),y,p_solid)) {
			if (!place_meeting(x-sprite_get_width(s_pieces),y,p_solid)) {
				x -= sprite_get_width(s_pieces);
				image_index = 1;
			}
		}
		else {
			image_index = 1;
		}
		var _temp = types[1];
		types[@ 1] = types[0];
		types[@ 0] = _temp;
	}
	else {
		
		image_index = 0;
	}
}
#endregion