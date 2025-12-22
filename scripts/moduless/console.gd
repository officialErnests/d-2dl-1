extends RichTextLabel

var text_delay = 0.01
var can_type = false

signal done()

func setSpeed(p_speed) -> void:
	text_delay = p_speed

func addCharecter(p_text: String) -> void:
	text += p_text

func addNewLine() -> void:
	text += "\n"

func addText(p_text: String) -> void:
	visible_characters = get_parsed_text().length()
	text += p_text
	showText()

func clearText() -> void:
	text = ""
	visible_characters = -1

func getLast(p_offset) -> String:
	var result = ""
	for index in range(text.length()-1, -1, -1):
		var iter_charecter = text[index]

		# checks offset
		if p_offset > 0 and iter_charecter == " " or iter_charecter == "\n":
			
			continue
		
		if iter_charecter == " " or iter_charecter == "\n":
			if result.length() > 0:
				return result.reverse()
			continue
		
		result += iter_charecter
	return result.reverse()

func showText() -> void:
	if get_parsed_text().length() > visible_characters:
		visible_characters += 1
		await get_tree().create_timer(text_delay).timeout
		showText()
	else:
		visible_characters = -1
		done.emit()