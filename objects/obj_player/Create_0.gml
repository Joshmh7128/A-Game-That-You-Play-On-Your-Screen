/// @description Insert description here
// You can write your code in this editor

// set the game to fullscreen
// window_set_fullscreen(true);

// proprietary vars
hspeed = 0;
vspeed = 0;

spd = 0; // our speed variable tells us how to fast to move
vspd = 0;
dir = 0; // our direction variable tells us which direction we're moving in
grav = 1; // the speed of gravity on the player
max_vspeed = 20; // our maximum vspeed
jump_grav = 0; // the amount of gravity currently applied to the player
input_speed = 20; // how fast we move
jump_power = -4; // how high we jump
hlerpspeed = 0.15; 
rspeed = 0; lspeed = 0; // our right and left speeds for the player

// are we grounded
grounded = false;
jumpfalling = true; // are we in the second half of our jump?
jumptimemax = 7; // the amount of frames we can apply upward movement
jumptime = jumptimemax;
jumpingup = false; // are we currently jumping up?

// our visual vars
imagerot = 0;