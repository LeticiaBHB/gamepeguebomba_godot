extends Sprite


func _ready():
	pass

func _process(delta): 
	position.y -= 1.2 #posição do smoke
	
func _on_anim_animation_finished(anim_name): # quando a animação terminar ese sinal vai ser emetido e a ação executada
	#print("destruir a fumaça")
	queue_free() #elimina o smoke
