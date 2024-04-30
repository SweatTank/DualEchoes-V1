extends State

class_name WalkState


var player_chase = false
var player = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_detection_area_body_entered(body):
	player = body
	player_chase = true



func _on_detection_area_body_exited(body):
	player = null
	player_chase = false
