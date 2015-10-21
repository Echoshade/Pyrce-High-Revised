var/lightbot="Light Bot"
var/cloudybot="Cloudy Bot"
mob/escaped
	dead=1

mob/corpse
	dead=1
	ai=1
	koed=1
	layer=OBJ_LAYER
	verb/Push(var/mob/m in get_step(usr,usr.dir))
		set src in oview(1)
		if(usr.playing==0)return
		if(usr.shinigami==1)return
		if(usr.isGhost==1)return
		if(usr.beatrice==1&&usr.icon_state=="butterfly")return
		if(get_step(src,usr))
			step(src,usr.dir,"Speed=0")
			range(6,usr) << "[usr] shoves the [src]"
	verb/Pull()
		set src in oview(1)
		set name="Drag / Stop"
		if(usr.playing==0)return
		if(usr.shinigami==1)return
		if(usr.beatrice==1&&usr.icon_state=="butterfly")return
		if(usr.pulling&&usr.pulling==src)
			usr.pulling=null
			usr << "You stop dragging the [src]"
			src.pulled=0
			return
		else if(usr.pulling)
			for(var/mob/M in oview(3,usr))
				if(M.pulling==src)
					var/rander=rand(1,3)
					if(rander==1)
						M.pulling=null
						src.pulled=1
						M << "[usr] pulls the [src] away from you."
					else
						usr << "You failed to pull the [src] away from [M]."
						M << "[usr] tries to pull the [src] away from you"
						return
			usr.pulling=src
			usr << "You begin dragging the [src]"
			src.pulled=1
			return
		else
			for(var/mob/M in oview(3,usr))
				if(M.pulling==src)
					var/rander=rand(1,3)
					if(rander==1)
						M.pulling=null
						M << "[usr] pulls the [src] away from you."
						src.pulled=1
					else
						usr << "You failed to pull the [src] away from [M]."
						M << "[usr] tries to pull the [src] away from you"
						return
			usr.pulling=src
			usr << "You begin dragging the [src]"
			src.pulled=1
	verb/Search_Body()
		///set name="Drag / Stop"
		set src in oview(1)
		if(usr.playing==0)return
		if(usr.shinigami==1)return
		usr.bodysearch=2
		usr.looking=src
		usr.client.statpanel="[src]"
	verb/Plant_On_Body()
		set src in oview(1)
		if(usr.shinigami==1)return
		if(hoarddelayer==1)return
		if(usr.playing==0)return
		var/obj/fisthold=null
		var/list/storage = new/list()
		for(var/obj/O in usr)
			storage+=O
			if(O.name=="Fists")
				storage-=O
				fisthold=O
		var/obj/O=input(usr,"What would you like to plant on [src]?",storage) in storage
		if(O=="Cancel")return
		if(O==usr.equipped)
			WeaponEquip(usr,fisthold)
		//src.contents+=O
		CheckWeight2(usr,O)
		usr.contents-=O
		src.contents+=O
	Click()
		if(usr.playing==0)return
		if(attackdelayer==1)return
		if(usr==src&&usr.noclickself==1)return
		//if(usr==src)return
		if(usr.shinigami==1)return
		if(src.shinigami==1)return
		if(usr.zombie&&src.zombie==1)return
		if(usr.canattack==0)return
		var/obj/N=usr.equipped
		if(usr.zombie==1)
			if(src in oview(1))
				range(8,usr) << "[fightfont][usr] bites and chews on the [src]!</b>"
				usr.canattack=0
				spawn(18)usr.canattack=1
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
	Dragoned(mob/M)
		M.sight |= BLIND
		spawn(60)M.sight &= ~BLIND
	Lethality(A)
		if(A=="Normal")
			knifedmg=6
			axedmg=14
			alonditedmg=14
			pipedmg=9
			hammerdmg=8
			billhookdmg=10
			metalbatdmg=11
		if(A=="Above Normal")
			knifedmg=9
			axedmg=17
			alonditedmg=17
			pipedmg=12
			hammerdmg=11
			billhookdmg=13
			metalbatdmg=14
		if(A=="One Hit One Kill")
			knifedmg=999
			axedmg=999
			alonditedmg=999
			pipedmg=999
			hammerdmg=999
			billhookdmg=999
			metalbatdmg=999
		else if(A=="High")
			knifedmg=11
			axedmg=19
			alonditedmg=19
			pipedmg=14
			hammerdmg=13
			billhookdmg=15
			metalbatdmg=16
		if(A=="Very High")
			knifedmg=14
			axedmg=22
			alonditedmg=22
			pipedmg=17
			hammerdmg=16
			billhookdmg=18
			metalbatdmg=19
		if(A=="Low")
			knifedmg=3
			axedmg=11
			alonditedmg=11
			pipedmg=6
			hammerdmg=5
			billhookdmg=7
			metalbatdmg=8
		if(A=="Very Low")
			knifedmg=1
			axedmg=9
			alonditedmg=9
			pipedmg=4
			hammerdmg=3
			billhookdmg=5
			metalbatdmg=6
mob/koed/verb/Plant_On()
	set src in oview(1)
	if(usr.shinigami==1)return
	if(hoarddelayer==1)return
	if(usr.playing==0)return
	var/obj/fisthold=null
	var/list/storage = new/list()
	for(var/obj/O in usr)
		storage+=O
		if(O.name=="Fists")
			storage-=O
			fisthold=O
	storage+="Cancel"
	var/obj/O=input(usr,"What would you like to plant on [src]?",storage) in storage
	if(O=="Cancel")return
	if(src.koed==0)return
	if(O==usr.equipped)
		WeaponEquip(usr,fisthold)
	//src.contents+=O
	CheckWeight2(usr,O)
	usr.contents-=O
	src.contents+=O
mob/koed/verb/Search_Body()
	set src in oview(1)
	if(usr.shinigami==1)return
	if(hoarddelayer==1)return
	if(usr.playing==0)return
	if(src.koed==1)
		usr.looking=src
		usr.bodysearch=1
		usr.client.statpanel="[src]"
mob/koed/verb/Drag()
	set src in oview(1)
	set name="Drag / Stop"
	if(usr.playing==0)return
	if(usr.shinigami==1)return
	if(usr.beatrice==1&&usr.icon_state=="butterfly")return
	if(usr.pulling&&usr.pulling==src)
		usr.pulling=null
		usr << "You stop dragging the [src]"
		src.pulled=0
		return
	else if(usr.pulling)
		for(var/mob/M in oview(3,usr))
			if(M.pulling==src)
				var/rander=rand(1,3)
				if(rander==1)
					M.pulling=null
					src.pulled=1
					M << "[usr] pulls the [src] away from you."
				else
					usr << "You failed to pull the [src] away from [M]."
					M << "[usr] tries to pull the [src] away from you"
					return
		usr.pulling=src
		usr << "You begin dragging the [src]"
		src.pulled=1
		return
	else
		for(var/mob/M in oview(3,usr))
			if(M.pulling==src)
				var/rander=rand(1,3)
				if(rander==1)
					M.pulling=null
					M << "[usr] pulls the [src] away from you."
					src.pulled=1
				else
					usr << "You failed to pull the [src] away from [M]."
					M << "[usr] tries to pull the [src] away from you"
					return
		usr.pulling=src
		usr << "You begin dragging the [src]"
		src.pulled=1
mob/DblClick()
	if(usr.playing==0&&usr.watching==1)
		usr.x=src.x
		usr.y=src.y
		usr.z=src.z
