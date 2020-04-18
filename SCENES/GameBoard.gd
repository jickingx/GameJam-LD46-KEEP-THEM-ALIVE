extends Node2D
const MARGIN = 12
const PADDING = 4
const GRID_SIZE = 128


func _ready():
	spawn_cards_to_board()

func spawn_cards_to_board():
	var max_cards_h = 6
	var max_cards_v = 4
	
	for i in max_cards_v:
		var y = calculate_position(i)
		for i in max_cards_h:
			var x = calculate_position(i)
			spawn_card(true, x, y)

func calculate_position(i) :
	return MARGIN + (GRID_SIZE / 2)  + (i * GRID_SIZE) + (i * PADDING) 

func spawn_card(is_good, x, y):
	var path = "res://Items/Card.tscn"
	var scene = load(path)
	var card = scene.instance()
	var pos =  Vector2(x, y)
	
	add_child(card)
	card.set_global_position(pos)
	
