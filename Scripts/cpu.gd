extends Node

var utility = preload("res://Scripts/utility.gd")
var Moves = utility.Moves

# Properties
var rng = RandomNumberGenerator.new()

var hover = Moves.Rock

var choice = Moves.Scissors

var cpu_choice = Moves.Scissors

# Signals
signal begin_battle(player_choice, cpu_choice, winner)


# Functions
func _ready():
	rng.randomize()
	
func _process(delta):
	var time_left = $Timer.time_left
	
	$"Control/CountDown".text = str(int(time_left))
	
	var choice_string = ""
	match choice:
		Moves.Scissors: choice_string = "Scissors"
		Moves.Rock: choice_string = "Rock"
		Moves.Paper: choice_string = "Paper"
	
	$"Control/Choice".text = choice_string


func _input(event):
	if event is InputEventMouseButton:
		choice = hover


func pick_card():
	rng.randomize()
	var rand_choice = rng.randi_range(0, 2)
	
	match rand_choice:
		0: return Moves.Rock
		1: return Moves.Paper
		2: return Moves.Scissors


# Connections
func _on_RockCard_mouse_entered():
	hover = Moves.Rock


func _on_PaperCard_mouse_entered():
	hover = Moves.Paper


func _on_ScissorsCard_mouse_entered():
	hover = Moves.Scissors


func _on_Timer_timeout():
	cpu_choice = pick_card()
	var player_choice_string = utility.move_enum_to_string(choice)
	var cpu_choice_string = utility.move_enum_to_string(cpu_choice)
	var winner = utility.get_winner(choice, cpu_choice)
	
	emit_signal("begin_battle", player_choice_string, cpu_choice_string, winner)
