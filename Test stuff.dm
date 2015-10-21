obj/key
	icon='items_miscellaneous.dmi'
	icon_state="key"
	var/names=null
	var/msg=null
	verb
		Pick_Up()
			set src in oview(1)
			if(usr.playing==0)return
			if(usr.shinigami==1)return
			if(usr.isGhost==1)return
			Move(usr,src)
		Drop()
			set src in usr
			set category = null
			if(usr.playing==0)return
			if(usr.shinigami==1)return
			//if(src==usr.equipped)return
			Move(usr.loc,src)
	Click()
		if(!usr.looking==0)
			var/obj/O=usr.looking
			if(usr.isGhost==1)return
			var/descp=null
			var/obj/I=src
			if(I.name=="Office Key")
				descp="Looks like the key to the office door."
			if(I.name=="Lounge Key")
				descp="Looks like the key to the lounge door."
			if(src in O)
				if(I.name=="Fists")return
				var/pp2=CustAlert(usr,"[descp]",list("Take","Leave"),5,4,13,7)
				if(pp2=="Take")
					if(usr.looking==0)return
					Move(usr,src)
obj/Lockable_Locker
	icon='locker2.dmi'
	name="locker"
	density=1
	var/open=0
	var/locked=0
	verb/Open()
		set src in oview(1)
		set name = "Open / Close"
		if(usr.playing==0)return
		if(usr.shinigami==1)return
		if(usr.isGhost==1)return
		if(open==0&&locked==0)
			open=1

		else if(open==0&&locked==1)
			for(var/obj/O in usr)
				if(istype(O,/obj/key))
					if(O.tag==src.tag)
						range(5,usr) << "[usr] unlocks the locker"
						soundmob(usr, 5, 'door_lock.ogg', TRUE)
						locked=0
						return
					else
				usr << "The locker seems to be locked.."
				soundmob(usr, 5, 'door_locked.ogg', TRUE)
				return

	verb/Lock()
		set name = "Lock / Unlock"
		set src in oview(1)
		//set category=null
		if(usr.playing==0)return
		if(usr.shinigami==1)return
		if(usr.isGhost==1)return
		if(open==1)return
		for(var/obj/O in usr)
			if(istype(O,/obj/key))
				if(O.tag==src.tag)
					if(locked==1)
						range(5,usr) << "[usr] unlocks the locker."
						soundmob(usr, 5, 'door_lock.ogg', TRUE)
						locked=0
					else
						if(open==1)return
						range(5,usr) << "[usr] locks the locker."
						soundmob(usr, 5, 'door_lock.ogg', TRUE)
						locked=1
	Click()
		if(src in oview(1,usr))
			if(istype(src, /obj/Door))
				src.Open()
				return

obj/Lockable_Door
	icon='school.dmi'
	icon_state="door"
	name="Door"
	density=1
	var/hits=5
	var/open=0
	var/locked=0
	opacity=1
	verb/Open()
		set src in oview(1)
		set name = "Open / Close"
		if(usr.playing==0)return
		if(usr.shinigami==1)return
		if(usr.isGhost==1)return
		if(open==0&&locked==0)
			open=1
			src.icon_state="open door"
			density=0
			pixel_x+=30
			sd_SetOpacity(0)
		else if(open==0&&locked==1)
			for(var/obj/O in usr)
				if(istype(O,/obj/key))
					if(O.tag==src.tag)
						range(5,usr) << "[usr] unlocks the door"
						soundmob(usr, 5, 'door_lock.ogg', TRUE)
						locked=0
						return
			if(usr.equipname=="Axe")
				if(usr.canchop==0)return
				spawn(10)
					usr.canchop=1
				if(usr.zombie==1)
					soundmob(usr, 8, 'audio/slamming_against.wav', TRUE)
					range(5,usr) << "<b>WHAM!!!!!!</b> The sound of something slamming against the door is heard!"
				else
					range(5,usr) << sound('audio/axe_door.ogg')
					range(5,usr) << "<b>WHAM!!!!!!</b> The sound of an axe chopping into a door is heard!"
				hits-=1
				usr.canchop=0
				if(hits<1)
					usr.canattack=1
					var/obj/Shattered_Door/A = new
					A.loc=src.loc
					del src
				return
			else
				spawn(10) usr.canchop=1
				usr << "The door seems to be locked.."
				soundmob(usr, 5, 'door_locked.ogg', TRUE)
				return
		else
			for(var/atom/A in oview(1,src))
				if(A.loc==src.loc)
					var/mob/B=A
					if(istype(A,/mob)&&B.playing==1&&B.shinigami==0)return
					else if(istype(A,/blooddrip))break
					else if(istype(A,/obj/bloodsplat))break
					else if(istype(A,/obj/bloodspot))break
					else if(istype(A,/obj/Custom_Placeable))break
					else if(istype(A,/obj/bloodstep))break
					else if(istype(A,/obj/paintings))break
					else if(istype(A,/mob)&&A.invisibility>50)break
					else if(istype(A,/turf))
						break
					else
						return
			open=0
			pixel_x=0
			//src.icon_state="blank"
			sd_SetOpacity(1)
			density=1
			icon_state="door"
	verb/Lock()
		set name = "Lock / Unlock"
		set src in oview(1)
		//set category=null
		if(usr.playing==0)return
		if(usr.shinigami==1)return
		if(usr.isGhost==1)return
		if(open==1)return
		for(var/obj/O in usr)
			if(istype(O,/obj/key))
				if(O.tag==src.tag)
					if(locked==1)
						range(5,usr) << "[usr] unlocks the door."
						soundmob(usr, 5, 'door_lock.ogg', TRUE)
						locked=0
					else
						if(open==1)return
						range(5,usr) << "[usr] locks the door."
						soundmob(usr, 5, 'door_lock.ogg', TRUE)
						locked=1
	Click()
		if(src in oview(1,usr))
			if(istype(src, /obj/Door))
				src.Open()
				return
