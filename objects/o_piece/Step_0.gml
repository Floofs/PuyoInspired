if (global.paused) exit;

if (!grounded) {
	vsp = 4;
	xscale = 0.5;
	yscale = 1.5;
	if (place_meeting(x,y+vsp,p_solid)) {
		while (!place_meeting(x,y+sign(vsp),p_solid)) {
			y += sign(vsp);	
		}
		vsp = 0;
		global.wait_timer[@ player] = room_speed div 2;
	}
	y += vsp;
}
else {
	xscale = approach(xscale,1,0.1);
	yscale = approach(yscale,1,0.1);
	
	//Do we need to pop Puyos?
	if (global.wait_timer[player] <= 0 && !popped) {
		if (place_meeting(x,y,o_deadzone)) {
			global.wait_timer[@ player] = room_speed div 8;
			global.player_health[@ player] = clamp(global.player_health[player]-1,0,3);
			with (o_piece) if (player == other.player) instance_destroy();
			exit;
		}
		
		var _ready = true;
		with (o_piece) {
			if (!grounded) _ready = false;	
		}
	
		if (type != 0 && !visited && !popped && _ready) {
			BFS(id);
		}
	}
	
	//Pop your Puyo!!
	if (popped) {
		instance_destroy();
		exit;
	}
}

var _lastGrnd = grounded;
grounded = place_meeting(x,y+1,p_solid);
if (grounded && !_lastGrnd) {
	with (o_piece) {
		if (player == other.player) && (type == other.type) visited = false;	
	}
	
	xscale = 1.5;
	yscale = 0.5;
}	