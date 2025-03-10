extends Control

func _ready():
	print("cameras:")
	print(CameraServer.feeds())
	for feed in CameraServer.feeds():
		var name = feed.get_name()
		print(name)
