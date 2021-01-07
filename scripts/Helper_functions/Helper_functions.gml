/// @function approach(a, b, amount)
function approach(_a,_b,_amount) {
	if (_a < _b) {
		_a += _amount;
		if (_a > _b) return _b;
	}
	else {
		_a -= _amount;
		if (_a < _b) return _b;
	}
	return _a;
}

/// @function saveFile(filename, data)
function saveFile(_filename, _data) {
	var _buffer = buffer_create(string_byte_length(_data)+1,buffer_fixed,1);
	buffer_write(_buffer,buffer_string,_data);
	buffer_save(_buffer,_filename);
	buffer_delete(_buffer);
}

/// @function loadJSON(filename)
function loadJSON(_filename) {
	var _buffer = buffer_load(_filename);
	var _string = buffer_read(_buffer,buffer_string);
	var _json = json_decode(_string);
	
	buffer_delete(_buffer);
	return _json;
}

/// @function create_dialogue(line)
function create_dialogue(_line) {
	with (instance_create_layer(0,0,layer,o_dialogue)) {
		current_page = _line;
	}
}

/// @function create_cutscene(scene)
function create_cutscene(_scene) {
	var _inst = instance_create_layer(0,0,layer,o_cutscene);
	with (_inst) {
		scene_info = _scene;
		get_scene_array();
	}
}

/// @function position_to_tile(pos)
function position_to_tile(_pos) {
	return (ceil(_pos/TILE_SIZE)-1);
}

/// @function script_execute_alt(script,arguments)
function script_execute_alt(s,a) {
	var _len = array_length(a);
 
	switch (_len) {
	    case 0:  script_execute(s); break;
	    case 1:  script_execute(s, a[0]); break;
	    case 2:  script_execute(s, a[0], a[1]); break;
	    case 3:  script_execute(s, a[0], a[1], a[2]); break;
	    case 4:  script_execute(s, a[0], a[1], a[2], a[3]); break;
	    case 5:  script_execute(s, a[0], a[1], a[2], a[3], a[4]); break;
	    case 6:  script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5]); break;
	    case 7:  script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6]); break;
	    case 8:  script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]); break;
	    case 9:  script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8]); break;
	    case 10: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9]); break;
	    case 11: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10]); break;
	    case 12: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11]); break;
	    case 13: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12]); break;
	    case 14: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13]); break;
	    case 15: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14]); break;
	}
}
	
/// @function instance_nth_nearest(x,y,obj,n)
function instance_nth_nearest(_x,_y,_obj,_n) {
	_n = min(max(1,_n),instance_number(_obj));
    var list = ds_priority_create();
    var nearest = noone;
    with (_obj) ds_priority_add(list,id,distance_to_point(_x,_y));
    repeat (_n) nearest = ds_priority_delete_min(list);
    ds_priority_destroy(list);
    return nearest;
}