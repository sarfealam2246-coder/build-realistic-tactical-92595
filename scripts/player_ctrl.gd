extends CharacterBody3D
const SPEED = 9.0
const JUMP_VELOCITY = 5.5
func _physics_process(delta):
    if not is_on_floor(): velocity.y -= 9.8 * delta
    var input_dir = Input.get_vector('ui_left', 'ui_right', 'ui_up', 'ui_down')
    var dir = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
    if dir:
        velocity.x = dir.x * SPEED
        velocity.z = dir.z * SPEED
    else:
        velocity.x = move_toward(velocity.x, 0, SPEED)
        velocity.z = move_toward(velocity.z, 0, SPEED)
    move_and_slide()
