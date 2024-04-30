extends Control

var loading : bool
var path : String
var waitForInput : bool
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if loading:
		var progress = []
		var status = ResourceLoader.load_threaded_get_status(path, progress)
		if status == ResourceLoader.THREAD_LOAD_IN_PROGRESS:
			print(progress[0] *100)
		elif status == ResourceLoader.THREAD_LOAD_LOADED:
			set_process(false)
			print("level loaded")
			var scene = ResourceLoader.load_threaded_get(path)
			ChangeScene(scene)
	pass

func ChangeScene(resource : PackedScene):
	var currentNode = resource.instantiate()
	get_tree().root.add_child(currentNode)
	
	for item in get_tree().root.get_children():
		if item != currentNode:
			get_tree().root.remove_child(item)
			item.queue_free()

func loadLevel(path : String):
	self.path = path
	show()
	if(ResourceLoader.has_cached(path)):
		ResourceLoader.load_threaded_get(path)
	else:
			ResourceLoader.load_threaded_request(path, "", true)
			loading = true
