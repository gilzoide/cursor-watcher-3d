extends Spatial

onready var directionalLight: Spatial = $DirectionalLight
onready var spotLight: Spatial = $SpotLight

func toggle_lights():
	directionalLight.visible = not directionalLight.visible
	spotLight.visible = not spotLight.visible
