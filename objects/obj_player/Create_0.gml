/// @desc Player Values

enum PSTATE {             // State of the player
	FREE,
	ATTACK
}

enum PDIR {				  // Direction of the player
	LEFT,
	RIGHT
}

p_health = 1;             // Players current health
p_state = PSTATE.FREE;    // Current state of the player
p_dir = PDIR.RIGHT;       // Current direction of the player

p_dmg = 1;                // The amount of damage the player does

h_spd = 0;                // The horizontal speed of the player
v_spd = 0;                // The vertical speed of the player
grv = 0.15;                // The gravity of the player (how many pixels 
						  // per second does the player fall)
p_jump = -1.7;              // What is the veritcal speed of the player when they jump (must be negative)
p_spd = 1.5;                // Base speed of the player

ex_jump = 1;              // How many midair jumps the player has
ex_jump_cap = 1;          // How many midair jumps the player can perform

hit_list = ds_list_create();  // List of enemies hit by attack