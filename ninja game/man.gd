extends CharacterBody2D
var speed = 100
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var turn_left: RayCast2D = $"turn left"
@onready var turn_right: RayCast2D = $"turn right"
@onready var target: RayCast2D = $target
@onready var target_2: RayCast2D = $target2
@onready var target_3: RayCast2D = $target3
@onready var animation_player_2: AnimationPlayer = $AnimationPlayer2

var frist_move = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("move right")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if target_3.is_colliding():
		if target_3.get_collider().is_in_group("player"):
			if target_3.get_collider().hit == false :
				get_tree().change_scene_to_file("res://losse.tscn")
			elif target_3.get_collider().hit == true:
				animation_player_2.play("HIDE")
				

	if target_2.is_colliding():
		if target_2.get_collider().is_in_group("player"):
			if target_2.get_collider().hit == false :
				get_tree().change_scene_to_file("res://losse.tscn")
			elif target_2.get_collider().hit == true:
				animation_player_2.play("HIDE")
	if target.is_colliding():
		if target.get_collider().is_in_group("player"):
			if target.get_collider().hit == false :
				get_tree().change_scene_to_file("res://losse.tscn")
			elif target.get_collider().hit == true:
				animation_player_2.play("HIDE")
	if frist_move and not turn_left.is_colliding():
		animation_player.play("move right")
		velocity.x = speed
	if turn_left.is_colliding() and not turn_left.get_collider().is_in_group("player")  :
		animation_player.play("move left")
		frist_move = false
		velocity.x = -speed
	if turn_right.is_colliding() and not turn_right.get_collider().is_in_group("player"):
		animation_player.play("move right")
		frist_move = false
		velocity.x = speed
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		speed = 200
	


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		speed = 100
