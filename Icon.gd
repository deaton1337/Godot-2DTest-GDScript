extends CharacterBody2D

var speed: int = 35000
var direction: Vector2 = Vector2(0, 0)
var my_rotation: float = 0.0
var lower_bound: Vector2 = Vector2(0,0)
var upper_bound: Vector2 = Vector2(1920, 1080)

func _ready():
	direction = Vector2(randf_range(-0.9, 1.0), randf_range(-0.9, 1.0))


func _physics_process(delta):
	velocity = direction * speed * delta
	move_and_slide()

	if IsOutOfBounds(self.position):
		direction = -direction;

	my_rotation += 50 * delta
	rotation_degrees = my_rotation


func IsOutOfBounds(this_position: Vector2):
	return position.x <= lower_bound.x || position.y <= lower_bound.y || \
			position.x >= upper_bound.x|| position.y >= upper_bound.y;
