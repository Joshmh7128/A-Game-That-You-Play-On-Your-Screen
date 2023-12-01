// Inherit the parent event

function on_activate()
{
}

function on_activate(_state)
{
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
		mask_index = spr_purple;
	
		image_index = 0;
		return;
	}
}