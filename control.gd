class_name Clicker
extends Control


@export var label : Label
@export var up1CostLabel : Label
@export var up2CostLabel : Label
var fish: int = 0
var multiplier: float = 1
@export var upgradeOneCost = 5
@export var upgradeTwoCost = 1000
	
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
	update_cost_label()


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
