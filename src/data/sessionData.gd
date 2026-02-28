extends Node
class_name Session

var _id:String
var data:Dictionary[String,Object]
var _time:Dictionary = Time.get_time_dict_from_system()

func _ready() -> void:
	pass

func _init() -> void:
	_id = UUID.generateId()

func getId() -> String:
	return _id
