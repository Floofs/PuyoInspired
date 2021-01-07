/// @desc Save Data
var _list = ds_list_create();

//Add data here

var _wrapper = ds_map_create();
ds_map_add_list(_wrapper,"ROOT",_list);

var _json = json_encode(_wrapper);
saveFile(SAVE_FNAME,_json);

//Nuke the data
ds_map_destroy(_wrapper);