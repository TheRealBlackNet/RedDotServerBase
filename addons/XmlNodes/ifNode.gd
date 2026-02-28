@icon("res://addons/XmlNodes/IfNodeIcon.svg")
extends Node
class_name IfNode

@export_category("Condition")
@export 
var test_field:String = ""
@export 
var test_value:String = ""
@export 
var test_type:TestTypes = TestTypes.Equal

enum TestTypes {
	Equal,
	NotEqual,
	IsNull,
	NotNull,
#	Greater,
#	Smaller,
#	GreaterEqual,
#	SmallerEqual,
}


func _ready() -> void:
	pass # Replace with function body.
