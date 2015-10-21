var/const/SOUND_WALK='audio/footsteps.wav'
blooddrip
	parent_type=/obj
	name=""
	icon='effects.dmi'
	icon_state="drip"
	layer=TURF_LAYER
	//layer-=1
client/control_freak=1
client
	Northwest()
		return
	Northeast()
		return
	Southwest()
		return
	Southeast()
		return
	North()
		if(usr.portal==1)return
		if(usr.frozen)return 0
		.=..()
		for(var/obj/Misc/Poppers/O in usr.loc)
			if(usr.playing==1)
				soundmob(usr, 10, 'smallexplosion.wav', TRUE)
				del O
				usr << "You step on the poppers"
		for(var/obj/Warp/A in usr.loc)
			if(A.oneway==1)return
			if(usr.loc == A.loc&&usr.portal==0)
				for(var/obj/Warp/B in world)
					if(A.tag==B.tag)
						if(B==A)
							goto ender
						//var/obj/X
						usr.x=B.x
						usr.y=B.y
						usr.z=B.z
						usr.portal=1
						usr.frozen=1
						sleep(3)
						if(B.Warp_Message)
							usr << "[B.Warp_Message]"
						for(var/mob/K in get_step(usr,usr.dir))
							usr.loc=K.loc
							goto ender
						for(var/obj/K in get_step(usr,usr.dir))
							if(istype(K,/obj/Containers))
								usr.loc=K.loc
								goto ender
						step(usr,usr.dir)
						if(usr.pulling)
							var/obj/X=usr.pulling
							usr.pulling=null
							X.x=usr.x
							X.y=usr.y
							X.z=usr.z
						:ender
						usr.portal=0
						usr.frozen=0
	South()
		if(usr.portal==1)return
		if(usr.frozen)return 0
		.=..()
		for(var/obj/Misc/Poppers/O in usr.loc)
			if(usr.playing==1)
				soundmob(usr, 10, 'smallexplosion.wav', TRUE)
				del O
				usr << "You step on the poppers"
		for(var/obj/Warp/A in usr.loc)
			if(A.oneway==1)return
			if(usr.loc == A.loc&&usr.portal==0)
				for(var/obj/Warp/B in world)
					if(A.tag==B.tag)
						if(B==A)
							goto ender
						usr.x=B.x
						usr.y=B.y
						usr.z=B.z
						usr.portal=1
						usr.frozen=1
						sleep(3)
						if(B.Warp_Message)
							usr << "[B.Warp_Message]"
						for(var/mob/K in get_step(usr,usr.dir))
							usr.loc=K.loc
							goto ender
						for(var/obj/K in get_step(usr,usr.dir))
							if(istype(K,/obj/Containers))
								usr.loc=K.loc
								goto ender
						step(usr,usr.dir)
						if(usr.pulling)
							var/obj/X=usr.pulling
							usr.pulling=null
							X.x=usr.x
							X.y=usr.y
							X.z=usr.z
						:ender
						usr.portal=0
						usr.frozen=0
	East()
		if(usr.portal==1)return
		if(usr.frozen)return 0
		.=..()
		for(var/obj/Misc/Poppers/O in usr.loc)
			if(usr.playing==1)
				soundmob(usr, 10, 'smallexplosion.wav', TRUE)
				del O
				usr << "You step on the poppers"
		for(var/obj/Warp/A in usr.loc)
			if(A.oneway==1)return
			if(usr.loc == A.loc&&usr.portal==0)
				for(var/obj/Warp/B in world)
					if(A.tag==B.tag)
						if(B==A)
							goto ender
						if(usr.pulling)
							var/obj/X=usr.pulling
							usr.pulling=null
							X.x=usr.x
							X.y=usr.y
							X.z=usr.z
						usr.x=B.x
						usr.y=B.y
						usr.z=B.z
						usr.portal=1
						usr.frozen=1
						sleep(3)
						if(B.Warp_Message)
							usr << "[B.Warp_Message]"
						for(var/mob/K in get_step(usr,usr.dir))
							usr.loc=K.loc
							goto ender
						for(var/obj/K in get_step(usr,usr.dir))
							if(istype(K,/obj/Containers))
								usr.loc=K.loc
								goto ender
						step(usr,usr.dir)
						:ender
						usr.portal=0
						usr.frozen=0
	West()
		if(usr.portal==1)return
		if(usr.frozen)return 0
		.=..()
		for(var/obj/Misc/Poppers/O in usr.loc)
			if(usr.playing==1)
				soundmob(usr, 10, 'smallexplosion.wav', TRUE)
				del O
				usr << "You step on the poppers"
		for(var/obj/Warp/A in usr.loc)
			if(A.oneway==1)return
			if(usr.loc == A.loc&&usr.portal==0)
				for(var/obj/Warp/B in world)
					if(A.tag==B.tag)
						if(B==A)
							goto ender
						if(usr.pulling)
							var/obj/X=usr.pulling
							usr.pulling=null
							X.x=usr.x
							X.y=usr.y
							X.z=usr.z
						usr.x=B.x
						usr.y=B.y
						usr.z=B.z
						usr.portal=1
						usr.frozen=1
						sleep(3)
						if(B.Warp_Message)
							usr << "[B.Warp_Message]"
						for(var/mob/K in get_step(usr,usr.dir))
							usr.loc=K.loc
							goto ender
						for(var/obj/K in get_step(usr,usr.dir))
							if(istype(K,/obj/Containers))
								usr.loc=K.loc
								goto ender
						step(usr,usr.dir)
						:ender
						usr.portal=0
						usr.frozen=0
obj/Move()
	.=..()
	var/obj/O=src
	for(var/obj/Warp/A in O.loc)
		if(A.oneway==1)return
		if(O.loc == A.loc)
			for(var/obj/Warp/B in world)
				if(A.tag==B.tag)
					if(B==A)
						goto ender
					O.x=B.x
					O.y=B.y
					O.z=B.z
					sleep(3)
					for(var/mob/K in get_step(O,O.dir))
						O.loc=K.loc
						goto ender
					step(O,O.dir)
					:ender