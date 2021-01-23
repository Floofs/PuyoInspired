if (current < array_length(text)-1) {
	alpha = approach(alpha,1,0.1);
	scale = approach(scale,2,0.2);
	
	if (scale == 2) && (alpha == 1) timer--;
	if (timer < 0) { current++; timer = room_speed * 0.5; }
}
else {
	alpha = approach(alpha,0,0.1);
	scale = approach(scale,8,0.5);
	
	if (alpha == 0) instance_destroy();
}