/// @function	get_scene_array()
function get_scene_array() {
	curr_scene = scene_info[scene_index];
	
	var _len = array_length(curr_scene)-1;
	scene_array = -1;
	scene_array = array_create(_len,0);
	array_copy(scene_array,0,curr_scene,1,_len);
}

/// @function	cutscene_wait(seconds)
/// @param		{real} seconds
function cutscene_wait(_seconds) {
	timer++;
	if (timer >= _seconds*room_speed) {
		timer = 0;
		cutscene_end_action();
	}
}

/// @function	cutscene_wait_dialogue()
function cutscene_wait_dialogue() {
	if (!instance_exists(o_dialogue)) cutscene_end_action();
}

/// @function	cutscene_end_action()
function cutscene_end_action() {
	scene_index++;
	
	if (scene_index >= array_length(scene_info)) {
		instance_destroy();
		exit;
	}
	
	get_scene_array();
}

/// @function	cutscene_play_sound(soundid,priority,loops)
/// @param		soundid
/// @param		priority
/// @param		loops
function cutscene_play_sound(_s,_p,_l) {
	audio_play_sound(_s,_p,_l);
	cutscene_end_action();
}

/// @function	cutscene_instance_create(x,y,layerid,obj)
/// @param		x
/// @param		y
/// @param		layerid
/// @param		obj
function cutscene_instance_create(_x,_y,_id,_obj) {
	var _inst = instance_create_layer(_x,_y,_id,_obj);
	cutscene_end_action();
	return _inst;
}

/// @function	cutscene_instance_destroy(obj_id)
/// @param		obj_id
function cutscene_instance_destroy(_obj) {
	with (_obj) instance_destroy();
	cutscene_end_action();
}

/// @function	cutscene_instance_destroy_nearest(x,y,obj_id,to_destroy)
/// @param		x
/// @param		y
/// @param		obj_id
/// @param		object to destroy
function cutscene_instance_destroy_nearest(_x,_y,_obj1,_obj2) {
	with (_obj1) var _inst = instance_nearest(_x,_y,_obj2);
	cutscene_instance_destroy(_inst);
}

/// @function	cutscene_change_direction(obj,direction)
/// @param		obj_id
/// @param		direction
function cutscene_change_direction(_obj,_dir) {
	with (_obj) {
		direction = _dir;
		localFrame = 0;
		update_sprite();
	}
	cutscene_end_action();
}

/// @function	cutscene_change_variable(obj,var,value)
/// @param		obj_id
/// @param		variable as string
/// @param		value
function cutscene_change_variable(_obj,_var,_val) {
	with (_obj) {
		variable_instance_set(id,_var,_val);
	}
	cutscene_end_action();
}

/// @function	cutscene_move_character(obj,x,y,isXRelative,isYRelative,spd)
/// @param		obj_id
/// @param		x
/// @param		y
/// @param		isXRelative
/// @param		isYRelative
/// @param		spd
function cutscene_move_character(_obj,_x,_y,_isXRelative,_isYRelative,_spd) {
	if (x_dest == -1) || (y_dest == -1) {
		if (!_isXRelative) x_dest = _x; else x_dest = _obj.x+_x;
		if (!_isYRelative) y_dest = _y; else y_dest = _obj.y+_y;
	}
	
	var _xx = x_dest;
	var _yy = y_dest;
	var _finish = false;
	
	with (_obj) {
		sprite_index = spr_walk;
		if (oldSpr != sprite_index) localFrame = 0;
		
		if (point_distance(x,y,_xx,_yy) >= _spd) {
			var _pdir = point_direction(x,y,_xx,_yy);
			direction = _pdir;
			
			var _ldirx = lengthdir_x(_spd,_pdir);
			var _ldiry = lengthdir_y(_spd,_pdir);
			x += _ldirx;
			y += _ldiry;
			
			update_sprite();
		}
		else {
			_finish = true;
		}
	}
	
	//End the action
	if (_finish) {
		with (_obj) {
			sprite_index = spr_idle;
			localFrame = 0;
			subx = 0;
			suby = 0;
			x = round(x);
			y = round(y);
			update_sprite();
		}
		
		with (other) {
			x_dest = -1;
			y_dest = -1;
			cutscene_end_action();
		}
	}
}

