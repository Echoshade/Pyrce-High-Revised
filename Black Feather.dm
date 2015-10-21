

mob/proc
	HostMute()

		var/list/playerz=new/list()
		for(var/mob/M in world)
			playerz+=M
		playerz+="Cancel"
		var/mob/M=input(src,"Who do you want to mute?") in playerz
		if(M=="Cancel")
			return
		for(var/mob/A in world)
			if(A.playing==0)
				A << "<font color=red><font face=\"Segoe Print\">[src.key] has muted [M.key]([M])"
		mutelist+=M.key
	HostUnmute()

		var/list/lisp=new/list()
		for(var/m in mutelist)
			lisp+=m
		if(lisp.len==0)
			usr << "There isn't any muted people in the list."
			return
		lisp+="Cancel"
		var/A=input(src,"Who to unmute?") in lisp
		for(var/m in mutelist)
			if(A==mutelist[m])
				A=m
		if(A=="Cancel")return

		if(A in mutelist)
			for(var/mob/n in world)
				if(n.playing==0)
					n << "<font color=red><font face=\"Segoe Print\">[src.key] has unmuted [A]"
			mutelist-=A

mob/proc/HostToggle_OOC()
	set category = "Host"
	if(hushchat==0)
		var/pp=ShowAlert(src,"Do you want to disable the usage of World Chat?",list("Yes","No"))
		if(pp=="Yes")
			hushchat=1
			world << "<b><font color=aqua>[lightbot]</b></font> [usr.key] disables OOC."
			return
	else
		var/pp=ShowAlert(src,"Do you want to enable the usage of World Chat?",list("Yes","No"))
		if(pp=="Yes")
			hushchat=0
			world << "<b><font color=aqua>[lightbot]</b></font> [usr.key] enables OOC."
			return
mob/proc/HostModifyDef()
		set name = "Modify Lag"
		set category = "Host"
		var/num=round(input(src,"If your server is lagging try adjusting the settings in this around, by default it is 75.","Lag Helper.",LagFilter.def) as num,1)
		LagFilter.def = num
mob/proc/HostBoot_From_Server()
	set name = "Boot Player"
	set category = "Host"
	var/list/ppl=new/list()
	for(var/mob/player/A in world)
		ppl+=A
	ppl+="Cancel"
	var/mob/player/A=input(src,"Who do you want to boot?","Host Command") in ppl
	if(A=="Cancel") return
	for(var/mob/M in world)
		if(M.playing==0)
			M << "<b><font color=aqua>[lightbot]</b></font> [src.key]([src.name]) has booted [A.key]([A.name]) from the server."
	if(A.playing==1)
		A.Suicided()
	else if(src.joined==1&&src.playing==0&&GameOn==0)
		joinlist-=src
		//joined-=0
		src.joiner=0
		src.myloc=src.loc
		src.watching=0
		playersjoined-=1
		if(src.gender=="male")
			maleslot-=1
		else
			femaleslot-=1
	del A
mob/proc/Set_RP_Mode()
	if(GameOn==0)return
	:beginn
	var/rpm=input(src,"Which RP mode do you wish to use?") in list("Light","Medium","Heavy")
	if(rpm=="Light")
		var/rr=input(src,"When using Light Roleplay mode you don't enforce things such as 'emoting rules' and you can generally let things slip, it is light roleplay after all and this can lead to be one of best for new comers and some oldies the same.") in list("Use it","Nah")
		if(rr=="Use it")
			rpmode="Light Roleplay"
		else
			goto beginn
	if(rpm=="Medium")
		var/rr=input(src,"When using 'Medium RP mode' you enforce emoting attacks, you will have to emote before attacking someone and later on if they got away for a long period of time. Ect stuff.") in list("Use it","Nah")
		if(rr=="Use it")
			rpmode="Medium Roleplay"
		else
			goto beginn
	if(rpm=="Heavy")
		var/rr=input(src,"Stuff is about to get heavy, Enforcing the writing of paper, attacking and other misc stuff. This mode is generally not advised unless you wan a small server of 'Elitest'.") in list("Use it","Nah")
		if(rr=="Use it")
			rpmode="Heavy Roleplay"
		else
			goto beginn
