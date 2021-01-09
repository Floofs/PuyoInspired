/// @desc Calculate CPU piece placement
if (!is_cpu) exit;

cpu_target_x = choose(0,room_width,room_width); //It knows the left-side is bad, since garbage drops left-to-right
cpu_target_y = room_height;

if (instance_exists(o_piece)) {
	var _list = ds_list_create();
	with (o_piece) {
		if (player == other.player) && (type == other.types[0] || type == other.types[1]) ds_list_add(_list,id);
	}
	
	var _last = room_width;
	var _size = sprite_get_width(s_pieces);
	var _connected = 0;
	for (var i = 0; i < ds_list_size(_list); i++) {
		var _inst = ds_list_find_value(_list,i);
		var _dist = point_distance(x,y,_inst.x,_inst.y);
		if (_connected < _inst.connected) && (_dist < _last) && (_dist >= sprite_get_width(s_pieces)) {
			_connected = _inst.connected;
			_last = _dist;
			
			with (_inst) {
				#region Check to see if we can put the piece around this one
				if (!place_meeting(x,y-_size,p_solid)) {
					other.cpu_target_x = x;
					other.cpu_target_y = y-(_size div 2)-_size;
					other.cpu_target_type = type;
				}
				else if (!place_meeting(x-_size,y,p_solid)) && (place_meeting(x-_size,y+_size,p_solid)) {
					other.cpu_target_x = x-_size;
					other.cpu_target_y = y-(_size div 2);
					other.cpu_target_type = type;
				}
				else if (!place_meeting(x+_size,y,p_solid)) && (place_meeting(x+_size,y+_size,p_solid)) {
					other.cpu_target_x = x+_size;
					other.cpu_target_y = y-(_size div 2);
					other.cpu_target_type = type;
				}
				#endregion
			}
		}
	}
	
	ds_list_destroy(_list);
}