extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var animation = "Idle"
	if $AnimatedSprite.animation != animation:
		$AnimatedSprite.play(animation)
		
func _on_Dino_body_entered(body):
	if body.get_name() == "PlayerBetter":
		print("Dino has been defeated..!")
		var animation = "Dead"
		$AnimatedSprite.play(animation)
		$AudioStreamPlayer2D.play()
