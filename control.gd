class_name Clicker
extends Control

#TODO Retool the update nodes as clones of PanelContainer
# but also gather them on ready as an array for updates

@export var label : Label
@export var fish: int = 0
var multiplier: float = 1
var buttons = 0
	
func add_fish() -> void:
	fish += multiplier

func update_label_text() -> void:
	label.text = "You have %d fish" %fish
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
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
	print(thisNode)
	fish -= thisNode.returnCost()
	update_label_text()
	multiplier += thisNode.upgrade()
	thisNode.updateLabel()
	
	
	
