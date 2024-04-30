extends CharacterBody2D

@onready var sprite : Sprite2D = $Sprite2D
@onready var animation_tree : AnimationTree = $AnimationTree
#var start_moving_direction = Vector2.LEFT
@export var movement_speed : float =  30.0
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine

@onready var healthbar = $HealthBar



# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : Vector2
var player_chase = false
var player = null



func _ready():
	animation_tree.active = true
	
func _physics_process(delta):
	

	
	if player_chase:
		position.x += (player.position.x - position.x) / movement_speed
		if position.x >= player.position.x:
			sprite.flip_h = true
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	

	if direction && state_machine.check_if_can_move():
		velocity.x = direction.x * movement_speed
	
	else:
		velocity.x = move_toward(velocity.x, 0, movement_speed)
	
	
	#update_facing_direction()
	move_and_slide()
	



func _on_detection_area_body_entered(body):
	player = body
	player_chase = true

func _on_detection_area_body_exited(body):
	player = null
	player_chase = false



