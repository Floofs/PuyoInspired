var _pos = SCREEN_HEIGHT-24;
y = approach(y,_pos,12);

if (y >= _pos) {
	if (image_xscale == 0.75) {
		image_xscale = 1.25;
		image_yscale = 0.75;
		part_type_color1(global.particle_blob,c_white);
		part_particles_create(global.particle_sys,x,y,global.particle_sys,8);
	}
	else {
		image_xscale = approach(image_xscale,1,0.05);
		image_yscale = approach(image_yscale,1,0.05);
	}
}
