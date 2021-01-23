if (global.paused) || (instance_exists(o_ready)) exit;

if (t < 360) t += 4;
else t -= 360;

var _notYet = false;
if (instance_exists(o_piece_controller)) {
	with (o_piece_controller) {
		if (player == other.player) _notYet = true;
	}
}
if (o_game.flip_timer <= 0) _notYet = true;

if (!_notYet && global.garbage[player] > 0 && !dropped_garbage
&& global.wait_timer[player] <= 0 && global.chain_timer[player] <= 0) {
	dropped_garbage = true;
	var _size = sprite_get_width(s_pieces);
	var _amount = 0;
	var _go = clamp(global.garbage[player],0,6);
	for (var i = 0; i < _go; i++) {
		if (!instance_place(x-(_size*2)+(i*_size),y,o_piece)) {
			with (instance_create_layer(x-(_size*2)+(i*_size),y,layer,o_piece)) {
				type = 0;
				player = other.player;
			}
			_amount++;
		}
		else if (_go < 5) _go++;
	}
	global.garbage[@ player] = clamp(global.garbage[player]-_amount,0,global.garbage[player]);
	global.wait_timer[@ player] = (room_speed div 4) * 3;
	exit;
}

if (!_notYet && global.wait_timer[player] <= 0 && global.chain_timer[player] <= 0) {
	with (instance_create_layer(x,y,layer,o_piece_controller)) {
		types = other.types;
		player = other.player;
		is_cpu = other.is_cpu;
	}
	types = [irandom(global.type_count)+1,irandom(global.type_count)+1];
	while (types[1] == types[0] && chance < 3) types[@ 1] = irandom(global.type_count)+1;
	chance++;
	if (types[1] == types[0]) chance = 0; //Make sure they don't get doubles too often
	if (chance > 3) {
		chance = 0;
		types[@ 1] = types[0];
		//Force the player to get a double every once in a while
	}
	dropped_garbage = false;
}