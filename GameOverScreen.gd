extends Node

# preload fail when scene is already loaded and become cyclic loading


onready var highscoreLabel = $CenterContainer/VBoxContainer/HighScoreLabel

func set_highscore_label():
  var save_data = SaveAndLoad.load_data_from_file()
  print(save_data)
  highscoreLabel.text = "HIGH SCORE : %d" % save_data.highscore

func _ready():
  set_highscore_label()
  

func _process(delta):
  if Input.is_action_just_pressed("ui_cancel"):
    get_tree().change_scene("res://StartMenu.tscn")

