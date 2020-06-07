kLeft = -keyboard_check(vk_left); 
kRight = keyboard_check(vk_right); 
kJump = keyboard_check_pressed(vk_up);
dt = delta_time/1000000;
show_debug_message(dt);

move = kLeft + kRight; 
hsp = move * moveSpeed; 

if (vsp < mvsp) { 
	vsp += grav; 
	};

if (kJump && place_meeting(x, y+35, obj_wall)) { 
	jmp = true; 
	}
	
if (place_meeting(x, y + 1, obj_wall)) { 
	if(jmp = true){
		vsp = 1 * -jumpSpeed; 
		}
	jmp = false
	}

if (place_meeting(x + hsp, y, obj_wall)) { 
	while (!place_meeting(x + sign(hsp), y, obj_wall)) { 
		x += (dt * sign(hsp)); 
		x = lerp(x, hsp, 0.1);
		} 
	hsp = 0; 
	} 
x += hsp;

if (place_meeting(x, y + vsp, obj_wall)) { 
	while (!place_meeting(x, y + sign(vsp), obj_wall)) { 
		y += sign(vsp); 
		} 
		vsp = 0; 
	} 
y += vsp;