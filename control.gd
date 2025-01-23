class_name Clicker
extends Control

#TODO Add passive income upgrade
#TODO Could the upgrade be done in the node itself and it just
# emit a signal with the number of fish to take off and mult to increase?

# Export base variables that need to be updated 
# This is the main fish counter label
@export var fishLabel : Label
# This is the number of fish
@export var fish: int = 0
# This is the prestige gain label
@export var prestigeLabel : Label

# Other base variables
var baseMult: float = 1 # fish base multiplier, increased on Prestige
var fishMultiplier: float = 1 # Ongoing fish mult, increased by upgrades
var upgradeNodes = 0 # used on ready to collect up all the upgrade nodes

# Adds fish to the total
func add_fish() -> void:
	fish += fishMultiplier

# Updates any labels in direct child nodes
func update_label_text() -> void:
	fishLabel.text = "You have %d fish" %fish
	prestigeLabel.text = "Prestige for %d added multiplier" %calculatePrestige()

# Returns current prestige multiplier
func calculatePrestige():
	var spam = floor(fish / 1500)
	return spam

# Carries out the prestige. 
# Sets the new base mult, sets the finsh mult to match it
# then resets fish and all upgrade nodes
func prestige() -> void:
	baseMult += calculatePrestige()
	fishMultiplier = baseMult
	fish = 0
	update_label_text()
	for i in upgradeNodes:
		i.reset()
	
# Called when the node enters the scene tree for the first time.
# Gathers the upgrade nodes for future use
# Then sets all their labels to display the cost
func _ready() -> void:
	upgradeNodes = get_tree().get_nodes_in_group("update_buttons")
	for i in upgradeNodes:
		i.updateLabel()


# Called every frame. 'delta' is the elapsed time since the previous frame.
# Checks each upgrade node to see if the buy button should be enabled
func _process(delta: float) -> void:
	for i in upgradeNodes:
		i.buyButtonStatus(fish)

# Button press for the mainn buy fish button
func _on_button_pressed() -> void:
	add_fish()
	update_label_text()

# Button press for the Buy button on each upgrade
# Each node should pass their own path in, plus cost. 
func _on_node_button_pressed(path, updateNumber) -> void:
	var thisNode = self.get_node(path)
	fish -= thisNode.returnCost()
	update_label_text()
	fishMultiplier += thisNode.upgrade()
	thisNode.updateLabel()
	
	
func _on_prestige_button_pressed() -> void:
	prestige()
