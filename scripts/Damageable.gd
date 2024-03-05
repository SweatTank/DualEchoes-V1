extends Node

class_name Damageable

@export var health : float = 100

func hit(damage : int):
	health -= damage
	
	if (health <= 0):
		get_parent().queue_free()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
