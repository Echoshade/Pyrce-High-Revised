var/list/punchsounds=list('audio/punch.wav','audio/punch2.wav','audio/punch3.wav')
var
 nailbatstam=5
 nailedbatdmg=9
 nailbatweight=3
 fightfont="<font face=Arial><b>"
obj/var
	painter=5
	spray=0
	paintcolor="Green"
proc
	LethalWeapon(obj/O,mob/M,mob/E)
		if(M.stamina<O.stamtake)return
		if(istype(O,/obj/weapons/Spear))
			if(!E in M.dir)return
		var/thedmg=O.dmgtake
		var/missed=0
		if(M==E)
			for(var/mob/n in range(8,M))
				if(n.rpchat==0||n.watching==1)
					n << "[n.fightfont][M] [O.msgtake] themself with their [filterbloody(O.name)]!"
				_message(n,"[n.fightfont][M] [O.msgtake] themself with their [filterbloody(O.name)]!")
		else
			var/evade=0
			evade=rand(1,10)
			if(E.dead==1)
				for(var/mob/n in range(8,M))
					n << "[n.fightfont][M] [O.msgtake] [E] with their [filterbloody(O.name)]!</b>"
				M.stamina-=O.stamtake
				M.canattack=0
				spawn(O.delaytake) M.canattack=1
				goto endd
			if(E.logged==0||E.koed==0)
				if(evade==1)
					for(var/mob/n in range(8,M))
						if(n.rpchat==0||n.watching==1)
							n << "[n.fightfont][E] evades the attack attempted from [M]!"
						_message(n,"[n.fightfont][E] evades the attack attempted from [M]!")
						missed=1
					thedmg=0
					goto nomsg
			if(M.dir==SOUTH&&E.dir==NORTH||M.dir==NORTH&&E.dir==SOUTH||M.dir==WEST&&E.dir==EAST||M.dir==EAST&&E.dir==WEST)
				evade=rand(1,4)
				if(evade==1)
					for(var/mob/n in range(8,M))
						if(n.rpchat==0||n.watching==1)
							n << "[n.fightfont][M] cleanly [O.msgtake] [E] with their [filterbloody(O.name)]!"
						_message(n,"[n.fightfont][M] cleanly [O.msgtake] [E] with their [filterbloody(O.name)]!")
					thedmg+=rand(1,3)
					goto nomsg
			if(E in get_step(M,M.dir)&&E.dir==M.dir)
				evade=rand(1,4)
				if(evade==1)
					for(var/mob/n in range(8,M))
						n << "[n.fightfont][M] [O.msgtake] [E] in the back with their [filterbloody(O.name)]!"
					thedmg-=rand(1,2)
					goto nomsg
			for(var/mob/n in range(8,M))
				if(n.rpchat==0||n.watching==1)
					n << "[n.fightfont][M] [O.msgtake] [E] with their [filterbloody(O.name)]!"
				_message(n,"[n.fightfont][M] [O.msgtake] [E] with their [filterbloody(O.name)]!")
			if(O.type==/obj/weapons/Billhook&&missed==0)
				soundmob(E, 7, 'audio/billhook.wav', TRUE)
			if(O.type==/obj/weapons/Knife&&missed==0)
				soundmob(E, 7, 'audio/knife_stab.ogg', TRUE)
			if(O.type==/obj/weapons/Metal_Bat&&missed==0)
				soundmob(E, 7, 'audio/bat_hit.ogg', TRUE)
		if(O.bloodweapon==0&&missed==0)
			if(O.type==/obj/weapons/Knife)
				M.underlays-='knife.dmi'
				M.underlays+='bloodyknife.dmi'
				O.icon_state="bloody knife"
				O.name="Bloody Knife"
				O.bloodweapon=1
			if(O.type==/obj/weapons/Axe)
				M.underlays-='axe.dmi'
				M.underlays+='bloodyaxe.dmi'
				O.icon_state="bloody axe"
				O.name="Bloody Axe"
				O.bloodweapon=1
			if(O.type==/obj/weapons/Billhook)
				M.underlays-='billhook.dmi'
				M.underlays+='bloodybillhook.dmi'
				O.icon_state="bloody billhook"
				O.name="Bloody Billhook"
				O.bloodweapon=1
			if(O.type==/obj/weapons/Alondite)
				M.underlays-='alondite.dmi'
				M.underlays+='bloodyalondite.dmi'
				O.icon_state="bloody alondite"
				O.name="Bloody Alondite"
				O.bloodweapon=1
			if(O.type==/obj/weapons/Hammer)
				M.underlays-='hammer.dmi'
				M.underlays+='bloodyhammer.dmi'
				O.icon_state="bloody hammer"
				O.name="Bloody Hammer"
				O.bloodweapon=1
			if(O.type==/obj/weapons/Nailed_Bat)
				M.underlays-='nailedwoodbat.dmi'
				M.underlays+='bloodynailedbat.dmi'
				O.icon_state="bloody nailed bat"
				O.name="Bloody Nailed Bat"
				O.bloodweapon=1
			if(O.type==/obj/weapons/Metal_Bat)
				M.underlays-='metalbat.dmi'
				M.underlays+='bloodymetalbat.dmi'
				O.bloodweapon=1
				O.icon_state="bloody metal bat"
				O.name="Bloody Metal Bat"
		:nomsg
		var/dmgred=0
		if(llevel=="Very Low")
			dmgred=thedmg*0.11
			thedmg-=round(dmgred)
		if(llevel=="Low")
			dmgred=thedmg*0.14
			thedmg-=round(dmgred)
		if(llevel=="Below Normal")
			dmgred=thedmg*0.17
			thedmg-=round(dmgred)
		if(llevel=="Normal")
			dmgred=thedmg*0.20
			thedmg-=round(dmgred)
		if(llevel=="Above Normal")
			dmgred=thedmg*0.15
			thedmg-=round(dmgred)
		if(llevel=="High")
			dmgred=thedmg*0.10
			thedmg-=round(dmgred)
		if(llevel=="One Hit One Kill")
			thedmg=999
		if(thedmg<1) thedmg=1
		E.hp-=thedmg
		M.stamina-=O.stamtake
		M.canattack=0
		spawn(O.delaytake) M.canattack=1
		if(missed==0)
			BleedEffect(M,E)
			BloodSpotEffect(E)
			BleedEffect(E,M)
		if(E.dead==0)
			E.updatehp()
			E.DeathCheck()
		CheckGame()
		:endd
	BluntWeapon(obj/O,mob/M,mob/E)
		if(M.stamina<O.stamtake)return
		var/thedmg=O.dmgtake
		//if("Bloody" in WName
		if(M==E)
			for(var/mob/n in range(8,M))
				if(n.rpchat==0||n.watching==1)
					n << "[n.fightfont][M] [O.msgtake] themself with their [O.name]!</b>"
				_message(n,"[n.fightfont][M] [O.msgtake] themself with their [O.name]!</b>")
		else
			var/evade=0
			evade=rand(1,10)
			if(E.dead==1)
				for(var/mob/n in range(8,M))
					n << "[n.fightfont][M] [O.msgtake] [E] with their [O.name]!</b>"
				M.stamina-=O.stamtake
				M.canattack=0
				spawn(O.delaytake) M.canattack=1
				goto endd
			if(E.logged==0)
				var/activ=E.client.inactivity/10
				if(evade==1&&activ<2)
					for(var/mob/n in range(8,M))
						if(n.rpchat==0||n.watching==1)
							n << "[n.fightfont][E] evades the attack attempted from [M]</b>!"
						_message(n,"[n.fightfont][E] evades the attack attempted from [M]</b>!")
					thedmg=0
					goto nomsg
			if(M.dir==SOUTH&&E.dir==NORTH||M.dir==NORTH&&E.dir==SOUTH||M.dir==WEST&&E.dir==EAST||M.dir==EAST&&E.dir==WEST)
				var/ev=M.dexterity+O.dex
				if(ev>93)ev=93
				evade=rand(ev,100)
				if(evade==100)
					for(var/mob/n in range(8,M))
						if(n.rpchat==0||n.watching==1)
							n << "[n.fightfont][M] cleanly [O.msgtake] [E] with their [O.name]!</b>"
						_message(n,"[n.fightfont][M] cleanly [O.msgtake] [E] with their [O.name]!</b>")
					thedmg+=rand(1,3)
					if(thedmg<1) thedmg=1
					goto nomsg
			if(E in get_step(M,M.dir)&&E.dir==M.dir)
				evade=rand(1,6)
				if(evade==1)
					for(var/mob/n in range(8,M))
						n << "[n.fightfont][M] barely [O.msgtake] [E] in the back with their [O.name]!</b>"
					thedmg-=rand(1,4)
					if(thedmg<1) thedmg=1
					goto nomsg
				if(evade==2)
					for(var/mob/n in range(8,M))
						n << "[n.fightfont][M] cleanly [O.msgtake] [E] in the back with their [O.name]!</b>"
					thedmg+=rand(1,4)
					if(thedmg<1) thedmg=1
					goto nomsg
			//var/rnd=rand(1,3)
			for(var/mob/n in range(8,M))
				if(n.rpchat==0||n.watching==1)
					n << "[n.fightfont][M] [O.msgtake] [E] with their [O.name]!</b>"
				_message(n,"[n.fightfont][M] [O.msgtake] [E] with their [O.name]!</b>")
			//if(rnd==2) range(8,M) << "<b>[M] [O.msgtake] [E] with their [O.name]!</b>"
		:nomsg
		if(O.type==/obj/weapons/Fists)
			soundmob(E, 7, pick(punchsounds), TRUE)
		if(O.type==/obj/weapons/Wooden_Bat)
			soundmob(E, 7, 'audio/bat_hit.ogg', TRUE)
		E.stamina-=thedmg
		M.stamina-=O.stamtake
		M.canattack=0
		spawn(O.delaytake) M.canattack=1
		if(E.logged==0)
			E.updatesp()
		if(E.stamina<1&&E.koed==0&&E.dead==0)
			KnockOut(E)
		CheckGame()
		:endd
	Taser(obj/O,mob/M,mob/E)
		if(O.name=="Taser")
			if(M==E)
				for(var/mob/n in range(8,M))
					if(n.rpchat==0||n.watching==1)
						n << "[n.fightfont][M] shocks themself with their Taser!"
					_message(n,"[n.fightfont][M] shocks themself with their Taser!")
			else
				for(var/mob/n in range(8,M))
					n << "[n.fightfont][M] shocks [E] with their Taser!"
			soundmob(E, 7, 'audio/taser.wav', TRUE)
			O.painter-=1
			if(O.painter<1)
				M << "The battery insde the taser seems to have gone dead."
				O.name="Dead Taser"
				M.equipname="Dead Taser"
				O.lethal=0
			M.canattack=0
			spawn(12) M.canattack=1
			if(E.dead==0)
				KnockOut(E)
	ZombieAttack(mob/A,mob/B)
		if(B.zombie==1)return
		for(var/mob/n in range(8,B))
			n << "[n.fightfont][A] bites at [B]!"
		B.hp-=rand(10,14)
		A.canattack=0
		spawn(19) A.canattack=1
		if(B.hp<1)
			if(B.zombie==0&&B.dead==0)
				if(B.zombie==1)return
				B.canattack=1
				B.Zombify()
		if(B.infected==0&&B.dead==0)
			var/rander=rand(1,2)
			if(rander==1)
				B.infected=1
				B.infection=1
				B << "[B.fightfont]<font color=gray>Ouch, you have been infected, you should probably look for a cure or something."
	Paint(obj/O,mob/A,mob/B)
		if(A.stamina>2)
			O.painter-=1
			A.stamina-=2
			if(A==B)
				for(var/mob/n in range(8,B))
					n << "[n.fightfont][A] sprays themself with their Spray Paint!"
			else
				for(var/mob/n in range(8,B))
					n << "[n.fightfont][A] sprays [B] with their Spray Paint!"
			soundmob(B, 7, Sprayer, TRUE)
			var/icon/I='paintoverlay.dmi'
			//if(O.paintcolor=="Red")
			I+=rgb(O.pcolor1,O.pcolor2,O.pcolor3)
			Sprayed(B,O.pcolor1,O.pcolor2,O.pcolor3)
			B.overlays+=I
			if(O.painter<0)
				O.name="Empty Paint"
				A.equipname="Empty Paint"
				A << "<i>That seems to be the last of the paint..</i>"
				O.lethal=0
			A.canattack=0
			spawn(24) A.canattack=1
	NanayaAttack(mob/A,mob/B)
		if(A.equipname=="Nanatsu-Yoru"&&A.stamina>15)
			if(A.stamina<15)return
			if(B.dead==1)
				for(var/mob/n in range(8,B))
					n << "[n.fightfont][A] stabs [B] with their Nanatsu-Yoru!"
				goto derp
			if(usr.glassesoff==0)
				if(A==B)
					for(var/mob/n in range(8,B))
						n << "[n.fightfont][A] stabs themself with their Nanatsu-Yoru!"
				else
					for(var/mob/n in range(8,B))
						n << "[n.fightfont][A] stabs [B] with their Nanatsu-Yoru!"
				if(B.hp==100)
					var/obj/bloodsplat/N = new
					N.loc=B.loc
				B.hp-=knifedmg
				A.stamina-=knifestam
				A.canattack=0
				spawn(22) A.canattack=1
				if(B.dead==0)
					B.DeathCheck()
				return
			var/randerr=rand(1,100)
			if(randerr==1)
				if(A==B)
					for(var/mob/n in range(8,B))
						n << "[n.fightfont][A] slashes along the lines of themself perfectly!"
				else
					for(var/mob/n in range(8,B))
						n << "[n.fightfont][A] slashes along the lines of [B] perfectly, instantly killing them!"
				B.hp-=999
			else
				if(A==B)
					for(var/mob/n in range(8,B))
						n << "[n.fightfont][A] slashes along the lines of themself!"
				else
					for(var/mob/n in range(8,B))
						n << "[n.fightfont][A] slashes along the lines of [B]!"
				B.hp-=rand(1,33)
			//var/obj/weapons/NanatsuYoru/O=A.equipped
			if(B.hp==100)
				var/obj/bloodsplat/N = new
				N.loc=B.loc
			:derp
			A.stamina-=rand(10,15)
			BleedEffect(A,B)
			BloodSpotEffect(B)
			BleedEffect(B,A)
			A.canattack=0
			spawn(28) A.canattack=1
			if(B.dead==0)
				B.DeathCheck()
	VampireBite(mob/A,mob/B)
		if(A.vampire==1)
			if(A.stamina<8)return
			if(A==B)
				for(var/mob/n in range(8,B))
					n << "[n.fightfont][A] bites themself!"
			else
				for(var/mob/n in range(8,B))
					n << "[n.fightfont][A] vigorously bites [B]!"
			A.stamina-=8
			A.canattack=0
			spawn(22) A.canattack=1
			if(B.dead==0)
				var/hprand=rand(1,24)
				B.hp-=hprand
				A.hp+=hprand-rand(1,hprand)
				if(A.hp>99)
					A.hp=100
				A.updatehp()
				B.updatehp()
				A.thirst-=hprand-4
				if(A.thirst<1)
					if(A==B)goto no
					A.thirst=0
					:no
				B.DeathCheck()

