extends Spatial

export(NodePath) var pointerPath
onready var pointer: Spatial = get_node(pointerPath)

export(float) var look_speed = 4
var looking_at: Vector3

func _init():
	if pointer:
		looking_at = pointer.global_transform.origin

func _process(delta):
	if pointer:
		var pointer_pos = pointer.global_transform.origin
		looking_at = looking_at.linear_interpolate(pointer_pos, delta * look_speed)
		look_at(looking_at, Vector3.DOWN)
