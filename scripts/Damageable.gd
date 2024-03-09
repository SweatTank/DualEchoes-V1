extends Node

class_name Damageable

signal on_hit(node : Node, damage_taken : int)


@export var health : float = 100 :
	get:
		return health
	set(value):
		SignalBus.emit_signal("on_health_changed", get_parent(), value - health)
		health = value

@export var death_animation : String = "dead" 

func hit(damage : int):
	health -= damage
	
	emit_signal("on_hit", get_parent(), damage)
	
	#if (health <= 0):
		#get_parent().queue_free()


# Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.
#
#
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass


func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == death_animation):
		get_parent().queue_free() # Replace with function body.
