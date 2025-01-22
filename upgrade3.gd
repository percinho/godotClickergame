#class_name childPanel
extends Panel

var upgradeCost : int = 500
var multiplier : float = 1.5
var fishMult : int = 100
@export var upgradeLabel3 : Label


func upgrade():
	upgradeCost *= multiplier
	return fishMult

func updateLabel() -> void:
	upgradeLabel3.text = "%d" %upgradeCost

func returnCost():
	return upgradeCost

func reset() -> void:
	upgradeCost = 500 
	multiplier = 1.5
	fishMult = 100
	updateLabel()

func buyButtonStatus(fish) -> void:
	if fish >= upgradeCost:
		$Button.disabled = false
	else:
		$Button.disabled = true

 # Called when the node enters the scene tree for the first time.
func _ready() -> void:
	updateLabel()
	add_to_group("update_buttons")


 # Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
