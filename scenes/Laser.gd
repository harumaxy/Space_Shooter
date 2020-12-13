extends RigidBody2D

const HitEffect = preload("res://scenes/HitEffect.tscn")

onready var laserSound = $LaserSound

func _ready():
  laserSound.play()
  
#func _exit_tree():
#  create_hit_effect()
  
func create_hit_effect():
  var main = get_tree().current_scene
  var hitEffect := HitEffect.instance() as Node2D
  main.add_child(hitEffect)
  hitEffect.global_position = self.global_position
