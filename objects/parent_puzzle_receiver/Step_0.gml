/// @description Abstract puzzle receiver parent

// partial function that takes no arguments
function on_activate()
{
	
}

// function that takes arguments
function on_activate(_input_state = false)
{
	// based on whether the input state is true or false, use this
	// by default when this is run it runs the normal one just in case we simplify logic
	on_activate();
}


// function that takes state and integers
function on_activate(_input_state = false, value = 0)
{
	// based on whether the input state is true or false, or we need an integer, use this
	// by default when this is run it runs the normal one just in case we simplify logic
	on_activate();
}