//Resize the screen
//surface_resize(application_surface,G_WIDTH*scale,G_HEIGHT*scale);
surface_resize(application_surface,G_WIDTH,G_HEIGHT);
display_set_gui_size(G_WIDTH,G_HEIGHT);

//Set up the depth sorter
//instance_create_layer(0,0,layer,o_depth);

//Force the room speed
room_speed = G_FPS;