var/const/Sprayer='spraying_2.wav'
var/Bokkendmg=12
var/Bokkenstam=9
proc
	BleedEffect(mob/A,mob/B)
		if(B.bloodspot<15)
			B.bloodspot+=1
		if(B.bloodspot==3)
			var/obj/bloodspot/N = new
			N.loc=B.loc
		else if(B.bloodspot==8)
			var/obj/bloodspot/P=new
			P.loc=B.loc
		else if(B.bloodspot==12)
			var/obj/bloodspot/M=new
			M.loc=B.loc
		if(A.bloody<8)
			A.bloody+=1
			A.overlays+='bloodoverlay.dmi'
		else if(A.bloody==6)
			A.overlays+='verybloodyoverlay.dmi'
		if(B.bloody<8)
			B.bloody+=1
		if(B.bloody<6)
			B.overlays+='bloodoverlay.dmi'
		else if(B.bloody==6)
			B.overlays+='verybloodyoverlay.dmi'
	BloodSpotEffect(mob/B)
		if(B.bloodspot<15)
			B.bloodspot+=1
		if(B.bloodspot==3)
			var/obj/bloodspot/N = new
			N.loc=B.loc
		else if(B.bloodspot==8)
			var/obj/bloodspot/P=new
			P.loc=B.loc
		else if(B.bloodspot==12)
			var/obj/bloodspot/M=new
			M.loc=B.loc