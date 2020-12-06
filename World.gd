extends Node

var score := 0 setget set_score
onready var scoreLabel = $Score

func set_score(value: int):
  score = value
  scoreLabel.text = "Score = %d" % score

func _on_Enemy_score_up():
 self.score += 10
  
