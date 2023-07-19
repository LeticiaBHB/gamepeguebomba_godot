extends Area2D

#carregamento da fumaça
var pre_smoke = preload("res://Scenes/smoke.tscn")
var t_smoke = 0

#carregamento da explosão da fumaça
var pre_fumaca = preload("res://Scenes/fumaca.tscn")

#carregamento da explosão com o chão
var pre_explosao = preload("res://Scenes/explosao.tscn")
export var vel =100

func _ready():
	pass # Replace with function body.
	
func _process(delta):
	t_smoke += delta #tempo para instanciar uma fumaça
	#print(t_smoke)
	if t_smoke > rand_range(0.1,0.2):
		#print("criar fumaça")
		Smoke()
		t_smoke = 0 
	vel += 3 # vai incrementando e a bomba vai se tornando mais rapida
	
	#print(self.position.y)
	#self.position.y = self.position.y + 10 #para ela descer
	print(position.y)
	self.position.y += vel * delta # para a movimentação ficar suave
	if self.position.y > 700:
		self.queue_free() #para destruir/eliminar ela e economiza a memoria - verificando o objeto
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


#jaro
func _on_bomba_body_entered(body): # o body representa o objeto com o qual estou colidindo 
	#print(body.nome)
	if body.name == "player":
		get_parent().pontos +=10
		 #get_parent pq a bomba é um elemento filho da fase
		Emitir_fumaca()
		self.queue_free() # eu destruo a bomba e se colidir com o player


#chão
func _on_bomba_area_entered(area):
	if area.name == "chao":
		get_parent().pontos -=10 #perde 10 pontos
		Emitir_explosao()
		self.queue_free()
	print(area.name)
func Smoke():
	#print("função smoke")
	var s = pre_smoke.instance() #bvai guardar uma copia da fumaça
	s.position = position  + Vector2(rand_range(-30,-15),-20) # vai variaar entre os valores x 
	get_parent().add_child(s) #pega a fase a adiciona como filha


func Emitir_fumaca():
	#print("fumaça")
	var f = pre_fumaca.instance()
	f.position = position
	get_parent().add_child(f)
func Emitir_explosao():
	var e = pre_explosao.instance()
	e.position = position
	get_parent().add_child(e)
	#print("explosão")
