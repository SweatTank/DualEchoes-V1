extends Sprite2D

@export var layer = 1
var speedoffset = 0.5
@onready var skele = $"../../../enemy"

var posoffset : Vector2

func _ready():
	posoffset = position
	
func _process(_delta):
	position = -skele.position * layer * speedoffset * posoffset
	if position.x - skele.position.x > 320:
		posoffset.x -= 640 
	if position.x - skele.position.x < -320:
		posoffset.x += 320


