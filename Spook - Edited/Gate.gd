extends StaticBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var player = get_parent().get_node("Player")
	if player.blueKey and player.redKey and player.yellowKey:
		queue_free()
