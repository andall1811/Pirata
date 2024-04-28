extends AnimatedSprite2D
## Script for collectible objects with dialogues
##
## This object is stored in the inventory. It also shows an object information dialogue



# Animation and dialogues mapping
var _dialogues = {
	"blue_potion": "res://scenes/game/dialogues/dialogues/power_up/blue_potion.dialogue",
	"green_bottle": "res://scenes/game/dialogues/dialogues/power_up/green_bottle.dialogue",
}
var _move: Node2D # To disable the character
var _potion_time = 5.0


# Initialization function
func _ready():
	play()


# Listen for when a "body" enters the object's area
func _on_area_body_entered(body):
	if body.is_in_group("player"):
		_move = body.get_node("MainCharacterMovement")
		_pick_up()


# When picking up the object, play pick-up animation, and when finished, activate the character and free memory
func _pick_up():
	# Add items to the inventory
	#InventoryCanvas.add_item_by_name(animation)
	# Play animation and remove the item from the scene
	var _animation = animation
	_apply_potion(_animation)
	play("pick_up")
	await animation_finished
	visible = false
	$Area/CollisionShape.disabled = true
	await get_tree().create_timer(_potion_time).timeout
	$Area/CollisionShape.disabled = false
	play(_animation)
	visible = true
	
func _apply_potion(_animation):
	match _animation:
		"jump_potion":
			_move._max_jumps = 3
			await get_tree().create_timer(_potion_time).timeout
			_move._max_jumps = 2
		"speed_potion":
			_move.velocity = 200
			await get_tree().create_timer(_potion_time).timeout
			_move.velocity = 100
		"tree_potion":
			var _trees = $"../../FrontPalm".get_children()
			for _tree in _trees:
				_tree._enable_collision()
			await get_tree().create_timer(_potion_time).timeout
			for _tree in _trees:
				_tree._disable_collision()
			
	
