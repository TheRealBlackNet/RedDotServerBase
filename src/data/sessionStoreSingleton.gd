extends Node
class_name SessionStoreSingleton

var _sessions:Dictionary[String, Session]

func _ready() -> void:
	pass


func newSession() -> Session:
	var newSession:Session = Session.new()
	_sessions.set(newSession.getId(), newSession)
	return newSession

func hasSession(key:String) -> bool:
	return _sessions.has(key)


func getSession(key:String) -> Session:
	var retval:Session = _sessions.get(key)
	
	return retval
