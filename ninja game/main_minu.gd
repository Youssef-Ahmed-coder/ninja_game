extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animation_player_2: AnimationPlayer = $AnimationPlayer2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("new_animation")
	animation_player_2.play("label move")
	await animation_player.animation_finished
	animation_player.play("open close")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://levels.tscn")
	pass # Replace with function body.


func _on_bye_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
