extends Label
var startTime = 0
signal death()

func start() -> void:
	startTime = Time.get_ticks_msec() + 20000
	print(Time.get_ticks_msec())
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var time = str(floori((startTime - Time.get_ticks_msec())/10.0))
	while time.length() < 4:
		time = "0"+time
	text = time[0] + time[1] + ":" + time[2] + time[3]
	if int(time) < 0:
		death.emit()
func addTime(p_time_ms: int) -> void:
	startTime += p_time_ms