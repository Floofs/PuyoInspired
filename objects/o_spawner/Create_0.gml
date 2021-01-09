image_index = 0;
player = 0;
is_cpu = false;
dropped_garbage = false;

types = [irandom(global.type_count)+1,irandom(global.type_count)+1];
chance = 0;

t = 0;

name = "CPU";

//y++; //So the spawner can't let you place blobs over the board