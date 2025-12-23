extends Node

@export var console: Control
@export var visualiser: StyleBoxTexture
@export var app_window: SubViewport
# @export var timer

var write_enabled = false
# used when the code still needs controll after writing
var write_locked = false
var previous_cahrecter = ""

var email_opened = false
var email_index = 0
var email_death = false
var email_death_debounce = false

var task_index = -1
var task_mode = false
var task_curent: Dictionary
var task_requim_index = 0
var task_failed = false
var task_done = false
var task_unhappy = ""

var app_index = -1
var app_curent = null
var app_node = null

var download_downloading = false
var download_module_index = 0

var game_over = false

func start() -> void:
	diologue(0)
	console.done.connect(stopWriting)
	deaths.startTime = Time.get_unix_time_from_system()

func _process(delta):
	if email_death:
		if email_death_debounce: return
		email_death_debounce = true
		setHand("explosion_pre")
	else:
		var curent_text = detectKeyboard()
		if previous_cahrecter == curent_text: return
		previous_cahrecter = curent_text
		write(curent_text)
		checkSpecial()

func write(p_string: String) -> void:
	if not write_enabled: return
	console.addCharecter(p_string)

func stopWriting() -> void:
	if email_death:
		setHand("explosion_aft")
		email_death_debounce = false
		write_enabled = false
		write_locked = false
		email_death = false
		task_failed = false
		deaths.deaths += 1
		await get_tree().create_timer(0.5).timeout
		console.addSlowText(".................................................\nYou exploded..\n..................................................\n BUT SUDENTLY, a bright light shined and you got back up\n")
	else:
		if write_locked:
			#Writing chains
			if task_mode: taskWrite()
			elif download_downloading: downloadChain()
			# As failsafe
			else: newLine()
		else: newLine()

func newLine() -> void:
	if task_mode:
		console.addCharecter("[b]Noob-o-task->>[/b] ")
	else:
		console.addCharecter("[b]Noob->>[/b] ")
	write_enabled = true
	
