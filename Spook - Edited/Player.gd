class_name Player
extends KinematicBody2D

var blueKey = false
var redKey = false
var yellowKey = false

var hasGun = false

var movespeed = 200
var bullet_speed = 2000
var bullet = preload("res://Bullet.tscn")

func _physics_process(_delta):
	var motion = Vector2()
	
	if Input.is_action_pressed("up"):
		motion.y -= 1
	if Input.is_action_pressed("down"):
		motion.y += 1
	if Input.is_action_pressed("left"):
		motion.x -= 1
	if Input.is_action_pressed("right"):
		motion.x += 1
	
	if hasGun:
		if Input.is_action_just_pressed("LMB"):
			fire()
			$Bang.play()
	
	motion = motion.normalized()
	motion = move_and_slide(motion * movespeed)
	
	look_at(get_global_mouse_position())

func fire():
	var bullet_instance = bullet.instance()
	bullet_instance.position = get_global_position()
	bullet_instance.rotation_degrees = rotation_degrees
	bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child", bullet_instance)
	
func kill():
	get_tree().reload_current_scene()
	

func _on_Area2D_body_entered(body):
	if "Monster" in body.name:
		$Timer.start(0.5)
		$KillSound.play()
		$Timer.connect("timeout", self, "kill")
	if "blueKey" in body.name:
		blueKey = true
		$"../blueKey".queue_free()
		$KeyJingle.play()
	if "redKey" in body.name:
		redKey = true
		$"../redKey".queue_free()
		$KeyJingle.play()
	if "yellowKey" in body.name:
		yellowKey = true
		$"../yellowKey".queue_free()
		$KeyJingle.play()
