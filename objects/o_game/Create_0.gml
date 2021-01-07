randomize();

global.player_health = array_create(2,3);
global.wait_timer = array_create(2,0);
global.chain = array_create(2,0);
global.chain_timer = array_create(2,0);
global.garbage = array_create(2,0);

clear_timer = 0;
end_game = false;
end_timer = 180;

t = 0;

//Create the spawners
with (instance_create_layer(92,44,"Board",o_spawner)) {
	player = 0;
	is_cpu = true;
}

with (instance_create_layer(220,44,"Board",o_spawner)) {
	player = 1;
	is_cpu = true;
}

//Create the deadzones
instance_create_layer(92,40,"Board",o_deadzone);
instance_create_layer(220,40,"Board",o_deadzone);