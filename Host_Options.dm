//mob/verb/tohex()
//	var/c=input(usr,";")as num
//	var/c1=input(usr,";")as num
//	var/c2=input(usr,";")as num
//	world << rgb(c,c1,c2)

mob/Host/verb
	.Hosttoggleautohost()
		set hidden=1
		if(GameOn==1)return
		var/ea="Enable"
		if(autohost==1)ea="Disable"
		var/A=input(usr,"Would you like to [ea] auto-hosting?","Auto-Host Settings") in list("Yes","No")
		if(A=="Yes")
			if(autohost==0)
				autohost=1
				world << "<b><font color=aqua>[lightbot]</b> Autohosting has been enabled."
				worldsave()
				updateworld()
				winset(usr,"LAutohost","Text=\"Auto-Hosting: On\"")
				autohostcount+=1
				AutoHostStart(autohostcount)
			else
				autohost=0
				worldsave()
				world << "<b><font color=aqua>[lightbot]</b> Autohosting has been disabled."
				winset(usr,"LAutohost","Text=\"Auto-Hosting: Off\"")
				updateworld()
				autohostcount+=1
	.Hosttoggleautopoll()
		set hidden=1
		if(GameOn==1)return
		var/ea="Enable"
		if(autopoll==1)ea="Disable"
		var/pp5=input(usr,"Do you want to [ea] auto-polling?") in list("Yes","No")
		if(pp5=="Yes")
			if(autopoll==0)
				autopoll=1
				winset(usr,"LAutopoll","Text=\"Auto-Poll: On\"")
				world << "<b><small><font color = #330066>Poll Bot</b></font><small>: Auto polling for the game mode will begin before each round."
				GameModePoll()
			else
				autopoll=0
				world << "<b><small><font color = #330066>Poll Bot</b></font><small>: Auto polling disabled."
				winset(usr,"LAutopoll","Text=\"Auto-Poll: Off\"")
				for(var/mob/M in world)
					winshow(M,"voting",0)
				return

	.Hostautohostdelay()
		set hidden=1
		if(GameOn==1)return
		:tryagain
		var/pp5=input(usr,"How much wait time until the game starts? Input the minutes!","") as num
		var/tyme=pp5*600
		if(pp5<1)
			usr << "Sorry, you can only use times over one minute."
			goto tryagain
		if(pp5>20)
			usr << "Over 20 minutes? This doesn't sound very good... Try again."
			goto tryagain
		tyme=round(tyme)
		autohostdelay=tyme
		autohostshowdelay=round(pp5)
		autohostcount+=1
		worldsave()
		winset(usr,"LAutohostdelay","Text=\"Auto-Host Wait: [autohostshowdelay] Minutes\"")
		AutoHoster(autohostcount)
	.Hostautopolldelay()
		set hidden=1
		if(GameOn==1)return
		:tryagain
		var/pp5=input(usr,"How much time until the poll concludes? Input the seconds!","") as num
		var/tyme=pp5
		if(pp5<5)
			usr << "Sorry, you can only use times over five second..."
			goto tryagain
		if(pp5>900)
			usr << "This doesn't sound very good... Try again."
			goto tryagain
		tyme=round(tyme)
		polldelay=tyme*10
		pollshowdelay=round(tyme)
		winset(usr,"LAutopolldelay","Text=\"Polling Delay: [pollshowdelay] Seconds\"")
		worldsave()
	Hostchangeattackdelay()
		set hidden=1
		if(GameOn==1)return


		var/pp9=input(usr,"Which delay do you wish to use, note this only prevents them from attacking. Set it to 0 to disable it.") in list("Off","5 Minutes","10 Minutes","15 Minutes")
		attackdelay=pp9
		winset(usr,"LAttack","Text=\"Attack Delay: [attackdelay]\"")
	Hostchangehoarddelay()
		set hidden=1
		if(GameOn==1)return
		var/pp9=input(usr,"Which delay do you wish to use, note this only prevents them from hoarding items/looking into stuff the whole time this is on.") in list("Off","5 Minutes","10 Minutes","15 Minutes")
		hoarddelay=pp9
		winset(usr,"LHoard","Text=\"Hoard Delay: [hoarddelay]\"")



	.Hostchangemap()
		set hidden=1
		if(GameOn==1)return
		var/mpp=input(usr,"Which map do you wish to use?") in list("Default","Default 2","Custom","Cancel")
		if(mpp=="Cancel")return
		if(mpp=="Default")
			mapp="Default"
			world << "Map changed to default map"
			updateworld()
		//	return
		if(mpp=="Default 2")
			mapp="Default 2"
			world << "Map changed to the second default map"
			updateworld()
			//return
		if(mpp=="Custom")
			var/mappr=input(usr,"Please specify the name of the map(Must be in the games DIR). To use the default map type in the map Default.","Enter the maps name, don't enter map_ or .sav")
			var/id=mappr
			InitializeSwapMaps()
			var/swapmap/M=swapmaps_byname[id]
			if(!M)
				//var/savefile/S
				if(swapmaps_mode==SWAPMAPS_TEXT && fexists("map_[id].txt"))
					text=1
				else if(fexists("map_[id].sav"))
				//	S=new("map_[id].sav")
				else if(swapmaps_mode!=SWAPMAPS_TEXT && fexists("map_[id].txt"))
					text=1
				else
					usr << "There is no such map: [id]"
					return
			mapp=mappr
		updateworld()
		winset(usr,"LMap","Text=\"Current Map: [mapp]\"")
	.Hostchangemode()
		set hidden=1
		if(GameOn==1)return
		var/pp=input(usr,"Please choose a desired mode you wish to use.") in list("Normal","Ghost","Death Note","Doppelganger","Secret","Vampire","Witch","Zombie", "Death Note Classic", "Extended")//"Slender")
		if(pp==gamemode)
			usr << "Thats the current game mode already."
			return
			if(GameOn==1)return
		gamemode=pp
		world << "<b><font color=aqua>[lightbot]</b> </font>Game mode has changed to [pp]"
		world << sound(null)
		updateworld()
		for(var/mob/player/A in world)
			if(A.ai==0)
				A.GameTitle()
		updateworld()
		winset(usr,"LMode","Text=\"Current Mode: [gamemode]\"")
	.Hostchangelethality()
		set hidden=1
		if(GameOn==1)return
		var/pp=input(usr,"Which lethality level do you wish to use?") in list("One Hit One Kill","Very High","High","Above Normal","Normal","Low","Very Low")
		Lethality(pp)
		llevel=pp
		winset(usr,"LLethality","Text=\"Lethality: [llevel]\"")
	.Hostchangehour()
		set hidden=1
		if(GameOn==1)return
		:tryagain
		var/pp5=input(usr,"How many minutes in an hour do you want, pick anything from 1 to 60!","") as num
		var/tyme=pp5*600
		tyme=round(tyme)
		if(pp5<1)
			usr << "Sorry, you can only use times over one minute."
			goto tryagain
		if(pp5>60)
			usr << "Sorry, you can only use times under an hour."
			goto tryagain
		gamesleephours=tyme
		hours=round(pp5)
		worldsave()
		winset(usr,"LHours","Text=\"Hours: [hours] Minutes\"")
	.Hostchangespawnrate()
		set hidden=1
		if(GameOn==1)return
		var/pp=input(usr,"Which item spawn rate do you wish to use?") in list("Very High","High","Normal","Low","Very Low","None")
		SpawnRate(pp)
		spawnrate=pp
		winset(usr,"LSpawn","Text=\"Item Spawn Rate: [spawnrate]\"")
	.Hostfunctionclassic()
		set hidden=1
		if(GameOn==1)return
		var/pp5=input(usr,"Would you like to enable the classic choosing of characters before rounds; the black haired boy and ect.") in list("Yes","No")
		if(pp5=="Yes")
			classiccharacterpick=1
			winset(usr,"LCClassic","Text=\"Classic Characters Mode: On]\"")
		else
			classiccharacterpick=0
			winset(usr,"LCClassic","Text=\"Classic Characters Mode: Off]\"")
	.Hostfunctionmultikey()
		set hidden=1
		if(GameOn==1)return
		var/ea="Allow"
		if(multikey=="On")ea="Disallow"
		var/pp5=input(usr,"Do you want to [ea] multikeys?") in list("Yes","No")
		if(pp5=="Yes")
			if(multikey=="Off")
				multikey="On"
			else
				multikey="Off"
		winset(usr,"LMultikey","Text=\"Allow Multi-keying: [multikey]\"")
	.Hostfunctioncpu()
		set hidden=1
		if(GameOn==1)return
		var/ea="Enable"
		if(computeruse=="On")ea="Disable"
		var/pp5=input(usr,"Do you want to [ea] the functionality of the computer?") in list("Yes","No")
		if(pp5=="Yes")
			if(computeruse=="Off")
				computeruse="On"
			else
				computeruse="Off"
		winset(usr,"LCPU","Text=\"Computer Functionality: [computeruse]\"")
	.Hostfunctiontapes()
		set hidden=1
		if(GameOn==1)return
		var/ea="Enable"
		if(tapesfunction=="On")ea="Disable"
		var/pp5=input(usr,"Do you want to [ea] the functionality of the tapes?") in list("Yes","No")
		if(pp5=="Yes")
			if(tapesfunction=="Off")
				tapesfunction="On"
			else
				tapesfunction="Off"
		winset(usr,"LTapes","Text=\"Tapes Functionality: [tapesfunction]\"")
	.Hostfunctionescape()
		set hidden=1
		if(GameOn==1)return
		var/ea="Enable"
		if(keycardfunction=="On")ea="Disable"
		var/pp5=input(usr,"Do you want to [ea] the functionality of the tapes?") in list("Yes","No")
		if(pp5=="Yes")
			if(keycardfunction=="Off")
				keycardfunction="On"
			else
				keycardfunction="Off"
		winset(usr,"LEscape","Text=\"Allow Escaping: [keycardfunction]\"")
	.Hostfunctionuniform()
		set hidden=1
		if(GameOn==1)return
		var/A=input(usr,"Which uniform color do you want to use?") in list("Blue","Red")
		if(A=="Blue")
			uniform=0
			winset(usr,"LUni","Text=\"Uniform Color: Blue\"")
		else
			uniform=1
			winset(usr,"LUni","Text=\"Uniform Color: Red\"")
