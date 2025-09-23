var right_key = keyboard_check(vk_right);
var left_key = keyboard_check(vk_left);
var up_key = keyboard_check(vk_up);
var down_key = keyboard_check(vk_down);

xspd = (right_key - left_key) * move_spd;
yspd = (down_key - up_key) * move_spd;

// set sprite direction
mask_index = sprite[DOWN];

var move_right = xspd > 0;
var move_left = xspd < 0;
var move_down = yspd > 0;
var move_up = yspd < 0;

if yspd == 0 {
	if move_right { face = RIGHT };
	if move_left { face = LEFT };
}

if move_right && face == LEFT { face = RIGHT };
if move_left && face == RIGHT { face = LEFT };

if xspd == 0 {
	if move_down { face = DOWN };
	if move_up { face = UP };
}

if move_down && face == UP { face = DOWN };
if move_up && face == DOWN { face = UP };

sprite_index = sprite[face];

// collision handling
if place_meeting(x + xspd, y, obj_wall) == true {
	xspd = 0
}
if place_meeting(x, y + yspd, obj_wall) == true {
	yspd = 0
}

// move the player
x += xspd;
y += yspd;

// only animate player when walking
if xspd == 0 && yspd == 0 {
	image_index = 0
}

// depth
depth = -bbox_bottom;