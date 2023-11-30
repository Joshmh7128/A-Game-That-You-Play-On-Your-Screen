/// @description Public function for player respawning
function respawn_player(_player)
{
	// move the argument player to our positions
	_player.x = respawn_x;
	_player.y = respawn_y;
	return;
}

