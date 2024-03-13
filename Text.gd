extends MarginContainer

@onready var TextLabel = $MarginContainer/TextLabel
@onready var timer = $LetterDisplayTimer

const MAX_WIDTH = 256

var text = ""
var letter_index = 0

var letter_time = 0.03
var space_time = 0.06
var punctuation_time = 0.2

signal finished_displaying()


# Called when the node enters the scene tree for the first time.
func _ready():
	_display_text(" Привет я твоя мама ")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _display_text(text_to_display: String):
	text = text_to_display
	TextLabel.text = text_to_display
	print(size.x)
	
	#await resized
	#custom_minimum_size.x = min(size.x, MAX_WIDTH)

	#if size.x < MAX_WIDTH:
	custom_minimum_size.x = MAX_WIDTH
	TextLabel.autowrap_mode = TextServer.AUTOWRAP_WORD
	
	#await resized
	#custom_minimum_size.y = size.y

	#global_position.x -= size.x
	#global_position.y -= size.y + 2

	
	TextLabel.text = ""
	_display_letter()
	
func _display_letter():
	TextLabel.text += text[letter_index]
	letter_index += 1
	if letter_index >= text.length():
		finished_displaying.emit()
		return
	match text[letter_index]:
		"!", ".", "," , "?":
			timer.start(punctuation_time)
		" ":
			timer.start(space_time)
		_:
			timer.start(letter_time)


func _on_letter_display_timer_timeout():
	_display_letter()
