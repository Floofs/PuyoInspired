//Resize Grid
var _instNum = instance_number(p_entity);
if (ds_grid_height(depth_grid) != _instNum) ds_grid_resize(depth_grid,2,_instNum);

//Add Instance Info to Grid, then sort it
var e = 0;	//e for entity
with (p_entity) {
	other.depth_grid[# 0,e] = id;
	other.depth_grid[# 1,e] = y;
	e++;
}
ds_grid_sort(depth_grid,1,true);

var _inst;
e = 0;
repeat(_instNum) {
	_inst = depth_grid[# 0,e];
	with (_inst) {
		event_perform(ev_draw,0);
	}
	e++;
}