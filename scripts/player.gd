extends CharacterBody2D

@onready var flashlight = $"Cone Light"
var speed = 200.0
var flashlight_time = 0.0

func _ready():
	flashlight.visible = false

func _physics_process(delta):
	var dir = Vector2.ZERO
	if Input.is_action_pressed("ui_right"): dir.x += 1
	if Input.is_action_pressed("ui_left"):  dir.x -= 1
	if Input.is_action_pressed("ui_down"):  dir.y += 1
	if Input.is_action_pressed("ui_up"):    dir.y -= 1

	velocity = dir.normalized() * speed
	move_and_slide()

	if dir != Vector2.ZERO:
		rotation = dir.angle()

	if Input.is_action_just_pressed("reveal"):
		flashlight.visible = true
		flashlight_time = 1.5  # seconds

	if flashlight_time > 0.0:
		flashlight_time -= delta
		if flashlight_time <= 0.0:
			flashlight.visible = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("Found it")
