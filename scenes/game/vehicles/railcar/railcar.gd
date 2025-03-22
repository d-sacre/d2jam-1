extends Node2D

################################################################################
#### CONSTANT DEFINITIONS ######################################################
################################################################################
const SPEED = 350

# REMARK: Only temporary, for development purposes
var _autoPlay : bool = false

@onready var _drawingArea : Node2D = $Sprite2D/drawingArea

func allow_drawing(status : bool) -> void:
	self._drawingArea.allow_drawing(status)

################################################################################
#### GODOT RUNTIME FUNCTION OVERRIDES ##########################################
################################################################################
func _process(delta: float) -> void:
	var _tmp_direction = 1

	# REMARK: Only temporary, for development purposes
	if Input.is_action_just_pressed("jump"):
		self._autoPlay = !self._autoPlay
	
	if not self._autoPlay:
		_tmp_direction = Input.get_axis("left", "right")

	self.position.x += _tmp_direction * SPEED * delta
