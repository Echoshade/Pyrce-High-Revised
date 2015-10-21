proc
	Endingcredits()
		NormalEnd()
	CheckCorpses()
		var/crps=deadlist.len
		var/crpscheck=0
		for(var/mob/corpse/M in world)
			crpscheck+=1
		if(crps!=crpscheck)
			deadlist=new/list()
			for(var/mob/corpse/M in world)
				deadlist+=M
	CheckZombies()
		zombielist=new/list()
		for(var/mob/M in world)
			if(M.zombie==1)
				zombielist+=M

proc
	NormalEnd()
		var/plays=0
		var/ka=0
		var/ka2=0
		var/kamsg2=null
		var/kamsg=null
		//var/mob/thatkira=null
		var/mainplayer=null
		var/mainplayer2=null
		for(var/mob/M in world)
			if(M.playing==1&&M.dead==0)
				plays+=1
			if(M.killer==1&&M.watching==0)
				world << "The killer was [M.realname] / [M.alias] played by [M.realkey]"
				if(M.dead==0) ka=1
				kamsg="The Killer"
				mainplayer=M
			if(M.shinigami==1&&M.watching==0)
				world << "The Shinigami was played by [M.realkey]"
				//kamsg="The Shinigami"
			if(M.isGhost==1)
				world << "The Ghost was played by [M.realkey]"
			if(gamemode=="Death Note")
				for(var/obj/Misc/Death_Note/O in M)
					if(O in M)
						if(M.shinigami==0)
							world << "Kira was [M.realname] / [M.alias] played by [M.realkey]"
							kamsg="Kira"
							if(M.dead==0)
								ka=1
								mainplayer=M
						else
							world << "The Shinigami appears to be holding the Death Note last."
			if(M.kira==1&&M.watching==0)
				world << "The Second Kira was [M.realname] / [M.alias] played by [M.realkey]"
			if(M.classickira==1&&M.watching==0)
				world << "Kira was [M.realname] / [M.alias] played by [M.realkey]"
				//if(M.dead==0) ka=1
				//kamsg="The Second Kira"
			if(M.classicshinigamieyes==1&&M.watching==0)
				world << "The Shinigami Eyes was [M.realname] / [M.alias] played by [M.realkey]"
			if(M.isL==1&&M.watching==0)
				world << "The Detective was [M.realname] / [M.alias] played by [M.realkey]"
				//kamsg="The Second Kira"
				if(M.dead==0) ka2=1
				kamsg2="The Detective"
				mainplayer2=M
			if(M.beatrice==1&&M.watching==0)
				world << "The witch was [M.realname] / [M.alias] played by [M.realkey]"
				if(M.dead==0) ka=1
				kamsg="The Witch"
				mainplayer=M
			if(M.currentrole=="The Doppelganger"&&M.watching==0)
				world << "The doppelganger was [M.realname] / [M.alias] played by [M.realkey]"
				if(M.dead==0) ka=1
				kamsg="The Doppelganger"
				mainplayer=M
			if(M.suspect==1&&M.watching==0)
				world << "The suspect was [M.realname] / [M.alias] played by [M.realkey]"
				if(M.dead==0) ka2=1
				kamsg2="The Suspect"
				mainplayer2=M
		if(gamemode=="Vampire")
			for(var/mob/B in alivelist)
				if(B.nanaya==1)
					world << "[B.alias] / [B.realname] ([B.realkey]) <font color=blue>(Nanaya)</font></font>!"
				if(B.vampire==1) world << "[B.alias] / [B.realname] ([B.realkey]) <font color=red>(Vampire)!"
			for(var/mob/B in deadlist)
				if(B.nanaya==1)
					world << "[B.alias] / [B.realname] ([B.realkey]) <font color=blue>(Nanaya)<font color=red>(Dead)</font></font>!"
				if(B.vampire==1)
					world << "[B.alias] / [B.realname] ([B.key]) <font color=red>(Vampire)<font color=red>(Dead)</font></font>!"
			for(var/mob/B in escapelist)
				if(B.nanaya==1)
					world << "[B.alias] / [B.realname] ([B.realkey]) <font color=blue>(Nanaya)<font color=blue>(Escaped)</font></font>!"
				if(B.vampire==1)
					world << "[B.alias] / [B.realname] ([B.key]) <font color=red>(Vampire)<font color=blue>(Escaped)</font></font>!"

		plays+=escapelist.len
		//var/deadpeep=deadlist.len
		if(gamemode=="Vampire")goto enderr
		if(gamemode=="Zombie")goto enderr
		/////
		if(deadlist.len==0) world << "No one died during the game; therefore, it seems time ran out."
		else if(plays==0) world << "Everyone has died this round! Somehow..."
		else if(ka==1&&plays==1)
			CheckUnlock(mainplayer,kamsg)
			world << "Everyone has died except for [kamsg]!"
		else if(ka==0&&plays>0&&kamsg2==null) world << "Some people survived, and some died; [kamsg] amongst them."
		else if(ka==1&&plays>0&&kamsg2==null) world << "Some people survived, and some died. [kamsg], however, managed to live."

		else if(ka==0&&plays>0&&kamsg2&&ka2==0) world << "Some people survived, and some died; [kamsg] and [kamsg2] amongst them."
		else if(ka==1&&plays>0&&kamsg2&&ka2==1)
			CheckUnlock(mainplayer2,kamsg2,"No DN")
			world << "Some people survived, and some died. [kamsg] and [kamsg2], however, managed to live."

		else if(ka==1&&plays>0&&kamsg2&&ka2==0) world << "Some people survived, and some died; [kamsg2] amongst them. [kamsg], however, managed to live."
		else if(ka==0&&plays>0&&kamsg2&&ka2==1)
			CheckUnlock(mainplayer2,kamsg2)
			world << "Some people survived, and some died; [kamsg] amongst them. [kamsg2], however, managed to live."

		else world << "Error detecting round end players, debugging info: Players lived([plays]) Players died([deadlist.len])"
		:enderr
