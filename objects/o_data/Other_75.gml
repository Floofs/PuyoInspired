switch (async_load[? "event_type"]) {
	case "gamepad discovered": {
		var _pad = async_load[? "pad_index"];
		gamepad_set_axis_deadzone(_pad,0.25);
		gamepad_set_button_threshold(_pad,0.1);
		global.gamepad = _pad;
	} break;
	case "gamepad lost": {
		//Disconnected
	} break;
}