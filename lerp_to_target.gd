extends Node3D


@export var target : Node3D

@export var rate : float = 1.0


func _process(delta : float) -> void:
	global_transform = global_transform.interpolate_with(
		target.global_transform,
		rate * delta)
