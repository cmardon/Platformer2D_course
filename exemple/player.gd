extends CharacterBody2D

const SPEED = 400.0
const JUMP_VELOCITY = -400.0

const DASH_SPEED = 1000.0
const DASH_DURATION = 0.1

const GRAVITY = 1000.0

const COYOTE_TIME := 0.12
var coyote_timer := 0.0

@onready var sprite = $AnimatedSprite2D

var was_in_air := false

var is_dashing := false
var dash_timer := 0.0
var dash_direction := 1

func _physics_process(delta: float) -> void:
	if sprite.animation == "death":
		return
	
	# ---------- DASH ----------
	if Input.is_action_just_pressed("ui_shift") and not is_dashing:
		is_dashing = true
		dash_timer = DASH_DURATION
		
		# Direction du dash
		if sprite.flip_h:
			dash_direction = -1
		else:
			dash_direction = 1

	# Si on dash
	if is_dashing:
		velocity.x = dash_direction * DASH_SPEED
		dash_timer -= delta
		
		if dash_timer <= 0:
			is_dashing = false
	
	else:
		# Gravity
		if not is_on_floor():
			velocity.y += GRAVITY * delta

		# ---------- COYOTE TIME ----------
		if is_on_floor():
			coyote_timer = COYOTE_TIME
		else:
			coyote_timer -= delta

		# Jump
		if Input.is_action_just_pressed("ui_accept") and (is_on_floor() or coyote_timer > 0.0):
			velocity.y = JUMP_VELOCITY
			was_in_air = true
			coyote_timer = 0.0

		# Movement
		var direction := Input.get_axis("ui_left", "ui_right")

		if direction != 0:
			velocity.x = direction * SPEED
			sprite.flip_h = direction < 0
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

	# ---------- ANIMATIONS ----------
	if sprite.animation != "death":
		if is_dashing:
			if sprite.animation != "run":
				sprite.play("run")
		elif not is_on_floor():
			if sprite.animation != "jump":
				sprite.play("jump")
		else:
			var direction := Input.get_axis("ui_left", "ui_right")

			if direction != 0:
				if sprite.animation != "run":
					sprite.play("run")
			else:
				if sprite.animation != "idle":
					sprite.play("idle")
	
	# Déplacement
	move_and_slide()

	# ---------- DÉTECTION DES PICS ----------
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()

		if collider is TileMapLayer:
			var position_impact = collision.get_position()
			var position_dans_case = position_impact - collision.get_normal() * 2

			var coords = collider.local_to_map(collider.to_local(position_dans_case))
			
			var tile_data = collider.get_cell_tile_data(coords)

			if tile_data:
				var est_mortel = tile_data.get_custom_data("est_mortel")
				
				if est_mortel:
					sprite.play("death")
					await sprite.animation_finished
					tuer_joueur()
					break


func tuer_joueur(_body=null) -> void:
	if _body == null or _body == self:
		get_tree().call_deferred("change_scene_to_file", "res://exemple/niveaux/niveau1.tscn")
