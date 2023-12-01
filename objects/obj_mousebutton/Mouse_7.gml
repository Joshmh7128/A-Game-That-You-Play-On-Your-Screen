if (mouse_clicking)
{	
	mouse_clicking = false;
	
	// set the state
	set_visible_state();
	// run on pressed
	on_press();
}