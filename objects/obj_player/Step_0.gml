/// @desc Movement

if (place_meeting(x, y, obj_enemy))
	playerHit(1);

if (p_health <= 0)
	instance_destroy();

key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);
key_attack = keyboard_check_pressed(ord("X"));

// returns -1, 0, or 1 depending on what is pressed
var _move = 0;
v_spd += grv;
playerJump();

switch (p_state) {
	case PSTATE.FREE:
		_move = key_right - key_left;
		if (_move > 0)
			p_dir = PDIR.RIGHT;
		else if (_move < 0)
			p_dir = PDIR.LEFT;
		
		if (key_attack) {
			alarm_set(0, sprite_get_number(spr_attack)/sprite_get_speed(spr_attack));
			p_state = PSTATE.ATTACK;
			if (p_dir == PDIR.RIGHT)
				sprite_index = spr_player_attack_right;
			if (p_dir == PDIR.LEFT)
				sprite_index = spr_player_attack_left;
			image_index = 0;
			ds_list_clear(hit_list);
		}
		// h_spd is the direction times the speed
		// v_spd is incremented by the gravity value
		h_spd = _move * p_spd;
		break;
		
		case PSTATE.ATTACK:
			mask_index = p_dir == PDIR.RIGHT ? spr_attack_right_hitb : spr_attack_left_hitb;
			var _hitByAttackFrame = ds_list_create();
			var _hits = instance_place_list(x, y, obj_enemy, _hitByAttackFrame, false);
			for (var i = 0; i < _hits; i++) {
				var _hitInstance = _hitByAttackFrame[| i];
				// If the instance hasn't already been hit
				if (ds_list_find_index(hit_list, _hitInstance) == -1) {
					ds_list_add(hit_list, _hitInstance);
					enemyHit(_hitInstance, obj_player.p_dmg);
				}	
			}
			ds_list_destroy(_hitByAttackFrame);
			mask_index = spr_player;
			break;
		
}

playerColision(_move);

// Moves player based on spd
x += h_spd;
y += v_spd;