@tool
extends Area3D


## Enabled flag
@export var enabled : bool = true

## Button text
@export var text : String = "Text" : set = _set_text

## Button color
@export var color : Color = Color.WHITE : set = _set_color

## Button size
@export var size : Vector3 = Vector3(0.5, 0.1, 0.1) : set = _set_size

## Target scene
@export_file("*.tscn") var scene : String


func _ready():
	area_entered.connect(_on_area_entered)
	_update_text()
	_update_color()
	_update_size()


func _set_text(p_text : String) -> void:
	text = p_text
	if is_inside_tree():
		_update_text()


func _set_color(p_color : Color) -> void:
	color = p_color
	if is_inside_tree():
		_update_color()


func _set_size(p_size : Vector3) -> void:
	size = p_size
	if is_inside_tree():
		_update_size()


func _update_text() -> void:
	$Label3D.text = text


func _update_color() -> void:
	$Label3D.modulate = color


func _update_size() -> void:
	$CollisionShape3D.shape.size = size


func _on_area_entered(_area : Area3D) -> void:
	if enabled and scene:
		get_tree().change_scene_to_file(scene)
