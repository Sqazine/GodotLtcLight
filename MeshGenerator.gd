@tool
extends EditorScript

func _generate_light_plane_resource():
	var vertices = PackedVector3Array()
	vertices.push_back(Vector3(-8.0, 2.4, -1.0))
	vertices.push_back(Vector3(-8.0, 2.4,  1.0))
	vertices.push_back(Vector3(-8.0, 0.4,  1.0))
	vertices.push_back(Vector3(-8.0, 0.4, -1.0))
	
	var normals = PackedVector3Array()
	normals.push_back(Vector3(1.0, 0.0, 0.0))
	normals.push_back(Vector3(1.0, 0.0, 0.0))
	normals.push_back(Vector3(1.0, 0.0, 0.0))
	normals.push_back(Vector3(1.0, 0.0, 0.0))
	
	var uv = PackedVector2Array()
	uv.push_back(Vector2(0.0, 0.0))
	uv.push_back(Vector2(0.0, 1.0))
	uv.push_back(Vector2(1.0, 0.0))
	uv.push_back(Vector2(1.0, 1.0))
	
	var indices = PackedInt32Array()
	indices.push_back(0)
	indices.push_back(1)
	indices.push_back(2)
	indices.push_back(0)
	indices.push_back(2)
	indices.push_back(3)

	# 初始化 ArrayMesh。
	var mesh:ArrayMesh = ArrayMesh.new()
	var vertexArrays = []
	vertexArrays.resize(Mesh.ARRAY_MAX)
	vertexArrays[Mesh.ARRAY_VERTEX] = vertices
	vertexArrays[Mesh.ARRAY_NORMAL] = normals
	vertexArrays[Mesh.ARRAY_INDEX] = indices
	vertexArrays[Mesh.ARRAY_TEX_UV] = uv

	# 创建 Mesh。
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, vertexArrays)
	ResourceSaver.save(mesh,"res://LightPlaneMesh.tres", ResourceSaver.FLAG_COMPRESS)

func _generate_ground_plane_resource():
	var psize:float = 10.0
	
	var vertices = PackedVector3Array()
	vertices.push_back(Vector3(psize, 0.0, -psize))
	vertices.push_back(Vector3(-psize, 0.0, -psize))
	vertices.push_back(Vector3(-psize, 0.0, psize))
	vertices.push_back(Vector3(psize, 0.0, psize))
	
	var normals = PackedVector3Array()
	normals.push_back(Vector3(0.0, 1.0, 0.0))
	normals.push_back(Vector3(0.0, 1.0, 0.0))
	normals.push_back(Vector3(0.0, 1.0, 0.0))
	normals.push_back(Vector3(0.0, 1.0, 0.0))
	
	var uv = PackedVector2Array()
	uv.push_back(Vector2(0.0, 0.0))
	uv.push_back(Vector2(0.0, 1.0))
	uv.push_back(Vector2(1.0, 0.0))
	uv.push_back(Vector2(1.0, 1.0))
	
	var indices = PackedInt32Array()
	indices.push_back(0)
	indices.push_back(1)
	indices.push_back(2)
	indices.push_back(0)
	indices.push_back(2)
	indices.push_back(3)

	# 初始化 ArrayMesh。
	var mesh:ArrayMesh = ArrayMesh.new()
	var vertexArrays = []
	vertexArrays.resize(Mesh.ARRAY_MAX)
	vertexArrays[Mesh.ARRAY_VERTEX] = vertices
	vertexArrays[Mesh.ARRAY_NORMAL] = normals
	vertexArrays[Mesh.ARRAY_INDEX] = indices
	vertexArrays[Mesh.ARRAY_TEX_UV] = uv

	# 创建 Mesh。
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, vertexArrays)
	ResourceSaver.save(mesh,"res://GroundPlaneMesh.tres", ResourceSaver.FLAG_COMPRESS)

func _run() -> void:
	_generate_light_plane_resource()
	_generate_ground_plane_resource()
