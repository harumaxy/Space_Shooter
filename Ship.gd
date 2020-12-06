extends Area2D

const Bullet : PackedScene = preload("res://Bullet.tscn")
const ExplosionEffect : PackedScene = preload("res://ExplosionEffect.tscn")
export(int) var SPEED := 100

func _process(delta: float):
  var y =   Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
  position.y += SPEED * delta * y
  
  if Input.is_action_just_pressed("ui_accept"):
    fire_bullet()
  
func fire_bullet():
  var bullet = Bullet.instance()
  var main = get_tree().current_scene
  main.add_child(bullet)
  bullet.global_position = self.global_position


func _on_Ship_area_entered(area: Area2D):
  area.queue_free()
  self.queue_free()

func _exit_tree():
  var main = get_tree().current_scene
  var explosionEffect = ExplosionEffect.instance()
  main.add_child(explosionEffect)
  explosionEffect.global_position = self.global_position
