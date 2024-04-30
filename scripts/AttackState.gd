extends State

class_name EnemyAttackSate

@export var damageable : Damageable
@export var attack_state : State
@export var character_state_machine : CharacterStateMachine
@export var attack_animation : String = "attack"
@export var idle_state : State


# Called when the node enters the scene tree for the first time.
func _ready():
	#damageable.connect("on_hit", on_damageable_hit)
	pass
	

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_detection_area_body_entered(body):
	playback.travel("attack")


func _on_detection_area_body_exited(body):
	if next_state == idle_state:
		playback.travel("walk")


func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == attack_animation):
		
		attack_state.can_move = false
		next_state = idle_state # Replace with function body.
