/// @function get_character_sprites(name)
// Use this one in o_character
function get_character_sprites(_name) {
	switch (_name) {
		case characters.chloe: {
			if (player == 0) sprite_index = s_character_chloe_left;
			else sprite_index = s_character_chloe_right;
		} break;
	}
}

function get_character_name(_id) {
	var _str = "CPU";
	switch (_id) {
		case characters.chloe: _str = "Chloe"; break;
	}
	return _str;
}

function get_character_win(_id) {
	var _spr = s_character_chloe_win;
	switch (_id) {
		case characters.chloe: _spr = s_character_chloe_win; break;
	}
	return _spr;
}

function get_character_lose(_id) {
	var _spr = s_character_chloe_lose;
	switch (_id) {
		case characters.chloe: _spr = s_character_chloe_lose; break;
	}
	return _spr;
}