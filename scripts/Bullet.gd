extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var speed = 150
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	move_local_x(speed * delta)
	pass
