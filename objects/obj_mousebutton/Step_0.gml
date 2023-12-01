/// @description checks if mouse is over and then applies the specific sprite state
// run to set the state of the object's light
function set_visible_state()
{
	if (state == off)
	{		
		image_index = 2;
		
		show_debug_message("state off");
		return;
	}
		
	if (state == on)
	{
		image_index = 3;
		show_debug_message("state on");
		return;
	}
}

// when this thing is pressed
function on_press()
{
	show_debug_message("on press");	
	
	receiver.on_activate(state);
}

	