/// @function	cutscene_move_character_simple(obj,x,y,isXRelative,isYRelative,spd)
/// @param		obj_id
/// @param		x
/// @param		y
/// @param		isXRelative
/// @param		isYRelative
/// @param		spd
function cutscene_move_character_simple(_obj,_x,_y,_isXRelative,_isYRelative,_spd) {
	if (x_dest == -1) || (y_dest == -1) {
		if (!_isXRelative) x_dest = _x; else x_dest = _obj.x+_x;
		if (!_isYRelative) y_dest = _y; else y_dest = _obj.y+_y;
	}
	
	var _xx = x_dest;
	var _yy = y_dest;
	var _finish = false;
	
	with (_obj) {
		sprite_index = spr_walk;
		if (oldSpr != sprite_index) localFrame = 0;
		
		if (x != _xx) || (y != _yy) {
			var _pdir = point_direction(x,y,_xx,_yy);
			direction = _pdir;
			
			x = approach(x,_xx,_spd);
			y = approach(y,_yy,_spd);
			
			update_sprite();
		}
		else {		
			_finish = true;
		}
	}
	
	//End the action
	if (_finish) {
		with (_obj) {
			sprite_index = spr_idle;
			localFrame = 0;
			subx = 0;
			suby = 0;
			x = round(x);
			y = round(y);
			update_sprite();
		}
		
		with (other) {
			x_dest = -1;
			y_dest = -1;
			cutscene_end_action();
		}
	}
}

/// @function	cutscene_move_group_simple(obj,x,y,isXRelative,isYRelative,spd)
/// @param		obj_id array
/// @param		x
/// @param		y
/// @param		isXRelative
/// @param		isYRelative
/// @param		spd
function cutscene_move_group_simple(_obj,_x,_y,_isXRelative,_isYRelative,_spd) {
	if (x_dest == -1) || (y_dest == -1) {
		if (!_isXRelative) x_dest = _x; else x_dest = _obj[0].x+_x;
		if (!_isYRelative) y_dest = _y; else y_dest = _obj[0].y+_y;
	}
	
	var _xx = x_dest;
	var _yy = y_dest;
	var _finish = false;
	
	for (var i = 0; i < array_length(_obj); i++) {
		with (_obj[i]) {
			sprite_index = spr_walk;
			if (oldSpr != sprite_index) localFrame = 0;
		
			if (x != _xx) || (y != _yy) {
				var _pdir = point_direction(x,y,_xx,_yy);
				direction = _pdir;
			
				x = approach(x,_xx,_spd);
				y = approach(y,_yy,_spd);
			
				update_sprite();
			}
			else {		
				_finish = true;
			}
		}
	}
	
	//End the action
	if (_finish) {
		for (var i = 0; i < array_length(_obj); i++) {
			with (_obj[i]) {
				sprite_index = spr_idle;
				localFrame = 0;
				subx = 0;
				suby = 0;
				x = round(x);
				y = round(y);
				update_sprite();
			}
		}
		
		with (other) {
			x_dest = -1;
			y_dest = -1;
			cutscene_end_action();
		}
	}
}

/// @function	cutscene_hop_character(obj,spd)
/// @param		obj_id
/// @param		{real} spd
function cutscene_hop_character(_obj,_spd) {
	with (_obj) {
		zsp = -_spd;
	}
	cutscene_end_action();
}

/// @function	cutscene_jump_character(obj,x,y)
/// @param		obj_id
/// @param		{real} x
/// @param		{real} y
function cutscene_jump_character(_obj,_x,_y) {
	with (_obj) {
		x = _x;
		y = _y;
	}
	cutscene_end_action();
}

/// @function	cutscene_create_emote(obj,emote)
/// @param		obj_id
///	@param		{real} emote
function cutscene_create_emote(_obj,_emote) {
	var _xx = _obj.x;
	var _yy = _obj.y-_obj.sprite_height;
	
	with (instance_create_layer(_xx,_yy,layer_get_id("UI"),o_emote)) {
		image_index = _emote;
	}
	cutscene_end_action();
}

/// @function	cutscene_create_dialogue(line)
/// @param		{real} line
function cutscene_create_dialogue(_line) {
	with (instance_create_layer(0,0,"Instances",o_dialogue)) {
		current_page = _line;	
	}
	cutscene_end_action();
}