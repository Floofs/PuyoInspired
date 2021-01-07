draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _size = 1;

draw_text_transformed_color(x+_size,y,str,_size,_size,0,c_black,c_black,c_black,c_black,image_alpha);
draw_text_transformed_color(x,y+_size,str,_size,_size,0,c_black,c_black,c_black,c_black,image_alpha);

draw_text_transformed_color(x,y,str,_size,_size,0,c_white,color,color,c_black,image_alpha);