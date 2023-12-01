if (mouse_over)
{
	show_debug_message("mouse click");
	mouse_clicking = true;
	state = !state;
	// set our sprite to the depressed sprite
	image_index = 1;
}