extends AnimatedSprite


func _ready():
	self.play() # vai dar um play na animação assim que ela for chamada
	pass 


func _on_explosao_animation_finished():
	#print("eliminar a explosão")
	queue_free()
