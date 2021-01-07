y = lerp(y,ystart-offset,0.2);
if (round(y) == ystart-offset) image_alpha -= 0.05;
if (image_alpha <= 0) instance_destroy();