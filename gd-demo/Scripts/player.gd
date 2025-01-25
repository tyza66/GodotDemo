extends CharacterBody2D

# 变量声明
@export var move_speed : float = 50
@export var animator : AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
# _ready函数中的代码会在游戏开始的时候运行
func _ready() -> void:
	print("Hello,World!")
	# velocity = Vector2(50,0) #设定玩家初始速度 这俩东西来自CharacterBody2D类
	# pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# _process函数会在游戏的每一帧都执行一次
# _physics_process固定帧率可以确保不同电脑上的运行效果是一样的
func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("left","right","up","down") * move_speed
	
	if velocity == Vector2.ZERO:
		animator.play("idle")
	else:
		animator.play("run")
	
	move_and_slide()