mob/proc/HostEnd_Game()
	if(GameOn==0)return
	var/pp=ShowAlert(src,"Do you really want to end the game?",list("Yes","No"))
	if(pp=="Yes")
		if(GameOn==1)
			world << "<font color=gray>The Host has ended the current round."
			EndGame()
obj
	Dragon
		New()
			var/obj/Dragon/T = new /obj/DragonTrail // Define the object T to be the trail
			var/X = turn(src.dir,180) // Define X to be 180 turn of the source's direction
			T.loc = get_step(src, X) // Spawn it behind the src
			T.dir = src.dir // Give them same direction
			walk(T, T.dir) // Make it walk with the lazer (needs same delay as the lazer
	DragonTrail
		icon='windanimation.dmi'
		icon_state="body"
var/const/birdflap='birdflap.wav'
var/const/kittynoise='Cat Attacking.wav'
var/const/stakenoise='stakes.wav'
var/const/stakecrash='stakecrash.wav'
mob/proc
	Dragon_Shoot()
		if(attackdelayer==1)return
		for(var/obj/Misc/Black_Feather/O in usr)
			if(O in usr)
			//	if(feath==1)return
			//	feath=1
				usr.contents-=O
				break
		var/obj/K = new/obj/ice(src.loc)
		soundmob(src, 8, birdflap, TRUE)
		K.dir=src.dir
		src.canattack=1
		if(K.dir == NORTH)
			K.pixel_y+=15
		if(K.dir == WEST)
			K.pixel_x-=15
		if(K.dir == EAST)
			K.pixel_x+=15
		if(K.dir == SOUTH)
			K.pixel_y-=15
		walk(K,src.dir)
	SmokeBomb2()
		for(var/obj/Misc/Smoke_Bomb/O in usr)
			if(O in usr)
			//	if(feath==1)return
			//	feath=1
				usr.contents-=O
				break
		var/obj/SmokeyLayer/I=new
		I.loc=src.loc
		for(var/mob/B in range(6,src))
			B << "[src] slams a smoke bomb against the ground"
		spawn(50)
			for(var/obj/SmokeyLayer/K in world)
				del K
	SmokeBomb()
		for(var/obj/Misc/Smoke_Bomb/O in usr)
			if(O in usr)
			//	if(feath==1)return
			//	feath=1
				usr.contents-=O
				break
		var/obj/SmokeOverlay/N=new
		N.loc=src.loc
		for(var/mob/B in range(6,src))
			B << "[src] slams a smoke bomb against the ground"
		sleep(3)
		for(var/mob/M in view(src))
			if(src==M) goto nop
			src.Blindme()
			:nop
		spawn(30)
			for(var/obj/SmokeOverlay/K in world)
				del K
obj
	SmokeyLayer
		icon='smokeoverlay.dmi'
		name=""
		layer=10
		opacity=1
obj
	ice
		name="Dragon's Head"
		icon = 'windanimation.dmi'
		icon_state = "head"
		density = 1
		layer = 60
		var/list/Gotcha=new/list()
		New()
		..()
		Move()
			..()
			//var/obj/dragontrail/K = new /obj/dragontrail
			var/obj/dragontrail/K = new /obj/dragontrail
			if(src.dir == NORTH)
				K.loc = locate(src.x,src.y-1,src.z)
			if(src.dir == WEST)
				K.loc = locate(src.x+1,src.y,src.z)
			if(src.dir == EAST)
				K.loc = locate(src.x-1,src.y,src.z)
			if(src.dir == SOUTH)
				K.loc = locate(src.x,src.y+1,src.z)
			K.dir = src.dir
			for(var/mob/A in Gotcha)
				A.loc=src.loc
		Bump(atom/A)
			if(istype(A,/mob))
				var/mob/M=A
				M.loc=src.loc
				M.frozen=1
				if(M in Gotcha)
					Gotcha-=M
				sleep(1)
				Gotcha+=M
			else
				for(var/mob/M in Gotcha)
					if(M.playing==1)
						M.frozen=0
						Dragoned(M)
				sleep(2)
				deldragon()
				del src

proc/deldragon()
	for(var/obj/dragontrail/K in world)
		del K
		sleep(1)
