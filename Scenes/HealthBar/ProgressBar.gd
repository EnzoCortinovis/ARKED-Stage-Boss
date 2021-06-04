extends ProgressBar

var mainBar = self.get("custom_styles/fg")
onready var secondBar = $ProgressBar2.get("custom_styles/fg")



func _ready():
	set_process(false)
	#self.bg_color = Color(0.93,0.05,0.11)
	#mainBar.bg_color = Color(0.27,0.6,0.05)
	
	
func set_bar_value(value):
	self.value = value
	#set_process(false)
	$Timer.stop()
	$Timer.start(0)
	if(value > $ProgressBar2.value):
		$ProgressBar2.value = value

func _on_Timer_timeout():
	set_process(true)

func _process(delta):
	$ProgressBar2.value = lerp($ProgressBar2.value, value, 0.1)
	if($ProgressBar2.value - value <= 0.5):
		$ProgressBar2.value = value
		set_process(false)




func _on_Button_pressed():
	if(value <= 0):
		set_bar_value(100)
	else:
		set_bar_value(value - 10)
