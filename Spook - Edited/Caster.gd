class_name EnemyGamer
extends RayCast2D

var MaxDistance = Vector2(300, 300)
var target
var does_see_player setget , _get_see

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _draw():
	draw_line(Vector2(), cast_to, Color.aqua, 1.0, false)

func _physics_process(delta):
	var player = get_parent().get_parent().get_node("Player")
	var EnemyToPlayer = player.position - position
	if is_colliding() and get_collider() is Player:
		target = get_collider()
	if MaxDistance > EnemyToPlayer:
		target = null
	does_see_player = target != null
	

func _get_see() -> bool:
	return does_see_player
