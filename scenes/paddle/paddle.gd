extends Node2D

class_name Paddle

@onready var area: Area2D = $Area2D

signal gem_captured
var _speed = 300

func _ready() -> void:
	area.area_entered.connect(_on_area_entered)

func _movement(delta: float):
	var axis = Input.get_axis("left", "right")
	if axis != 0:
		area.set_position(Vector2(area.position.x + _speed * axis * delta, area.position.y))

func _process(delta: float) -> void:
	_movement(delta)

func _on_area_entered(area: Area2D) -> void:
	var gem: Gem = area.get_parent()
	gem.destroy()
	gem_captured.emit()
