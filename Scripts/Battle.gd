extends Node2D

onready var left = $Left
onready var right = $Right
onready var left_start: float = $Left.position.x
onready var right_start: float = $Right.position.x

var battle := false
var counter := 0

export var speed := 20

var winner = 0

signal show_battle
signal show_winner(winner)

func _ready():
	$Control/VSLabel.visible = false
	$Control/PlayerChoice.visible = false
	$Control/CpuChoice.visible = false
	self.visible = false


func _process(delta):
	if battle and counter != 1100:
		left.position.x += speed
		right.position.x -= speed
	
		counter += speed
		
	if counter == 1100 && !$"Control/VSLabel".visible:
		$Control/VSLabel.visible = true
		$Control/PlayerChoice.visible = true
		$Control/CpuChoice.visible = true
		emit_signal("show_battle")
		emit_signal("show_winner", winner)


func begin_battle():
	battle = true
	self.visible = true
	

func reset():
	self.visible = false
	
	$Control/VSLabel.visible = false
	$Control/PlayerChoice.visible = false
	$Control/CpuChoice.visible = false
	
	battle = false
	$Left.position.x = left_start
	$Right.position.x = right_start


func _on_Game_CPU_begin_battle(player_choice, cpu_choice, winner):
	self.winner = winner
	$Control/PlayerChoice.text = player_choice
	$Control/CpuChoice.text = cpu_choice
	begin_battle()
