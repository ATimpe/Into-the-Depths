// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function colisionGround(){
	// Vetrical Colision
	if (place_meeting(x, y + v_spd, obj_wall)) {
		while (!place_meeting(x, y + sign(v_spd), obj_wall)) {
			y += sign(v_spd);
		}
		v_spd = 0;	
	}
}