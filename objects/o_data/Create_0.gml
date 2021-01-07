//Game Data
scale = 3;

global.controls = {
	left : [vk_left,gp_padl],
	right : [vk_right,gp_padr],
	up : [vk_up,gp_padu],
	down : [vk_down,gp_padd],
	accept : [ord("Z"),gp_face1],
	cancel : [ord("X"),gp_face2],
	extra : [ord("C"),gp_face3],
	menu : [ord("V"),gp_face4],
	start : [vk_enter,gp_start],
	select : [vk_backspace,gp_select]
}

global.gamepad = 0;
global.paused = false;

global.rule_offset = false;
global.type_count = 4;

//Start up the game
randomize();
resize_window(scale);
draw_set_font(fnt_sans);

alarm[0] = 1;

instance_create_layer(0,0,"Instances",o_controller);

room_goto_next();