mob/proc/HosterOptions()
	set hidden = 1
	if(GameOn==1)return
	winshow(usr,"hostopt",1)
	winset(src,"hostopt","size=262x394")
	winset(usr,"LAutopolldelay","Text=\"Polling Delay: [pollshowdelay] Seconds\"")
	winset(usr,"LAutohostdelay","Text=\"Auto-Host Wait: [autohostshowdelay] Minutes\"")
	winset(usr,"LMap","Text=\"Current Map: [mapp]\"")
	winset(usr,"LMode","Text=\"Current Mode: [gamemode]\"")
	winset(usr,"LHours","Text=\"Hours: [hours] Minutes\"")
	winset(usr,"LLethality","Text=\"Lethality: [llevel]\"")
	winset(usr,"LSpawn","Text=\"Item Spawn Rate: [spawnrate]\"")
	//Functions
	winset(usr,"LMultikey","Text=\"Allow Multi-keying: [multikey]\"")
	winset(usr,"LCPU","Text=\"Computer Functionality: [computeruse]\"")
	winset(usr,"LTapes","Text=\"Tapes Functionality: [tapesfunction]\"")
	winset(usr,"LEscape","Text=\"Allow Escaping: [keycardfunction]\"")
	winset(usr,"LAttack","Text=\"Attack Delay: [attackdelay]\"")
	winset(usr,"LHoard","Text=\"Hoard Delay: [hoarddelay]\"")
	if(uniform==0)
		winset(usr,"LUni","Text=\"Uniform Color: Blue\"")
	else
		winset(usr,"LUni","Text=\"Uniform Color: Red\"")
	if(autohost==0)
		winset(usr,"LAutohost","Text=\"Auto-Hosting: Off\"")
	else
		winset(usr,"LAutohost","Text=\"Auto-Hosting: On\"")
	if(autopoll==0)
		winset(usr,"LAutopoll","Text=\"Auto-Poll: Off\"")
	else
		winset(usr,"LAutopoll","Text=\"Auto-Poll: On\"")