@tool

extends Node

var LTC1Texture:ImageTexture
var LTC2Texture:ImageTexture

@onready var plane:MeshInstance3D = $Plane
@onready var LTC1Test:MeshInstance3D = $LTC1Test
@onready var LTC2Test:MeshInstance3D = $LTC2Test
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var width: int = 64
	var height: int = 64
	var data: PackedFloat32Array = LtcData.LTC1  # 你的浮点数组（长度需为 width * height）

	var image = Image.create(width, height, false, Image.FORMAT_RGBAF)
	image.set_data(width, height, false, Image.FORMAT_RGBAF, data.to_byte_array())
	LTC1Texture = ImageTexture.create_from_image(image)
	
	var data2: PackedFloat32Array = LtcData.LTC2  # 你的浮点数组（长度需为 width * height）
	var image2 = Image.create(width, height, false, Image.FORMAT_RGBAF)
	image2.set_data(width, height, false, Image.FORMAT_RGBAF, data2.to_byte_array())
	LTC2Texture = ImageTexture.create_from_image(image2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	plane.material_override.set_shader_parameter("LTC1",LTC1Texture)
	plane.material_override.set_shader_parameter("LTC2",LTC2Texture)
	LTC1Test.material_override.set_shader_parameter("materialDiffuse",LTC1Texture)
	LTC2Test.material_override.set_shader_parameter("materialDiffuse",LTC2Texture)
