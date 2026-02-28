extends Node
class_name UuidGenerator

var _uuidChars = ["0","1","2","3","4","5","6","7","8","9",\
	"A","B","C","D","E","F","G","H","I","J","K",\
	"L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",\
	"a","b","c","d","e","f","g","h","i","j","k",\
	"l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

# d062 1d80 - 47d9 - 4064 - a9eb - 2812 65fc 770f 

func _ready() -> void:
	pass

func _getGroup() -> String:
	return _uuidChars.pick_random()\
		+ _uuidChars.pick_random()\
		+ _uuidChars.pick_random()\
		+ _uuidChars.pick_random()

func generateId() -> String:
	return _getGroup() + _getGroup()\
	+ "-" + _getGroup()\
	+ "-" + _getGroup()\
	+ "-" + _getGroup()\
	+ "-" + _getGroup() + _getGroup() + _getGroup()
