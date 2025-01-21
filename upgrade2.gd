#class_name childPanel
extends Panel

var upgradeCost : int = 50 
var multiplier : float = 1.5
var fishMult : int = 10
@export var upgradeLabel2 : Label


func upgrade():
	upgradeCost *= multiplier
	return fishMult

func updateLabel() -> void:
	print("we got here")
	upgradeLabel2.text = "%d" %upgradeCost

func returnCost():
	return upgradeCost

func buyButtonStatus(fish) -> void:
	if fish >= upgradeCost:
		$Button.disabled = false
	else:
		$Button.disabled = true

 # Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(self.upgradeCost)
	print("test")
	updateLabel()
	add_to_group("update_buttons")


 # Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
