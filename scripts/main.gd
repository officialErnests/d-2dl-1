extends Node

@export var console: Control

var can_write = false
var previous_cahrecter = ""


func _process(delta):
	var curent_text = detectKeyboard()
	if previous_cahrecter == curent_text: return
	previous_cahrecter = curent_text
	write(curent_text)
	checkSpecial()

func write(p_string: String) -> void:
	if can_write: return
	console.addCharecter(p_string)

func checkSpecial() -> void:
	print(console.getLast(0))

func detectKeyboard() -> String:
	# others
	if Input.is_key_pressed(KEY_SPACE): return " "
	if Input.is_key_pressed(KEY_ENTER): return " --ENTER"
	if Input.is_key_pressed(KEY_MINUS): return "-"
	
	# keyboard
	if Input.is_key_pressed(KEY_Q): return "Q"
	if Input.is_key_pressed(KEY_W): return "W"
	if Input.is_key_pressed(KEY_E): return "E"
	if Input.is_key_pressed(KEY_R): return "R"
	if Input.is_key_pressed(KEY_T): return "T"
	if Input.is_key_pressed(KEY_Y): return "Y"
	if Input.is_key_pressed(KEY_U): return "U"
	if Input.is_key_pressed(KEY_I): return "I"
	if Input.is_key_pressed(KEY_O): return "O"
	if Input.is_key_pressed(KEY_P): return "P"
	if Input.is_key_pressed(KEY_A): return "A"
	if Input.is_key_pressed(KEY_S): return "S"
	if Input.is_key_pressed(KEY_D): return "D"
	if Input.is_key_pressed(KEY_F): return "F"
	if Input.is_key_pressed(KEY_G): return "G"
	if Input.is_key_pressed(KEY_H): return "H"
	if Input.is_key_pressed(KEY_J): return "J"
	if Input.is_key_pressed(KEY_K): return "K"
	if Input.is_key_pressed(KEY_L): return "L"
	if Input.is_key_pressed(KEY_Z): return "Z"
	if Input.is_key_pressed(KEY_X): return "X"
	if Input.is_key_pressed(KEY_C): return "C"
	if Input.is_key_pressed(KEY_V): return "V"
	if Input.is_key_pressed(KEY_B): return "B"
	if Input.is_key_pressed(KEY_N): return "N"
	if Input.is_key_pressed(KEY_M): return "M"

	# numbers
	if Input.is_key_pressed(KEY_1): return "1"
	if Input.is_key_pressed(KEY_2): return "2"
	if Input.is_key_pressed(KEY_3): return "3"
	if Input.is_key_pressed(KEY_4): return "4"
	if Input.is_key_pressed(KEY_5): return "5"
	if Input.is_key_pressed(KEY_6): return "6"
	if Input.is_key_pressed(KEY_7): return "7"
	if Input.is_key_pressed(KEY_8): return "8"
	if Input.is_key_pressed(KEY_9): return "9"
	if Input.is_key_pressed(KEY_0): return "0"

	# directions
	if Input.is_key_pressed(KEY_LEFT): return "LEFT"
	if Input.is_key_pressed(KEY_RIGHT): return "RIGHT"
	if Input.is_key_pressed(KEY_UP): return "UP"
	if Input.is_key_pressed(KEY_DOWN): return "DOWN"
	return ""
