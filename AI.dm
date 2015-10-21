mob/proc/HPHud()
	if(src.logged==1)return
	var/cc=src.hp
	//var/cc2=usr.stamina
	var/cp=13
	//var/cp2=13
	var/obj/A=new/obj/THUD/
	src.client.screen += A
	var/obj/s=new/obj/STHUD/
	src.client.screen += s
	if(cc>100)
		cc=100
	while(cc>1)
		var/obj/O=new/obj/HHUD/
		//O.x=cp
		O.screen_loc = "1:[cp],NORTH:5"
		src.client.screen += O
		//O.pixel_x=cp
		cp+=1
		cc-=1

mob/proc/updatehp()
	if(src.logged==1)return
	var/cc=src.hp
	var/cp=13
	if(cc>100)
		cc=100
	for(var/icon/X as anything in src.client.screen)
		if(X.icon=='healthhud.dmi')
			src.client.screen -= X

	while(cc>1)
		if(src.hp>30)
			var/obj/O=new/obj/HHUD/
		//O.x=cp
			O.screen_loc = "1:[cp],NORTH:5"
			src.client.screen += O
		else
			var/obj/O=new/obj/HHUD/
		//O.x=cp
			O.screen_loc = "1:[cp],NORTH:5"
			O.icon_state="2"
			src.client.screen += O
		//O.pixel_x=cp
		cp+=1
		cc-=1
mob/proc/updatesp()
	if(src.logged==1)return
	var/cc=src.stamina
	var/cp=13
	if(cc>100)
		cc=100
	for(var/icon/X as anything in src.client.screen)
		if(X.icon=='staminahud.dmi')
			src.client.screen -= X

	while(cc>1)
		var/obj/O=new/obj/SHUD/
		//O.x=cp
		O.screen_loc = "5:[cp],NORTH:5"
		src.client.screen += O
		//O.pixel_x=cp
		cp+=1
		cc-=1
obj
	HHUD
		icon='healthhud.dmi'
		layer = 101
		// New(client/C)
		screen_loc = "NORTHWEST"
	HHUD2
		icon='healthhud2.dmi'
		layer = 101
		// New(client/C)
		screen_loc = "NORTHWEST"
	SHUD
		icon='staminahud.dmi'
		layer = 101
		// New(client/C)
		screen_loc = "NORTHWEST"
	THUD
		icon='hud.png'
		layer=100
		screen_loc = "NORTHWEST"
	STHUD
		icon='stamhud.png'
		layer=100
		screen_loc = "5,NORTH"

mob/verb/SwitchScreens()
	set hidden=1
	var/st=winget(usr,"mainwin","left")
	if(st=="maped")
		winset(usr,"mainwin","left=rightpanel;right=maped")
	else
		winset(usr,"mainwin","left=maped;right=rightpanel")
mob/verb/switchedtab()
	set hidden=1
	..()
	if(usr.client)
		if(usr.playing==1)
			usr.stamupdater=1
		if(usr.infected==1)
			usr.infectionupdater=1
mob/verb
	mapsize32()
		set hidden=1
		winset(src,"panedmap.Themap","icon-size=32")
	mapsizecust()
		set hidden=1
		var/iconsizer=input(usr,"Which size do you want to use?") as num
		winset(src,"panedmap.Themap","icon-size=[iconsizer]")
mob/verb
	ProfileAge()
		set category=null
		var/num=round(input(src,"=","Profile Age.",usr.setage) as num,1)
		usr.setage=num
	ProfileDesc()
		set category=null
		var/mess=input("Describe yor character in here!","Profile Desc",usr.setprofile)as null|message
		if(mess)
			usr.setprofile=mess
