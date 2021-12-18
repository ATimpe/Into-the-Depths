/// Controls colision of the player
function playerColision(_move){
	// Horizontal Colision
	if (place_meeting(x + h_spd, y, obj_wall) && h_spd != 0) {
		while (!place_meeting(x + _move, y, obj_wall)) {
			x += _move;
		}
		h_spd = 0;
	}

	// Vetrical Colision
	if (place_meeting(x, y + v_spd, obj_wall) && v_spd != 0) {
		while (!place_meeting(x, y + sign(v_spd), obj_wall)) {
			y += sign(v_spd);
		}
		v_spd = 0;
	}
}