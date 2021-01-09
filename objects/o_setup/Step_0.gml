//Controls
var _kLeft = o_controller.kLeftTap;
var _kRight = o_controller.kRightTap;
var _kUp = o_controller.kUpTap;
var _kDown = o_controller.kDownTap;
var _kAccept = o_controller.kAccept;

if (_kUp && !_kDown) choice--;
else if (_kDown && !_kUp) choice++;
if (choice < 0) choice = 2;
if (choice > 2) choice = 0;

switch (choice) {
	case 0: {
		if (_kAccept) {
			switch (shape) {
				case 0: global.piece_sprite = s_pieces_orbs; break;
				case 1: global.piece_sprite = s_pieces_cube; break;
				case 2: global.piece_sprite = s_pieces_shapes; break;
				case 3: global.piece_sprite = s_pieces_puyo; break;
				case 4: global.piece_sprite = s_pieces_numbers; break;
			}
			instance_create_layer(0,0,layer,o_game);
			instance_destroy();
		}
	} break;
	
	case 1: {
		if (_kLeft && !_kRight) shape--;
		else if (_kRight && !_kLeft) shape++;
	
		if (shape < 0) shape = 4;
		if (shape > 4) shape = 0;
	} break;
	
	case 2: {
		if (_kLeft && !_kRight) || (_kRight && !_kLeft) global.CPU_only = !global.CPU_only;
	} break;
}
