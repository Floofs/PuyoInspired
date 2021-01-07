target = noone;
xTo = 448;
yTo = 0;

width = G_WIDTH;
height = G_HEIGHT;

state = CAMERA_STATES.point;
active = true;

alarm[0] = 1;

enum CAMERA_STATES {
	follow,
	point
}