extends Node2D

var pre_bomba = preload("res://Scenes/bomba.tscn")
var tempo = 0
export var ini = .5
export var fim = 1
#sistema de pontos do jogo:
export var pontos = 0
onready var txt_label = $label
#export é para acessar a variavel foraa do script
func _ready():
	pass

func _process (delta):
	txt_label.text = "Pontos" + str(pontos)
	tempo+=delta
	#print(tempo)
	if tempo > rand_range(ini,fim): #fica sorteando valores entre meio e um
		CriarBomba()
		#print("criar uma bomba") + str(tempo)
		tempo = 0
		
func CriarBomba():
	var bomba = pre_bomba.instance()#vamos criar uma copia da cena que tem a bomba e colocar aqui
	bomba.position = Vector2(rand_range(35,530),bomba.position.y)#posição para as bombas cairem
		#range escolhe um favor aleatório 
	self.add_child(bomba) # vamos add um elemento como filho para ela

