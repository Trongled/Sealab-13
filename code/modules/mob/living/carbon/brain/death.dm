/mob/living/carbon/brain/death(gibbed)
	if(!gibbed && container && istype(container, /obj/item/device/mmi)) //If not gibbed but in a container.
		container.icon_state = "mmi_dead"
	return ..(gibbed,"beeps shrilly as the MMI flatlines!")

/mob/living/carbon/brain/gib()

	if(container && istype(container, /obj/item/device/mmi))
		del(container)//Gets rid of the MMI if there is one
	if(loc)
		if(istype(loc,/obj/item/organ/brain))
			del(loc)//Gets rid of the brain item
	..(null,1)