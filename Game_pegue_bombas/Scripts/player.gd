extends KinematicBody2D

export var speed = 400
onready var spr_player = $sprite

func _ready():
	pass 
	
func _process(delta):
	print(self.position) #self ta se referindo ao player #62 e 450 no meu caso será 190 e 585
	var dir = Vector2()#x e y
	if Input.is_action_pressed("left"): #seta da esquerda
		#get_node("sprite") # é uma das possibilidades para acessar o sprite
		#$sprite.flip_h = true #para acessar a propriedade 
		# quando eu aperto a tecla da esquerda ele vira para a esquerda
		spr_player.scale.x = -1
		dir.x = -1
		$shape.position.x =-154 # valor do shape, para ele virar para a esquerda
	if Input.is_action_pressed("right"):
		$sprite.flip_h = false # qunado aperto a tecla da direita ele recebe false
		spr_player.scale.x = 1
		dir.x = 1
		$shape.position.x=-109

	#para mudar de direção do player tem o flip_h e o transformer utilizando a escala
	#para delimitar até onde o boneco vai preciso fazer: print(self.position)
	if self.position.x < 190: #quando ele alcançar essa posição ele não vai mais andar para a esquerda 
		self.position.x = 190
	if self.position.x >585:
		self.position.x = 585
		
	#colo acertar a posição do colisor quando o personagem muda de lado
	move_and_slide(dir * speed)
	pass
