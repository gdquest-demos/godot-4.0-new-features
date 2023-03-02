extends StaticBody3D

@onready var target_position = Vector3.DOWN


func _physics_process(delta):
	global_position = target_position
