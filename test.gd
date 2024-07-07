extends Node2D

var max_fps: bool = false;
var instance_count: int= 0;

var icon_scene = preload("res://icon.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	for i in 1500:
		instanceIcon();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	addIcon()


func addIcon():
		var fps = Engine.get_frames_per_second()

		if fps < 30:
			max_fps = true

		if !max_fps:
			instanceIcon()

		$Label.text = "Count = " + str(instance_count)
		$Label.text += "\nFPS = " +  str(fps)


func instanceIcon():
	var icon_instance = icon_scene.instantiate()
	icon_instance.position = Vector2(randi_range(10,1900), randi_range(10,1000))
	add_child(icon_instance)
	instance_count +=1


func _on_timer_timeout():
	max_fps = false;
