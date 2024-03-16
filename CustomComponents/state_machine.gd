class_name CustomStateMachine

var states : Array[String]
var current_state : String


func _init(input_states : Array[String]):
	states = input_states
	reset()


func set_state(state : String):
	assert(states.find(state) != -1)
	current_state = state

func get_state():
	return current_state

func check_match(index : int) -> bool:
	return current_state == states[index]

func reset():
	current_state = states[0]
