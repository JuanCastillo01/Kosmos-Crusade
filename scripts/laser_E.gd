extends Area2D

var mov = Vector2()
var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mov.y = speed*delta
	mov.x = (-speed)*delta
	translate(mov)
	if (position.y > (get_viewport_rect().size.y + 30)):
		get_node("../").queue_free()
	pass


func _on_area_entered(area):
	if area.is_in_group(game.JOGADOR):
		area.setDurabilidade(area.durabilidade -1)
		queue_free()
