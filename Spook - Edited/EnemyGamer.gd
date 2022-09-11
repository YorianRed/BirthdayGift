extends KinematicBody2D
var maxDistance = Vector2(300,300)
var speed = 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	var motion = Vector2()
	var player = get_parent().get_node("Player")
	var EnemyToPlayer = player.position - position
	
	if maxDistance > EnemyToPlayer:
		for ray in get_tree().get_nodes_in_group("rays"):
			if ray._get_see():
				motion += (Vector2(player.position) - position)
				look_at(player.position)
				
				motion = motion.normalized() * speed
				move_and_collide(motion)


func _on_Area2D_body_entered(body):
	if "Bullet" in body.name:
		queue_free()
