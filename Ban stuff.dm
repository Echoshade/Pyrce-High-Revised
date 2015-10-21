var/Resetting=0

mob
	proc/RestoreUser()
		//src << "Checking Vars"
		if(src.s_bubble)
			del(src.s_bubble)
		for(var/V in src.vars)
			//src.vars[V]=initial(vars[V])
			if(V=="gender"||V=="locs"||V=="bounds"||V=="screen_loc"||V=="animate_movement"||V=="ckey"||V=="key"||V=="group"||V=="vars"||V=="verbs"||V=="parent_type"||V=="name"||V=="key"||V=="type"||V=="noclickself"||V=="sub"||V=="norole"||V=="mykey"||V=="setprofile"||V=="setage"||V=="mastervolume"||V=="chatcolor"||V=="chattercolor"||V=="unlock1"||V=="unlock2"||V=="unlock3"||V=="unlock4"||V=="unlock5"||V=="unlock6"||V=="unlock7"||V=="unlock8"||V=="charhaircolor"||V=="charname"||V=="charhair"||V=="chargender"||V=="musicmute"||V=="sfxmute"||V=="showlists")

				goto no
			src.vars[V]=initial(src.vars[V])
			:no
		for(var/V in src.verbs)
			//src.verbs[V]=initial(src.verbs[V])
			//src << "[V]"
			src.verbs-=typesof(/mob/ingame/verb/)
			src.verbs-=typesof(/mob/shinigami/verb/)
			src.verbs-=typesof(/mob/Ghost/verb/)
			//src.verbs-=typesof(/mob/watcher/verb/)
			src.client.verbs-=typesof(/mob/watcher/verb/)
		src.name=src.key
		src.client.command_text="Chat "
	//	src.client.verbs+=typesof(/mob/watcher/verb/)
		winshow(src,"pdawin",0)
		winshow(src,"DeathNoteWin",0)
		winshow(src,"deathnote",0)
		winshow(src,"switchbox",0)
		winshow(src,"Roster",0)
		winshow(src,"scotdb",0)
		winshow(src,"Settings",0)
		//src.hide_chatbox()
		src.client.screen=null
		src.remlines()
		src.client.images=null
		overlayers=new/list()

proc
	checkmap()
		for(var/turf/T in world)
			if(!T||!length(T.contents))continue
			for(var/obj/O in T.contents)
				if(istype(O,/obj))
					var/obj/O2 = new O.type
					O2.loc = O.loc
					del(O)
	boot_up()
		Resetting=1
		if(gamemode=="Slender")
			world << "<font color=red>Shader's don't reset right after playing Slender. Rebooting to fix the issue."
			world.Reboot()
		if(gamemode=="Slender")
			world << "<b>The world will be rebooted to reset lighting because it is in early stages."
			world.Reboot()
		for(var/mob/A in world)
			if(A.client)
				A.UserReset()
				//A.RestoreUser()
				A.GameTitle()
		clean_up()
		clean_up_the_rest()
		delitems()
		//world.Repop()
		worldsave()
		GameOver=0
		GameOn=0
		Resetting=0
		halllights=1
		canturnonlights=1
		updateworld()
		if(autopoll==1)
			GameModePoll()
		if(autohost==1)
			AutoHostStart(autohostcount)
	clean_up()
		//GameOn=0
		gamehour=6
		ampm="PM"
		for(var/mob/corpse/A in world)
			del(A)
		for(var/mob/escaped/A in world)
			del(A)
		for(var/mob/ai/A in world)
			del(A)
		for(var/mob/A in world)
			if(!A.client)
				del A
		if(mapp!="Default"||mapp!="Default 2")SwapMaps_Unload(mapp)
	clean_up_the_rest()
		world.maxx=16
		world.maxy=16
		world.maxz=11
		sleep(1)
		WorldReset()
	delitems()
		for(var/mob/player/p in world)
			for(var/obj/I in p.contents)
				del(I)