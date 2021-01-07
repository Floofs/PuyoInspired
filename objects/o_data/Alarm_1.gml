/// @desc Load Save Data
if (!file_exists(SAVE_FNAME)) exit;

var _wrapper = loadJSON(SAVE_FNAME);
//var _list = _wrapper[? "ROOT"];

//read data here

ds_map_destroy(_wrapper);