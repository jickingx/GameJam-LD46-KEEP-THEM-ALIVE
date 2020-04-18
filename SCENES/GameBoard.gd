extends Node2D

const MARGIN = 14
const PADDING = 4
const GRID_SIZE = 128
const max_cards_h = 6
const max_cards_v = 4
const Card = preload("res://Items/Card.tscn")
const EndScene = preload("res://Items/Card.tscn")


var rng = RandomNumberGenerator.new()
var max_evil_card = Global.evil_card_count

func _ready():
	spawn_cards_to_board()
	$CanvasLayer/LabelInfectedCount.text = str(max_evil_card)


func _on_Button_button_up():
	process_results()


func _on_Button_quarantine_timeout():
	process_results()


func _on_Popup_Button_button_up():
	get_tree().reload_current_scene()


func spawn_cards_to_board():
	var card_counter = 0
	var evil_card_indices = get_random_set(
			max_evil_card,
			(max_cards_h * max_cards_v))
	
	for i in max_cards_v:
		var y = calculate_position(i)
		for i in max_cards_h:
			var x = calculate_position(i)
			#todo set random set
			var is_evil = false 
			if card_counter in evil_card_indices:
				is_evil = true 
			spawn_card(is_evil, x, y)
			card_counter = card_counter + 1


func calculate_position(i) :
	return MARGIN + (GRID_SIZE / 2)  + (i * GRID_SIZE) + (i * PADDING) 

func get_random_set(max_evil_card, max_cards):
	var evil_card_indices = Array()
	rng.randomize()
	
	for i in max_evil_card :
		var temp = rng.randi_range(0, max_cards - 1)
		if temp in evil_card_indices:
			temp = rng.randi_range(0, max_cards - 1)
		evil_card_indices.append(temp) 
	
	return evil_card_indices

func spawn_card(is_evil, x, y):
	
	var card = Card.instance()
	var pos =  Vector2(x, y)
	
	add_child(card)
	card.set_global_position(pos)
	
	if is_evil :
		card.set_evil()


func validate_selected_cards():
	var invalid_counter = 0
	var cards = get_tree().\
		get_current_scene().\
		get_tree().\
		get_nodes_in_group("cards")
	#validate each
	for i in cards.size() :
		if not cards[i].validate():
			invalid_counter += 1
	if invalid_counter > 0:
		return false
	return true


func process_results():
	if validate_selected_cards() :
		Global.evil_card_count -= 1
	else:
		Global.evil_card_count += Global.evil_card_count / 2
	
	if Global.evil_card_count <= 0 || Global.evil_card_count >= (max_cards_h * max_cards_v):
		get_tree().change_scene("res://SCENES/End.tscn")
	
	#show pop up if success
	$CanvasLayer/Button.disabled = true
	$CanvasLayer/PopupDialog.popup()