proc
	FakeCorpse(mob/M)
		M.HideHud()
		var/mob/corpse/A = new/mob/corpse
		A.killer=M.killer
		A.realname=M.realname
		A.alias=M.alias
		A.kira=M.kira
		A.isL=M.isL
		A.classickira=M.classickira
		A.classicshinigamieyes=M.classicshinigamieyes
		A.currentrole=M.currentrole
		A.beatrice=M.beatrice
		A.suspect=M.suspect
		A.shinigamieyes=M.shinigami
		A.realkey=M.key
		A.loc=M.loc
		A.chatavatar=M.chatavatar
		A.nanaya=M.nanaya
		A.vampire=M.vampire
		//A.toucheddn=0
		A.infected=0
		A.icon=M.icon
		A.suffix=M.key
		A.overlays=M.overlays
		A.name="[M.name]'s Corpse"
		A.icon_state="dead"


		if(M.shinigami==1)
			A.invisibility=100
			A.density=0
		deadlist+=A
		spawn(2)alivelist-=M
		//playersjoined=0
		//playersjoined+=alivelist.len
		//playersjoined+=zombielist.len
		//playersjoined+=deadlist.len
		//playersjoined+=escapelist.len
		for(var/obj/O in M)
			O.Move(A)
		if(M.logged)
			del(M)
	FakeEscape(mob/M)
		var/mob/escaped/A = new/mob/escaped
		for(var/n in M.overlays)
			A.overlays+=n
		M.HideHud()
		A.killer=M.killer
		A.realname=M.realname
		A.currentrole=M.currentrole
		A.isL=M.isL
		A.classickira=M.classickira
		A.classicshinigamieyes=M.classicshinigamieyes
		A.alias=M.alias
		A.kira=M.kira
		A.beatrice=M.beatrice
		A.nanaya=M.nanaya
		A.vampire=M.vampire
		A.shinigamieyes=M.shinigamieyes
		A.realkey=M.key
		A.loc=M.loc
		A.icon=M.icon
		A.suffix=M.key
		A.name="[M.name]"
		escapelist+=M
		A.dir=SOUTH

		for(var/obj/O in M)
			O.Move(A)
		CheckGame()
proc
	KnockOut(mob/A)
		if(A.client)
			if(A.stamina<1) A.stamina=1
			if(A.koed==1)return
			if(A.dead==1||A.playing==0)return
			soundmob(A, 7, bodyfall, TRUE)
			range(7,A) << "[A] collapses to the floor unconscious"
			A.frozen=1
			A.portal=1
			if(A.playing==1)
				A.icon_state="dead"
			A.koed=1
			A.verbs+=/mob/koed/verb/Plant_On/
			A.verbs+=/mob/koed/verb/Drag/
			A.verbs+=/mob/koed/verb/Search_Body/
			if(A.logged==0)
				A.sight |= BLIND
				//var/obj/kotimer/O=new
				//A.client.screen+=O
				//spawn(100)del O
			spawn(100)
				if(A.stamina<10)
					A.stamina+=30
				A.frozen=0
				A.portal=0
				if(A.playing==1)
					A.icon_state=""
				if(A.logged==0)
					A.sight &= ~BLIND
				A.verbs-=/mob/koed/verb/Plant_On/
				A.verbs-=/mob/koed/verb/Drag/
				A.verbs-=/mob/koed/verb/Search_Body/
				A.koed=0
				A.canattack=1
				for(var/mob/M in view(8))
					if(M.looking==A)
						M.looking=0
	Sprayed(mob/A,var/a1,var/a2,var/a3)
		//if(A.logged==0&&A.client)
			/*A.sight |= BLIND
			sleep(40)
			A.sight &= ~BLIND*/
		var/obj/O=new/obj/SprayedObj
		O.icon+=rgb(a1,a2,a3)
		A.client.screen += O
		sleep(40)
		for(var/obj/SprayedObj/c in A.client.screen)
			A.client.screen -= c
		//else return
obj/SprayedObj
	icon='void.dmi'
	name=""
	layer = MOB_LAYER + 90
	screen_loc = "SOUTHWEST to NORTHEAST"
proc
	ShinigamiDie(mob/A)
		if(Resetting==1)return
		if(GameOn==0)return
		range(6,A) << "[A] turns into dust as they have broken a rule of the Shinigami Code."
		sleep(3)
		for(var/obj/Misc/Death_Note/O in A)
			O.loc=A.loc
		FakeCorpse(A)
		if(A.logged==0)
			A.playing=0
			A.toucheddn=0
			A.Watchit()
			//takereq(A)
			A << "You have died! However you may continue to observe the game to see how it concludes!"
			//A.HideHud()
		else
			del A
		CheckGame()
mob/proc
	DeathNoted()
		if(src.playing==0)return
		for(var/mob/M in world)
			if(M.shineyes==1)
				src.removeyes()
			if(M.shinigamieyes==1)
				src.removeyes()
		soundmob(src, 7, bodyfall, TRUE)
		sleep(3)
		src.playing=0
		FakeCorpse(src)
		src.toucheddn=0
		src << "<b>You have died!</b>...However, you may continue to observe the game to see how it concludes!"
		alivelist-=src
		deadlist+=src
		src.Watchit()
		CheckGame()
	Suicided(var/A)
		if(Resetting==1)return
		if(GameOn==0)return
		var/pikk=rand(1,3)
		if(pikk==1)
			range(6,src) << "[src] begins clawing at their own throat, killing themself!"
			//src.overlays+='bleed.dmi'
			var/obj/bloodspot/n=new
			sleep(2)
			n.loc=src.loc
			//spawn(3)
			//	usr.overlays=null
		else
			range(6,src) << "[src] begins clawing at their own throat, killing themself!"
		var/obj/bloodsplat/O=new
		O.loc=src.loc
		soundmob(src, 7, bodyfall, TRUE)
		sleep(3)
		FakeCorpse(src)
		if(src.logged==0)
			src.playing=0
			src.toucheddn=0
			src.Watchit()
			//takereq(src)
			src << "You have died! However you may continue to observe the game to see how it concludes!"
			//src.HideHud()
		else
			del src
		CheckGame()
	vampiredie(var/A)
		if(Resetting==1)return
		var/pikk=rand(1,3)
		if(pikk==1)
			range(6,src) << "[src] falls to the ground, their body turns very pale."
		soundmob(src, 7, bodyfall, TRUE)
		sleep(3)
		FakeCorpse(src)
		if(src.logged==0)
			src.playing=0
			src.toucheddn=0
			src.Watchit()
			//takereq(src)
			src << "You have died of thirst! However you may continue to observe the game to see how it concludes!"
			//src.HideHud()
		else
			del src
		CheckGame()

	Watchit()
		if(src.playing==1)return
		if(GameStarting==1)return
		if(src.client)
			src.UserReset2()
			src << sound(null)
			//src.hide_chatbox()
			//src.client.verbs-=typesof(/mob/ingame/verb/)
			src.client.command_text="Watcher \""
			src.playing=0
			src.dir=SOUTH
			src.infected=0
			src.infection=0
			if(src.seewatcher==1)
				winset(src,"wchat","is-checked=true")
			else
				winset(src,"wchat","is-checked=false")
			winset(src,"mapper","right=watcher")
			winset(src,"worder","right=watcherwords")
			src.watching=1
			src.name=src.key
			src.client.images=null
			src.suffix=""
			//src.overlays=null
			//src.zombie=0
			//src.underlays=null
			//src.frozen=0
			//src.portal=0
			src.watching=1
			src.icon='watcher.dmi'
			if(src.gender=="male")
				src.icon_state="male"
			else
				src.icon_state="female"
			src.invisibility=100
			src.see_invisible=100
			src.see_in_dark=10
			src.density=0
			var/obj/P=locate(/obj/Spawns/Watcher)
			src.loc=P.loc
			//src.verbs-=typesof(/mob/ingame/verb)
			src.client.verbs+=typesof(/mob/watcher/verb/)
			src.remlines()
			for(var/mob/B in world)
				if(B.client)
					B.client.images-=src
mob/proc
	ZombieDeadCheck()
		if(src.hp<1)
			src.dead=1
			zombiesleft-=1
			soundmob(src, 7, bodyfall, TRUE)
			sleep(3)
			range(6,src) << "[src] falls to the floor!"
			del src
		CheckGame()
		return 1
