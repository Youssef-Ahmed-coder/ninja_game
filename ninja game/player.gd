extends CharacterBody2D
#---------------------------------------------------------------------------
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animation_player_2: AnimationPlayer = $AnimationPlayer2
@onready var animation_player_3: AnimationPlayer = $AnimationPlayer3
@onready var animation_player_4: AnimationPlayer = $AnimationPlayer4
@onready var animation_player_5: AnimationPlayer = $AnimationPlayer5
@onready var timer: Timer = $Timer
@onready var label: Label = $CanvasLayer/Label
@onready var timer_2: Timer = $Timer2
@onready var label_2: Label = $CanvasLayer/Label2
#---------------------------------------------------------------------------
var SPEED = 300.0
var JUMP_VELOCITY = -500.0
var jump_2 = false
var jump_num = 0
var get_sward = false
var last_move = null
var dash_power = 500
var stars = 0
var hit = false
#----------------------------------------------------------------------------
func _ready() -> void:
	timer_2.wait_time = 7.1
	timer.wait_time = 3.1
	label.text= ""
func _physics_process(delta: float) -> void:
	label_2.text = str("wait ," , int(timer_2.time_left) , " for dash")
	if timer_2.time_left <= 0.5:
		timer_2.stop()
		pass
	
	if Input.is_action_just_pressed("q") and last_move == "right" and timer_2.time_left <= 0.6:
		translate(Vector2( dash_power , 0))
		animation_player_5.play("dash 2")
		timer_2.wait_time = 7.1
		timer_2.start()
	if Input.is_action_just_pressed("q") and last_move == "left"and timer_2.time_left <= 0.6:
		translate(Vector2(-dash_power , 0))
		animation_player_5.play("dash")
		timer_2.wait_time = 7.1
		timer_2.start()
	if timer.time_left <= 0.5:
		timer.stop()
	if get_sward:
		label.text = str ("wait " , int(timer.time_left) , " for use")
	if get_sward and Input.is_action_just_pressed("press") and last_move == "right" and timer.time_left <= 0.6:
		hit = true
		velocity.x =  500000
		animation_player_4.play("hit right")
		timer.wait_time = 3.1
		timer.start()
		await animation_player_4.animation_finished
		hit = false
		pass
	if get_sward and Input.is_action_just_pressed("press") and last_move == "left" and timer.time_left <= 0.6:
		hit = true
		velocity.x =  -50000
		animation_player_4.play("hit left")
		timer.wait_time = 3.1
		timer.start()
		await animation_player_4.animation_finished
		hit = false
		pass
	if not is_on_floor():
		velocity += get_gravity() * delta
	if is_on_floor() and jump_2 or jump_num == 3 and not is_on_floor():
		jump_2 = false
		jump_num = 0

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_2 = true
		jump_num +=1
	elif Input.is_action_just_pressed("ui_accept") and jump_2 and not is_on_floor():
		animation_player_2.play("jump")
		velocity.y = JUMP_VELOCITY
		jump_num+=1
		
	if Input.is_action_pressed("a") and not Input.is_action_just_pressed("press"):
		animation_player.play("move left")
		last_move = "left"
		velocity.x =  -SPEED
	elif Input.is_action_pressed("d") and not Input.is_action_just_pressed("press") :
		last_move = "right"
		animation_player.play("move")
		velocity.x =  SPEED
	else:
		if not Input.is_action_just_pressed("press"):
			animation_player.play("idel")
			velocity.x = 0

	move_and_slide()
