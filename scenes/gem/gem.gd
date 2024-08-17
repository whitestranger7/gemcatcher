extends Node2D

class_name Gem

@onready var sprite: Sprite2D = $Area2D/Sprite2D
@onready var _sprite_size: Vector2 = sprite.texture.get_size() * sprite.scale

var _speed = 100

func _process(delta: float) -> void:
	_check_if_alive()
	self.set_position(Vector2(self.position.x, self.position.y + _speed * delta))

func _check_if_alive() -> void:
	if self.position.y > get_viewport().get_visible_rect().size.y + (_sprite_size.y / 2):
		self.queue_free()

func destroy() -> void:
	self.queue_free()
