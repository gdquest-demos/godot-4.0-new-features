extends Control

const GAME_WINDOW_SCENE := preload("res://networking/robot_war/robot_war_window.tscn")

@onready var spawn_window_button : Button = %SpawnWindowButton


func _ready() -> void:
	spawn_window_button.pressed.connect(
		func():
			var window := GAME_WINDOW_SCENE.instantiate()
			add_child(window)
			window.popup_centered()
	)
