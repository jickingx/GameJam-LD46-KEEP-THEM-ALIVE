extends Node2D

var counter:int = 0
#MAX 3 LINES , uses first char on key for anim
var messages = {
		"0": "[center]GREETINGS NEWBIE !!! [/center][center]HOW WAS THE DEATH ANGENT[/center][center]TRANSITION PROCESS?[/center]",
		"2": "[center]YEAH, THAT SUCKS[/center][center]BEEN THERE TOO...[/center][center]EONS AGO[/center]",
		"00": "[center]ANYWAYS, I SUMMONED YOU HERE[/center][center]FOR A CRITICAL MISSION[/center]",
		"1": "[center]I BELIEVE YOU CAN HANDLE[/center][center]THE TASK OF SAVING THE LIVING[/center]",
		"11": "[center]I KNOW ITS TOO MUCH TO ASK[/center][center]SORRY DUDE...[/center][center]I GOT NO OPTION DIALOGUE ITEM FOR YOU[/center]",
		"22": "[center]MAYBE NEXT TIME?[/center][center]IF WE GET THROUGH THIS MESS[/center][center]CREATED BY OUR CLUMSY RND TEAM[/center]",
		"3": "[center]THIS TEST VIRUS HAS GONE[/center][center]WAY OUT OF THIER CONTROL[/center]",
		"4": "[center]TASK REQUIRES YOU TO HAND PICK[/center][center]INFECTED ONES TO BE QUARANTINED[/center]",
		"222": "[center]I ASSUME YOU GOT THE GIST[/center][center]OF WHAT WILL HAPPEN TO THEM RIGHT?[/center]",
		"111": "[center]SO BE CAREFUL NOT TO[/center][center]\"QUARANTINE\"[/center][center]THE HEALTHY ONES[/center]",
		"33": "[center]WE HAD A HUGE DROP IN HEAD COUNT[/center][center]SO EVERYONE IS PRECIOUS NOW[/center]",
		"1111": "[center]KEEP DOING IT UNTIL NO ONE IS INFECTED[/center]",
		"0000": "[center]I TRUST YOU WONT SCREW THIS UP[/center]",
		"2222": "[center]WILL YA?[/center]",
	}

func _ready():
	update_labels(counter)

func _on_Button_button_up():
	$AudioStreamPlayer2DBlip.play()
	counter += 1
	if messages.size() <= counter :
		get_tree().change_scene("res://SCENES/GameBoard.tscn")
	else:
		update_labels(counter)


func update_labels(counter):
	var new_text = messages.get(str(messages.keys()[counter]))
	var anim_key = str(messages.keys()[counter])[0]
	$AnimatedSprite.play(anim_key)
	$CanvasLayer/Label.bbcode_text = new_text
