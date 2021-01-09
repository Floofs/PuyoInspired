/// @desc Start the game

//Create the spawners
with (instance_create_layer(92,46,"Board",o_spawner)) {
	player = 0;
	is_cpu = global.CPU_only;
	if (!global.CPU_only) name = get_character_name(global.left_char);
}

with (instance_create_layer(220,46,"Board",o_spawner)) {
	player = 1;
	is_cpu = true;
	if (global.story_mode) name = get_character_name(global.right_char);
}

//Create the characters
with (instance_create_layer(SCREEN_CENTER_X,4+(32),"Instances",o_character)) {
	player = 0;
	get_character_sprites(global.left_char);
	
}

with (instance_create_layer(SCREEN_CENTER_X,room_height-4,"Instances",o_character)) {
	player = 1;
	get_character_sprites(global.right_char);
	image_xscale = -1;
}