extends KinematicBody2D

var motion = Vector2();
var gravity = Vector2();

const UP = Vector2(0, -1)

func _physics_process(delta):
	
	
	var kLeft = Input.is_action_pressed("ui_left");
	var kRight = Input.is_action_pressed("ui_right");
	var kJump = Input.is_action_pressed("ui_up");
	
	var move = -int(kLeft) + int(kRight);
	
	motion.x = move*500;
	
	motion.y = gravity.y;
	gravity.y +=10;
	
	motion.x += move;
	move_and_slide(motion, UP);
	motion.x=0;
	
	if(is_on_floor() == true && int(kJump) > 0):
		print("Jump")
		for n in 1:
			gravity.y -= -500 * delta;
	
	if(is_on_floor() == true):
		gravity.y == 0;
	
	pass
