extends StaticBody2D

var whipped = false
var cocked = false
var popped = false

func _physics_process(delta):
	var player = get_parent().get_node("Player")
	if !$Timer.is_stopped():
		if $Timer.time_left < 10 and !whipped:
			$Sprite2.visible = true
			$Sprite3.visible = true
			$Whip.play()
			whipped = true
		if $Timer.time_left < 5 and !cocked:
			$Sprite2.visible = false
			$Sprite3.visible = false
			$GunGet.play()
			cocked = true
			player.hasGun = true
		if $Timer.time_left < 2 and !popped:
			$Sprite.visible = false
			$Poof.play()
			popped = true

func give_gun():
	$Timer.start(8)

func _on_Area2D_body_entered(body):
	if "Player" in body.name:
		give_gun()