mob/ramiel
	icon='ramiel.dmi'
	name="Ramiel, The Angel"
	hp=500
	Click()
		if(usr.playing==0)return
		if(usr.shinigami==1)return
		if(usr.canattack==0)return
		var/obj/N=usr.equipped
		if(usr.zombie==1)
			return
		else if(usr.vampire==1&&usr.equipname=="Fists")
			if(src in oview(1))
				VampireBite(usr,src)
		else if(usr.nanaya==1&&usr.equipname=="Nanatsu-Yoru")
			if(src in oview(1))
				NanayaAttack(usr,src)
		else if(N.lethal==1)
			if(src in view(N.disttake))
				LethalWeapon(N,usr,src)
		else if(N.lethal==0)
			if(src in view(N.disttake))
				BluntWeapon(N,usr,src)
		else if(N.lethal==3)
			if(src in view(N.disttake))
				Taser(N,usr,src)
		else if(N.lethal==4)
			if(src in view(N.disttake))
				Paint(N,usr,src)
proc
	WashSelf(mob/A)
		A.frozen=1
		A.washing=1
		A << "You begin washing yourself"
		sleep(20)
		for(var/image/X as anything in A.overlays)
			if(X.icon=='bloodoverlay.dmi') A.overlays-=X
			if(X.icon=='verybloodyoverlay.dmi') A.overlays-=X
			if(X.icon=='paintoverlay.dmi') A.overlays-=X
		A.bloody=0
		A << "You finished washing yourself"
		A.washing=0
		A.frozen=0
	WashWeapon(mob/A)
		var/list/holder=new/list()
		for(var/obj/weapons/O in A)
			if(O.name=="Bloody Knife")
				holder+=O
			if(O.name=="Bloody Axe")
				holder+=O
			if(O.name=="Bloody Alondite")
				holder+=O
			if(O.name=="Bloody Pipe")
				holder+=O
			if(O.name=="Bloody Bat")
				holder+=O
			if(O.name=="Bloody Billhook")
				holder+=O
			if(O.name=="Bloody Bat")
				holder+=O
			if(O.name=="Bloody Nailed Bat")
				holder+=O
			if(O.name=="Bloody Hammer")
				holder+=O
		if(holder.len<1)
			A << "You don't seem to have anything to wash.."
			return
		if(A.equipname=="Fists")
			var/obj/weapons/P=input(A,"Which weapon do you want to wash?") in holder
			WashWeapon2(P)
		else
			A << "It's hard to wash off a weapon with your hands full.. Try unequiping it fist!"
mob/verb/stamupdaterz()
	set hidden = 1
	if(src.playing==1)
		src.stamgain-=1
		if(src/stamgain<0) stamgain=0
mob/proc/RamielAI()
	set background=1
	walk_rand(src,7,7)
	if(GameOn==0)return
	var/rander=rand(1,6)
	if(rander==1)
		src.RamielMartyr()
	else if(rander==2)
		RamielJudgement()
	else if(rander==3)
		RamielPain()
	else if(rander==4)
		var/randd=rand(1,2)
		if(randd==1)
			RamielHellsgate()
	if(GameOn==0)return
	sleep(90)
	spawn()src.RamielAI()
mob/proc/DeadCheckRamiel()
	if(src.hp<1)
		world << "<font color=red>The angel has been defeated, congrats."
		EndGame()
mob/proc/RamielMartyr()
	world << "<big><font color=red>Verse 1 (Martyr)</font> activated by Ramiel!"
	for(var/mob/M in world)
		if(M.playing==1&&M.dead==0)
			var/rander=rand(1,3)
			if(rander==1)
				M << "Your wrists and ankles are pierced by a large, sharp feeling!"
				M.hp-=rand(1,5)
				M.DeathCheck()
	CheckGame()
obj/HellHand
	icon='ramielmove.dmi'
	name="Hells Gate"
	layer=7
mob/proc/HellsGate()
	if(GameOn==0)return
	if(src.playing==1&&src.dead==0)
		var/obj/HellHand/O=new
		O.loc=src.loc
		src << "You get hit by the Hells Gate"
		src.hp-=rand(10,35)
		src.DeathCheck()
		sleep(11)
		del O
