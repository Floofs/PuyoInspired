/// @function	tile_meeting(x, y, layer)
/// @param		{real} x
/// @param		{real} y
/// @param		layer
function tile_meeting(_x,_y,_layer) {
	var _tm = layer_tilemap_get_id(_layer);
	
	var _x1 = tilemap_get_cell_x_at_pixel(_tm,bbox_left+(_x-x),y);
	var _y1 = tilemap_get_cell_y_at_pixel(_tm,x,bbox_top+(_y-y));
	var _x2 = tilemap_get_cell_x_at_pixel(_tm,bbox_right+(_x-x),y);
	var _y2 = tilemap_get_cell_y_at_pixel(_tm,x,bbox_bottom+(_y-y));
	
	for (var _xx = _x1; _xx <= _x2; _xx++) {
		for (var _yy = _y1; _yy <= _y2; _yy++) {
			if (tile_get_index(tilemap_get(_tm,_xx,_yy)) > 0) return tile_get_index(tilemap_get(_tm,_xx,_yy));
		}
	}
	return false;
}
	
function BFS(_v) {
	var _size = sprite_get_width(s_pieces);
	var _q = ds_queue_create();
	var _visited = ds_list_create();
	ds_list_add(_visited,_v);
	ds_queue_enqueue(_q,_v);
	
	_v.visited = true;
	
	while (!ds_queue_empty(_q)) {
		var _w = ds_queue_head(_q);
		ds_queue_dequeue(_q);
		var _left = instance_place(_w.x-_size,_w.y,o_piece);
		var _right = instance_place(_w.x+_size,_w.y,o_piece);
		var _top = instance_place(_w.x,_w.y-_size,o_piece);
		var _bottom = instance_place(_w.x,_w.y+_size,o_piece);
		
		//Left
		if (instance_exists(_left) && _left.type == _w.type && !_left.visited) {
			ds_queue_enqueue(_q,_left);
			ds_list_add(_visited,_left);
			_left.visited = true;
		}
		
		//Right
		if (instance_exists(_right) && _right.type == _w.type && !_right.visited) {
			ds_queue_enqueue(_q,_right);
			ds_list_add(_visited,_right);
			_right.visited = true;
		}
		
		//Top
		if (instance_exists(_top) && _top.type == _w.type && !_top.visited) {
			ds_queue_enqueue(_q,_top);
			ds_list_add(_visited,_top);
			_top.visited = true;
		}
		
		//Bottom
		if (instance_exists(_bottom) && _bottom.type == _w.type && !_bottom.visited) {
			ds_queue_enqueue(_q,_bottom);
			ds_list_add(_visited,_bottom);
			_bottom.visited = true;
		}
	}
	
	show_debug_message(string(ds_list_size(_visited))+" connected pieces");
	
	//Pop the puyos!
	if (ds_list_size(_visited) >= 4) {
		for (var i = 0; i < ds_list_size(_visited); i++) {
			var _inst = ds_list_find_value(_visited,i);
			_inst.popped = true;
		}
		
		global.wait_timer[@ _v.player] = (room_speed div 4) * 3;
		global.chain[@ _v.player] += 1;
		global.chain_timer[@ _v.player] = room_speed div 2;
		
		with (o_game) clear_timer = 60; //So we don't have too many particles on-screen
		
		//Show the current chain count
		var _col = c_red;
		if (_v.player == 1) _col = c_blue;
		with (instance_create_layer(_v.x,_v.y,"Chains",o_chain)) {
			str = string(global.chain[_v.player])+"-Chain!";
			color = _col;
		}
	}
	else {
		for (var i = 0; i < ds_list_size(_visited); i++) {
			var _inst = ds_list_find_value(_visited,i);
			_inst.connected = ds_list_size(_visited);
		}
	}
	
	ds_list_destroy(_visited);
	ds_queue_destroy(_q);
}