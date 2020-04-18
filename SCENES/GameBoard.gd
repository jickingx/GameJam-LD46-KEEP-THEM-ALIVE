extends Node2D
const MARGIN = 12
const PADDING = 4
const GRID_SIZE = 128


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_cards_to_board()
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func spawn_cards_to_board():
	#set board margin & padding
	var max_cards_h = 4
	var max_cards_v = 4
	
	
	for i in max_cards_v:
		var counter_y = i + 1;
		var y = MARGIN + (counter_y * GRID_SIZE) + (counter_y * PADDING) 
		print_debug("y: " + str(y))
		#SPAWN IN X
		for i in max_cards_h:
			var counter_x = i + 1;
			var x = MARGIN + (counter_x * GRID_SIZE) + (counter_x * PADDING)
			print_debug("x: " + str(x))
			spawn_card(true, x, y)
	pass

func spawn_card(is_good, x, y):
	var path = "res://Items/Card.tscn"
	var scene = load(path)
	var card = scene.instance()
	var pos =  Vector2(x, y)
	
	add_child(card)
	card.set_global_position(pos)
	
