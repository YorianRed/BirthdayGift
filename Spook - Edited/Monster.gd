extends KinematicBody2D

var speed = 70
var state = "patrol"
var yell = true
var alive = true
onready var pathfollow = get_parent()
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	var rand = rng.randf_range(0, 6300)
	get_parent().offset = rand

func patrol(delta):
	pathfollow.offset += speed * delta

func _integrate_forces(_delta):
	global_rotation = 0

func _physics_process(delta):
	if alive:
		var player = get_parent().get_parent().get_parent().get_node("Player")
	
		if $Step.playing == false and $StepFast.playing == false:
			$Step.play()
	
		if $Timer.time_left < 0.2:
			$StepFast.stop()
			$Timer.stop()
			speed = 70
			yell = true
	
		if 400 <= global_position.x and global_position.x <= 496:
			if 400 <= player.global_position.x and player.global_position.x <= 496:
					speed = 300
					$Timer.start(5)
					if yell:
						$THEFUNNY.play()
						yell = false
					if $Step.playing == true:
						$Step.stop()
						$StepFast.play()
		if 352 <= global_position.y and global_position.y <= 432:
			if 352 <= player.global_position.y and player.global_position.y <= 432:
					speed = 300
					$Timer.start(5)
					if yell:
						$THEFUNNY.play()
						yell = false
					if $Step.playing == true:
						$Step.stop()
						$StepFast.play()
		if 832 <= global_position.x and global_position.x <= 912:
			if 832 <= player.global_position.x and player.global_position.x <= 912:
					speed = 300
					$Timer.start(5)
					if yell:
						$THEFUNNY.play()
						yell = false
					if $Step.playing == true:
						$Step.stop()
						$StepFast.play()
		if 704 <= global_position.y and global_position.y <= 784:
			if 704 <= player.global_position.y and player.global_position.y <= 784:
					speed = 300
					$Timer.start(5)
					if yell:
						$THEFUNNY.play()
						yell = false
					if $Step.playing == true:
						$Step.stop()
						$StepFast.play()
		patrol(delta)
		print(704 <= player.global_position.y and player.global_position.y <= 784)
	
		_integrate_forces(delta)

func end():
	get_tree().change_scene("res://End.tscn")

func _on_Area2D_body_entered(body):
	if "Bullet" in body.name:
		$Timer.start(3)
		$Melt.play()
		$Step.stop()
		$StepFast.stop()
		$THEFUNNY.stop()
		$Area2D.queue_free()
		$CollisionShape2D.queue_free()
		alive = false
		visible = false
		$Timer.connect("timeout", self, "end")
