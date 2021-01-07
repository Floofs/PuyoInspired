/// @desc Center the Window
window_center();

//This is an alarm because resizing the window on the same
//frame as centering it makes the window not center at all
//so using alarm[0] = 1 makes it wait the single frame it
//needs to adjust properly