proc/CheckUnlock(mob/M,thatrole,var/NoDN)
	if(thatrole=="The Killer"&&M.unlock1!="Successful Slaughter!")
		M << "<font color=red>Unlocked: Successful Slaughter!"
		M.unlock1="Successful Slaughter!"
		M.save()
		world.SetMedal("Successful Slaughter!", M.key)
	if(thatrole=="The Witch"&&M.unlock2!="I Know Magic!")
		M << "<font color=red>Unlocked: I Know Magic!"
		M.unlock2="I Know Magic!"
		M.save()
		world.SetMedal("I Know Magic!", M.key)
	if(thatrole=="The Doppelganger"&&M.unlock3!="Copy Cat!")
		M << "<font color=red>Unlocked: Copy Cat!"
		M.unlock3="Copy Cat!"
		M.save()
		world.SetMedal("Copy Cat!", M.key)
	if(thatrole=="The Detective"&&M.unlock4!="Mission Complete!"&&NoDN==null)
		M << "<font color=red>Unlocked: Mission Complete!"
		M.unlock4="Mission Complete!"
		M.save()
		world.SetMedal("Mission Complete!", M.key)
	if(thatrole=="The Suspect"&&M.unlock7!="Survived as Suspect!")
		M << "<font color=red>Unlocked: Survived as Suspect!"
		M.unlock7="Survived as Suspect!"
		M.save()
		world.SetMedal("Survived as Suspect!", M.key)
	if(thatrole=="The Eyes"&&M.unlock6!="Seen the Cursed One!"&&NoDN==null)
		M << "<font color=red>Unlocked: Seen the Cursed One!"
		M.unlock6="Seen the Cursed One!"
		M.save()
		world.SetMedal("Seen the Cursed One!", M.key)
	if(thatrole=="Kira"&&M.unlock8!="Just as Planned!"&&NoDN==null)
		M << "<font color=red>Unlocked: Just as Planned!"
		M.unlock8="Just as Planned!"
		M.save()
		world.SetMedal("Just as Planned!", M.key)
proc/CheckGame()
	sleep(3)
	var/counter=0
	if(GameOn==0)return
	counter=alivelist.len
	for(var/mob/M in world)
		if(M.shinigami==1)
			counter-=1
		if(M.isGhost==1)
			counter-=1
	if(gamemode=="Zombie")
		counter+=1
	if(counter<2)
		EndGame()