extends Spatial

export(NodePath) var cameraPath
onready var camera: Camera = get_node(cameraPath)

func _ready():
	update_position(get_viewport().get_mouse_position())

func _input(event):
	if event is InputEventMouseMotion:
		update_position(event.position)

func update_position(position):
	var z_depth = (camera.global_transform.origin - self.global_transform.origin).z
	self.global_transform.origin = camera.project_position(position, z_depth)
