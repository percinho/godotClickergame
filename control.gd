class_name Clicker
extends Control

#TODO Retool the update nodes as clones of PanelContainer
# but also gather them on ready as an array for updates

@export var label : Label
@export var up1CostLabel : Label
@export var up2CostLabel : Label
var fish: int = 0
var multiplier: float = 1
@export var upgradeOneCost = 5
@export var upgradeTwoCost = 1000
@export var upgrade3 : Node = PanelContainer.new()
	
func add_fish() -> void:
	fish += multiplier

func update_label_text() -> void:
	label.text = "You have %d fish" %fish

func update_cost_label() -> void:
	up1CostLabel.text = "%d" %upgradeOneCost
	up2CostLabel.text = "%d" %upgradeTwoCost

func buy_upgrade(cost):
	fish -= cost
	return cost * 1.4
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	upgrade3.updateLabel()
	update_cost_label()
	var spam = get_tree().get_nodes_in_group("update_buttons")
	for i in spam:
		print(i.upgradeCost)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	add_fish()
	update_label_text()


func _on_up1Buy_button_pressed(num, mult) -> void:
	match num:
		1:
			upgradeOneCost = buy_upgrade(upgradeOneCost)
		2:
			upgradeTwoCost = buy_upgrade(upgradeTwoCost)
	
	update_cost_label()
	multiplier += mult
	update_label_text()



func _on_node_button_pressed(path, updateNumber) -> void:
	var thisNode = self.get_node(path)
	fish -= thisNode.upgradeCost
	thisNode.upgrade()
	thisNode.updateLabel()
	
	
	
