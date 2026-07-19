extends Area2D

var  stars = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Win2.is_win = true
		Win2.stars =  body.stars
		get_tree().change_scene_to_file("res://win2.tscn")
		pass
	pass # Replace with function body.
