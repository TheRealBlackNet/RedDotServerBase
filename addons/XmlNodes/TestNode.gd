@icon("res://addons/XmlNodes/TestNodeIcon.svg")
extends XmlNode
class_name TestNode


var test_if:Array = []

func _ready() -> void:
	pass # Replace with function body.


func writeXmlLine(request: HttpRequest,\
	response: HttpResponse,\
	addDeclaration:bool = true) -> String:
	# there are child nodes cant <xml/>
	# only switch it off because castor will need 
	# the empty tags so closing it here would be bad!
	if noEndTag && get_child_count() > 0\
	 || nodeText.length() > 0:
		noEndTag = false
	
	prewrite.emit(self)
	
	var retval = ""
	if addDeclaration: # if we start with a if
		if isHtml:
			retval += "<!DOCTYPE html>\r\n"
		else:
			retval += "<?xml version='1.0' encoding='utf-8' ?>\r\n";

	# TODO GET IF - ELSE 
	for child in get_children():
		retval += child.writeXmlLine(false)


	return retval
