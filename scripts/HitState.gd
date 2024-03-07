extends State

class_name HitSate

@export var damageable : Damageable
@export var dead_state : State
@export var character_state_machine : CharacterStateMachine
@export var death_animation : String = "dead"

# Called when the node enters the scene tree for the first time.
func _ready():
	damageable.connect("on_hit", on_damageable_hit)
	

func on_damageable_hit(node : Node, damage_amount : int):
	if(damageable.health > 0):
		emit_signal("interrupt_state", self)
	else:
		emit_signal("interrupt_state", dead_state)
		playback.travel(death_animation)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
