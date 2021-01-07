if (!active) exit;

switch (state) {
	case CAMERA_STATES.follow: {
		if (target != noone) && (instance_exists(target)) {
			var _xx = target.x-round(width/2);
			var _yy = target.y-round(height/2);
			
			x = lerp(x,_xx,0.5);
			y = lerp(y,_yy,0.5);
		}
	} break;
	
	case CAMERA_STATES.point: {
		x = lerp(x,xTo,0.1);
		y = lerp(y,yTo,0.1);
	} break;
}

x = clamp(x,0,room_width-round(width));
y = clamp(y,0,room_height-round(height));

camera_set_view_pos(view_camera[0],x,y);