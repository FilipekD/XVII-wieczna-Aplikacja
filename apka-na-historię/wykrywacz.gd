extends Control

func _ready():
	print("cameras:")
	for feed in CameraServer.feeds():
		var name = feed.get_name()
		print(name)
