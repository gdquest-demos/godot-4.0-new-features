extends Node3D

@onready var camera_3d: Camera3D = %Camera3D
@onready var body: StaticBody3D = %SphereBody
@onready var softbody: SoftBody3D = %SoftBody3D
@onready var softbody2: SoftBody3D = %SoftBody3D2


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var ray_query := PhysicsRayQueryParameters3D.new()
		ray_query.exclude = [softbody.get_physics_rid(), softbody2.get_physics_rid(), body.get_rid()]
		ray_query.from = camera_3d.project_position(get_viewport().get_mouse_position(), 0.0)
		ray_query.to = ray_query.from + camera_3d.project_ray_normal(get_viewport().get_mouse_position()) * 100
		print(ray_query.from)
		print(ray_query.to)
		var dict := get_world_3d().direct_space_state.intersect_ray(ray_query)
#		print(dict)
		if not dict.is_empty():
#		ray_cast_3d.target_position = camera_3d.project_ray_normal(get_viewport().get_mouse_position())
#		if ray_cast_3d.is_colliding():
			body.target_position = dict["position"]
#			body.global_position = dict["position"]
