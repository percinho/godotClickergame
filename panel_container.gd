extends Panel

# Steps when you duplicate:
# Copy script, then detach and attach the new one. 
# Change values below
# Change upgrade Label in var and func
# Change button argument
# Assign label variable
# Change name of upgrade

var upgradeCost : int = 5 
var multiplier : float = 1.5
var fishMult : int = 1
@export var upgradeLabel : Label

func upgrade():
	upgradeCost *= multiplier
	return fishMult

func updateLabel() -> void:
	upgradeLabel.text = "%d" %upgradeCost

func returnCost():
	return upgradeCost

func buyButtonStatus(fish) -> void:
	if fish >= upgradeCost:
		$Button.disabled = false
	else:
		$Button.disabled = true

func reset() -> void:
	upgradeCost = 5 
	multiplier = 1.5
	fishMult = 1
	updateLabel()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	updateLabel()
	add_to_group("update_buttons")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
