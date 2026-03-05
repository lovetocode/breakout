extends Node2D

@onready var BrickObj = preload("res://brick.tscn")

var rows = 7
var columns = 32
var margin = 50

var colors = get_colors()




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_up()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func set_up():
	
	for r in rows:
		for c in columns:
			
			var randomNumber = randi_range(0,2)
			if randomNumber > 0:
				var newBrick = BrickObj.instantiate()
				add_child(newBrick)
				newBrick.position = Vector2(margin + (c * 34), margin + (r * 34))
				
				var sprite = newBrick.get_node("Sprite2D")
				colors.shuffle()
				if r <= 9:
					sprite.modulate = colors[0]
				if r <= 6:
					sprite.modulate = colors[1]
				if r < 3:
					sprite.modulate = colors[2]
				
		
func get_colors():
	var colors = [
		Color(0, 0, 1, 1),
		Color(1,0,0,1),
		Color(1,1,1,1),
		
	]
	return colors
func game_over():
	get_tree().reload_current_scene()


func _on_death_zone_body_entered(body: Node2D) -> void:
	game_over()