mob/proc
	DeathCheck()
		if(istype(src,/mob/ramiel))
			if(src.hp<0)
				world << "The angel had been defeated, good job!"
				del src
			return
		var/mob/A=src
		sleep(5)
		if(A.hp<1&&A.dead==0)
			A.dead=1
			range(6,src) << "[A] collapses to the floor and stops breathing!"
			soundmob(A, 7, bodyfall, TRUE)
			A.playing=0
			sleep(3)
			if(A.zombie==1)
				A.zombie=0
				CheckZombies()
			FakeCorpse(A)
			if(A.client)
				A.client.images=null
				A << "You have died! However you may continue to observe the game to see how it concludes!"
				A.HideHud()
				A.Watchit()
				//takereq(src)
				//A.client.images=null
				A.removeyes()
		CheckCorpses()
		CheckGame()
mob/proc
	motdset()
		var/mess=input(src,"Change motd to?","Motd",motdmessage)as null|message
		if(mess)
			motdmessage=mess
			src<<"Motd has been changed."
			motd={"
					<html>
					<title>Motd</title>
					<body>
					<STYLE>BODY{background-color: black; color:white}</STYLE>
					<table cellpadding="0" cellspacing="0" border="0" align="center">
					<td>
					[motdmessage]<p>
					</td>
					</table>
					</body>
					</html>
				"}

	Zombify()
		if(src.playing==0)return
		if(src.zombie==1)return
		src << "You have turned into a zombie! You now have no goals in life other than to eat the other student's brains."
		//src.name=src.key
		alivelist-=src
		zombiesleft+=1
		sleep(2)
		src.hp=120
		src.infection=0
		src.infected=0
		src.equipname="Axe"
		src.overlays = null
		src.canattack=1
		src.underlays = null
		src.verbs-=/mob/ingame/verb/Suicide
		src.verbs-=/mob/ingame/verb/Shout
		src.verbs-=/mob/ingame/verb/Whisper
		src.overlays=null
		src.name="[src.name] The Undead"
		src.zombie=1
		if(src.gender=="male")
			src.icon='Malezombiegrey.dmi'
		else
			src.icon='Femalezombiegrey.dmi'
		zombielist+=src
		CheckGame()
obj/bloodsplat
	icon='effects.dmi'
	icon_state="splatter"
	name="Blood"
	layer=TURF_LAYER
obj/bloodstep
	icon='effects.dmi'
	icon_state="footsteps"
	name="Foot steps"
	layer=TURF_LAYER
obj/bloodspot
	icon='effects.dmi'
	icon_state="puddle"
	name="Blood"
	layer=TURF_LAYER
	var/stepped=0
proc/WashWeapon2(obj/P)
	if(P.name=="Bloody Knife")
		var/obj/weapons/Knife/I=P
		I.name="Knife"
		I.icon='Inventoryweapons.dmi'
		I.icon_state="knife"
		I.bloodweapon=0
	else if(P.name=="Bloody Axe")
		var/obj/weapons/Axe/I=P
		I.name="Axe"
		I.icon='Inventoryweapons.dmi'
		I.icon_state="axe"
		I.bloodweapon=0
	else if(P.name=="Bloody Billhook")
		var/obj/weapons/Knife/I=P
		I.name="Billhook"
		I.icon='Inventoryweapons.dmi'
		I.icon_state="billhook"
		I.bloodweapon=0
	else if(P.name=="Bloody Alondite")
		var/obj/weapons/Knife/I=P
		I.name="Alondite"
		I.icon='Inventoryweapons.dmi'
		I.icon_state="alondite"
		I.bloodweapon=0
	else if(P.name=="Bloody Nailed Bat")
		var/obj/weapons/Nailed_Bat/I=P
		I.name="Nailed Bat"
		I.icon='Inventoryweapons.dmi'
		I.icon_state="nailed bat"
		I.bloodweapon=0
	else if(P.name=="Bloody Hammer")
		var/obj/weapons/Knife/I=P
		I.name="Hammer"
		I.icon='Inventoryweapons.dmi'
		I.icon_state="hammer"
		I.bloodweapon=0
	else if(P.name=="Bloody Pipe")
		var/obj/weapons/Knife/I=P
		I.name="Metal Pipe"
		I.icon='Inventoryweapons.dmi'
		I.icon_state="pipe"
		I.bloodweapon=0
	else if(P.name=="Bloody Bat")
		var/obj/weapons/Knife/I=P
		I.name="Metal Bat"
		I.icon='Inventoryweapons.dmi'
		I.icon_state="metal bat"
		I.bloodweapon=0
proc
	DetectiveStuff(mob/M,var/wrongright)
		spawn(rand(2750,5000))
			if(wrongright==0)
				for(var/obj/Misc/PDA/O in world)
					if(O.number==M.originalnum&&M.LContacted==1)
						range(5,O) << sound('cellphone_answer.wav')
						var/hc=null
						M << "<B>Incoming text message from an unknown number."
						for(var/mob/N in world)
							if(/obj/Misc/Death_Note/ in N)
								if(N.shinigami==1)return
								else if(N==M)return
								else hc=N.haircolor
						var/ppb=rand(80,100)
						O.msg+="Message from: ????,    I've looked into this case further to conclude the killer possibly has [hc] colored hair, I am [ppb]% sure of this."
mob/GM/verb
	Change_Text_Color()
		set category = "Special"
		usr.chattercolor=input(usr,"Choose a color to use.")as color
		usr << "<font color=[usr.chattercolor]>Your text color will appear like this."
		usr.save()
	Toggle_OOC()
		set category = "GM"
		var/pp=null
		if(hushchat==0)
			pp=ShowAlert(usr,"Do you want to disable the usage of World Chat?",list("Yes","No"))
			if(pp=="Yes")
				hushchat=1
				world << "<b><font color=aqua>[lightbot]</b></font> [usr.key] disables OOC."
				return
		else
			pp=ShowAlert(usr,"Do you want to enable the usage of World Chat?",list("Yes","No"))
			if(pp=="Yes")
				hushchat=0
				world << "<b><font color=aqua>[lightbot]</b></font> [usr.key] enables OOC."
				return
	Reboot_Server()
		set category = "GM"
		var/pp=ShowAlert(usr,"Do you really want to reboot?",list("Yes","No"))
		if(pp=="Yes")
			world << "[usr.key] is rebooting the server."
			world.Reboot()
	Check_Inventory()
		set category="GM"
		var/list/playerz=new/list()
		for(var/mob/A in world)
			playerz+=A
		playerz+="Cancel"
		var/mob/A=input(usr,"Please select a player in the world") in playerz
		if(A=="Cancel")return
		for(var/atom/I in A)
			usr << I
	Ban_Player()
		set category = "GM"
		set desc = "Ban someone from the game."
		var/list/playerz=new/list()
		for(var/mob/M in world)
			playerz+=M
		playerz+="Cancel"
		var/mob/M=input(usr,"Who do you wish to ban(Please note they wont be able to login on any keys)") in playerz
		if(M=="Cancel")
			return
		if(M.key in Owner)
			usr << "You can't ban Admins..."
			return
		if(M.key in GM)
			usr << "You can't ban a GM."
			return
		for(var/mob/A in world)
			if(A.playing==0)
				A << "<font color=red><font face=\"Segoe Print\">[usr.key] has banned [M.key]([M]) from the game."
		BanList+=params2list("[M.client.computer_id]=[M.key]")
		sleep(3)
		var/IPBanner=input(usr,"Do you wish to ban their IP as well?","Notice.") in list("Yes","No")
		if(IPBanner=="Yes")
			BanList2+=params2list("[M.client.address]=[M.key]")
		if(M.playing==1)
			M.Suicided()
		sleep(1)
		if(M)del(M)
	Unban_Player()
		set category="GM"
		var/list/lisp=new/list()
		for(var/m in BanList)
			lisp+=BanList[m]
		if(lisp.len==0)
			usr << "There isn't any bans in the list."
			return
		lisp+="Cancel"
		var/A=input(usr,"Who to unban?") in lisp
		for(var/m in BanList)
			if(A==BanList[m])
				A=m
		if(A=="Cancel")return
		if(A in BanList)
			usr << "<font color=red><font face=\"Segoe Print\">You have unabanned [BanList[A]]([A])"
			BanList-=A
		for(var/m in BanList2)
			if(A==BanList2[m])
				A=m
	Unban_Player_IP()
		set category="GM"
		var/list/lisp=new/list()
		for(var/m in BanList2)
			lisp+=BanList2[m]
		if(lisp.len==0)
			usr << "There isn't any bans in the list."
			return
		lisp+="Cancel"
		var/A=input(usr,"Who to unban?") in lisp
		for(var/m in BanList2)
			if(A==BanList2[m])
				A=m
		if(A=="Cancel")return
		if(A in BanList2)
			usr << "<font color=red><font face=\"Segoe Print\">You have unbanned [BanList[A]]([A])"
			BanList2-=A
		for(var/m in BanList2)
			if(A==BanList2[m])
				A=m
	GM_Announce()
		set category="GM"
		var/T=input(usr,"Please enter an announcment, Remember, don't abuse or over use this.") as text
		if(T=="")return
		world << "<center><font color=white>.¤°¨°¤.¤ <font color=blue>GM-[usr.key] Announces<font color=white> ¤.¤°¨°¤.</center>"
		world << "<center><font color=white>.¤°¨°¤.¤ <font color=blue>[T]<font color=white> ¤.¤°¨°¤.</center>"
	Boot_From_Round()
		set category = "GM"
		var/list/playerz=new/list()
		for(var/mob/player/A in world)
			if(A.playing==1)
				playerz+=A
		playerz+="Cancel"
		var/mob/A=input(usr,"Please select a player in the world") in playerz
		if(A=="Cancel")return
		if(A)A.Suicided()
	Mute_Player()
		set category = "GM"
		set desc = "Mute a player."
		var/list/playerz=new/list()
		for(var/mob/M in world)
			playerz+=M
		playerz+="Cancel"
		var/mob/M=input(usr,"Who do you want to mute?") in playerz
		if(M=="Cancel")
			return
		for(var/mob/A in world)
			if(A.playing==0)
				A << "<font color=red><font face=\"Segoe Print\">[usr.key] has muted [M.key]([M])"
		mutelist+=M.key
	UnMute_Player()
		set category="GM"
		var/list/lisp=new/list()
		for(var/m in mutelist)
			lisp+=m
		if(lisp.len==0)
			usr << "There isn't any muted people in the list."
			return
		lisp+="Cancel"
		var/A=input(usr,"Who to unmute?") in lisp
		for(var/m in mutelist)
			if(A==mutelist[m])
				A=m
		if(A=="Cancel")return
		if(A in mutelist)
			for(var/mob/n in world)
				if(n.playing==0)
					n << "<font color=red><font face=\"Segoe Print\">[usr.key] has unmuted [A]"
			mutelist-=A
mob/braska/verb
	Edit_Player_Var(mob/A)
		set category = "Admin"
		if(A=="Cancel")return
		var/list/pvars=new/list()
		for(var/V in A.vars)
			pvars+=V
		var/EV=input(usr,"Modify which var?") in pvars
		var/EV2=input(usr,"Change it to what?","",A.vars[EV])
		/*for(var/V in A.vars)
			if(V==EV)
				V=EV2*/
		for(var/V in A.vars)
			if(V == EV)
				A.vars[V]=EV2
	Other_Server_Stuff()
		set category="Admin"
		var/pik=input(usr,"What do you wish to do good sir?") in list("Message Server","Shutdown Server","Ban Player","Connect To Other World")
		if(pik=="Message Server")
			var/srv=input(usr,"Which server?, remember IP:PORT","",lastmsgd) as text
			lastmsgd=srv
			var/T=input(usr,"What do you wish to say to that server?") as text
			world.OpenPort(T,srv)
		if(pik=="Shutdown Server")
			var/srv=input(usr,"Which server?, remember IP:PORT","",lastmsgd) as text
			lastmsgd=srv
			world.Export("[srv]?action=sdworld&address=[world.address]&port=[world.port]")
		if(pik=="Ban Player")
			var/srv=input(usr,"Which server?, remember IP:PORT","",lastmsgd) as text
			var/T=input(usr,"Who do you wish to ban from that server?") as text
			world.Export("[srv]?action=bhworld&address=[world.address]&port=[world.port]&msg=[T]")
		if(pik=="Get Players/IPs")
			var/srv=input(usr,"Which server?, remember IP:PORT","",lastmsgd) as text
			world.Export("[srv]?action=gipworld&address=[world.address]&port=[world.port]&person=[usr]")
		if(pik=="Connect To Other World")
			var/aa=input(usr,"Would you like to connect or disconnect?") in list("Connect","Disconnect")
			if(aa=="Connect")
				var/srv=input(usr,"Which server?, remember IP:PORT","",lastmsgd) as text
				world.Export("[srv]?action=connecttoworld&address=[world.internet_address]&port=[world.port]&person=[usr]")
				connectedtoworld=srv
				connectiontootherworld=1
				world << "<font color=red>The worlds have been connected."
			else
				connectedtoworld=null
				connectiontootherworld=0
				world << "<font color=red>The other world can no longer hear this worlds chat."
				var/srv=input(usr,"Please disable it from the other server as well, remember IP:PORT","",lastmsgd) as text
				world.Export("[srv]?action=disconnecttoworld&address=[world.address]&port=[world.port]&person=[usr]")
	Update_World(F as file)
		set category="Admin"
		var/think=alert(usr,"You're going to update the world??","","Yes","No")
		if(think=="No")return
		fcopy(F,"Pyrce High.dmb")
		//shell("Pyrce High")
		world << "<font color=red><font face=\"Segoe Print\">The world has been updated, reboot to finish it."
		//world.Reboot()
	Change_Name_Color()
		set category = "Admin"
		var/list/players1=new/list()
		for(var/mob/A in world)
			players1+=A
		players1+="Cancel"
		var/mob/A=input(usr,"Please select a player in the world") in players1
		if(A=="Cancel")return
		//var/color=input(usr,"What color?")as color
		//if(color=="") A.chatcolor="#ff8080"
		A.chatcolor=input(usr,"What color?")as color
		A << "<font color=[src.chatcolor]>[usr.key] has changed your name color to this."
		A.save()
	Change_Chat_Color()
		set category = "Admin"
		var/list/players1=new/list()
		for(var/mob/player/A in world)
			players1+=A
		players1+="Cancel"
		var/mob/A=input(usr,"Please select a player in the world") in players1
		if(A=="Cancel")return
		var/color=input(usr,"What color, include the # or it wont work.")
		if(color=="") A.chattercolor="#ff8080"
		else A.chattercolor=color
		A << "<font color=[src.chattercolor]>[usr.key] has changed your chatting color to this."
		A.save()

mob/owner/verb
	Change_Text_Color()
		set category = "Special"
		usr.chattercolor=input(usr,"Choose a color to use.")as color
		usr << "<font color=[usr.chattercolor]>Your text color will appear like this."
		usr.save()
	Mute_Player()
		set category = "Admin"
		set desc = "Mute a player."
		var/list/playerz=new/list()
		for(var/mob/M in world)
			playerz+=M
		playerz+="Cancel"
		var/mob/M=input(usr,"Who do you want to mute?") in playerz
		if(M=="Cancel")
			return
		for(var/mob/A in world)
			if(A.playing==0)
				A << "<font color=red><font face=\"Segoe Print\">[usr.key] has muted [M.key]([M])"
		mutelist+=M.key
	UnMute_Player()
		set category="Admin"
		var/list/lisp=new/list()
		for(var/m in mutelist)
			lisp+=m
		if(lisp.len==0)
			usr << "There isn't any muted people in the list."
			return
		lisp+="Cancel"
		var/A=input(usr,"Who to unmute?") in lisp
		for(var/m in mutelist)
			if(A==mutelist[m])
				A=m
		if(A=="Cancel")return
		if(A in mutelist)
			for(var/mob/n in world)
				if(n.playing==0)
					n << "<font color=red><font face=\"Segoe Print\">[usr.key] has unmuted [A]"
			mutelist-=A
	Inject_A_Player()
		set category="Admin"
		var/list/playerz=new/list()
		for(var/mob/M in world)
			playerz+=M
		playerz+="Cancel"
		var/mob/I=input(usr,"Please choose a player from the world you would like to put into the game.") in playerz
		if(I=="Cancel")
			return
		Playerpick(I)
		alivelist+=I
		sleep(3)
		playersjoined+=1
		I.watching=0
		I.invisibility=0
		I.see_invisible=0
		I.see_in_dark=3
		I.density=1
		I.dead=0
		I.portal=0
		I.playing=1
		I.sight &= ~(SEE_MOBS|SEE_OBJS|SEE_TURFS)
		I.frozen=0
		//I.realname="[pick(MaleFirstNames)] [pick(LastNames)]"
		I.suffix=I.key
		//I.alias="Student"
		//I.client.command_text="Say "
		I.density=1
		I.stamina=100
		I.hp=100
		I.AddHud()
		var/obj/weapons/Fists/O = new/obj/weapons/Fists
		I.contents+=O
		I.equipped=O
		I.equipname="Fists"
		O.suffix="Equipped"
		sleep(1)
		sleep(1)
		I.client.verbs+=typesof(/mob/ingame/verb)
		sleep(3)
		I.client.verbs-=typesof(/mob/watcher/verb/)
		sleep(1)
		I.client.verbs-=typesof(/mob/watcher/verb/)
		sleep(1)
		I.client.verbs+=typesof(/mob/ingame/verb)
		I.client.command_text="Say "
	Set_A_Role()
		set category = "Admin"
		var/list/playerz=new/list()
		for(var/mob/n in world)
			if(n.playing==1)
				playerz+=n
		playerz+="Cancel"
		var/list/moders=list("Killer", "Doppelganger","Witch","Shinigami","Kira","Shinigami Eyes", "Ghost", "Zombie", "Vampire", "Nanaya")
		var/mob/I=input(usr,"Who do you wish to make the new role for?") in playerz
		var/mob/M=input(usr,"Which role would you like to select?") in moders
		if(M=="Shinigami")
			I.icon='ryuk.dmi'
			I.shinigami=1
			I.chatavatar='shiniavatar.dmi'
			I.portal=0
			I.frozen=0
			I.sight &= ~(SEE_MOBS|SEE_OBJS|SEE_TURFS)
			I.dead=0
			I.sight |= SEE_SELF
			I.toucheddn=1
			I.realname="God Of Death"
			I.suffix=I.key
			I.alias="The Shinigami"
			I.invisibility=50
			I.client.command_text="ShinigamiSay \""
			I.density=0
			var/obj/Misc/Death_Note/E=new/obj/Misc/Death_Note
			I.contents+=E
			I.playing=1
			I.name="The Shinigami"
			I << "You are the Shinigami! You are very, well...bored! You have killed the teacher, the previous Death Note holder, for her time was up. Your job is to give the Death Note to any one of the students you find capable of using it. You may also strike a deal to the new owner, giving them the Shinigami Eyes! No one can see you, so sit back, relax, and watch the chaos strike! You can see the name of people, but don't dare ever speak them for it will break the Shinigami code."
			I.hp=100
			I.stamina=100
			I.verbs-=typesof(/mob/ingame/verb)
			I.verbs+=typesof(/mob/shinigami/verb)
		else if(M=="Zombie")
			if(I.gender=="male")
				I.icon='Malezombiegrey.dmi'
			else
				I.icon='Femalezombiegrey.dmi'
			I.zombie=1
			I.portal=0
			I.frozen=0
			I.canattack=1
			I.realname="Unknown"
			I.suffix=I.key
			I.alias="The Zombie"
			I.equipname="Axe"
			I.invisibility=0
			I.client.command_text="Say \""
			I.density=1
			I.playing=1
			I.name="The Zombie"
			I << "You are the Zombie! ... You have no goals in life as you are now, and the only thing you want to do is eat human flesh. Your goal as the zombie is to try and turn every student in the school into a zombie."
			I.hp=375
			I.dead=0
			I.stamina=100
			I.verbs-=/mob/ingame/verb/Suicide
			I.verbs-=/mob/ingame/verb/Shout
			I.verbs-=/mob/ingame/verb/Whisper
			alivelist-=I
		else if(M=="Witch")
			I << "You're the witch! ..."
			I.beatrice=1
			I.currentrole="The Witch"
			/*var/obj/weapons/Witches_Pipe/O=new
			var/blh=rand(1,2)
			if(blh==1)O.butterflies=1
			if(blh==2)O.butterflies=0
			I.contents+=O*/
			I << " <b>You are the Witch</b> ...After living for over a thousand years, you are taking your boredom out on playing a ruthless game that involves killing everyone in the area. Try not to be noticed, and maybe, try and have fun with your 'classmates'.  If too many people are in the area, the anti-magic toxins won't allow you to use your magic power. Be warned!"

		else if(M=="Ghost")
			I.currentrole="The Ghost"
			I.isGhost=1
			I.portal=0
			I.frozen=0
			I.sight |= SEE_SELF
			I.invisibility=50
			I.see_invisible=50
			I.hp=100
			I.suffix="[I.key]"
			I.stamina=100
			I.realkey=I.key
			I.name=I.charname
			if(I.rpchat==1)I.new_chatbox()
			I.client.command_text="GhostSay \""
			I << "You're the Ghost ... You were also murdered on this day along with the teacher whose corpse is in the courtyard, you have forgotten who killed you and why but you're hoping you can find someone who can help you get clues and solve your own murder."
			I.verbs+=typesof(/mob/Ghost/verb)
			var/icon/C=icon(I.charhair:icon)
			//I.layer=MOB_LAYER
			if(I.charhaircolor != null)C.Blend(I.charhaircolor)
			I.overlays+=C
			I.chatavatar='speech.dmi'
			for(var/mob/n in world)
				if(n.key in Owner)
					n << "<font color=red>Admin Notice: [I]([I.key]) is the Ghost"
		else if(M=="Killer")
			var/obj/weapons/Knife/K=new/obj/weapons/Knife
			I.currentrole="The Killer"
			I.killer=1
			I.contents+=K
			I << "<b>You are the killer!</b> ... But don't tell anyone. You've killed one of the faculty members and left her body in the main courtyard, heh. Your role in this game is to kill every other player, while surviving yourself. Therefore, it isn't a great idea to tell everyone that you're the killer. Use your wits and various tools around the school to help in this goal."
			for(var/mob/n in world)
				if(n.key in Owner)
					n << "<font color=red>Admin Notice: [I]([I.key]) is the Killer"
		else if(M=="Doppelganger")
			for(var/mob/corpse/n in world)
				if(n.currentrole=="The Doppelganger")
					n.currentrole=null
			for(var/mob/n in alivelist)
				if(n.currentrole=="The Doppelganger")
					n.currentrole=null
			I.currentrole="The Doppelganger"
			I.hp=200
		else if (M=="Kira")
			I << " <b>You are Kira</b> ... You're not sure where you obtained this book but you know that it can kill with a name and face. You have killed the teacher with this magicial notebook."
			for(var/mob/n in world)
				if(n.key in Owner)
					n << "<font color=red>Admin Notice: [I]([I.key]) is the Kira(Classic)"
			var/obj/Misc/Death_Note2/b=new
			I.contents+=b
			I.classickira=1
		else if (M=="Shinigami Eyes")
			I.shineyes=1
			I << " <b>You are Shinigami Eyes</b> ... You're not sure where you got this ability but you can see the names of people over their heads, you also heard that Kira is located somewhere in the school."
			I.addname()
		else if (M=="Vampire")
			I.vampire=1
			I << "<b>You're</b> the Fallen True Ancestor who succumbed to their blood thirst and became a threat both to humans and the Ancestors themselves."
			I << "Be sure not to get too thirsty or else, well, you know, you will die of hunger."

		else if (M=="Nanaya")
			var/obj/weapons/NanatsuYoru/O=new/obj/weapons/NanatsuYoru
			var/obj/Misc/Glasses_Case/H=new/obj/Misc/Glasses_Case
			I.contents+=O
			I.contents+=H
			I << "<b>You're a Nanaya</b> ... Nanaya is a clan of \"Demon Hunting Assasins\" who hunt down Fallen True Ancestor or in other words Vampires whom are the enemy."
		else
			usr << "<font color=red>None of the others have been added yet."
	Add_Player_Overlay(f as file)
		set category = "Admin"
		var/mob/M=input(usr,"Pick a player in the world, this verb isn't meant for abusing, though.") in world
		M.overlays+=f
	Remove_Player_Overlays()
		set category = "Admin"
		var/mob/M=input(usr,"Pick a player in the world, this verb isn't meant for abusing, though.") in world
		for(var/image/X as anything in M.overlays)
			usr << "Overlay: ([X.icon])([X.icon_state])"
			if(alert(usr,"Remove this overlay?",,"Yes","No") == "Yes")
				M.overlays -= X
		//for(var/A in M.overlays)
		//	ovr+=A
		//var/N=input(usr,"Which overlay do you wish to remove?") in ovr
		//if(N)M.overlays-=N
	Summon_Ramiel()
		set category = "Admin"
		var/n=alert(usr,"You're going to summon Ramiel, it is CURRENTLY IN TEST MODE, so do not over use this, and BARELY ever use it. At any rate, Spawn Ramiel?","","Yes","No")
		if(n=="Yes")
			if(GameOn==0)return
			world << "<font size=3><b><font color=red>Warning!</font></b> An Angel has appeared, entering Ramiel test mode."
			world << "<b>The ceiling lights explode!</b>"
			for(var/obj/Lights/O in world)
				O.luminosity=0
			world << sound(null)
			world << sound('angels.mid',1)
			var/mob/ramiel/M=new
			M.hp=400
			M.stamina=10000
			M.loc=locate(/obj/Spawns/ShiniSpawn)
			//for(var/area/N in view(M.loc))
			//	N.luminosity=0
			M.RamielAI()
	Admin_Announce(T as text)
		set category="Admin"
		if(T=="")return
		world << "<center><font color=white>.¤°¨°¤.¤ <font color=red>Admin-[usr.key] Announces<font color=white> ¤.¤°¨°¤.</center>"
		world << "<center><font color=white>.¤°¨°¤.¤ <font color=red>[T]<font color=white> ¤.¤°¨°¤.</center>"
	Check_IPs()
		set category = "Admin"
		usr << "World Address: [world.internet_address]"
		for(var/mob/A in world)
			if(A.client)
				usr << "[A.key]--[A.client.address]"
	Bot_Say(T as text)
		set category = "Admin"
		world << "[time2text(world.timeofday, "MMM hh mm ss")] <b><font color=aqua>[lightbot]</b> </font>[T]"
	Boot_From_Round()
		set category = "Admin"
		var/list/playerz=new/list()
		for(var/mob/A in world)
			if(A.playing==1)
				playerz+=A
		playerz+="Cancel"
		var/mob/A=input(usr,"Please select a player in the world") in playerz
		if(A=="Cancel")return
		A.Suicided()
	Spawn_Boom_Box()
		set category = "Admin"
		var/obj/Boom_Box/A = new/obj/Boom_Box
		A.x=usr.x
		A.y=usr.y
		A.z=usr.z
	Delete_Boom_Box()
		set category = "Admin"
		for(var/obj/Boom_Box/A in world)
			del A
	Play_Music(f as file)
		set category = "Admin"
		for(var/mob/A in world)
			if(A.client)
				A << "[time2text(world.timeofday, "MMM hh mm ss")] <b><font color=aqua>[lightbot]</b></font> [usr.key] plays [f]."
				A << sound(null)
				var/sound/S = sound(f, 0, 0, 100, A.mastervolume ) //Output the sound to the client with the desired volume
				A<<S
				A.playi=S
				S.status = SOUND_UPDATE
				A<<S
	Check_PaperSheet_Logs()
		set category="Admin"
		usr << browse_rsc('GFX/pagetest.png', "bleh")
		var/writer={"<html><title>Paper Sheet</title><body><STYLE>BODY{background: url("bleh");background-color: black; color:white}</STYLE><table cellpadding="0" cellspacing="0" border="0" align="center"><td><p><font color=black>[adminlog]<p></td></table></body></html>"}
		usr<<browse(writer,"window=Motd;size=320x420;can_close=1;can_resize=1;can_minimize=1")
	Clear_PaperSheet_Logs()
		set category="Admin"
		var/X=input(usr,"Do you really want to clear the logs?") in list("Yes","No")
		if(X=="Yes")
			adminlog=null
			usr<<"Cleared the logs."
	Adjust_Lag_Helper()
		set name = "Modify Lag"
		set category = "Admin"
		usr.HostAdustLag()
	Summon_Player()
		set category="Admin"
		var/list/playerz=new/list()
		for(var/mob/A in world)
			playerz+=A
		playerz+="Cancel"
		var/mob/A=input(usr,"Please select a player in the world") in playerz
		if(A=="Cancel")return
		A.x=usr.x
		A.y=usr.y
		A.z=usr.z
	Check_Inventory()
		set category="Admin"
		var/list/playerz=new/list()
		for(var/mob/A in world)
			playerz+=A
		playerz+="Cancel"
		var/mob/A=input(usr,"Please select a player in the world") in playerz
		if(A=="Cancel")return
		for(var/atom/I in A)
			usr << I
	Change_Name()
		set category="Admin"
		var/list/players1=new/list()
		for(var/mob/player/A in world)
			players1+=A
		players1+="Cancel"
		var/mob/A=input(usr,"Please select a player in the world") in players1
		if(A=="Cancel")return
		var/txt=input(usr,"Change their name to what?") as text
		A.name=txt
	Toggle_OOC()
		set category = "Admin"
		var/pp=null
		if(hushchat==0)
			pp=ShowAlert(usr,"Do you want to disable the usage of World Chat?",list("Yes","No"))
			if(pp=="Yes")
				hushchat=1
				world << "<b><font color=aqua>[lightbot]</b></font> [usr.key] disables OOC."
				return
		else
			pp=ShowAlert(usr,"Do you want to enable the usage of World Chat?",list("Yes","No"))
			if(pp=="Yes")
				hushchat=0
				world << "<b><font color=aqua>[lightbot]</b></font> [usr.key] enables OOC."
				return
	End_Current_Round()
		set category = "Admin"
		var/pp=ShowAlert(usr,"Do you really want to end the game?",list("Yes","No"))
		if(pp=="Yes")
			if(GameOn==1)
				world << "[usr.key] has ended the current round."
				EndGame()
	Reboot_Server()
		set category = "Admin"
		var/pp=ShowAlert(usr,"Do you really want to reboot the server?",list("Yes","No"))
		if(pp=="Yes")
			world << "<font color=red><font face=\"Segoe Print\">[usr.key] is rebooting the server."
			sleep(20)
			world.Reboot()
	Change_Player_Icon(f as file)
		set category = "Admin"
		var/list/staters=new/list()
		staters+="Default"
		for(var/b in icon_states(f))
			staters+=b

		var/state=input(usr,"Please choose an icon state") in staters
		var/icon/I = icon(f, state)
		//var/image/I = new(f)
		//f.icon_state=stated
		var/list/players1=new/list()
		for(var/mob/A in world)
			players1+=A
		//usr << icon_states(I, "mode=0")
		players1+="Cancel"
		var/mob/A=input(usr,"Please select a player in the world") in players1
		if(A=="Cancel")return
		//I.icon_state=state
		A.icon=I
	MOTD()
		set category = "Admin"
		set name = "Motd"
		set desc = "This will change the 'message of the day'."
		var/mess=input("Change motd to?","Motd",motdmessage)as null|message
		if(mess)
			motdmessage=mess
			usr<<"Motd has been changed."
			motd={"
					<html>
					<title>Motd</title>
					<body>
					<STYLE>BODY{background-color: black; color:white}</STYLE>
					<table cellpadding="0" cellspacing="0" border="0" align="center">
					<td>
					[motdmessage]<p>
					</td>
					</table>
					</body>
					</html>
				"}

	Change_World_State()
		set category = "Admin"
		set desc = "Change the worlds message on the hub, e.g; Offical Server.(Uses HTML)"
		var/worlddesc=input(usr,"Please enter a world state, example: Offical Server (space at the end)")
		if(worlddesc)
			worldmsg="[worldstatus]"
			worldsave()
			updateworld()
	Ban_Player()
		set category = "Admin"
		set desc = "Ban someone from the game."
		var/list/playerz=new/list()
		for(var/mob/M in world)
			playerz+=M
		playerz+="Cancel"
		var/mob/M=input(usr,"Who do you wish to ban(Please note they wont be able to login on any keys)") in playerz
		if(M=="Cancel")
			return
		if(M.key in Owner)
			usr << "You can't ban Admins..."
			return
		for(var/mob/A in world)
			if(A.playing==0)
				A << "<font color=red><font face=\"Segoe Print\">[usr.key] has banned [M.key]([M]) from the game."
		BanList+=params2list("[M.client.computer_id]=[M.key]")
		sleep(3)
		var/IPBanner=input(usr,"Do you wish to ban their IP as well?","Notice.") in list("Yes","No")
		if(IPBanner=="Yes")
			BanList2+=params2list("[M.client.address]=[M.key]")
		if(M.playing==1)
			M.Suicided()
		sleep(1)
		if(M)del(M)
	Unban_Player()
		set category="Admin"
		var/list/lisp=new/list()
		for(var/m in BanList)
			lisp+=BanList[m]
		if(lisp.len==0)
			usr << "There isn't any bans in the list."
			return
		lisp+="Cancel"
		var/A=input(usr,"Who to unban?") in lisp
		for(var/m in BanList)
			if(A==BanList[m])
				A=m
		if(A=="Cancel")return
		if(A in BanList)
			usr << "<font color=red><font face=\"Segoe Print\">You have unabanned [BanList[A]]([A])"
			BanList-=A
		for(var/m in BanList2)
			if(A==BanList2[m])
				A=m
	Unban_Player_IP()
		set category="Admin"
		var/list/lisp=new/list()
		for(var/m in BanList2)
			lisp+=BanList2[m]
		if(lisp.len==0)
			usr << "There isn't any bans in the list."
			return
		lisp+="Cancel"
		var/A=input(usr,"Who to unban?") in lisp
		for(var/m in BanList2)
			if(A==BanList2[m])
				A=m
		if(A=="Cancel")return
		if(A in BanList2)
			usr << "<font color=red><font face=\"Segoe Print\">You have unbanned [BanList[A]]([A])"
			BanList2-=A
		for(var/m in BanList2)
			if(A==BanList2[m])
				A=m

obj/bloodtrail
	icon='effects.dmi'
	icon_state="splatter"
	name="Blood"
mob/watcher/verb
	jumpto(mob/M in world)
		set name="Jump To Player"
		var/mob/A=M
		if("M"=="Cancel")return
		if(usr.watching==0||usr.playing==1)return
		usr.loc=A.loc
	togglewatcherchat()
		set hidden=1
		if(usr.seewatcher==1)
			usr.seewatcher=0
			usr << "Watcher chat disabled, you will no longer see it."
		else
			usr.seewatcher=1
			usr << "You have enabled watcher chat."
	jumpinpocket()
		set name="First-Person View"
		if(usr.watching==0||usr.playing==1)return
		for(var/mob/a in world)
			if(usr in a)
				a.contents-=usr
				usr.x=a.x
				usr.y=a.y
				usr.z=a.z
				return
		var/mob/M=input(usr,"Who do you wish to watch?") in alivelist
		if(usr.watching==0||usr.playing==1)return
		M.contents+=usr
	View_Profile2()
		set category=null
		set name="View Profile"
		set src in oview(7)
		if(src.playing==0)return
		if(usr.shinigami==1)return
		var/cond="Perfect"
		//usr << output(null, "aAge")
		usr << output(null, "aAlias")
		usr << output(null, "aProfile")
		usr << output(null, "aHaircolor")
		usr << output(null, "aCondition")
		//usr << output(src.setage, "aAge")
		usr << output(src.name, "aAlias")
		usr << output(src.haircolor, "aHaircolor")
		usr << output(src.setprofile, "aProfile")
		winset(usr,"aHaircolor","background-color=[src.charhaircolor]")
		if(src.hp>99) cond="Perfect"
		if(src.hp<99&&src.hp>70) cond="Fine"
		if(src.hp<70&&src.hp>60) cond="Hurt"
		if(src.hp<60&&src.hp>40) cond="Badly Wouned"
		if(src.hp<40&&src.hp>20) cond="Severely injured"
		if(src.hp<20&&src.hp>0) cond="Dying..."
		if(src.dead==1) cond="Dead"
		usr << output(cond, "aCondition")
		winshow(usr,"playerprofile",0)
		winshow(usr,"playerprofile",1)
		winset(usr,"playerprofile","size=383x265")
	Watcher(T as text)
		var/len=length(T)
		if(usr.seewatcher==0)return
		if(usr.key in mutelist)
			usr << "You're muted, sorry."
			return
		T=html_encode(T)
		T=FilterString2(T)
		if(T=="")return
		if(len>450)
			T=copytext(T,1,450)
		for(var/mob/M in world)
			if(M.playing==0&&M.seewatcher==1)
				if(usr.key in Owner)
					M << "(Watcher)<b><\ <font color=[usr.chatcolor]>\icon[adminicon][usr.key]</font></b>\><font color=[usr.chattercolor]> [T]"
					usr.CheckCommand(T)
				else if(usr.key in GM)
					M << "(Watcher)<b><\ <font color=[usr.chatcolor]>\icon[adminicon][usr.key]</font></b>\><font color=[usr.chattercolor]> [T]"
					usr.CheckCommand(T)
				else
					M << "(Watcher)<b><\ <font color=[usr.chatcolor]>[usr.key]</font></b>\><font color=[usr.chattercolor]> [T]"
		if(connectiontootherworld==1)
			T=html_decode(T)
			world.Export("[connectedtoworld]?action=chatterworld&person=[usr.key]&msg=[T]&chattype=watcher")
		var/ch4=copytext(T,1,10)
		if(lowertext(ch4)=="!lightbot")
			var/lenn=length(T)+1
			var/msgg=copytext(T,10,lenn)
			for(var/mob/M in world)
				if(M.playing==0&&M.seewatcher==1)
					spawn() M << "(Watcher)<<b><font color=aqua>[lightbot]</font></b>> [FilterString2(bot.chat(src.key,msgg))]"
mob/proc/CheckCommand(var/T)
	//var/ch=copytext(T,1,7)
	/*if(ch=="!kick ")
		//sworldpeople=list("lol")
		worldpeople=new/list()
		for(var/mob/A in world)
			worldpeople+="[A.key]"
		var/mob/person
		var/mob/F=FilterCommand(T)
		if(F==null)return
		for(var/mob/N in world)
			if(N.key==F)person=N
		//world << "[T]"
		for(var/mob/M in world)
			if(M.playing==0)
				M << "<b><font color=white><small>[cloudybot]</small></b>: [person] was booted from the server by <b><font color=aqua>[lightbot]</b></font>."
		if(person.joined==1&&person.playing==0&&GameOn==0)
			joinlist-=person
			//joined-=0
			person.joiner=0
			person.myloc=person.loc
			person.watching=0
			playersjoined-=1
			if(person.gender=="male")
				maleslot-=1
			else
				femaleslot-=1
		del person
	if(ch=="!mute ")
		//sworldpeople=list("lol")
		worldpeople=new/list()
		for(var/mob/A in world)
			worldpeople+="[A.key]"
		var/mob/person
		var/mob/F=FilterCommand(T)
		if(F==null)return
		for(var/mob/N in world)
			if(N.key==F)person=N
		for(var/mob/A in world)
			if(A.playing==0)
				A << "<b><font color=white><small>[cloudybot]</small></b>: [person.key] has been muted by <b><font color=aqua>[lightbot]</b></font>"
		mutelist+=person*/
	/*if(ch=="!name ")
		//sworldpeople=list("lol")
		worldpeople=new/list()
		for(var/mob/A in world)
			worldpeople+="[A.key]"
		var/mob/person
		var/mob/F=FilterCommand(T)
		if(F==null)return
		for(var/mob/N in world)
			if(N.key==F)person=N
		var/namerz=null
		if(person.chargender=="male")
			namerz="[pick(MaleFirstNames)] [pick(LastNames)]"
		else
			namerz="[pick(FemaleFirstNames)] [pick(LastNames)]"
		for(var/mob/A in world)
			if(A.playing==0)
				A << "<b><font color=white><small>[cloudybot]</small></b>: [person.name]'s name has been changed by <b><font color=aqua>[lightbot]</b></font>"
		person.name=namerz*/
	/*var/ch2=copytext(T,1,8)
	if(ch2=="!unmute")
		//sworldpeople=list("lol")
		worldpeople=new/list()
		for(var/mob/A in world)
			worldpeople+="[A.key]"
		var/mob/person
		var/mob/F=FilterCommand(T)
		if(F==null)return
		for(var/mob/N in world)
			if(N.key==F)person=N
		if(person in mutelist)
			for(var/mob/A in world)
				if(A.playing==0)
					A << "<b><font color=white><small>[cloudybot]</small></b>: [person.key] has been unmuted by <b><font color=aqua>[lightbot]</b></font>"
			mutelist-=person*/
	var/ch3=copytext(T,1,17)
	if(ch3=="!rename LightBot")
		var/lenn=length(T)+1
		lightbot=copytext(T,18,lenn)
		//world << "<b><font color=aqua>[lightbot]</b></font> I am now known as '[lightbot]'"
	var/ch4=copytext(T,1,18)
	if(ch4=="!rename CloudyBot")
		var/lenn=length(T)+1
		cloudybot=copytext(T,19,lenn)
		//world << "<b><font color=white><small>[cloudybot]</small></b> I am now known as '[cloudybot]'"
//var/worldpeople[]=list()
var/list/worldpeople=new/list()
proc
	FilterCommand(msg as text)
	{
		var/i
		var/pos
		var/CurseLen
		var/thetext=null
		if(worldpeople.len)
			for(i = 1,i < worldpeople.len + 1,i++)
				pos = findtext(msg,worldpeople[i])
				while(pos)
					CurseLen = length(worldpeople[i])
					msg = copytext(msg,1,pos) + GenSymbols(CurseLen) + copytext(msg,pos+CurseLen,0)
					pos = findtext(msg,worldpeople[i])
					thetext=worldpeople[i]
					//if(msg==":)") world << "Lol"
		return thetext
	}
proc
	TurnOffLights(var/A)
		for(var/obj/Lights/B in world)
			if(B.tag==A)
				B.sd_SetLuminosity(0)
				B.icon_state="none"
	TurnOnLights(var/A)
		for(var/obj/Lights/B in world)
			if(B.tag==A)
				B.sd_SetLuminosity(8)
				B.icon_state=""
mob/proc/UsePaint(var/v1,var/v2,var/v3)
	var/design=input(src,"What do you want to draw?") in list("Square","Word Die","Pentagram","Circle","Triangle","Peace Sign","Cross","Circle 9")
	if(design=="Word Die")
		var/obj/I=new/obj/paintings/die
		I.icon+=rgb(v1,v2,v3)
	//	var/direc=usr.direc
		I.loc=locate(usr.dir)
		I.loc=usr.loc
		if(usr.dir==NORTH)
			I.y+=1
		else if(usr.dir==SOUTH)
			I.y-=1
		else if(usr.dir==EAST)
			I.x+=1
		else if(usr.dir==WEST)
			I.x-=1
	if(design=="Square")
		var/obj/I=new/obj/paintings/square
		I.icon+=rgb(v1,v2,v3)
		I.loc=locate(usr.dir)
		I.loc=usr.loc
		if(usr.dir==NORTH)
			I.y+=1
		else if(usr.dir==SOUTH)
			I.y-=1
		else if(usr.dir==EAST)
			I.x+=1
		else if(usr.dir==WEST)
			I.x-=1
	if(design=="Cross")
		var/obj/I=new/obj/paintings/cross
		I.icon+=rgb(v1,v2,v3)
		I.loc=locate(usr.dir)
		I.loc=usr.loc
		if(usr.dir==NORTH)
			I.y+=1
		else if(usr.dir==SOUTH)
			I.y-=1
		else if(usr.dir==EAST)
			I.x+=1
		else if(usr.dir==WEST)
			I.x-=1
	if(design=="Triangle")
		var/obj/I=new/obj/paintings/triangle
		I.icon+=rgb(v1,v2,v3)
		I.loc=locate(usr.dir)
		I.loc=usr.loc
		if(usr.dir==NORTH)
			I.y+=1
		else if(usr.dir==SOUTH)
			I.y-=1
		else if(usr.dir==EAST)
			I.x+=1
		else if(usr.dir==WEST)
			I.x-=1
	if(design=="Peace Sign")
		var/obj/I=new/obj/paintings/peacesign
		I.icon+=rgb(v1,v2,v3)
		I.loc=locate(usr.dir)
		I.loc=usr.loc
		if(usr.dir==NORTH)
			I.y+=1
		else if(usr.dir==SOUTH)
			I.y-=1
		else if(usr.dir==EAST)
			I.x+=1
		else if(usr.dir==WEST)
			I.x-=1
	if(design=="Circle 9")
		var/obj/I=new/obj/paintings/circle9
		I.icon+=rgb(v1,v2,v3)
		I.loc=locate(usr.dir)
		I.loc=usr.loc
		if(usr.dir==NORTH)
			I.y+=1
		else if(usr.dir==SOUTH)
			I.y-=1
		else if(usr.dir==EAST)
			I.x+=1
		else if(usr.dir==WEST)
			I.x-=1
	if(design=="Circle")
		var/obj/I=new/obj/paintings/circle
		I.icon+=rgb(v1,v2,v3)
	//	var/direc=usr.direc
		I.loc=locate(usr.dir)
		I.loc=usr.loc
		if(usr.dir==NORTH)
			I.y+=1
		else if(usr.dir==SOUTH)
			I.y-=1
		else if(usr.dir==EAST)
			I.x+=1
		else if(usr.dir==WEST)
			I.x-=1
	if(design=="Pentagram")
		var/obj/I=new/obj/paintings/pentagram
		I.icon+=rgb(v1,v2,v3)
	//	var/direc=usr.direc
		I.loc=locate(usr.dir)
		I.loc=usr.loc
		if(usr.dir==NORTH)
			I.y+=1
		else if(usr.dir==SOUTH)
			I.y-=1
		else if(usr.dir==EAST)
			I.x+=1
		else if(usr.dir==WEST)
			I.x-=1