extends KinematicBody2D

export (int) var speed = 400
export (int) var jump_speed = -600
export (int) var GRAVITY = 1200

export (int) var max_jumps = 2
export (float) var crouch_scale = 0.5

const UP = Vector2(0,-1)

var velocity = Vector2()

var jumps_remaining = max_jumps

func get_input():
	velocity.x = 0
	if is_on_floor():
		jumps_remaining = max_jumps
	if Input.is_action_just_pressed("ui_up") and jumps_remaining > 0:
		velocity.y = jump_speed
		jumps_remaining -= 1
	if Input.is_action_pressed('ui_right'):
		velocity.x += speed
	if Input.is_action_pressed('ui_left'):
		velocity.x -= speed
		
	if Input.is_action_pressed("ui_down"):
		$Sprite.scale.y = crouch_scale
	else:
		$Sprite.scale.y = 1.0

func _physics_process(delta):
	velocity.y += delta * GRAVITY
	get_input()
	velocity = move_and_slide(velocity, UP)
