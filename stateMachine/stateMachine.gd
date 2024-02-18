extends Node
class_name StateMachine

@onready var node_to_control = get_parent()
@export_node_path('TargetState') var initial_state
@onready var state = get_node(initial_state)

func _ready():
	call_deferred("_enter_state")

func _enter_state():
	state.target = node_to_control
	state.state_machine = self
	state.enter()

func change_to(new_state):
	state = get_node(new_state)
	_enter_state()

func _process(delta):
	if state.has_method("process"):
		state.process(delta)

func _input(event):
	if state.has_method("input"):
		state.process(event)
