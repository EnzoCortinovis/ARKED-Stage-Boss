extends KinematicBody2D

var health
var alive = true
var notDoingAnything = true 
onready var anim = $AnimatedSprite


# Called when the node enters the scene tree for the first time.
func _ready():
	health = 100




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		if health > 0 and notDoingAnything:
			anim.play("standing")
		if health == 0 and alive:
			anim.play("death")

func BossTakingDamages(dmg):
	if health > 0:
		health = health - dmg
		anim.stop()
		anim.play("hurt")
		notDoingAnything = false # pour blocker les autres anim de base 

func BossAttack():
	if health > 0:
		anim.stop()
		anim.play("attack")
		notDoingAnything = false # pour blocker les autres anim de base 

func _on_AnimatedSprite_animation_finished():
	if anim.animation == "death": # si l'anim de mort est finie
		alive = false
		anim.stop()
	if anim.animation == "hurt": # Si il a fini d'etre hurt il peut de nouveau stand
		notDoingAnything = true
	if anim.animation == "attack": # Si il a fini d'attaquer il peut de nouveau stand
		notDoingAnything = true
