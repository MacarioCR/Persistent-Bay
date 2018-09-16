/mob/living/simple_animal/hostile/creature
	name = "greed"
	desc = "You cant bear the sight of her."
	icon = 'icons/mob/critter.dmi'
	speak_emote = list("gibbers")
	icon_state = "otherthing"
	icon_living = "otherthing"
	icon_dead = "otherthing-dead"
	health = 60
	maxHealth = 60
	speed = 8
	destroy_surroundings = 1

	melee_damage_lower = 30
	melee_damage_upper = 50
	attacktext = "chomped"
	attack_sound = 'sound/weapons/bite.ogg'

	faction = "asteroid"

	//Space carp aren't affected by atmos.
	min_gas = null
	max_gas = null
	minbodytemp = 0


	var/starting_zlevel = 0
	var/inited = 0
	should_save = 0

/mob/living/simple_animal/hostile/creature/Found(var/atom/A)
	if(istype(A, /obj/machinery/mining/drill))
		var/obj/machinery/mining/drill/drill = A
		if(!drill.stat)
			stance = HOSTILE_STANCE_ATTACK
			return A
	if(istype(A, /obj/structure/ore_box))
		stance = HOSTILE_STANCE_ATTACK
		return A
	if(istype(A, /obj/item/weapon/ore))	
		stance = HOSTILE_STANCE_ATTACK
		return A

	
	
/mob/living/simple_animal/hostile/creature/New()
	..()
	starting_zlevel = z
	inited = 1
/mob/living/simple_animal/hostile/creature/Move()
	. = ..()
	if(.)
		if(inited && starting_zlevel != z)
			loc = null
			qdel(src)

/mob/living/simple_animal/hostile/creature/cult

	faction = "cult"

	min_gas = null
	max_gas = null
	minbodytemp = 0

	supernatural = 1

/mob/living/simple_animal/hostile/creature/cult/cultify()
	return
