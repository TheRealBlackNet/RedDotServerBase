extends Node
class_name WebpageHttpServer

const WEBPAGES:String = "webpages/"

var loadedPages:Dictionary


func _ready() -> void:
	index_pages()
	var server = HttpServer.new()
	
	# web.xml \ mapping \ servlets
	server.register_router(\
		WebInterface.new("^\\/[ |A-Z|a-z|0-1]*\\.(html|HTML)|^\\/"))
	server.register_router(\
		DataInterface.new("^\\/assets\\/.*"))
	
	
	add_child(server)
	server.enable_cors(["http://localhost:8080"])
	server.start()


func index_pages():
	var dir = DirAccess.open("res://" + WEBPAGES)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				print("Found file: " + file_name)
				loadedPages.set(file_name, "")
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
