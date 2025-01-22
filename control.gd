class_name Clicker
extends Control

#TODO Retool the update nodes as clones of PanelContainer
# but also gather them on ready as an array for updates

@export var label : Label
@export var fish: int = 0
@export var prestigeLabel : Label
var baseMult: float = 1
var fishMultiplier: float = 1
var buttons = 0
	
func add_fish() -> void:
	fish += fishMultiplier

func update_label_text() -> void:
	label.text = "You have %d fish" %fish
	prestigeLabel.text = "Prestige for %f added multiplier" %calculatePrestige()

func calculatePrestige():
	var spam = floor(fish / 1000)
	return spam * 0.5

func prestige() -> void:
	baseMult += calculatePrestige()
	fishMultiplier = baseMult
	fish = 0
	for i in buttons:
		i.reset()
	update_label_text()
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(2616 /  1000)
	buttons = get_tree().get_nodes_in_group("update_buttons")
	for i in buttons:
		i.updateLabel()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for i in buttons:
		i.buyButtonStatus(fish)
	pass


func _on_button_pressed() -> void:
	add_fish()
	update_label_text()


func _on_node_button_pressed(path, updateNumber) -> void:
	var thisNode = self.get_node(path)
	fish -= thisNode.returnCost()
	update_label_text()
	fishMultiplier += thisNode.upgrade()
	thisNode.updateLabel()
	
	
func _on_prestige_button_pressed() -> void:
	prestige()
