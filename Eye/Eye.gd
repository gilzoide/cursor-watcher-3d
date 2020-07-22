extends Spatial

export(NodePath) var pointerPath
onready var pointer: Spatial = get_node(pointerPath)

func _process(_delta):
	if pointer:
		look_at(pointer.global_transform.origin, Vector3.DOWN)
