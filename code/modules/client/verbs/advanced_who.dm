
/* YW EDIT START
/client/verb/who_advanced()
	set name = "Advanced Who"
	set category = "OOC.Resources" //CHOMPEdit

	var/msg = span_bold("Current Players:") + "\n"

	var/list/Lines = list()

	if(holder)
		for(var/client/C in GLOB.clients)
			var/entry = "<tr><td>[C.key]"
			if(C.holder && C.holder.fakekey)
				entry += " " + span_italics("(as [C.holder.fakekey])")

			entry += "</td><td>"

			if(C.mob.real_name)
				switch(C.mob.stat)
					if(UNCONSCIOUS)
<<<<<<< HEAD
						entry += "<span class='darkgray'><b>Unconscious</b></span>" // these are literally all spans so I can apply .inverted to them because black on dark grey isn't legible
=======
						entry += span_darkgray(span_bold("Unconscious")) // these are literally all spans so I can apply .inverted to them because black on dark grey isn't legible
>>>>>>> 7416cbea22 ([MIRROR] next set of spans (#9247))

					if(DEAD)
						if(isobserver(C.mob))
							var/mob/observer/dead/O = C.mob
							if(O.started_as_observer)
								entry += "<span class='gray'>Observing</span>"
							else
<<<<<<< HEAD
								entry += "<span class='black'><b>Died</b></span>"
=======
								entry += span_black(span_bold("Died"))
>>>>>>> 7416cbea22 ([MIRROR] next set of spans (#9247))

					else
						entry += "<span class='green'>Playing</span>"

				entry += " as [C.mob.real_name]"

			else if(isnewplayer(C.mob))
<<<<<<< HEAD
				entry += "<span class='blue'><b>In lobby</b></span>"
=======
				entry += span_blue(span_bold("In lobby"))
>>>>>>> 7416cbea22 ([MIRROR] next set of spans (#9247))

			entry += "</td><td>"

			var/age
			if(isnum(C.player_age))
				age = C.player_age
			else
				age = 0

			if(age <= 1)
<<<<<<< HEAD
				age = "<span class='red'><b>[age]</b></span>"
			else if(age < 10)
				age = "<span class='orange'><b>[age]</b></span>"
=======
				age = span_red(span_bold("[age]"))
			else if(age < 10)
				age = span_orange(span_bold("[age]"))
>>>>>>> 7416cbea22 ([MIRROR] next set of spans (#9247))

			entry += "Age: [age]"
			entry += "</td><td>"

			if(is_special_character(C.mob))
				if(C.mob?.mind?.special_role)
					entry += "<b><span class='red'>[C.mob.mind.special_role]</span></b>"
				else
					entry += "<b><span class='red'>Antagonist</span></b>"

			entry += "</td><td>"

			if(C.is_afk())
				var/seconds = C.last_activity_seconds()
				entry += " (AFK - "
				entry += "[round(seconds / 60)] minutes, "
				entry += "[seconds % 60] seconds)"

			entry += "</td><td>"
			entry += " (<A HREF='?_src_=holder;[HrefToken()];adminmoreinfo=\ref[C.mob]'>?</A>)"
			entry += "</td></tr>"

			Lines += entry
	else
		for(var/client/C in GLOB.clients)
			var/entry = "\t"
			if(C.holder && C.holder.fakekey)
				entry += "[C.holder.fakekey]"
			else
				entry += "[C.key]"
			var/mob/observer/dead/O = C.mob
			if(isobserver(O))
				entry += " - <span class='gray'>Observing</span><br>"
			else if(istype(O,/mob/new_player))
				entry += " - <span class='blue'>In Lobby</span><br>"
			else
				entry += " - <span class='green'>Playing</span><br>"

			Lines += entry

	msg += "<table>"
	for(var/line in sortList(Lines))
		msg += "[line]"
	msg += "</table>"
<<<<<<< HEAD
	msg += "<b>Total Players: [length(Lines)]</b>"
	msg = "<span class='filter_notice'>" + msg + "</span>"
=======
	msg += span_bold("Total Players: [length(Lines)]")
	msg = span_filter_notice(msg)
>>>>>>> 7416cbea22 ([MIRROR] next set of spans (#9247))
	to_chat(src, msg)
YW EDIT STOP*/
