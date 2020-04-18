extends Area2D

var is_evil : bool
var is_selected : bool

func set_evil():
	is_evil = true
	$AnimatedSprite.animation = "default_evil"

func _on_Card_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		self.on_click()

func on_click():
	is_selected = !is_selected
	if is_selected :
		$AnimatedSprite.animation = "selected"
	else:
		if is_evil:
			$AnimatedSprite.animation = "default_evil"
		else :
			$AnimatedSprite.animation = "default"
