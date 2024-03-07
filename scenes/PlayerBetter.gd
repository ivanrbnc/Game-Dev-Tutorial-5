extends KinematicBody2D

export (int) var speed = 400
export (int) var jump_speed = -600
export (int) var GRAVITY = 1200

const UP = Vector2(0,-1)

var velocity = Vector2()

func get_input():
	var animation = "Idle"
	velocity.x = 0
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = jump_speed
	if Input.is_action_just_pressed("ui_up") and Input.is_action_pressed('ui_right'):
		animation = "Jump"
		$AnimatedSprite.flip_h = false
		velocity.y = jump_speed
	if Input.is_action_just_pressed("ui_up") and Input.is_action_pressed('ui_left'):
		animation = "Jump"
		$AnimatedSprite.flip_h = true
		velocity.y = jump_speed
	if Input.is_action_pressed('ui_right'):
		animation = "Run"
		$AnimatedSprite.flip_h = false
		velocity.x += speed
	if Input.is_action_pressed('ui_left'):
		animation = "Run"
		$AnimatedSprite.flip_h = true
		velocity.x -= speed
	if Input.is_action_pressed("ui_accept"):
		animation = "Slash"
	if $AnimatedSprite.animation != animation:
		$AnimatedSprite.play(animation)

func _physics_process(delta):
	velocity.y += delta * GRAVITY
	get_input()
	velocity = move_and_slide(velocity, UP)
