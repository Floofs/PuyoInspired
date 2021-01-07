global.particle_sys = part_system_create_layer(layer,true);

global.particle_blob = part_type_create();
part_type_shape(global.particle_blob,pt_shape_pixel);
part_type_size(global.particle_blob,2,2,0,0);
part_type_color1(global.particle_blob,c_white);
part_type_alpha1(global.particle_blob,1);
part_type_speed(global.particle_blob,2,3,0,0.25);
part_type_gravity(global.particle_blob,0.2,270);
part_type_direction(global.particle_blob,60,120,0,0);
part_type_blend(global.particle_blob,false);
part_type_life(global.particle_blob,30,60);