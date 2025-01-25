extends CharacterBody2D

# 变量声明
@export var move_speed : float = 50
@export var animator : AnimatedSprite2D
var is_game_over : bool = false

@export var bullet_scence : PackedScene

# Called when the node enters the scene tree for the first time.
# _ready函数中的代码会在游戏开始的时候运行
func _ready() -> void:
	print("Hello,World!")
	# velocity = Vector2(50,0) #设定玩家初始速度 这俩东西来自CharacterBody2D类
	# pass # Replace with function body.


func _process(delta: float) -> void:
	if velocity == Vector2.ZERO or is_game_over:
		$RunningSound.stop()
	elif not $RunningSound.playing: #如果没有在播放的的话 如果不这样写,每次速度为0的时候就会停止播放了
		$RunningSound.play()
	# 之后的其他条件就不用再判断了

# Called every frame. 'delta' is the elapsed time since the previous frame.
# _process函数会在游戏的每一帧都执行一次
# _physics_process固定帧率可以确保不同电脑上的运行效果是一样的
func _physics_process(delta: float) -> void:
	if not is_game_over:
		velocity = Input.get_vector("left","right","up","down") * move_speed
		
		if velocity == Vector2.ZERO:
			animator.play("idle")
		else:
			animator.play("run")
		
		move_and_slide()
	
func game_over():
	if not is_game_over:
		is_game_over = true
		animator.play("game_over")
		
		get_tree().current_scene.show_game_over()
		$GameOverSound.play()
		
		# 等待计时器到期的信号 这个语句会暂停代码的执行，直到计时器触发timeout信号
		#await get_tree().create_timer(3).timeout # await是等待  注意这种Time原理是挂在在主场景树的根节点上 重置时会闪一下
		#get_tree().reload_current_scene()
		$RestartTimer.start()
	



func _on_fire() -> void:
	if  (not velocity == Vector2.ZERO) or is_game_over: # 或者直接写!=0也行
		return
	
	$FireSound.play()
	print("fire!")
	var bullet_node = bullet_scence.instantiate()
	bullet_node.position = position + Vector2(6,6) # 将玩家当前位置赋给子弹
	get_tree().current_scene.add_child(bullet_node)



func _reload_scene() -> void:
	get_tree().reload_current_scene()
