extends Node

@export var console: Control

var write_enabled = false
# used when the code still needs controll after writing
var write_locked = false
var previous_cahrecter = ""

var email_index = 0

var task_index = -1
var task_mode = false
var task_curent
var task_requim_index = 0
var task_failed = false
var task_done = false

func start() -> void:
	diologue(0)
	console.done.connect(stopWriting)

func _process(delta):
	var curent_text = detectKeyboard()
	if previous_cahrecter == curent_text: return
	previous_cahrecter = curent_text
	write(curent_text)
	checkSpecial()

func write(p_string: String) -> void:
	if not write_enabled: return
	console.addCharecter(p_string)

func stopWriting() -> void:
	if write_locked:
		taskWrite()
	else:
		newLine()

func newLine() -> void:
	if task_mode:
		console.addCharecter("[b]Noob-o-task->>[/b] ")
	else:
		console.addCharecter("[b]Noob->>[/b] ")
	write_enabled = true
	
func checkSpecial() -> void:
	if not write_enabled: return
	if task_mode:
		match console.getLast(0):
			"HELP":
				console.addNewLine()
				diologue(5)
			"ENTER":
				console.addNewLine()
				newLine()
			"CLEAR":
				console.clearText()
				newLine()
			"EXIT":
				console.addNewLine()
				write_enabled = false
				write_locked = false
				taskExit()
			"REPEAT":
				console.addNewLine()
				taskWrite()
			_:
				var lastinput = console.getLast(0)
				if task_requim_index < task_curent["Requims"].size(): 
					if lastinput == task_curent["Requims"][task_requim_index]["NoNo"]:
						task_failed = true
						task_requim_index += 1
						write_enabled = false
						console.addNewLine()
						taskWrite()
					elif lastinput == task_curent["Requims"][task_requim_index]["Expected"]:
						task_requim_index += 1
						write_enabled = false
						console.addNewLine()
						taskWrite()
				return
	else:
		match console.getLast(0):
			"EXIT":
				console.addNewLine()
				diologue(randi_range(2,4))
			"ENTER":
				console.addNewLine()
				newLine()
			"HELP":
				console.addNewLine()
				diologue(1)
			"CLEAR":
				console.clearText()
				newLine()
			"NMAIL":
				console.addNewLine()
				email(email_index)
				task_index = Diologue.getEmail(email_index)["Task"]
				task_requim_index = 0
			"TASK":
				console.addNewLine()
				task(task_index)
			"FAST":
				console.fastModeToggle()
				console.addNewLine()
				newLine()
			"MUSIC":
				if $Tttr1t.playing:
					$Tttr1t.stop()
				else:
					$Tttr1t.play()
				console.addNewLine()
				newLine()
			_:
				return

func task(p_index) -> void:
	if p_index == -1:
		write_enabled = false
		console.addText("NO TASK FOUND\nSELF DESTRUCT T-10\nT-9..........\nT-8..........\nT-7..........\nT-6..........\nT-5..........\nT-4..........\nT-3..........\nT-2..........\nT-1..........\n.................................................\nJk ;PP\n")
		return
	console.clearText()
	task_curent = Diologue.getTask(p_index)
	task_mode = true
	write_enabled = false
	write_locked = true
	console.addNewLine()
	console.addText("[b]--==|| Task mode ,,--.. EXIT [to] EXIT ||==--[/b]\n"+task_curent["Name"])

func taskWrite() -> void:
	if task_requim_index >= task_curent["Requims"].size(): 
		task_done = true
		write_enabled = false
		write_locked = false
		console.addText("All tasks done ;PP\nPlease proceed to check [i]tm(NMAIL)[/i]\n")
		return
	write_enabled = false
	write_locked = false
	console.addText("[b]"+str(task_requim_index+1) + "}{--= Numero of tasssky =--}{"+ str(task_requim_index+1)+ "[/b]\n"+task_curent["Requims"][task_requim_index]["Text"]+"\n"+task_curent["Requims"][task_requim_index]["Prompt"])

func taskExit() -> void:
	console.clearText()
	task_mode = false
	console.addText("--==|| EXIIITED Task mode EXIIITED ||==--\n")

func diologue(p_index: int) -> void:
	write_enabled = false
	console.addText(Diologue.getDiologue(p_index))

func email(p_index: int) -> void:
	write_enabled = false
	if task_done:
		if task_failed:
			console.addText(task_curent["Succes"])
		else:
			console.addText(task_curent["Fail"])
	else:
		console.addText(Diologue.getEmail(p_index)["Content"])

func detectKeyboard() -> String:
	# others
	if Input.is_key_pressed(KEY_SPACE): return " "
	if Input.is_key_pressed(KEY_ENTER): return " ENTER"
	
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
