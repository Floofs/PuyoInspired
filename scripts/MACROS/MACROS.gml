/*
ASSETS
Fonts are Determination Mono and Sans
*/

//Base Size (What I'm aiming for)
//#macro G_WIDTH 384
//#macro G_HEIGHT 216
#macro G_WIDTH 320
#macro G_HEIGHT 180
#macro G_FPS 60

//Directions
#macro CARDINAL_DIR round(direction/90)
#macro DIR_RIGHT 0
#macro DIR_UP 90
#macro DIR_LEFT 180
#macro DIR_DOWN 270

//Game Modes
enum gamemode {
	singleBoard,
	survival,
	mission,
	flip
}
enum missions {
	colorCount,
	chainCount,
	blobCount
}

//Important
#macro SAVE_FNAME "save"

//Tile-related
#macro TILE_SIZE 8

//Screen Stuff
#macro SCREEN_WIDTH display_get_gui_width()
#macro SCREEN_HEIGHT display_get_gui_height()

#macro SCREEN_CENTER_X round(SCREEN_WIDTH*0.5)
#macro SCREEN_CENTER_Y round(SCREEN_HEIGHT*0.5)