draw_set_valign(fa_middle);
draw_set_halign(fa_center);

draw_set_alpha(alpha);
var _xx = SCREEN_CENTER_X;
var _yy = SCREEN_CENTER_Y;

draw_text_transformed_color(_xx+(1*scale),_yy-(1*scale),text[current],scale,scale,0,c_black,c_black,c_black,c_black,alpha);
draw_text_transformed_color(_xx,_yy,text[current],scale,scale,0,c_black,c_black,c_black,c_black,alpha); //Bug??
draw_text_transformed(_xx,_yy,text[current],scale,scale,0);

draw_set_alpha(1);