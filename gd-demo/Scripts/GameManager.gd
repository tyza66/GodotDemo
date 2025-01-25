extends Node2D

@export var slime_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _spawn_climer() -> void:
	var slime_node = slime_scene.instantiate()
	slime_node.position = Vector2(260,randf_range(50,115))
	get_tree().current_scene.add_child(slime_node)
	
