//Game Data
scale = 4;

global.controls = {
	left : [vk_left,gp_padl],
	right : [vk_right,gp_padr],
	up : [vk_up,gp_padu],
	down : [vk_down,gp_padd],
	accept : [ord("Z"),gp_face1,gp_face3],
	cancel : [ord("X"),gp_face2,gp_face4],
	start : [vk_enter,gp_start]
}

global.gamepad = 0;
global.paused = false;
global.CPU_only = true;
global.story_mode = false;

global.left_char = characters.chloe;
global.right_char = characters.chloe;

global.mode = gamemode.singleBoard;
global.piece_sprite = s_pieces_orbs;
global.rule_offset = false;
global.type_count = 3;	//+1

//Start up the game
randomize();
resize_window(scale);
draw_set_font(fnt_sans);

surface_resize(application_surface,G_WIDTH,G_HEIGHT);
display_set_gui_size(G_WIDTH,G_HEIGHT);

alarm[0] = 1;

instance_create_layer(0,0,"Instances",o_controller);

room_goto_next();