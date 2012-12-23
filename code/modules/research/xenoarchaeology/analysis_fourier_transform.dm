
obj/machinery/anomaly/fourier_transform
	name = "Fourier Transform spectroscope"
	desc = "A specialised, complex analysis machine."
	icon = 'virology.dmi'
	icon_state = "analyser"

obj/machinery/anomaly/fourier_transform/ScanResults()
	var/results = "The scan was inconclusive. Check sample integrity and carrier consistency."

	var/datum/geosample/scanned_sample
	var/carrier
	var/num_reagents = 0

	for(var/datum/reagent/A in held_container.reagents.reagent_list)
		var/datum/reagent/R = A
		if(istype(R, /datum/reagent/analysis_sample))
			scanned_sample = R.data
		else
			carrier = R.id
		num_reagents++

	if(num_reagents == 2 && scanned_sample && carrier)
		//all necessary components are present
		var/specifity = GetResultSpecifity(scanned_sample, carrier)
		var/distance = scanned_sample.artifact_distance
		if(distance > 0)
			var/accuracy = 0.9
			if(specifity > 0.6)
				distance += (0.2 * rand() - 0.1) * distance
			else
				var/offset = 1 - specifity
				distance += distance * rand(-100 * offset, 100 * offset) / 100
				accuracy = specifity
			results = "Fourier transform analysis on anomalous energy absorption through carrier ([carrier]) indicates source located inside emission radius ([100 * accuracy]% accuracy): [distance]."
			if(carrier == scanned_sample.source_mineral)
				results += "<br>Warning, analysis may be contaminated by high quantities of molecular carrier present throughout sample."
		else
			results = "Standard energy dispersion detected throughout sample."

	return results
