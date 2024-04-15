x = mouse_x
y = mouse_y
depth = -4
scroll = false
points = []

function searchroombyxy(xx, yy) {
	room_found = false
	for (i = 0; i < array_length(opersistent.rooms); i++) {
		if opersistent.rooms[i].xx == xx && opersistent.rooms[i].yy == yy {
			room_found = true
			return { r: opersistent.rooms[i], i: i }
		}
	}
	if !room_found {
		return "roomnotfound"
	}
}

enum Direction {
    RightUp,
    RightDown,
    LeftUp,
    LeftDown,
    None
}

function analyzeDirection(pointArray) {
    var lastDirection = Direction.None
    var directionChanges = 0
	var alldirs = []
    var initialDirection = Direction.None
    var lastPoint = pointArray[0]
    
    for (var i = 1; i < array_length(pointArray); i++) {
        var currentPoint = pointArray[i]
        var currentDirection = Direction.None
        if (currentPoint.xx > lastPoint.xx) {  // moving right
            if (currentPoint.yy < lastPoint.yy) {
                currentDirection = "rightup"
            } else if (currentPoint.yy > lastPoint.yy) {
                currentDirection = "rightdown"
            }
        } else if (currentPoint.xx < lastPoint.xx) {  // moving left
            if (currentPoint.yy < lastPoint.yy) {
                currentDirection = "leftup"
            } else if (currentPoint.yy > lastPoint.yy) {
                currentDirection = "leftdown"
            }
        }
        
        if (i == 1) {
            initialDirection = currentDirection
			if !(initialDirection == Direction.None) {
				array_push(alldirs, initialDirection)
			}
        } else if (currentDirection != lastDirection) {  // change happens add to array
			array_push(alldirs, currentDirection)
            directionChanges++
        }
        
        lastDirection = currentDirection
        lastPoint = currentPoint
    }
	for (var i = 1; i < array_length(alldirs); i++) {
		if alldirs[i] == Direction.None {
			array_delete(alldirs, i, 1)
		}
	}
	return alldirs
	/*
	if (initialDirection == Direction.RightUp && directionChanges > 0) {
	}
	*/
}