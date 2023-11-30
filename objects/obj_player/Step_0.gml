/// @description Movement of the player

// function we run to declare our player debug movement
function process_movement_input()
{	
	// gamepad movement
	if (gamepad_axis_value(0, gp_axislh) > 0.1)
		rspeed = input_speed*(gamepad_axis_value(0, gp_axislh));
	else rspeed = 0;
	
	if (gamepad_axis_value(0, gp_axislh) < -0.1)
		lspeed = input_speed*(gamepad_axis_value(0, gp_axislh));
	else lspeed = 0;

	// only apply debug movement if we have to
	if (rspeed == 0 && lspeed == 0)
	{	
		// debug arrow key movement
		if keyboard_check(vk_right)
			rspeed = input_speed;
			else rspeed = 0;

		if keyboard_check(vk_left)
			lspeed = -input_speed;
			else lspeed = 0;
	}
	
	if keyboard_check(vk_up) || gamepad_button_check(0, gp_face1)
	{		
		
		//show_debug_message("pressing up");
		
		if (!jumpfalling && jumptime > 0)
		{			
			// we are jumping up
			jumpingup = true;
			vspeed += jump_power; // then apply gravity
			jumptime -= 1;
		} else if (jumptime <= 0)
		jumpingup = false;
	}
	
	// if we are already jumping and let go of up, jumping is false
	if (keyboard_check_released(vk_up) || gamepad_button_check_released(0, gp_face1)) && !jumpfalling
	{
		// we are not jumping
		jumpfalling = true;
		jumptime = 0;
	}
	
	// for closing the game
	if (keyboard_check(vk_escape))
		game_end();
	
	// show_debug_message("jumptime: " + string(jumptime));
	// show_debug_message("jumpfalling: " + string(jumpfalling));
	
}

// then process our physics
function process_player_physics()
{
	// set our speed and gravity
	// hspeed = spd;
	// additively increase our gravity if we are not standing on something
	if (!place_meeting(x,y+2,obj_parent_collision_block))
	{		
		if (vspeed < max_vspeed)
			vspeed += grav;
	}
	
	// at the speed we are falling check to see if a space is free, if not, stop falling
	if (!place_free(x, y+vspeed) | !place_free(x, y+2))
	{		
		p = vspeed;
		// slow us down
		vspeed = 0;
		// if p is 0 make it 2 just in case
		if (p == 0) p = 2;
		// snap our position to the fall point using a for point
		for (i = 0; i < p; i++)
		{
			// check along a line to see where we fall, then snap to one point above that
			if (!place_free(x, y+i))
			{
				// if we are about to hit the ground, snap ourselves to the ground at that point
				y = y+i;
				// we are now grounded
				grounded = true;
				// when we land reset our jumptime
				jumptime = jumptimemax;
				// we are no longer jump falling
				jumpfalling = false;
				// show_debug_message("reset jump");
				
				// then complete the loop
				break;
			}
		}
		
	} else // if there is a place free beneath us, we are not grounded
	{
		grounded = false;
	}
	
	// apply our hspeed
	hspeed = lerp(hspeed, lspeed + rspeed, hlerpspeed);
	// check in the direction of our hspeed to see if we can move
	if (instance_place(x+hspeed, y-1, obj_parent_collision_block))
	{		
		show_debug_message("block");
		p = hspeed;
		// slow us down
		hspeed = 0;
		// snap our position to the fall point using a for point
		for (i = 0; i < p; i++)
		{
			// check along a line to see where we fall, then snap to one point above that
			if (instance_place(x+i, y-1, obj_parent_collision_block))
			{
				// if we are about to hit the ground, snap ourselves to the ground at that point
				x = x+i*sign(hspeed);
				break;
			}
		}
		
	} else // if there is a place free beneath us, we are not grounded
	{
		grounded = false;
	}
	
}

// check if we collide with any kinds of deathholes
function process_deathhole_collision()
{


}

// run our stack
process_player_physics();
process_movement_input(); 