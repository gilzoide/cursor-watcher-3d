extends Spatial

export(NodePath) var pointerPath
onready var pointer: Spatial = get_node(pointerPath)

export(float) var look_speed = 4
var looking_at: Vector3

export(float) var pointer_dist_squared = 1
export(float) var distancing_factor = 0.6
export(float) var distancing_speed = 4
export(float) var distancing_back_speed = 2

func _ready():
	if pointer:
		looking_at = pointer.global_transform.origin

func _process(delta):
	if pointer:
		var pointer_pos = pointer.global_transform.origin
		looking_at = looking_at.linear_interpolate(pointer_pos, delta * look_speed)
		look_at(looking_at, Vector3.DOWN)
		
		var pos = global_transform.origin
		pointer_pos.z = pos.z
		if pos.distance_squared_to(pointer_pos) < pointer_dist_squared:
			var going_to = (pos - pointer_pos) * distancing_factor
			$MeshInstance.global_transform.origin = $MeshInstance.global_transform.origin.linear_interpolate(pos + going_to, delta * distancing_speed)
		else:
			$MeshInstance.global_transform.origin = $MeshInstance.global_transform.origin.linear_interpolate(pos, delta * distancing_back_speed)
