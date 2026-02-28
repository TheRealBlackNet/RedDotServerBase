extends HttpRouter
class_name DataInterface

func _init(argPath: String):
	self.path = argPath
	self.handle_get = self.handle_get_method

func handle_get_method(request: HttpRequest, response: HttpResponse) -> bool:
	#printerr("GET IMAGE - " + request.path)
	var filePath:String = Constants.getWebBase() + request.path
	var data:PackedByteArray = FileAccess.get_file_as_bytes(filePath)
	
	if data.is_empty():
		return false
	else:
		response.send_raw(200, data,\
			fileEndingToMimeType(filePath))
		return true


func fileEndingToMimeType(file:String) -> String:
	if file.to_lower().ends_with(".jpg")\
			|| file.to_lower().ends_with(".jpeg"):
		return "image/jpeg"
	elif file.to_lower().ends_with(".png"):
		return "image/png"
	elif file.to_lower().ends_with(".svg"):
		return "image/svg+xml"
	elif file.to_lower().ends_with(".gif"):
		return "image/gif"
	elif file.to_lower().ends_with(".tiff"):
		return "image/tiff"
	elif file.to_lower().ends_with(".webp"):
		return "image/webp"
	elif file.to_lower().ends_with(".bmp"):
		return "image/bmp"
	else:
		return "image/jpeg"
