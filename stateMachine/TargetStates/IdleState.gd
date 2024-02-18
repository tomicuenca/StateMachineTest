extends TargetState

func enter():
	print("Entrando a estado Idle")
	target.animation = "idle"

func process(delta):
	if Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		state_machine.change_to("RunningState")
