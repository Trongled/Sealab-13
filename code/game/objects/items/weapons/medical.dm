/*
CONTAINS:
MEDICAL


*/


/obj/item/stack/medical/attack(mob/living/carbon/M as mob, mob/user as mob)
	if (M.stat == 2)
		var/t_him = "it"
		if (M.gender == MALE)
			t_him = "him"
		else if (M.gender == FEMALE)
			t_him = "her"
		user << "\red \The [M] is dead, you cannot help [t_him]!"
		return

	var/stoppedblood = 0
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/datum/organ/external/affecting = H.get_organ("chest")

		if(istype(user, /mob/living/carbon/human))
			var/mob/living/carbon/human/user2 = user
			affecting = H.get_organ(check_zone(user2.zone_sel.selecting))
		else
			if(!istype(affecting, /datum/organ/external) || affecting:burn_dam <= 0)
				affecting = H.get_organ("head")

		if(H.bloodloss > 0 && heal_brute > 0)		// fix wounds too if bruise pack
			for(var/datum/organ/wound/W in affecting.wounds)
				if(W.bleeding)
					if(stoppedblood)
						stoppedblood = 2
						break
					W.stopbleeding()
					stoppedblood = 1

		if (user)
			if (M != user)
				H.visible_message("\red [user] patches [stoppedblood - 1 ? "some of" : "the last of"] [H]'s wounds with [src]", "\red You patch up [stoppedblood - 1 ? "some of" : "the last of"] [H]'s wounds", "\red You hear something like gauze being ripped.")
			else
				H.visible_message("\red [user] patches [stoppedblood - 1 ? "some of" : "the last of"] their own wounds with [src]", "\red You patch up [stoppedblood - 1 ? "some of" : "the last of"] your wounds", "\red You hear something like gauze being ripped.")

	if (M.health < 50 && !stoppedblood)
		var/t_him = "it"
		if (M.gender == MALE)
			t_him = "him"
		else if (M.gender == FEMALE)
			t_him = "her"
		user << "\red \The [M] is wounded badly, this item cannot help [t_him]!"
		return


	if (!istype(M))
		user << "\red \The [src] cannot be applied to [M]!"
		return 1

	if ( ! (istype(user, /mob/living/carbon/human) || \
			istype(user, /mob/living/silicon) || \
			istype(user, /mob/living/carbon/monkey) && ticker && ticker.mode.name == "monkey") )
		user << "\red You don't have the dexterity to do this!"
		return 1

	if (user)
		if (M != user)
			user.visible_message( \
				"\blue [M] has been applied with [src] by [user].", \
				"\blue You apply \the [src] to [M]." \
			)
		else
			var/t_himself = "itself"
			if (user.gender == MALE)
				t_himself = "himself"
			else if (user.gender == FEMALE)
				t_himself = "herself"

			user.visible_message( \
				"\blue [M] applied [src] on [t_himself].", \
				"\blue You apply \the [src] on yourself." \
			)

	if (istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		var/datum/organ/external/affecting = H.get_organ("chest")

		if(istype(user, /mob/living/carbon/human))
			var/mob/living/carbon/human/user2 = user
			affecting = H.get_organ(check_zone(user2.zone_sel.selecting))
		else
			if(!istype(affecting, /datum/organ/external) || affecting:burn_dam <= 0)
				affecting = H.get_organ("head")

		if (affecting.heal_damage(src.heal_brute, src.heal_burn))
			H.UpdateDamageIcon()
		M.updatehealth()
	else
		M.heal_organ_damage((src.heal_brute/2), (src.heal_burn/2))

	use(1)



/obj/item/stack/medical/advanced/attack(mob/living/carbon/M as mob, mob/user as mob)
	if (M.stat == 2)
		var/t_him = "it"
		if (M.gender == MALE)
			t_him = "him"
		else if (M.gender == FEMALE)
			t_him = "her"
		user << "\red \The [M] is dead, you cannot help [t_him]!"
		return

	var/stoppedblood = 0
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/datum/organ/external/affecting = H.get_organ("chest")

		if(istype(user, /mob/living/carbon/human))
			var/mob/living/carbon/human/user2 = user
			affecting = H.get_organ(check_zone(user2.zone_sel.selecting))
		else
			if(!istype(affecting, /datum/organ/external) || affecting:burn_dam <= 0)
				affecting = H.get_organ("head")

		if(H.bloodloss > 0 && heal_brute > 0)		// fix wounds too if bruise pack
			for(var/datum/organ/wound/W in affecting.wounds)
				if(W.bleeding)
					if(stoppedblood)
						stoppedblood = 2
						break
					W.stopbleeding()
					stoppedblood = 1

		if (user)
			if (M != user)
				H.visible_message("\red [user] patches [stoppedblood - 1 ? "some of" : "the last of"] [H]'s wounds with [src]", "\red You patch up [stoppedblood - 1 ? "some of" : "the last of"] [H]'s wounds", "\red You hear something like gauze being ripped.")
			else
				H.visible_message("\red [user] patches [stoppedblood - 1 ? "some of" : "the last of"] their own wounds with [src]", "\red You patch up [stoppedblood - 1 ? "some of" : "the last of"] your wounds", "\red You hear something like gauze being ripped.")

	if (M.health < 0 && !stoppedblood)
		var/t_him = "it"
		if (M.gender == MALE)
			t_him = "him"
		else if (M.gender == FEMALE)
			t_him = "her"
		user << "\red \The [M] is wounded badly, this item cannot help [t_him]!"
		return


	if (!istype(M))
		user << "\red \The [src] cannot be applied to [M]!"
		return 1

	if ( ! (istype(user, /mob/living/carbon/human) || \
			istype(user, /mob/living/silicon) || \
			istype(user, /mob/living/carbon/monkey) && ticker && ticker.mode.name == "monkey") )
		user << "\red You don't have the dexterity to do this!"
		return 1

	if (user)
		if (M != user)
			user.visible_message( \
				"\blue [M] has been applied with [src] by [user].", \
				"\blue You apply \the [src] to [M]." \
			)
		else
			var/t_himself = "itself"
			if (user.gender == MALE)
				t_himself = "himself"
			else if (user.gender == FEMALE)
				t_himself = "herself"

			user.visible_message( \
				"\blue [M] applied [src] on [t_himself].", \
				"\blue You apply \the [src] on yourself." \
			)

	if (istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		var/datum/organ/external/affecting = H.get_organ("chest")

		if(istype(user, /mob/living/carbon/human))
			var/mob/living/carbon/human/user2 = user
			affecting = H.get_organ(check_zone(user2.zone_sel.selecting))
		else
			if(!istype(affecting, /datum/organ/external) || affecting:burn_dam <= 0)
				affecting = H.get_organ("head")

		if (affecting.heal_damage(src.heal_brute, src.heal_burn))
			H.UpdateDamageIcon()
		M.updatehealth()
	else
		M.heal_organ_damage((src.heal_brute/2), (src.heal_burn/2))

	use(1)