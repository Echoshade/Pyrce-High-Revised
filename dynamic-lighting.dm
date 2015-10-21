/********************************************************************\
	lightingdemo.dm
	Shadowdarke (shadowdarke@hotmail.com)
	December 12, 2002

	This file provides a demonstration of the
	sd_DynamicAreaLighting library.

\********************************************************************/

var
	daytime = "Night"	// Used by mob/Stat() to disply the time of day

var
	time11 = 10	// how long it stays in this light state
	light11 = 0	// how much light there is outside
	d11 = 1		// amount of light increase
	canturnonlights=1
proc/NightCycle()
	// a simple day/night cycle
	//while(1)	// keep doing until the program ends
	//sleep(time)	// wait time ticks
	time11 = 10	// set time to the default
	light11 += d11	// shift the light amount

	// if light level is outside the allowed range
	if((light11 < 0) || (light11 > 4))
		d11 = -d11	// switch the direction of light changes
		light11 += d11	// put light back where it was
		time11 = 100	// make this light period last longer

	// just sets the time of day for the stat display
	switch(d11*light11)
		if(-4,4)
			daytime = "Day"
		if(-3,-2,-1)
			daytime = "Dusk"
		if(0)
			daytime = "Night"
		if(1,2,3)
			daytime = "Dawn"
	world<<"d11=[d11] light11=[light11]"
	sd_OutsideLight(light11)	// tell the library to update all the outside areas

area/demoarea
	icon = 'sd_dot.dmi'
	layer = 50
	sd_outside = 1
	sd_lighting = 1
	name=""
	mouse_opacity=0
	New()
		..()
		/* Remove the area icon, so you can see it in the map maker, but not in
			the demo. */
		icon = null
		mouse_opacity=0
area/
	outside
		icon_state = "yellow"
		sd_outside = 1
		trueoutside = 1
		sd_lighting = 1
		name=""
		mouse_opacity=0
		s//d_light_level = 4


/*	sd_DynamicAreaLighting is based on the built in luminosity var.
	All you have to do for static atoms is set luminosity. */

obj/zlamp
	icon = 'sd_demolight.dmi'
	luminosity = 6

/*	For lightsources that change luminosity, use
	sd_SetLuminosity(new_luminosity) instead of setting luminosity
	directly so the library can readjust local light levels */

/*mob
	//icon = 'sd_smiley.dmi'
	verb
		dark_icon()
			set desc = "Change the icon used for darkness."
			var
				list/options = list("3 shade dithered icon", "4 shade \
					dithered icon", "4 shade transparent icon", "4 shade \
					transparent icon (ligher version)", "7 shade \
					transparent icon")
				new_icon
				new_shades
			var/style = input("Choose a style of icon for the darkness.",\
				"Darkness style") as null|anything in options
			switch(style)
				if("3 shade dithered icon")
					new_icon = 'sd_dark_dither3.dmi'
					new_shades = 3
				if("4 shade dithered icon")
					new_icon = 'sd_darkstates.dmi'
					new_shades = 4
				if("4 shade transparent icon")
#if DM_VERSION>=400
					new_icon = 'sd_dark_alpha4.dmi'
					new_shades = 4
#else
					src << "Compile with BYOND 4.0 or greater for \
						transparent icons."
#endif
				if("4 shade transparent icon (ligher version)")
#if DM_VERSION>=400
					new_icon = 'sd_dark_alpha4b.dmi'
					new_shades = 4
#else
					src << "Compile with BYOND 4.0 or greater for \
						transparent icons."
#endif
				if("7 shade transparent icon")
#if DM_VERSION>=400
					new_icon = 'sd_dark_alpha7.dmi'
					new_shades = 7
#else
					src << "Compile with BYOND 4.0 or greater for \
						transparent icons."
#endif
			if(new_icon && new_icon!=sd_dark_icon)
				sd_SetDarkIcon(new_icon, new_shades)
				world << "Darkness icon changed to [sd_dark_icon]."

		/low(n as num)
			set desc = "(luminosity) Set your mob's luminosity."
			if(n>world.view)
				usr << "<font color=red><b>Warning:</b> Since \
					sd_DynamicAreaLighting uses the view() proc, \
					large luminosity settings may cause strange effects."
			usr.sd_SetLuminosity(n)

		view_size(n as num)
			set desc = "(view size) change the size of your view window."
			if(client) client.view = n*/

/*	Anything that changes opacity during the game, like this door turf,
	should use the sd_SetOpacity(new_opacity) proc to change opacity.
	You will also want to follow the example in the sd_SetOpacity()
	proc to remove and reapply lighting effects when you dynamically
	create turfs. */
turf
	door
		icon = 'sd_demodoor.dmi'
		density = 1
		opacity = 1
		proc
			open()
				sd_SetOpacity(0)
				density = 0
				icon_state = "open"
				spawn(50) close()

			close()
				if(!contents.len)
					sd_SetOpacity(1)
					density = 1
					icon_state = ""
				else
					spawn(10) close()

		New()
			..()
			// if this door is outside, add it to the light_spill turfs
			var/area/A = loc
			if(A.sd_outside)
				sd_light_spill_turfs += src

/*	This window turf will automatically be added to the list of light_spill
	turfs. The turfs in this list are focal points for light spilling
	from ouside areas into inside areas. */
	window
		icon = 'sd_demowindow.dmi'
		sd_light_spill = 1
		density = 1

/********************************************************************\
	That's all you need to know to use sd_DynamicAreaLighting.
	Everything beyond this point are just extras to enhance the
	demo, like mob counts and stat panels.
\********************************************************************/

var
	// 1 in lamp_chance number of turfs will spawn a lamp when created
	lamp_chance = 100	// 1 in 100 (1% chance)

	// 1 in mob_chance turfs will spawn a mob when created
	mob_chance = 25	// 1 in 25 (4% chance)

	// these three vars are just for display in the statpanel
	mobcount=0	// count of all the mobs in the demo
	glowmobs=0	// count of all the glowing mobs
	lampcount=0	// count of all the lamps in the demo

mob
	var
		making = /mob
	sd_SetLuminosity(n)
		/*	this extra code is added so the demo can track the number of
			luminous mobs. */
		if(luminosity&&!n)		// if it's already glowing & we turn the glow off
			glowmobs--			// decrease the glowmobs counter
		else if(!luminosity&&n)	// if the mob isn't glowing & we turn it on
			glowmobs++			// increase the glowmobs counter
		..()

	Login()
		..()
		//walk(src,0)	// cancel the random walking
		//world << "<b>[src] logs in.</b>"
		sd_SetLuminosity(0)
		//icon_state = "[rand(4,8)]"
