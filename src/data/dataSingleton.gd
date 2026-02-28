extends Node
class_name DataSingleton


func _ready() -> void:
	pass


var _webpages:String = "res://webpages"
var _fallbackIndex:String = "/Index.html"
var _404Page:String = "/PageNotFound404.html"


func getWebBase() -> String:
	return _webpages

func getFallbackIndex() -> String:
	return _fallbackIndex

func get404Page() -> String:
	return _404Page
