extends Node

@export var gem_packed: PackedScene

@onready var timer: Timer = $"../Timer"

func _ready() -> void:
	if not gem_packed or not timer:
		print("gem node packed or timer are not found!")
		get_tree().quit()
	
	timer.timeout.connect(_on_timer_timeout)

func _spawn_gem() -> void:
	var gem: Gem = gem_packed.instantiate()
	var random_x_location = randf_range(50, get_viewport().get_visible_rect().size.x - 50)
	gem.set_position(Vector2(random_x_location, -50))
	get_parent().add_child(gem)


func _on_timer_timeout() -> void:
	_spawn_gem()
