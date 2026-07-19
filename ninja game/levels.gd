extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("label move")


func _on_bata_pressed() -> void:
	get_tree().change_scene_to_file("res://bata_game.tscn")
	pass # Replace with function body.





func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://level 1.tscn")



func _on_bye_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://level 2.tscn")
	pass # Replace with function body.


func _on_level_3_pressed() -> void:
	get_tree().change_scene_to_file("res://level 3.tscn")
	pass # Replace with function body.