obj/Lockable_Door_Updown
	icon='school.dmi'
	icon_state="door2"
	name="Door"
	density=1
	var/hits=5
	var/open=0
	var/locked=0
	opacity=1
	verb/Open()
		set src in oview(1)
		set name = "Open / Close"
		if(usr.playing==0)return
		if(usr.shinigami==1)return
		if(usr.isGhost==1)return
		if(open==0&&locked==0)
			open=1
			src.icon_state="open out"
			density=0
			pixel_y+=30
			sd_SetOpacity(0)
		else if(open==0&&locked==1)
			for(var/obj/O in usr)
				if(istype(O,/obj/key))
					if(O.tag==src.tag)
						range(5,usr) << "[usr] unlocks the door"
						soundmob(usr, 5, 'door_lock.ogg', TRUE)
						locked=0
						return
			if(usr.equipname=="Axe")
				if(usr.canchop==0)return
				usr.canchop=0
				spawn(10)
					usr.canchop=1
				if(usr.zombie==1)
					soundmob(usr, 8, 'audio/slamming_against.wav', TRUE)
					range(5,usr) << "<b>WHAM!!!!!!</b> The sound of something slamming against the door is heard!"
				else
					range(5,usr) << sound('audio/axe_door.ogg')
					range(5,usr) << "<b>WHAM!!!!!!</b> The sound of an axe chopping into a door is heard!"
				hits-=1
				if(hits<1)
					var/obj/Shattered_Door/A = new
					A.loc=src.loc
					del src
				return
			else
				usr << "The door seems to be locked.."
				usr << sound('door_locked.ogg')
				return
		else
			for(var/atom/A in oview(1,src))
				if(A.loc==src.loc)
					var/mob/B=A
					if(istype(A,/mob)&&B.playing==1&&B.shinigami==0)return
					else if(istype(A,/blooddrip))break
					else if(istype(A,/obj/bloodsplat))break
					else if(istype(A,/obj/bloodspot))break
					else if(istype(A,/obj/bloodstep))break
					else if(istype(A,/obj/paintings))break
					else if(istype(A,/obj/Custom_Placeable))break
					else if(istype(A,/mob)&&A.invisibility>50)break
					else if(istype(A,/turf))
						break
					else
						return
			open=0
			pixel_y=0
			//src.icon_state="blank"
			sd_SetOpacity(1)
			density=1
			icon_state="door2"
	verb/Lock()
		set name = "Lock/Unlock"
		set src in oview(1)
		if(usr.playing==0)return
		if(usr.shinigami==1)return
		for(var/obj/O in usr)
			if(istype(O,/obj/key))
				if(O.tag==src.tag)
					if(locked==1)
						range(5,usr) << "[usr] unlocks the door."
						soundmob(usr, 5, 'door_lock.ogg', TRUE)
						locked=0
					else
						if(open==1)return
						range(5,usr) << "[usr] locks the door."
						soundmob(usr, 5, 'door_lock.ogg', TRUE)
						locked=1
	Click()
		if(src in oview(1,usr))
			if(istype(src, /obj/Door))
				src.Open()
				return

obj
	Warp
		icon='fakebuttons.dmi'
		icon_state="warp"
		invisibility=101
		var/Warp_Message=""
		var/oneway=0
		//density=1
var/list/kiradie=new/list()

proc/CheckKira()
//	if(kiradie.len>0)
	for(var/m in kiradie)
		for(var/mob/A in world)
			if(A.realname==m)
				var/tod="[kiradie[A.realname]]"
				var/gt="[gamehour]:00 [ampm]"
				if(tod==gt)
					if(A.shineyes==0)
						if(A.playing==0) return
						if(A.shineyes==0)
							A << "You begin to feel a tight knot in your chest"
							sleep(20)
							if(A.playing==0)return
							range(6,A) << "<i>[A] falls to the ground, grabbing at their chest"
						else
							sleep(20)
							if(A.playing==0)return
							range(6,A) << "<i>[A] begins bleeding out their eyes, collapsing to the ground"
						A.DeathNoted()
						kiradie-=m
						for(var/mob/M in world)
							if(M.playing==1)
								M.canattack=1
					else
						if(A.playing==0) return
						A.KiraDie()
						kiradie-=m
						for(var/mob/M in world)
							if(M.playing==1)
								M.canattack=1
