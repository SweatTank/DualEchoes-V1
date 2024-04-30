extends State

class_name EnemyAttackState

@export var slow_down_speed : int = 50
@export var animation : AnimationPlayer



func on_process(delta : float):
	pass

func on_physics_process(delta : float):
	character.velocity.x = move_toward(character.velocity.x, 0, slow_down_speed * delta)
	animation.play("idle")
	character.move_and_slide()

func state_process(delta):
	pass

func state_input(event : InputEvent):
	pass
	
	

func on_enter():
	pass


func on_exit():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
