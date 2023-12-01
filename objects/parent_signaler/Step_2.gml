if (found == false)
{
	// find our receiver
	for (i = 0; i < instance_number(parent_puzzle_receiver); i++)
	{ 
		// if we match our signal and receiver
		if (instance_find(parent_puzzle_receiver, i).receiver_id == signaler_id)
		{
			receiver = instance_find(parent_puzzle_receiver, i);
			show_debug_message(receiver.receiver_id);
			found = true;
			break;
		}
	}
}