// Inherit the parent event
event_inherited();

function on_activate(_state)
{
	// should we invert our state?
	if (invert_state) 
		_state = !_state;
	
	if (_state == false)
	{
		show_debug_message("door in off state");	
		// turn off collision
		mask_index = spr_null;
		
		image_index = 1;
		return;
	}

	if (_state == true)
	{
		show_debug_message("door in on state");	
		// turn on collision
		mask_index = sprite_index;
	
		image_index = 0;
		return;
	}
}

if (invert_state)
	on_activate(true);