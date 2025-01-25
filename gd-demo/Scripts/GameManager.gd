extends Node2D

@export var slime_scene : PackedScene
@export var spawn_timer : Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void: # 我们要执行的代码不涉及物理计算就直接写在process里面就行
	spawn_timer.wait_time -= 0.2 * delta # 每秒减少0.2
	spawn_timer.wait_time = clamp(spawn_timer.wait_time,1,3) # 将等待时间限制在1和3之间


func _spawn_climer() -> void:
	var slime_node = slime_scene.instantiate()
	slime_node.position = Vector2(260,randf_range(50,115))
	get_tree().current_scene.add_child(slime_node)
	
