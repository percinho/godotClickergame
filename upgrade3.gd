#class_name childPanel
extends Panel

# Steps when you duplicate:
# Copy script, then detach and attach the new one. 
# Change values below
# Change upgrade Label in var and func
# Change button argument
# Assign label variable
# Change name of upgrade

var upgradeCost : int = 500
var multiplier : float = 1.5
var fishMult : int = 100
@export var upgradeLabel3 : Label


func upgrade():
	upgradeCost *= multiplier
	return fishMult

func updateLabel() -> void:
	print("we got here")
	upgradeLabel3.text = "%d" %upgradeCost

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
