extends Area2D

@export var slimer_speed : float = -100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position += Vector2(slimer_speed,0) *delta # delta是每一帧有多少秒
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		print("敌人触碰到玩家")
		body.game_over()