obj/dragontrail
	name="Dragon's Body"
	icon = 'windanimation.dmi'
	icon_state = "body"
	layer = 60
	density = 0
obj
	Butterflies
		New()
			var/obj/Butterfliestrail/T = new /obj/Butterfliestrail // Define the object T to be the trail
			var/X = turn(src.dir,180) // Define X to be 180 turn of the source's direction
			T.loc = get_step(src, X) // Spawn it behind the src
			T.dir = src.dir // Give them same direction
			walk(T, T.dir) // Make it walk with the lazer (needs same delay as the lazer
	DragonTrail
		icon='windanimation.dmi'
		icon_state="body"
obj
	Stake
		New()
			var/obj/Staketrail/T = new /obj/Staketrail // Define the object T to be the trail
			var/X = turn(src.dir,180) // Define X to be 180 turn of the source's direction
			T.loc = get_step(src, X) // Spawn it behind the src
			T.dir = src.dir // Give them same direction
			walk(T, T.dir) // Make it walk with the lazer (needs same delay as the lazer

mob/proc
	Shoot_SHS()
		if(src.canattack==0)return
		if(src.stamina<20)
			usr << "Seems like you need to build up more stamina before you can fire this again.."
			return
mob/proc
	Stake_Shoot()
		if(src.canattack==0)return
		if(attackdelayer==1)return
		if(usr.beatrice==1&&usr.icon_state=="butterfly")return
		if(src.stamina<60)
			usr << "Hmm.. Seems like you need to build up more magic(stamina) before you can cast this again.."
			return
		var/counters=0
		if(src.koed==1)return
		for(var/mob/A in oview(src))
			if(A.playing==1&&A.dead==0)
				counters+=1
		src.stamina-=60
		src.canattack=0
		updatesp(src)
		soundmob(src, 8, stakenoise, TRUE)
		view(usr) << "<i>[usr] summons a Stake of Purgatory.</i>"
		for(var/mob/M in range(5,usr))
			if(M.playing==0)
				M << "<i>[usr] summons a Stake of Purgatory.</i>"
		var/obj/K = new/obj/Stake(src.loc)
		//soundmob(src, 8, birdflap, TRUE)
		K.dir=src.dir
		if(K.dir == NORTH)
			K.pixel_y+=15
		if(K.dir == WEST)
			K.pixel_x-=15
		if(K.dir == EAST)
			K.pixel_x+=15
		if(K.dir == SOUTH)
			K.pixel_y-=15
		walk(K,src.dir)
		spawn(30)usr.canattack=1
	Kitty_Shoot()
		if(src.canattack==0)return
		if(attackdelayer==1)return
		if(src.stamina<28)
			usr << "Hmm.. Seems like you need to build up more magic(stamina) before you can cast this again.."
			return
		var/counters=0
		if(src.koed==1)return
		for(var/mob/A in oview(src))
			if(A.playing==1&&A.dead==0)
				counters+=1
		if(counters>beatricesee)
			src << "There seems to be too many people here, in other words, the anti-magic toxin is still to strong."
			return
		src.stamina-=28
		src.canattack=0
		updatesp(src)
		view(usr) << "<i>[usr] unleashes their cat familiars.</i>"
		for(var/mob/M in range(5,usr))
			if(M.playing==0)
				M << "<i>[usr] unleashes their cat familiars.</i>"
		soundmob(src, 8, kittynoise, TRUE)
		var/obj/K = new/obj/Kitties(src.loc)
		K.dir=src.dir
		if(K.dir == NORTH)
			K.pixel_y+=15
		if(K.dir == WEST)
			K.pixel_x-=15
		if(K.dir == EAST)
			K.pixel_x+=15
		if(K.dir == SOUTH)
			K.pixel_y-=15
		walk(K,src.dir)
		spawn(30)usr.canattack=1
	Shoot_Butterflies()
		if(usr.canattack==0)return
		if(attackdelayer==1)return
		if(usr.beatrice==1&&usr.icon_state=="butterfly")return
		if(src.stamina<28)
			usr << "Hmm.. Seems like you need to build up more magic(stamina) before you can cast this again.."
			return
		var/counters=0
		if(src.koed==1)return
		for(var/mob/A in oview(src))
			if(A.playing==1&&A.dead==0)
				counters+=1
		if(counters>beatricesee)
			src << "There seems to be too many people here, in other words, the anti-magic toxin is still to strong."
			return
		usr.stamina-=28
		usr.canattack=0
		usr.updatesp()
		view(usr) << "<i>[usr] scatters a bunch of golden butterflies.</i>"
		for(var/mob/M in range(5,usr))
			if(M.playing==0)
				M << "<i>[usr] scatters a bunch of golden butterflies.</i>"
		var/obj/K = new/obj/Butterfly(src.loc)
		soundmob(src, 8, birdflap, TRUE)
		K.dir=src.dir
		if(K.dir == NORTH)
			K.pixel_y+=15
		if(K.dir == WEST)
			K.pixel_x-=15
		if(K.dir == EAST)
			K.pixel_x+=15
		if(K.dir == SOUTH)
			K.pixel_y-=15
		walk(K,src.dir)
		spawn(30)usr.canattack=1
	Toggle_visibility()
		var/counters=0
		if(src.koed==1)return
		if(src.pulling)
			src << "You can't seem to go invisible while dragging something."
			return
		if(src.canlaugh==0)
			src << "You need to wait before casting this magic again."
			return
		for(var/mob/A in oview(src))
			if(A.playing==1&&A.dead==0)
				counters+=1
		if(counters>beatricesee)
			src << "There seems to be too many people here, in other words, the anti-magic toxin is still to strong."
			return
		src.canlaugh=0
		spawn(60) src.canlaugh=1
		if(src.playing==1)
			if(src.invisibility==0)
				src.canattack=0
				src.toggledflies=1
				src.invisibility=5
				src.density=0
				//src.oldicon=src.overlays
				for(var/A in src.overlays)
					overlayers+=A
				src.overlays=null
				src.icon_state="butterfly"
				//src.see_invisible=5
				src.sight |= SEE_SELF
				src.see_in_dark=5
			else
				src.icon_state=""
				for(var/A in overlayers)
					src.overlays+=A
				overlayers=new/list()
				src.sight &= SEE_SELF
				src.see_in_dark=2
				src.canattack=1
				src.toggledflies=0
				src.density=1
				src.invisibility=0
				src.see_invisible=0