func checkSpecial() -> void:
	if not write_enabled: return
	if game_over:
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
			"CLOSE":
				console.addNewLine()
				if app_node:
					app_node.queue_free()
					write_enabled = false
					console.addText("Bye bye appy !-!\n")
				else:
					write_enabled = false
					console.addText("No open app found !DD\n")
			"QUIT":
				get_tree().quit()
			"RESET":
				get_tree().reload_current_scene()
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
			"QUIT":
				get_tree().quit()
			_:
				var lastinput = console.getLast(0)
				if task_requim_index < task_curent["Requims"].size() and email_opened: 
					if lastinput == task_curent["Requims"][task_requim_index]["Expected"]:
						task_requim_index += 1
						write_enabled = false
						console.addNewLine()
						taskWrite()
					elif lastinput == task_curent["Requims"][task_requim_index]["NoNo"]:
						if task_curent["Requims"][task_requim_index]["Possible"]:
							task_failed = true
							task_unhappy = task_curent["Requims"][task_requim_index]["Text"]
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
				if Diologue.getEmailAmount() == email_index: return
				task_index = Diologue.getEmail(email_index)["Task"]
				app_index = Diologue.getEmail(email_index)["App"]
				task_done = false
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
			"DOWNLOAD":
				console.addNewLine()
				if app_curent:
					write_enabled = false
					console.addText("Memmory slot full x-x\nPlease delete previos app before downloading\n")
				else:
					if app_index == -1:
						write_enabled = false
						console.addText("No app found in NMAIL attachment ;;--;;\n")
						return
					app_curent = Diologue.getApp(app_index)
					write_enabled = false
					write_locked = true
					download_downloading = true
					download_module_index = 0
					console.addText(
						"Downloading: "+app_curent["Name"]+
						"\nSize:"+app_curent["Size"]+
						"\nDownloading... please wait!\n")
			"APP":
				console.addNewLine()
				if app_curent:
					if not app_node:
						write_enabled = false
						console.addText("RIGHT AWAY (tip: use CLEAR)\n")
						app_node = app_curent["Scene"].instantiate()
						app_window.add_child(app_node)
					else:
						write_enabled = false
						console.addText("App already open.. exit previous app\n")
				else:
					write_enabled = false
					console.addText("No app found... XXUXX\n")
			"CLOSE":
				console.addNewLine()
				if app_node:
					app_node.queue_free()
					write_enabled = false
					console.addText("Bye bye appy !-!\n")
				else:
					write_enabled = false
					console.addText("No open app found !DD\n")
			"DELETE":
				console.addNewLine()
				if app_curent:
					write_enabled = false
					app_curent = null
					console.addText("App disposed of, have wonderful day ;PP\n")
				else:
					write_enabled = false
					console.addText("No app found to satisfy my hunger....\n")
			"QUIT":
				get_tree().quit()
			"RESET":
				console.addNewLine()
				write_enabled = false
				console.addText("If you want to reset, please type NOWRESET\n")
			"NOWRESET":
				get_tree().reload_current_scene()
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
	if task_requim_index >= task_curent["Requims"].size() or not email_opened: 
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
	if task_done and email_opened:
		email_opened = false
		if task_failed:
			console.addSlowText("UH OH -> "+task_unhappy + "<-\n" + task_curent["Fail"])
			email_death = true
		else:
			console.addText(task_curent["Succes"])
			email_index += 1
	else:
		if Diologue.getEmailAmount() == p_index:
			deaths.endTime = Time.get_unix_time_from_system()
			game_over = true
			console.addSlowText("As you tried that.. nothing happened
			The bomb stoped ticking
			The computer buzzed softly..
			As soon you stood up.. 
			And finaly was free..
			BUT THEN KABOOOOOOOOOOOOOOOOOm
			U died XXDD
			Welp, you did great!
			You died "+ str(deaths.deaths) + "times
			And did it in " + str(deaths.start - deaths.endTime) + "ms
			And whenever you are ready to for another round just type RESET ;PP")
		console.addText(Diologue.getEmail(p_index)["Content"])
		email_opened = true

func downloadChain() -> void:
	if download_module_index > app_curent["Modules"].size() - 1:
		download_downloading = false
		write_locked = false
		return
	if download_module_index == app_curent["Modules"].size() - 1:
		download_downloading = false
		write_locked = false
	write_enabled = false
	console.addSlowText(app_curent["Modules"][download_module_index]+"\t\t [##-##=##-##] -+_ DONE\n")
	download_module_index += 1

func detectKeyboard() -> String:
	# others
	if Input.is_key_pressed(KEY_SPACE): 
		setHand("SPACE")
		return " "
	if Input.is_key_pressed(KEY_ENTER): 
		setHand("YAY")
		return " ENTER"
	
	# keyboard
	if Input.is_key_pressed(KEY_Q): 
		setHand("Q")
		return "Q"
	if Input.is_key_pressed(KEY_W): 
		setHand("W")
		return "W"
	if Input.is_key_pressed(KEY_E): 
		setHand("E")
		return "E"
	if Input.is_key_pressed(KEY_R): 
		setHand("R")
		return "R"
	if Input.is_key_pressed(KEY_T): 
		setHand("T")
		return "T"
	if Input.is_key_pressed(KEY_Y): 
		setHand("Y")
		return "Y"
	if Input.is_key_pressed(KEY_U): 
		setHand("U")
		return "U"
	if Input.is_key_pressed(KEY_I): 
		setHand("I")
		return "I"
	if Input.is_key_pressed(KEY_O): 
		setHand("O")
		return "O"
	if Input.is_key_pressed(KEY_P): 
		setHand("P")
		return "P"
	if Input.is_key_pressed(KEY_A): 
		setHand("A")
		return "A"
	if Input.is_key_pressed(KEY_S): 
		setHand("S")
		return "S"
	if Input.is_key_pressed(KEY_D): 
		setHand("D")
		return "D"
	if Input.is_key_pressed(KEY_F): 
		setHand("F")
		return "F"
	if Input.is_key_pressed(KEY_G): 
		setHand("G")
		return "G"
	if Input.is_key_pressed(KEY_H): 
		setHand("H")
		return "H"
	if Input.is_key_pressed(KEY_J): 
		setHand("J")
		return "J"
	if Input.is_key_pressed(KEY_K): 
		setHand("K")
		return "K"
	if Input.is_key_pressed(KEY_L): 
		setHand("L")
		return "L"
	if Input.is_key_pressed(KEY_Z): 
		setHand("Z")
		return "Z"
	if Input.is_key_pressed(KEY_X): 
		setHand("X")
		return "X"
	if Input.is_key_pressed(KEY_C): 
		setHand("C")
		return "C"
	if Input.is_key_pressed(KEY_V): 
		setHand("V")
		return "V"
	if Input.is_key_pressed(KEY_B): 
		setHand("B")
		return "B"
	if Input.is_key_pressed(KEY_N): 
		setHand("N")
		return "N"
	if Input.is_key_pressed(KEY_M): 
		setHand("M")
		return "M"

	# numbers
	if Input.is_key_pressed(KEY_1): 
		if randi_range(0,1) == 0:
			setHand("IDK")
		else:
			setHand("IDK2")
		return "1"
	if Input.is_key_pressed(KEY_2): 
		if randi_range(0,1) == 0:
			setHand("IDK")
		else:
			setHand("IDK2")
		return "2"
	if Input.is_key_pressed(KEY_3): 
		if randi_range(0,1) == 0:
			setHand("IDK")
		else:
			setHand("IDK2")
		return "3"
	if Input.is_key_pressed(KEY_4): 
		if randi_range(0,1) == 0:
			setHand("IDK")
		else:
			setHand("IDK2")
		return "4"
	if Input.is_key_pressed(KEY_5): 
		if randi_range(0,1) == 0:
			setHand("IDK")
		else:
			setHand("IDK2")
		return "5"
	if Input.is_key_pressed(KEY_6): 
		if randi_range(0,1) == 0:
			setHand("IDK")
		else:
			setHand("IDK2")
		return "6"
	if Input.is_key_pressed(KEY_7): 
		if randi_range(0,1) == 0:
			setHand("IDK")
		else:
			setHand("IDK2")
		return "7"
	if Input.is_key_pressed(KEY_8): 
		if randi_range(0,1) == 0:
			setHand("IDK")
		else:
			setHand("IDK2")
		return "8"
	if Input.is_key_pressed(KEY_9): 
		if randi_range(0,1) == 0:
			setHand("IDK")
		else:
			setHand("IDK2")
		return "9"
	if Input.is_key_pressed(KEY_0): 
		if randi_range(0,1) == 0:
			setHand("IDK")
		else:
			setHand("IDK2")
		return "0"

	# directions
	if Input.is_key_pressed(KEY_LEFT): 	
		setHand("LEFT")
		return "LEFT"
	if Input.is_key_pressed(KEY_RIGHT): 
		setHand("RIGHT")
		return "RIGHT"
	if Input.is_key_pressed(KEY_UP): 	
		setHand("UP")
		return "UP"
	if Input.is_key_pressed(KEY_DOWN): 	
		setHand("DOWN")
		return "DOWN"
	setHand("IDLE")
	return ""

func setHand(p_name:String) -> void:
	visualiser.texture = load("res://assets/Keyboard/"+p_name.to_lower()+".png")
