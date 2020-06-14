extends KinematicBody2D

var grav = 0.5; 
var hsp = 0; 
var vsp = 0;
var mvsp = 50;
var mxsp = 1;
var jumpSpeed = 10; 
var moveSpeed = 5;
var jmp = false;

func _physics_process(delta):
	var kLeft = Input.is_action_pressed("ui_left");
	var kRight = Input.is_action_pressed("ui_right"); 
	var kJump = Input.is_action_pressed("ui_up");
	
	var move = kLeft + kRight; 
	var hsp = move * moveSpeed; 
	
	if (vsp < mvsp):
		vsp += grav; 
	
	if (kJump && place_meeting(x, y+35, obj_wall)):
		jmp = true; 
		
	if (place_meeting(x, y + 1, obj_wall)):
		if(jmp == true):
			vsp = 1 * -jumpSpeed; 
		jmp = false
	
	if (place_meeting(x + hsp, y, obj_wall)):
		while (!place_meeting(x + sign(hsp), y, obj_wall)):
			x += (dt * sign(hsp)); 
			x = lerp(x, hsp, 0.1);
		hsp = 0; 
	x += hsp;
	
	if (place_meeting(x, y + vsp, obj_wall)):
		while (!place_meeting(x, y + sign(vsp), obj_wall)):
			y += sign(vsp); 
			vsp = 0; 
	y += vsp;
	pass
