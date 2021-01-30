extends Control

var utility = preload("res://Scripts/utility.gd")

var WinState = utility.WinState

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false


func set_winner(winner):
	var winner_string = " wins!"
	match winner:
		WinState.Win: winner_string = "Player" + winner_string
		WinState.Loss: winner_string = "CPU" + winner_string
		WinState.Tie: winner_string = "Tie!"
	
	$Winner.text = winner_string


func _on_Battle_show_winner(winner):
	set_winner(winner)
	self.visible = true


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/CPU_Game.tscn")
