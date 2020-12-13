extends Node2D

const Enemy : PackedScene = preload("res://Scenes/Enemy.tscn")

onready var spwanPoints = $SpawnPoints

func get_spawn_point():
  var points : Array = spwanPoints.get_children()
  points.shuffle()
  return (points[0] as Position2D).global_position
  
func spwan_enemy():
  var enemy = Enemy.instance()
  var main = get_tree().current_scene
  main.add_child(enemy)
  enemy.global_position = self.get_spawn_point()


func _on_Timer_timeout():
  spwan_enemy()
