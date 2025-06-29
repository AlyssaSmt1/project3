extends MeshInstance3D

func _ready():
	var radius = 2
	var height = 4  
	var segments = 32 
	var delta = 2 * PI / segments
	
	var verts = PackedVector3Array()
	

	for i in range(segments):
		var x = radius * cos(i * delta)
		var z = radius * sin(i * delta)
		verts.append(Vector3(x, 0, z))
	
	
	for i in range(segments):
		var x = radius * cos(i * delta)
		var z = radius * sin(i * delta)
		verts.append(Vector3(x, height, z))
	

	var indices = PackedInt32Array()
	for i in range(segments):
		var next_i = (i + 1) % segments 
	
		indices.append(i) 
		indices.append(i + segments) 
		indices.append(next_i) 

		indices.append(i + segments)  
		indices.append(next_i + segments) 
		indices.append(next_i)  
	
	
	var base_start = verts.size() - segments * 2
	for i in range(segments - 2):
		# Untere Fläche
		indices.append(0)
		indices.append(i + 1)
		indices.append(i + 2)
		
		# Obere Fläche
		indices.append(segments)
		indices.append(segments + i + 2)
		indices.append(segments + i + 1)


	var surface_array = []
	surface_array.resize(Mesh.ARRAY_MAX)
	surface_array[Mesh.ARRAY_VERTEX] = verts
	surface_array[Mesh.ARRAY_INDEX] = indices
	
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, surface_array)

func _process(delta: float) -> void:
	pass