mob/proc/RamielHellsgate()
	if(GameOn==0)return
	world << "<b><i><font color=red>Hells Gate</font></i></b> activated by Ramiel!"
	for(var/mob/M in world)
		if(M.playing==1&&M.dead==0)
			src.loc=M.loc
			M.HellsGate()
			break
	for(var/mob/M in oview(src))
		if(M.playing==1&&M.dead==0)
			M << "Ramiel appears!"
			sleep(10)
			M.hp-=rand(1,30)
			M.DeathCheck()
	CheckGame()
mob/proc/RamielJudgement()
	world << "<b><i><font color=red>Judgement</font></i></b> activated by Ramiel!"
	if(GameOn==0)return
	for(var/mob/M in world)
		if(M.playing==1&&M.dead==0)
			src.x=M.x
			src.y=M.y
			src.z=M.z
			break
	for(var/mob/M in view(src))
		if(M.playing==1&&M.dead==0)
			M << "Ramiel appears!"
			sleep(10)
			M.hp-=rand(1,30)
			M.DeathCheck()
	CheckGame()
mob/proc/RamielPain()
	if(GameOn==0)return
	for(var/turf/School_Floors/School_Floor/T in world)
		src.x=locate(T.x)
		src.y=locate(T.y)
		src.z=locate(T.z)
	CheckGame()
mob/ai
	Click()

proc
	givereq(mob/A)
		if(A.client)
			winset(A, "playersmenu", "parent=menu;name=Settings")
		//	for(var/client/C)
			var/itemname = "playermenu_[A.key]"
			var/command = "reqr"
			winset(A, itemname,\
			"parent=playersmenu;name=\"Request End Game\";command=[command]")
		return
	takereq(mob/A)
		winset(A, "playersmenu", "parent=;name=")
	//	for(var/client/C)
		var/itemname = ""
		winset(A, itemname,\
		"parent=;name=;command=")


obj
	zombiespawn
		icon='zombiespawner.dmi'
		name=""

mob
	// give all mobs the potential to have an AI routine.


	ai
		hp=100
		stamina=999
		ai=1
		target=null
		canattack=1
		dead=1
		frozen=0
		Dead_Teacher
			icon = 'deadteacher.dmi'
			name="Dead Teacher"
			//var/hp=350
			hp=100
			maxhp=100
			ai=1
		verb/Push()
			set src = oview(1)
			if(usr.playing==0)return
			if(usr.shinigami==1)return
			if(usr.isGhost==1)return
			if(usr.beatrice==1&&usr.icon_state=="butterfly")return
			for(var/mob/M in get_step(usr,usr.dir))
				if(M.playing==1)
					step(M,usr.dir)
					range(6,usr) << "[usr] shoves [src]"
					return
			for(src in get_step(usr,usr.dir))
				step(src,usr.dir,"Speed=0")
				range(6,usr) << "[usr] shoves the [src]"
				break

		verb/Pull()
			set name="Drag / Stop"
			set src in oview(1)
			if(usr.playing==0)return
			if(usr.shinigami==1)return
			if(usr.beatrice==1&&usr.icon_state=="butterfly")return
			if(usr.pulling&&usr.pulling==src)
				usr.pulling=null
				usr << "You stop dragging the [src]"
				return
			else if(usr.pulling)
				for(var/mob/M in oview(3,usr))
					if(M.pulling==src)
						var/rander=rand(1,3)
						if(rander==1)
							M.pulling=null
							M << "[usr] pulls the [src] away from you."
						else
							usr << "You failed to pull the [src] away from [M]."
							M << "[usr] tries to pull the [src] away from you"
							return
				usr.pulling=src
				usr << "You begin dragging the [src]"
				return
			else
				for(var/mob/M in oview(3,usr))
					if(M.pulling==src)
						if(M==usr)goto nop
						var/rander=rand(1,3)
						if(rander==1)
							M.pulling=null
							M << "[usr] pulls the [src] away from you."
						else
							usr << "You failed to pull the [src] away from [M]."
							M << "[usr] tries to pull the [src] away from you"
							return
				:nop
				usr.pulling=src
				usr << "You begin dragging the [src]"
