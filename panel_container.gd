extends Panel

# Steps when you duplicate:
# Copy script, then detach and attach the new one. 
# Change values below
# Change upgrade Label in var and func
# Change button argument
# Assign label variable
# Change name of upgrade

# Set the base values for this node
var upgradeCost : int = 5 # codt to upgrade
var multiplier : float = 1.5 # amount to increase the upgrade cost each time
var fishMult : int = 1 # amount to add to the fish-per-click

# The label needds a unique variable as it can be accessed from outside the script
@export var upgradeLabel : Label

# Upgrades the node. Makes it more expensive 
# then returns the amount to add each time ht main fish button is clicked. 
func upgrade():
	upgradeCost *= multiplier
	return fishMult

# updates the cost to upgrade the node
func updateLabel() -> void:
	upgradeLabel.text = "%d" %upgradeCost

# tells the main node what the upgrade cost is
func returnCost():
	return upgradeCost

# Enables the buy buttoin when it can be afforded. 
func buyButtonStatus(fish) -> void:
	if fish >= upgradeCost:
		$Button.disabled = false
	else:
		$Button.disabled = true

# Resets back to base values when the is a prestige
func reset() -> void:
	upgradeCost = 5 
	multiplier = 1.5
	fishMult = 1
	updateLabel()

# Called when the node enters the scene tree for the first time.
# Sets the label and adds the node to a group
func _ready() -> void:
	updateLabel()
	add_to_group("update_buttons")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
