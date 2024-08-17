extends Node

@onready var paddle: Paddle = $"../Paddle"
@onready var score_label: Label = $"../ScoreLabel/Label"

var _score = 0

func _ready() -> void:
	if not paddle or not score_label:
		get_tree().quit()
	paddle.gem_captured.connect(_on_gem_captured)

func get_score() -> String:
	return str(_score)

func _on_gem_captured() -> void:
	_score += 1
	score_label.set_text(get_score())
