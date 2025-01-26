extends CharacterBody2D


const SPEED = 120.0
const JUMP_VELOCITY = -250.0
const COYOTE_TIME = 0.125
const JUMP_BUFFER_TIME = 0.15

var coyote_timer = COYOTE_TIME
var jump_buffer_timer = 0
var is_mewoing = false

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D



func _physics_process(delta: float) -> void:
	
	# Contoller logic
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if is_on_floor():
		coyote_timer = COYOTE_TIME
		
	if jump_buffer_timer > 0:
		jump_buffer_timer -= delta
	if coyote_timer > 0:
		coyote_timer -= delta

	if Input.is_action_just_pressed("jump"):
		jump_buffer_timer = JUMP_BUFFER_TIME
	
	if coyote_timer > 0 and jump_buffer_timer > 0:
		velocity.y = JUMP_VELOCITY
		jump_buffer_timer = 0
		coyote_timer = 0

	var direction := Input.get_axis("left", "right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	# animation
	if direction > 0:
		animated_sprite.flip_h = false
	if direction < 0:
		animated_sprite.flip_h = true
	
	if !is_mewoing:
		if is_on_floor():
			if direction == 0:
				animated_sprite.play("idle")
			else:
				animated_sprite.play("walk")
		elif velocity.y < 0:
			animated_sprite.play("jump")
	#else:
		#animated_sprite.play("meow")
	
	move_and_slide()


func _on_meow_bubble_is_meowing(meowing: Variant) -> void:
	is_mewoing = meowing
