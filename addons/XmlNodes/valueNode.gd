@icon("res://addons/XmlNodes/ValNodeIcon.svg")
extends XmlNode
class_name ValueNode




func _ready() -> void:
	pass

func writeXmlLine(request: HttpRequest,\
	response: HttpResponse,\
	addDeclaration:bool = true) -> String:
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
