extends KinematicBody2D

var motion = Vector2();
var gravity = Vector2();

func _physics_process(delta):
	
	print(motion.y);
	
	var kLeft = Input.is_action_pressed("ui_left");
	var kRight = Input.is_action_pressed("ui_right");
	var kJump = Input.is_action_pressed("ui_up");
	
	var move = -int(kLeft) + int(kRight);
	
	motion.x = move*500;
	
	if(kJump == true):
		gravity.y -= 5000;
	
	motion.y = gravity.y;
	gravity.y +=10;
	
	
	
	
	if(sign(int(kJump)) > 0):
		gravity.y=0;
		pass
	
	print(int(motion.x));
	
	
	
	motion.x += move;
	move_and_slide(motion);
	motion.x=0;
	
	pass
