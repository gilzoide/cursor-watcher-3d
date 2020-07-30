extends Node

func _input(event):
	if event.is_action_pressed("toggle_lights"):
		$World3d.toggle_lights()
