extends Node

const World: PackedScene = preload("res://scenes/World.tscn")


func _on_Button_button_down():
 get_tree().change_scene_to(World)


# default setting : ui_accept = space, ui_cancel = esc

# SceneTree.quit() : quit godot game application

func _unhandled_input(event):
  if Input.is_action_just_pressed("ui_accept"):
    get_tree().change_scene_to(World)       

  if Input.is_action_just_pressed("ui_cancel"):
    get_tree().quit()