obj
	Butterfly
		name="Butterflies"
		icon = 'beatrice attack.dmi'
		icon_state = "head"
		density = 1
		layer = 60
		var/moved=0
		var/list/Gotcha=new/list()
		New()
		..()
		Move()
			..()
			//var/obj/dragontrail/K = new /obj/dragontrail
			var/obj/Butterfliestrail/K = new /obj/Butterfliestrail
			if(src.dir == NORTH)
				K.loc = locate(src.x,src.y-1,src.z)
			if(src.dir == WEST)
				K.loc = locate(src.x+1,src.y,src.z)
			if(src.dir == EAST)
				K.loc = locate(src.x-1,src.y,src.z)
			if(src.dir == SOUTH)
				K.loc = locate(src.x,src.y+1,src.z)
			K.dir = src.dir
			moved+=1
			for(var/mob/A in Gotcha)
				A.loc=src.loc
				A.hp-=rand(1,4)
				if(A.playing==1)
					A.updatehp()
					A.DeathCheck()
			if(moved>10)
				for(var/mob/M in Gotcha)
					M.frozen=0
					//M.hp-=rand(1,3)
					//sleep(2)
				delbutterfly()
				del src
		Bump(atom/A)
			if(istype(A,/mob))
				var/mob/M=A
				M.loc=src.loc
				M.frozen=1

				Gotcha-=M

				Gotcha+=M
				if(M.playing==1)
					M.updatehp()
					M.DeathCheck()
			else
				for(var/mob/M in Gotcha)
					M.frozen=0
					//M.hp-=rand(1,3)
					//sleep(2)
					if(M.playing==1)
						M.updatehp()
						M.DeathCheck()
				//sleep(3)
				delbutterfly()
				del src

proc/delbutterfly()
	for(var/obj/Butterfliestrail/K in world)
		del K
		sleep(1)

