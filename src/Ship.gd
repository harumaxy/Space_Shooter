extends Area2D

const Laser : PackedScene = preload("res://Scenes/Laser.tscn")
const ExplosionEffect : PackedScene = preload("res://Scenes/ExplosionEffect.tscn")
export(int) var SPEED := 100

signal player_death

func _process(delta: float):
  var y =   Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
  position.y += SPEED * delta * y
  
  if Input.is_action_just_pressed("ui_accept"):
    fire_laser()
  
func fire_laser():
  var laser = Laser.instance()
  var main = get_tree().current_scene
  main.add_child(laser)
  laser.global_position = self.global_position


func _on_Ship_area_entered(area: Area2D):
  area.queue_free()
  emit_signal("player_death")
  self.queue_free()

func _exit_tree():
  var main = get_tree().current_scene
  var explosionEffect = ExplosionEffect.instance()
  main.call_deferred("add_child", explosionEffect)
  explosionEffect.global_position = self.global_position
