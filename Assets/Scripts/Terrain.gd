extends TileMap

var grid = [];

func _ready():
	grid.resize(50);
	for n in 50:
		grid[n] = [];
		grid[n].resize(50)
		
		for m in 33:
			if (m%18 == 0):
				grid[n][m] = 0;
			
			else:
				grid[n][m] = -1;
	
	for n in range(0, 32):
		for m in range(0, 32):
			if grid[n][m] == 0:
				set_cell(n,m,(n+m)%2)
	
	pass