obj/Butterfliestrail
	name="Butterfly trail"
	icon = 'beatrice attack.dmi'
	icon_state = "tail"
	layer = 60
	density = 0
obj
	Kitties
		name="Cats"
		icon = 'cat.dmi'
		density = 1
		layer = 60
		var/list/Gotcha=new/list()
		New()
		..()
		Move()
			..()
			for(var/mob/A in Gotcha)
				A.loc=src.loc
		Bump(atom/A)
			if(istype(A,/mob))
				var/mob/M=A
				M.loc=src.loc
				M.frozen=1
				M.hp-=rand(2,4)
				sleep(1)
				if(!A in Gotcha)
					//Gotcha-=M
					Gotcha+=M
				if(M.playing==1)
					M.updatehp()
					M.DeathCheck()
			else
				for(var/mob/M in Gotcha)
					M.frozen=0
					M.hp-=rand(1,3)
					//sleep(2)
					if(M.playing==1)
						M.updatehp()
						M.DeathCheck()
				sleep(3)
				del src
obj
	Stake
		name="Stake"
		icon = 'stake.dmi'
		icon_state = "stake"
		density = 1
		layer = 60
		var/list/Gotcha=new/list()
		New()
		..()
		Move()
			..()
			//var/obj/dragontrail/K = new /obj/dragontrail
			var/obj/Staketrail/K = new /obj/Staketrail
			if(src.dir == NORTH)
				K.loc = locate(src.x,src.y-1,src.z)
			if(src.dir == WEST)
				K.loc = locate(src.x+1,src.y,src.z)
			if(src.dir == EAST)
				K.loc = locate(src.x-1,src.y,src.z)
			if(src.dir == SOUTH)
				K.loc = locate(src.x,src.y+1,src.z)
			K.dir = src.dir
			for(var/mob/A in Gotcha)
				A.loc=src.loc
		Bump(atom/A)
			if(istype(A,/mob))
				var/mob/M=A
				src.loc=M.loc
				M.hp-=rand(10,40)
				sleep(1)
				soundmob(M, 8, stakecrash, TRUE)
				if(M.playing==1)
					M.updatehp()
					M.DeathCheck()
				view(M) << "[M] gets hit by the Stake of Purgatory!"
				for(var/mob/N in range(6,M))
					if(N.playing==0)
						N << "[M] gets hit by the Stake of Purgatory!"
			else
				sleep(3)
				delstake()
				del src

proc/delstake()
	for(var/obj/Staketrail/K in world)
		del K
		sleep(1)

obj/Staketrail
	name="Steak trail"
	icon = 'stake.dmi'
	icon_state = "trail"
	layer = 60
	density = 0

mob/proc/Copy_Cat()
	if(src.canattack==0)
		src << "Sorry, you cannot do this just yet."
		return
	var/list/corpses=new/list()
	var/list/giveoverlays=new/list()
	for(var/mob/corpse/M in oview(1,src))
		corpses+=M
	corpses+="Cancel"
	var/mob/P=input(src,"Which corpse do you wish to possess? After possessing a corpse you're cannot attack or possess another for 2 minutes.") in corpses
	if(P=="Cancel")return
	src << "You take the face of [P]"
	for(var/A in src.overlays)
		giveoverlays+=A
	src.overlays=null
	for(var/A in P.overlays)
		src.overlays+=A
	var/icon/B=src.icon
	var/icon/Ava=src.chatavatar
	//var/icon/Myname=src.name
	src.icon=P.icon
	var/cname="[src.name]'s Corpse"
	var/pname=FilterCorpse(P.name)
	src.name=pname
	src.chatavatar=P.chatavatar
	var/icon/q=src.charhairavatar
	var/headcolor=src.charhairavatarcolor
	src.charhairavatarcolor=P.charhairavatar
	src.charhairavatar=P.charhairavatarcolor
	P.charhairavatar=q
	P.charhairavatarcolor=headcolor
	//src.realname=P.realname
	P.chatavatar=Ava
	P.name=cname
	P.overlays=null
	for(var/A in giveoverlays)
		P.overlays+=A
	P.icon=B
	src.canattack=0
	spawn(120) src.canattack=1