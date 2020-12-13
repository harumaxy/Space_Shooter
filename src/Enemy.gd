extends Area2D

const ExplosionEffect : PackedScene = preload("res://Scenes/ExplosionEffect.tscn")

export(int) var SPEED := 20
export(int) var ARMOR := 3

signal score_up


func _process(delta):
  position.x -= SPEED * delta


func _on_Enemy_body_entered(body: Node):
  body.queue_free()
  body.create_hit_effect()
  ARMOR -= 1
  if ARMOR <= 0:
    add_to_score()
    create_explosion()
    self.queue_free()

func add_to_score():
  var main = get_tree().current_scene
  if main.is_in_group("World"):
    main.score += 10
  

func create_explosion():
  var main = get_tree().current_scene
  var explosionEffect = ExplosionEffect.instance()
  main.add_child(explosionEffect)
  explosionEffect.global_position = self.global_position
