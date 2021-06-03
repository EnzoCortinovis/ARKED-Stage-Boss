extends Node2D

var HealthBar = preload("res://Scenes/HealthBar/ProgressBar.tscn")

var rng = RandomNumberGenerator.new()
var random_num

onready var Golem_1 = preload("res://Scenes/LesBoss/Golem_1.tscn")
onready var Golem_2 = preload("res://Scenes/LesBoss/Golem_2.tscn")
onready var Golem_3 = preload("res://Scenes/LesBoss/Golem_3.tscn")
onready var Minotaur_1 = preload("res://Scenes/LesBoss/Minotaur_1.tscn")
onready var Minotaur_2 = preload("res://Scenes/LesBoss/Minotaur_2.tscn")
onready var Minotaur_3 = preload("res://Scenes/LesBoss/Minotaur_3.tscn")
onready var Goblin = preload("res://Scenes/LesBoss/Goblin.tscn")
onready var Orc = preload("res://Scenes/LesBoss/Orc.tscn")
onready var Ogre = preload("res://Scenes/LesBoss/Ogre.tscn")



# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	random_num = rng.randi_range(1,9)
	instanciateBoss()
	



func instanciateBoss():
	var healthInstance = HealthBar.instance()
	$Scene.add_child(healthInstance)
	var bossTab = [Golem_1,Golem_2,Golem_3,Minotaur_1,Minotaur_2,Minotaur_3,Goblin,Orc,Ogre]
	var bossInstance = bossTab[random_num-1].instance()
	
	$Scene.add_child(bossInstance)
	
func loadRightScene(num): # pas utilisé pour le moment
	match num:
		1:
			var Golem_1 = load("res://Scenes/LesBoss/Golem_1.tscn")
		2:
			var Golem_2 = load("res://Scenes/LesBoss/Golem_2.tscn")
		3:
			var Golem_3 = load("res://Scenes/LesBoss/Golem_3.tscn")
		4:
			var Minotaur_1 = load("res://Scenes/LesBoss/Minotaur_1.tscn")
		5:
			var Minotaur_2 = load("res://Scenes/LesBoss/Minotaur_2.tscn")
		6:
			var Minotaur_3 = load("res://Scenes/LesBoss/Minotaur_3.tscn")
		7:
			var Goblin = load("res://Scenes/LesBoss/Goblin.tscn")
		8:
			var Orc = load("res://Scenes/LesBoss/Orc.tscn")
		9:
			var Ogre = load("res://Scenes/LesBoss/Ogre.tscn")
	rpc("instanciateBoss")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
