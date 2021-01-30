extends Area2D

var crystal = preload("res://Assets/crystal.png")

func _ready():
	$HTTPRequest.connect("request_completed", self, "_on_request_completed")
	$HTTPRequest.request("http://localhost:3000/user/assets")

func _on_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	
	var assets = json.result.assets
	
	if assets != null:
		$ChoiceSprite.texture = crystal
		$ChoiceSprite.scale = Vector2(0.1, 0.1)


func _on_Card_mouse_entered():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)



func _on_Card_mouse_exited():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
