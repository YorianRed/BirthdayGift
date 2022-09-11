extends Control

func _ready():
	$Node2D/AnimationPlayer.play("happi")

func _on_Next_pressed():
	$Node2D.visible = false
	$RichTextLabel.visible = true
	$Quit.visible = true
	$Next.visible = false


func _on_Quit_pressed():
	get_tree().quit()
