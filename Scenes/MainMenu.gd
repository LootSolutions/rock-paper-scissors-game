extends Node

var identity = null

func _ready():
	$HTTPRequest.connect("request_completed", self, "_on_request_completed")
	$HTTPRequest.request("http://localhost:3000/user/identity")

func _on_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	
	var display_name = json.result.display
	
	if display_name != null:
		$Control/Label2.text = "Welcome, " + display_name
	else:
		$Control/Label2.text = "Welcome"
	
func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/CPU_Game.tscn")




#func _on_HTTPRequest_request_completed(result, response_code, headers, body):
#	print("test")
