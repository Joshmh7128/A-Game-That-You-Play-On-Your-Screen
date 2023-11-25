/// @description Insert description here
// You can write your code in this editor

function checkwin()
{
	if distance_to_object(player) < touch_distance
	{
		room_goto(target_room);
	}
}

// run check win
checkwin();