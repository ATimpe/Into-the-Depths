/// Controls the jumping mechanics for players
function playerJump(){
	if (place_meeting(x, y + 1, obj_wall) && key_jump) {
		v_spd = p_jump;
	}

	if (!place_meeting(x, y + 1, obj_wall) && key_jump && ex_jump >= 1) {
		v_spd = p_jump;
		ex_jump--;
	}
}