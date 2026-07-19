extends Control


@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var animation2: AnimationPlayer = $AnimationPlayer2
@onready var animation3: AnimationPlayer = $AnimationPlayer3
var stars = 0
var is_win = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation.play("new_animation")
	animation2.play("label move")
	await animation.animation_finished
	animation.play("open close")
	
	pass # Replace with function body.


func _process(delta: float) -> void:
	stars = Win2.stars
	is_win = Win2.is_win
	if stars == 1 and is_win:
		animation3.play("1 stare")
	if stars == 2 and is_win:
		animation3.play("22 stare")
	if stars == 3 and is_win:
		animation3.play("2 stare")


func _on_bye_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_bye_2_pressed() -> void:
	get_tree().change_scene_to_file("res://levels.tscn")
	pass # Replace with function body.
