
obj
	Lights
		icon='school.dmi'
		icon_state="lights"
		layer=7
		//luminosity=8
		mouse_opacity=0
		//invisibility=101
		var/intensity=6
		New()
			..()
			spawn(10)src.sd_SetLuminosity(8)
obj/Switch_For_Lights
	name="Light Switch"
	icon='school.dmi'
	icon_state="switch on"
	var/switched="On"
	var/power="On"
	var/onlist=1
	verb
		Press_Switch()
			set src in oview(1)
			set category=null
			if(usr.playing==0)return
			if(usr.shinigami==1)return
			if(gamemode=="Slender")
				usr << "The lights don't seem to work properly."
				return
			if(power=="Off")return
			if(switched=="Off")
				for(var/obj/Lights/A in world)
					if(A.tag==src.tag)
						//A.luminosity=A.intensity
						A.sd_SetLuminosity(8)
						//A.luminosity = 6
						switched="On"
						icon_state="switch on"
						//A.sd_SetLuminosity(7)
			else
				for(var/obj/Lights/A in world)
					if(A.tag==src.tag)
						//A.luminosity=0
						A.sd_SetLuminosity(0)
						switched="Off"
						icon_state="switch off"
						//sd_SetLuminosity(0)
	DblClick()
		set category=null
		if(usr.playing==0)return
		if(usr.shinigami==1)return
		if(power=="Off")return
		if(src in oview(1))
			if(switched=="Off")
				for(var/obj/Lights/A in world)
					if(A.tag==src.tag)
						A.luminosity=A.intensity
						switched="On"
						icon_state="switch on"
						A.icon_state="lights"
			else
				for(var/obj/Lights/A in world)
					if(A.tag==src.tag)
						A.luminosity=0
						switched="Off"
						icon_state="switch off"
						A.icon_state="none"
var/fuses[] = new/list()
var/fusebuts[] = new/list()
obj
	Fuse_Box
		icon='school.dmi'
		icon_state="circuit box"
		verb
			Use()
				set category=null
				set src in oview(1)
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				winshow(usr,"switchbox",1)
				fuses= new/list()
				for(var/obj/Switch_For_Lights/A in world)
					if(A.onlist==1)
						fuses+="[A.tag]"
				//fuses+="Hallways"
				//winset(usr, "fboxgrid", "cells=2x[fuses.len]" )
				usr.usingswitchbox=1
				//for(var/obj/Switch_For_Lights/A in world)
				for( var/s=1 to fuses.len )
					var/k = fuses[s]
					usr << output( "<a href='?src=\ref[src];fuse=[url_encode(k)]'>[k]</a>", "fboxgrid:1,[s]" )
					for(var/obj/Switch_For_Lights/O in world)
						if(O.tag==k)
							var/pow="On"
							if(O.power=="On")
								pow="<font color=green><font size=2>On</font>"
							else
								pow="<font color=red><font size=2>Off</font>"
							usr << output( "[pow]", "fboxgrid:2,[s]" )
							//break
obj
	Cameras
		Camera
			icon='placeables.dmi'
			icon_state="camera"
		Monitor
			icon='placeables.dmi'
			icon_state="monitor"
			name="Monitor"
			density=1
			var/deleted=0
			verb
				View_Security_Camera()
					set category=null
					set src in oview(1)
					if(usr.playing==0)return
					if(usr.zombie==1)return
					var/camlist=new/list()
					for(var/obj/Cameras/Camera/O in world)
						camlist+="[O.tag]"
					camlist+="Cancel"
					var/picker=input(usr,"Which camera would you like to view?") in camlist
					for(var/obj/Cameras/Camera/O in world)
						if(O.tag==picker)
							usr.client:perspective = EYE_PERSPECTIVE
							usr.client.eye = O.loc
							usr.usingcamera=1
				View_Tapes()
					set src in oview(1)
					set category=null
					if(usr.playing==0) return
					if(usr.zombie==1)return
					if(tapesfunction=="Off")
						usr << "The tapes don't see to be functioning properly"
						return
					if(gamemode=="Normal"||gamemode=="Witch"||gamemode=="Doppelganger")
						if(deleted==0)
							var/mob/s
							for(var/mob/N in world)
								if(N.killer==1||N.currentrole=="The Doppelganger"||N.beatrice==1)
									s=N
							var/obj/N=new/obj/colorbox
							var/icon/I=new(N:icon)
							if(s.charhaircolor !=null)I.Blend(s.charhaircolor)
							usr << "After examining the blurry tapes it seems like the hair color \icon[I] is revealed."
						else if(deleted==1)
							usr << "The tapes have been deleted..."
						else
							usr << "You can't seem to make out the color of the killers hair at all.."
				Delete_Tapes()
					set src in oview(1)
					set category=null
					if(usr.playing==0) return
					for(var/obj/Cameras/Monitor/A in world)
						if(A.deleted==0)
							A.deleted=1
						else if(A.deleted==1)
							usr << "The tapes have already been deleted."
							return
					usr << "You erase the entire tapes contents of the murder."
area/demoarea
	icon = 'sd_dot.dmi'
	layer = 50
	sd_outside = 1
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
	icon = 'sd_dot.dmi'
	layer = 50
	name=""
	mouse_opacity=0
	New()
		..()
		/* Remove the area icon, so you can see it in the map maker, but not in
			the demo. */
		icon = null
		//icon_state = "yellow"
		sd_outside = 1
		mouse_opacity=0