
//todo
/datum/artifact_effect/cellcharge
	effecttype = "cellcharge"

/datum/artifact_effect/cellcharge/DoEffectTouch(var/mob/user)
	if(user)
		if(istype(user, /mob/living/silicon/robot))
			var/mob/living/silicon/robot/R = user
			for (var/obj/item/weapon/cell/D in R.contents)
				D.charge += 250
				R << "\blue SYSTEM ALERT: Large energy boost detected!"
			return 1

/datum/artifact_effect/cellcharge/DoEffectAura()
	if(holder)
		for (var/obj/machinery/power/apc/C in range(200, holder))
			for (var/obj/item/weapon/cell/B in C.contents)
				B.charge += 100
		for (var/obj/machinery/power/smes/S in range (src.effectrange,src)) S.charge += 250
		for (var/mob/living/silicon/robot/M in world)
			for (var/obj/item/weapon/cell/D in M.contents)
				D.charge += 100
				M << "\blue SYSTEM ALERT: Energy boost detected!"
		return 1

/datum/artifact_effect/cellcharge/DoEffectPulse()
	if(holder)
		for (var/obj/machinery/power/apc/C in range(200, holder))
			for (var/obj/item/weapon/cell/B in C.contents)
				B.charge += 100
		for (var/obj/machinery/power/smes/S in range (src.effectrange,src)) S.charge += 250
		for (var/mob/living/silicon/robot/M in world)
			for (var/obj/item/weapon/cell/D in M.contents)
				D.charge += 100
				M << "\blue SYSTEM ALERT: Energy boost detected!"
		return 1
