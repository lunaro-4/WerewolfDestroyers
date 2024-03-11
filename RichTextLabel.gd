extends RichTextLabel

var exapmple_text = "Ты че ахуел?"

# Called when the node enters the scene tree for the first time.
func _ready():
	scroll_procces(exapmple_text)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func scroll_procces(input_text:String):
	visible_characters = 0
	text = input_text
	
	for i in get_parsed_text():
		visible_characters += 1
		await get_tree().create_timer(0.2).timeout
