extends Button

signal quarantine_timeout

const TXT = "QUARANTINE "

var counter = 6

func _ready():
	text = TXT + str(counter)
	$Timer.start()


func _on_Timer_timeout():
	counter -= 1
	if counter < 0 :
		text = TXT
		disabled = true
		$Timer.stop()
		emit_signal("quarantine_timeout")
	else:
		text = TXT + str(counter)


func _on_Button_button_up():
	$Timer.stop()
	text = TXT
