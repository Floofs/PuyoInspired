var _shape = "";
var _spr = s_pieces;
switch (shape) {
	case 0: _shape = "Round"; _spr = s_pieces_orbs; break;
	case 1: _shape = "Cubes"; _spr = s_pieces_cube; break;
	case 2: _shape = "Shapes"; _spr = s_pieces_shapes; break;
	case 3: _shape = "Slime"; _spr = s_pieces_puyo; break;
	case 4: _shape = "Numbers"; _spr = s_pieces_numbers; break;
}
var _mode = "";
switch (global.mode) {
	case gamemode.survival: _mode = "Survival"; break;
	case gamemode.singleBoard: _mode = "Single Board"; break;
	case gamemode.flip: _mode = "Flip"; break;
	case gamemode.mission: _mode = "Mode"; break;
}
var _CPU = "Enabled";
if (!global.CPU_only) _CPU = "Disabled";

var _str = "Start\nGummi Type: < "+_shape+" >\nP1 CPU: < "+_CPU+" >\nGame Mode: < "+_mode+" > X";

draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _xx = 32;
var _yy = 24;

draw_text(_xx,_yy,_str);
draw_text(_xx-12,_yy+(choice*string_height("M")),">");
for (var i = 1; i < global.type_count+2; i++) {
	draw_sprite(_spr,i,_xx+48+((i-1)*9),_yy+12);
}