if (global.chain_timer[player] > 0) && (global.chain[player] > 1) {
	image_yscale = approach(image_yscale,1,0.2);
	reset_pos = false;
	switch (player) {
		case 0: x = approach(x,xstart+32,0.2); break;
		case 1: x = approach(x,xstart-32,0.2); break;
	}
}
else if (!reset_pos) {
	image_yscale = approach(image_yscale,0,0.2);
	if (image_yscale == 0) alarm[0] = 1;
}