/// @description Insert description here
// You can write your code in this editor

if (e_health <= 0)
	instance_destroy();

x -= 1;

v_spd += grv;
colisionGround();
y += v_spd;