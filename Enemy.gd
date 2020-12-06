extends Area2D

const ExplosionEffect : PackedScene = preload("res://ExplosionEffect.tscn")

export(int) var SPEED := 20
export(int) var ARMOR := 3

signal score_up


func _ready():
  var main = get_tree().current_scene
  if main.is_in_group("World"):
    connect("score_up", main, "_on_Enemy_score_up")

func _process(delta):
  position.x -= SPEED * delta


func _on_Enemy_body_entered(body: Node):
  body.queue_free()
  ARMOR -= 1
  if ARMOR <= 0:
    emit_signal("score_up")
    self.queue_free()

func _exit_tree():
  var main = get_tree().current_scene
  var explosionEffect = ExplosionEffect.instance()
  main.add_child(explosionEffect)
  explosionEffect.global_position = self.global_position
