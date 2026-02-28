extends HttpRouter
class_name WebInterface

func _init(argPath: String):
	self.path = argPath
	self.handle_get = self.handle_get_method
	self.handle_post = self.handle_post_method
	self.handle_put = self.handle_put_method
	self.handle_patch = self.handle_patch_method
	self.handle_delete = self.handle_delete_method
	self.handle_options = self.handle_options_method


func handle_get_method(request: HttpRequest, response: HttpResponse) -> bool:
	printerr("GET PAGE - " + request.path)
	var curPath:String = request.path
	var status:int = 200
	
	
	if len(curPath) <= 1 :
		curPath = Constants.getFallbackIndex()
	
	var filePath:String = (Constants.getWebBase() + curPath)\
		.replace(".html", ".tscn")
	var exists:bool = FileAccess.file_exists(filePath)
	
#	if not exists:
#		filePath = (Constants.getWebBase() + curPath) # pure html 
#		exists = FileAccess.file_exists(filePath)
	
	if not exists:
		filePath = (Constants.getWebBase()\
		 	+ Constants.get404Page())\
			.replace(".html", ".tscn")
		status = 404
	
	printerr("SEND PAGE - " + filePath)
	var currentPageLoaded = load(filePath)
	var html:GenericNode = currentPageLoaded.instantiate()
	
	if html == null:
		return false
	else:
		response.send(status,\
			html.writeXmlLine(request, response, true))
		return true


func handle_post_method(request: HttpRequest, response: HttpResponse) -> void:
	response.send(200, JSON.stringify({
		message = "Hello! from POST",
		raw_body = request.body,
		parsed_body = request.get_body_parsed(),
		params = request.query
	}), "application/json")

func handle_put_method(_request: HttpRequest, response: HttpResponse) -> void:
	response.send(200, "Hello! from PUT")

func handle_patch_method(_request: HttpRequest, response: HttpResponse) -> void:
	response.send(200, "Hello! from PATCH")

func handle_delete_method(_request: HttpRequest, response: HttpResponse) -> void:
	response.send(200, "Hello! from DELETE")

func handle_options_method(_request: HttpRequest, response: HttpResponse) -> void:
	response.send(200, "Hello! from Options")
