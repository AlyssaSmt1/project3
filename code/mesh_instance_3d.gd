extends MeshInstance3D

# Called when the node enters the scene tree for the first time.
func _ready():
	var radius = 2
	var segments = 10
	var delta = 2 * PI / segments
	
	var verts = PackedVector3Array()
	verts.append(Vector3(0, 0, 0))  # Zentrum des Kreises
	
	# Generiere die Vertices entlang des Kreises
	for i in range(segments):
		var x = radius * cos(i * delta)
		var z = radius * sin(i * delta)
		verts.append(Vector3(x, 0, z))
	
	var indices = PackedInt32Array()
	# Erstelle die Indizes für die Dreiecke
	for i in range(1, segments):
		# Erster Dreieck (0, i, i+1)
		indices.append(0)
		indices.append(i)
		indices.append(i + 1)
	
	# Letztes Dreieck (0, segments, 1)
	indices.append(0)
	indices.append(segments)
	indices.append(1)
	
	var surface_array = []
	surface_array.resize(Mesh.ARRAY_MAX)
	surface_array[Mesh.ARRAY_VERTEX] = verts
	surface_array[Mesh.ARRAY_INDEX] = indices
	
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, surface_array)
	
	pass 

func _process(delta: float) -> void:
	pass
