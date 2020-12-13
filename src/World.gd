extends Node

const GameOverScreen: PackedScene = preload("res://GameOverScreen.tscn")

var score := 0 setget set_score
onready var scoreLabel = $Score


func set_score(value: int):
  score = value
  update_score_label()
  
func update_score_label():
  scoreLabel.text = "Score = %d" % score
  
func update_save_data():
  var save_data = SaveAndLoad.load_data_from_file()
  if score > save_data.highscore:
    SaveAndLoad.save_data_to_file({highscore = score})
    


func _on_Ship_player_death():
  yield(get_tree().create_timer(1), "timeout")
  update_save_data()
  get_tree().change_scene_to(GameOverScreen)
