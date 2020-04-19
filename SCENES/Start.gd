extends Node2D

func _on_ButtonStart_button_up():
	$AudioStreamPlayer2DBlip.play()
	yield(get_tree().create_timer(.5), "timeout")
	get_tree().change_scene("res://SCENES/Instructions.tscn")
