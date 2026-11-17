extends CharacterBody3D
@onready var nav: NavigationAgent3D = $NavigationAgent3D
func set_target(pos: Vector3):
    nav.target_position = pos
func _physics_process(_delta):
    if nav.is_navigation_finished(): return
    var nxt = nav.get_next_path_position()
    velocity = (nxt - global_position).normalized() * 4.5
    move_and_slide()
