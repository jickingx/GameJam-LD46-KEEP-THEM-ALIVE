extends Node2D

func _ready():
	if Global.evil_card_count <= 0:
		$CanvasLayer/Label.text = "WHOA DIDN'T EXPECTED THAT, YOU'LL BE PROMOTED !!!"
		$AnimatedSprite.play("1")
	else:
		$CanvasLayer/Label.text = "YOU SCREWD AGAIN, YOU'RE FIRED !!!'"
		$AnimatedSprite.play("0")


func _on_Timer_timeout():
	Global.evil_card_count = Global.MIN_EVIL_CARD_COUNT
	get_tree().change_scene("res://SCENES/Start.tscn")
