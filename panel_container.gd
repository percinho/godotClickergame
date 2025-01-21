class_name upgradePanel
extends Panel

var upgradeCost = 500 
var multiplier = 1.5
@export var upgradeLabel : Label

func upgrade() -> void:
	upgradeCost *= multiplier

func updateLabel() -> void:
	print("we got here")
	upgradeLabel.text = "%d" %upgradeCost

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	updateLabel()
	add_to_group("update_buttons")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
