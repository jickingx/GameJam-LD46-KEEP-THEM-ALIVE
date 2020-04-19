extends Area2D

var is_disabled : bool
var is_evil : bool
var is_selected : bool

func _ready():
	$AnimatedSprite.play("default")

func set_evil():
	is_evil = true
	$AnimatedSprite.play("default_evil")

func _on_Card_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		self.on_click()

func on_click():
	if is_disabled :
		return
	$AudioStreamPlayer2D.play()
	
	is_selected = !is_selected
	if is_selected :
		$AnimatedSprite.play("selected")
	else:
		if is_evil:
			$AnimatedSprite.play("default_evil")
		else :
			$AnimatedSprite.play("default")

func validate() -> bool :
	is_disabled = true
	if (!is_evil && !is_selected) || (is_evil && is_selected):
		return true
	
	$AnimatedSprite.play("dead")
	return false
	
