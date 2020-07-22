extends Position3D

export(NodePath) var cameraPath
onready var camera: Camera = get_node(cameraPath)

func _input(event):
	if event is InputEventMouseMotion:
		var z_depth = (camera.global_transform.origin - self.global_transform.origin).z
		self.global_transform.origin = camera.project_position(event.position, z_depth)
