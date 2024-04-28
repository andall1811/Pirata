extends AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	self.play()

func _disable_collision():
	$StaticBody2D/CollisionShape2D.set_deferred("disabled", true)
	
func _enable_collision():
	$StaticBody2D/CollisionShape2D.set_deferred("disabled", false)
