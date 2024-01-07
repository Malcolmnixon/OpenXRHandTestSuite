@tool
extends Node3D


@export var height : float = 1.6

@export var start_ik : Array[SkeletonIK3D] = []

@export var camera : XRCamera3D

@export var origin : XROrigin3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Start all IKs
	for ik in start_ik:
		ik.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta : float) -> void:
	var ny := origin.global_basis.y
	var nx := camera.global_basis.x.slide(ny).normalized()
	var nz := nx.cross(ny)
	global_basis = Basis(nx, ny, nz)
	global_position = camera.global_position + Vector3.DOWN * height
