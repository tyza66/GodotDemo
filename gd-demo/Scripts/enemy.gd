extends Area2D

@export var slimer_speed : float = -100
var is_dead : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not is_dead:
		position += Vector2(slimer_speed,0) *delta # delta是每一帧有多少秒


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		print("敌人触碰到玩家")
		body.game_over()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		print("史莱姆中弹了")
		$AnimatedSprite2D.play("death") # 这样直接将属性拖进来的是按照名称寻找的,很脆弱
		is_dead = true 
		
		await get_tree().create_timer(0.6).timeout
		queue_free() # 销毁史莱姆节点
