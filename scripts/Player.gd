extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var velocity
var screensize
var SPEED = 100
var bullet = preload("res://scenes/Bullet.tscn")
var maxFireDelay = .2
var fireDelay
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	fireDelay = maxFireDelay
	screensize = get_viewport_rect().size
	pass

func _process(delta):
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED


	if fireDelay < 0:
		if Input.is_mouse_button_pressed(BUTTON_LEFT):
			var newBullet = bullet.instance();
			newBullet.position = self.position
			newBullet.rotation = self.rotation
			get_tree().get_root().add_child(newBullet)
			fireDelay = maxFireDelay
	else:
		fireDelay -= 1.0 * delta
	position += velocity * delta
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)

	self.look_at(get_global_mouse_position());
	pass