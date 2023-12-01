// find all of our receivers
if (!found_receivers)
{
	// search all of our puzzle receiver
	for (i = 0; i < instance_number(parent_puzzle_receiver); i++)
	{
		// if this is the one we want, add it to our array of receiver
		if (instance_find(parent_puzzle_receiver,i).receiver_id == target_id)
			array_push(receivers, instance_find(parent_puzzle_receiver,i));
	}
	
	// now that we have found our receivers, we are good to go
	found_receivers = true;
}

// partial function that takes no arguments
function on_activate()
{
	for (i = 0; i < array_length(receivers); i++)
	{
		with (receivers[i])
		{
			on_activate();	
		}
	}
}

// function that takes arguments
function on_activate(_input_state = false)
{
	for (i = 0; i < array_length(receivers); i++)
	{
		with (receivers[i])
		{
			on_activate(_input_state);	
		}
	}
}


// function that takes state and integers
function on_activate(_input_state = false, value = 0)
{
	for (i = 0; i < array_length(receivers); i++)
	{
		with (receivers[i])
		{
			on_activate(_input_state, value);	
		}
	}
}