extends Area2D

export var inner_sprite = "res://Assets/hexagon_woodPaper.png"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#$InnerSprite.texture = inner_sprite
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Card_mouse_entered():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)



func _on_Card_mouse_exited():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
