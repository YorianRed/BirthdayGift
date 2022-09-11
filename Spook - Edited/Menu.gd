extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Start_pressed():
	get_tree().change_scene("res://World.tscn")

func _process(_delta):
	if $BussItDown.playing == false:
		$BussItDown.play()
func _on_Quit_pressed():
	get_tree().quit()
