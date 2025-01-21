extends Panel

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

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	updateLabel()
	add_to_group("update_buttons")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
