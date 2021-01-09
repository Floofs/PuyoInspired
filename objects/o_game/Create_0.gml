randomize();

switch (global.mode) {
	case gamemode.survival: global.player_health = array_create(2,3); break;
	default: global.player_health = array_create(2,1); break;
}
global.wait_timer = array_create(2,0);
global.chain = array_create(2,0);
global.chain_timer = array_create(2,0);
global.garbage = array_create(2,0);

clear_timer = 0;
end_game = false;
end_timer = 180;

t = 0;

alarm[0] = 60;

//Create the deadzones
instance_create_layer(92,46,"Board",o_deadzone);
instance_create_layer(220,46,"Board",o_deadzone);