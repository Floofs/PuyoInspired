#region Pausing
if (os_is_paused() && !global.paused) global.paused = true;

var _kPause = o_controller.kPause;
if (_kPause) global.paused = !global.paused;

if (global.paused) {
	//Pause Menu
	
	exit;
}
#endregion

if (end_game) {
	if (t < 360) t += 4;
	else t -= 360;
	
	if (end_timer > 0) {
		end_timer--;
		if (end_timer == 0) {
			part_particles_clear(global.particle_blob);
			gc_collect();
			room_restart();
		}
	}
	exit;
}

#region Timers
//Wait
if (global.wait_timer[0] > 0) global.wait_timer[@ 0]--;
else global.wait_timer[@ 0] = 0;

if (global.wait_timer[1] > 0) global.wait_timer[@ 1]--;
else global.wait_timer[@ 1] = 0;

//Chains
if (global.wait_timer[0] <= 0) {
	if (global.chain_timer[0] > 0) global.chain_timer[@ 0]--;
	else {
		global.chain_timer[@ 0] = 0;
		
		if (global.rule_offset) {
			if (global.garbage[0] > 0) {
				var _g = (clamp((global.chain[0]-1),0,24)*8);
				if (_g > global.garbage[0]) global.garbage[@ 1] += (global.garbage[0]-_g);
				global.garbage[@ 0] = (clamp(global.garbage[0]-_g,0,global.garbage[0]));
			}
			else global.garbage[@ 1] += (clamp((global.chain[0]-1),0,24)*8);
		}
		else global.garbage[@ 1] += (clamp((global.chain[0]-1),0,24)*8);
		
		global.chain[@ 0] = 0;
	}
}

if (global.wait_timer[1] <= 0) {
	if (global.chain_timer[1] > 0) global.chain_timer[@ 1]--;
	else {
		global.chain_timer[@ 1] = 0;
		
		if (global.rule_offset) {
			if (global.garbage[0] > 0) {
				var _g = (clamp((global.chain[1]-1),0,24)*8);
				if (_g > global.garbage[1]) global.garbage[@ 0] += (global.garbage[1]-_g);
				global.garbage[@ 1] = (clamp(global.garbage[1]-_g,0,global.garbage[1]));
			}
			else global.garbage[@ 0] += (clamp((global.chain[1]-1),0,24)*8);
		}
		else global.garbage[@ 0] += (clamp((global.chain[1]-1),0,24)*8);
		
		global.chain[@ 1] = 0;
	}
}

if (clear_timer > 0) {
	clear_timer--;
	if (clear_timer <= 0) {
		part_particles_clear(global.particle_blob);	
	}
}
#endregion

#region Win/Loss
if (global.player_health[0] <= 0 || global.player_health[1] <= 0) {
	if (instance_exists(o_piece_controller)) with (o_piece_controller) instance_destroy();
	if (instance_exists(o_piece)) with (o_piece) instance_destroy();
	with (o_spawner) instance_destroy();
	with (o_deadzone) instance_destroy();
	end_game = true;
}
#endregion