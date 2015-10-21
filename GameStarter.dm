atom
	// switch which line is commented to change which
	// icon file is used, when using the 'simple' icon
	// look at how harsh the lighting effects look
	// compared to the 'textured' tiles. the lighting
	// effects look much nicer when the tiles underneath
	// have more detail and aren't just solid colors.
	// icon = 'dynamic-lighting-simple.dmi'
	icon = 'dynamic-lighting-simple.dmi'
mob/proc
	HostAdustLag()
		var/setlag=input(src,"Please choose which of the follow settings depending on your lag, test them, whatever, some may have side effects though such as slower inventory updates.","Lag Settings.") in list("Above Normal(Not recommended)","Normal","Below Normal","Laggy","Very Laggy")
		if(setlag=="Above Normal(Not recommended)")
			world.fps=17
			world.tick_lag=1
		if(setlag=="Normal")
			world.fps=15
			world.tick_lag=1
		if(setlag=="Below Normal")
			world.fps=14
			world.tick_lag=1
		if(setlag=="Laggy")
			world.fps=12
			world.tick_lag=1
		if(setlag=="Very Laggy")
			world.fps=10
			world.tick_lag=2
		worldsave()
var
	worldcreator="Unknown"

var/list/spawns=list("1A","2A","1B","2B","1C","2C","1D","2D","1AA","2AA","1BB","2BB","1DD","2DD","Caf1","Caf2","Caf3","Caf","Caf4")
//var/list/MaleFirstNames=list("James","Ryo","Johann","Kenn","Mikado","Donald","Sho","Shuuya","Edo","Jin","Takashi","Kaede","Keiichi","Vicious","Shiki","Funai")
//var/list/FemaleFirstNames=list("Maria","Mizuko","Alice","Saya","Nina","Rikako","Sahara","Saeko","Shinki")
mob/shinigami/verb
	ShinigamiSay(T as text)
		if(usr.shinigami==0)return
		if(T=="")return
		var/len=length(T)
		if(len>500)
			T=copytext(T,1,500)
		T=html_encode(T)
		for(var/mob/A in range(8,usr))
			if(A.toucheddn==1)
				_message(A, "<font color=[usr.charhaircolor]>[usr]<font color=[A.rpchatcolor]>: [T]")
				if(A.rpchat==0||A.watching==1)
					A << "\icon[usr.chatavatar][usr] says, \" [T] \""
			if(A.watching==1)
				//_message(A, "<font color=[usr.charhaircolor]>[usr]<font color=[A.rpchatcolor]>: [T]")
				A << "\icon[usr.chatavatar][usr] says, \" [T] \""
	ShinigamiEmote(T as text)
		if(usr.shinigami==0)return
		if(T=="")return
		var/len=length(T)
		if(len>500)
			T=copytext(T,1,500)
		T=html_encode(T)
		for(var/mob/A in range(8,usr))
			if(A.toucheddn==1)
				if(A.rpchat==0||A.watching==1)
					A << "\icon[usr.chatavatar]<i>[usr] [T]</i>"
				_message(A, "<font color=[usr.charhaircolor]>[usr]<font color=[A.rpchatcolor]>: [T]")
			if(A.watching==1)
				A << "\icon[usr.chatavatar]<i>[usr] [T]</i>"
	Give_Shinigami_Eyes()
		if(gamehour==6&&ampm=="PM")
			usr << "You need to wait a while before doing this."
			return
		if(gamehour==7&&ampm=="PM")
			usr << "You need to wait a while before doing this."
			return
		if(gamehour==8&&ampm=="PM")
			usr << "You need to wait a while before doing this."
			return
		if(gamehour==9&&ampm=="PM")
			usr << "You need to wait a while before doing this."
			return
		if(gamehour==10&&ampm=="PM")
			usr << "You need to wait a while before doing this."
			return
		for(var/mob/A in oview(5,usr))
			if(A.toucheddn==1)
				var/pp=ShowAlert(usr,"Do you wish to offer [A] the Shinigami eye deal?",list("Yes","No"))
				if(pp=="Yes")
					var/pp2=ShowAlert(A,"[usr] has offered you the Shinigami eyes, with these you will be able to see the name of everyone you meet over their head, it's a good deal but there is a price. In exchange you must offer half of your remaining life, do you accept the deal?",list("Yes","No"))
					if(pp2=="Yes")
						if(A==usr)return
						A.shineyes=1
						A.addname()
						usr << "[A] has accepted your offer."
						if(gamehour==6&&ampm=="PM")
							kiradie+=params2list("[A.realname]=12:00 AM")
						if(gamehour==7&&ampm=="PM")
							kiradie+=params2list("[A.realname]=12:00 AM")
						if(gamehour==8&&ampm=="PM")
							kiradie+=params2list("[A.realname]=1:00 AM")
						if(gamehour==9&&ampm=="PM")
							kiradie+=params2list("[A.realname]=1:00 AM")
						if(gamehour==10&&ampm=="PM")
							kiradie+=params2list("[A.realname]=2:00 AM")
						if(gamehour==11&&ampm=="PM")
							kiradie+=params2list("[A.realname]=2:00 AM")
						if(gamehour==12&&ampm=="AM")
							kiradie+=params2list("[A.realname]=3:00 AM")
						if(gamehour==1&&ampm=="AM")
							kiradie+=params2list("[A.realname]=3:00 AM")
						if(gamehour==2&&ampm=="AM")
							kiradie+=params2list("[A.realname]=4:00 AM")
						if(gamehour==3&&ampm=="AM")
							kiradie+=params2list("[A.realname]=4:00 AM")
						if(gamehour==4&&ampm=="AM")
							kiradie+=params2list("[A.realname]=5:00 AM")
					else
						usr << "[A] declined your offer"
mob/proc/KiraDie()
	soundmob(src, 7, bodyfall, TRUE)
	src.playing=0
	sleep(3)
	range(5,src) << "[src] begins bleeding from their eyes as they fall to the ground."
	FakeCorpse(src)
	src.toucheddn=0
	src.toucheddn=0
	src << "Ouch... you died by the eye deal! However you may continue to observe the game to see how it concludes!"
	src.see_invisible=100
	src.Watchit()
	alivelist-=src
	deadlist+=src
	CheckGame()
	for(var/mob/player/A in world)
		if(/obj/Misc/Death_Note in usr)
			A << sound(bodyfall,volume=30)
var/disabled=0
proc/AutoHostStart(var/n)
	world << "<b><font color=blue>AutoHost</b> </font>Autohosting enabled, configuring game settings."
	sleep(20)
	if(autopoll==0)
		var/list/nnn=list("Normal","Witch","Zombie","Doppelganger","Secret","Ghost","Vampire", "Death Note Classic", "Extended")//, "Death Note", "Slender") These are deprecated for now.
		gamemode=pick(nnn)
		world << "<b><font color=blue>AutoHost</b> </font>Game mode changed to [gamemode]"
		world << "<b><font color=blue>AutoHost</b> </font>Game will start in [autohostshowdelay] minutes."
		world << sound(null)
		for(var/mob/player/A in world)
			A.GameTitle()
	updateworld()
	sleep(autohostdelay)
	if(autohost==1&&GameOn==0)
		StartGame()
	else return
proc/AutoHoster(var/n)
	set background=1
	sleep(autohostdelay)
	if(autohost==1&&GameOn==0)
		StartGame()
	else return
var/list/charpopper=new/list()
var/list/killerpopper=new/list()
proc/StartGame()
	set background=1
	if(GameOn==1)
		return
	if(GameStarting==1)
		return
	for(var/mob/M in world)
		if(M.client)
			winshow(M,"hostopt",0)
	updateworld()
	if(gamemode=="Secret")
		if(playersjoined<4)
			world << "<b><font color=aqua>[lightbot]</b> </font>Need 4 or more players for this mode."
			if(autohost==1)
				world << "<b><font color=aqua>[lightbot]</b> </font>Auto hosting will retry in [autohostshowdelay] more minutes."
				AutoHoster(autohostcount)
			return
	if(gamemode=="Vampire")
		if(playersjoined<2)
			world << "<b><font color=aqua>[lightbot]</b> </font>Need 2 or more players for this test mode."
			if(autohost==1)
				world << "<b><font color=aqua>[lightbot]</b> </font>Auto hosting will retry in [autohostshowdelay] more minutes."
				AutoHoster(autohostcount)
			return
	else if(gamemode=="Normal")
		if(playersjoined<2)
			world << "<b><font color=aqua>[lightbot]</b> </font>Need 2 or more players for this mode."
			if(autohost==1)
				world << "<b><font color=aqua>[lightbot]</b> </font>Auto hosting will retry in [autohostshowdelay] more minutes."
				AutoHoster(autohostcount)
			return
	else if(gamemode=="Death Note")
		if(playersjoined<3)
			world << "<b><font color=aqua>[lightbot]</b> </font>Need 3 or more players for this mode."
			if(autohost==1)
				world << "<b><font color=aqua>[lightbot]</b> </font>Auto hosting will retry in [autohostshowdelay] more minutes."
				AutoHoster(autohostcount)
			return
	else if(gamemode=="Death Note Classic")
		if(playersjoined<2)
			world << "<b><font color=aqua>[lightbot]</b> </font>Need 2 or more players for this mode."
			if(autohost==1)
				world << "<b><font color=aqua>[lightbot]</b> </font>Auto hosting will retry in [autohostshowdelay] more minutes."
				AutoHoster(autohostcount)
			return
	else if(gamemode=="Doppelganger")
		if(playersjoined<3)
			world << "<b><font color=aqua>[lightbot]</b> </font>Need 3 or more players for this mode."
			if(autohost==1)
				world << "<b><font color=aqua>[lightbot]</b> </font>Auto hosting will retry in [autohostshowdelay] more minutes."
				AutoHoster(autohostcount)
			return
	else if(gamemode=="Ghost")
		if(playersjoined<4)
			world << "<b><font color=aqua>[lightbot]</b> </font>Need 4 or more players for this mode."
			if(autohost==1)
				world << "<b><font color=aqua>[lightbot]</b> </font>Auto hosting will retry in [autohostshowdelay] more minutes."
				AutoHoster(autohostcount)
			return
	else if(gamemode=="Witch")
		if(playersjoined<2)
			world << "<b><font color=aqua>[lightbot]</b> </font>Need 2 or more players for this mode."
			if(autohost==1)
				world << "<b><font color=aqua>[lightbot]</b> </font>Auto hosting will retry in [autohostshowdelay] more minutes."
				AutoHoster(autohostcount)
			return
	else if(gamemode=="Zombie")
		if(playersjoined<2)
			world << "<b><font color=aqua>[lightbot]</b> </font>Need 2 or more players for this mode."
			if(autohost==1)
				world << "<b><font color=aqua>[lightbot]</b> </font>Auto hosting will retry in [autohostshowdelay] more minutes."
				AutoHoster(autohostcount)
			return
	else if(gamemode=="Extended")
		if(playersjoined<1)
			world << "<b><font color=aqua>[lightbot]</b> </font>Need a player for this mode."
			if(autohost==1)
				world << "<b><font color=aqua>[lightbot]</b> </font>Auto hosting will retry in [autohostshowdelay] more minutes."
				AutoHoster(autohostcount)
			return
	//else if (gamemode == "Lyoko")
	//	if (playersjoined<6)
	//		world << "<b><font color=aqua>[lightbot]</b> </font>Need 6 or more players for this mode."
	//		if(autohost==1)
	//			world << "<b><font color=aqua>[lightbot]</b> </font>Auto hosting will retry in [autohostshowdelay] more minutes."
	//			AutoHoster(autohostcount)
	//		return
	GameStarting=1
	for(var/mob/m in world)
		for(var/obj/HUD/OnScreenText/O in m.client.screen)
			if(O.name=="CharacterW")	continue
			if(O!=m)	m.client.screen-=O
			m.Chatting=0
			m.client.screen-=src
	var/roomer=0
	var/hidemsg=0
	if(gamemode=="Slender")
		world << "<b>New light testing is being initiated, please be patient with the load time.</b>"
	if(gamemode=="Secret")
		oldmode="Secret"
		gamemode=pick("Normal","Witch","Zombie","Doppelganger","Secret","Ghost","Vampire","Death Note", "Death Note Classic", "Extended")// "Slender")
		hidemsg=1
	if(mapp=="Default"||mapp=="Default 2")
		world << "Loading the default map."
	else
		world << "Loading [mapp]"
		worldcreator="Unknown"
		if(!SwapMaps_Load(mapp))
			usr << "Map [mapp] not found, loading default instead."
			mapp="Default"
	//if(mapp!="Default"||mapp!="Default 2")
	//	world << "Map created by: [worldcreator]"
	//sleep(1)
	if(mapp=="Default")
		dmmload('Default.dmm')
	else if(mapp=="Default 2")
		dmmload('Default2.dmm')
	//sleep(1)
	ItemSpawner()
	GameOn=1
	for(var/obj/Door/O in world)
		sd_light_spill_turfs += O
	///
	///
	///////
	var/rolecheck=0
	var/rolerz=0
	ticker(timesplayed)
	TimeTick(timesplayed)
	ticker2(timesplayed)
	//world << "Map loaded."
	for(var/mob/N in joinlist)
		charpopper+=N
		if(N.norole==0)
			rolerz+=1
		alivelist+=N
		N.sight &= ~(SEE_MOBS|SEE_OBJS|SEE_TURFS)
		N.charhairavatar=N.charhair
		N.charhairavatarcolor=N.charhaircolor
		if(N.norole==1)
			rolecheck+=1
		N.realkey=N.key
	if(rolerz>3)
		for(var/mob/M in joinlist)
			if(M.norole==0)
				killerpopper+=M
	else
		for(var/mob/M in joinlist)
			killerpopper+=M
	var/adder=playersjoined-rolecheck
	if(gamemode=="Death Note")
		var/mob/I=pick(killerpopper)
		killerpopper-=I
		charpopper-=I
		I.icon='ryuk.dmi'
		I.currentrole="The Shinigami"
		I.shinigami=1
		I.chatavatar='shiniavatar.dmi'
		I.portal=0
		I.frozen=0
		I.sight |= SEE_SELF
		I.toucheddn=1
		I.realname="God Of Death"
		I.suffix=I.key
		I.alias="The Shinigami"
		I.invisibility=50
		I.client.command_text="ShinigamiSay \""
		I.density=0
		I.playing=1
		I.realkey=I.key
		I.name="The Shinigami"
		I << "You are the Shinigami! You are very, well...bored! You have killed the teacher, the previous Death Note holder, for her time was up. Your job is to give the Death Note to any one of the students you find capable of using it. You may also strike a deal to the new owner, giving them the Shinigami Eyes! No one can see you, so sit back, relax, and watch the chaos."
		I.hp=100
		I.stamina=100
		var/obj/Misc/Death_Note/O = new/obj/Misc/Death_Note
		I.contents+=O
		I.verbs+=typesof(/mob/shinigami/verb)
		if(I.rpchat==1)I.new_chatbox()
	if(gamemode=="Ghost")
		var/mob/I=pick(killerpopper)
		killerpopper-=I
		charpopper-=I
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
		I.playing=1
		I.realkey=I.key
		I.name=I.charname
		if(I.rpchat==1)I.new_chatbox()
		I.client.command_text="GhostSay \""
		if(I.chargender=="male")
			if(uniform==0)
				I.icon='MaleBase.dmi'
			else
				I.icon='RedMaleBase.dmi'
			var/icon/e='MaleEyes.dmi'
			e*=rgb(rand(10,60),rand(20,60),rand(10,60))
			I.overlays+=e
			var/namer=pick(MaleFirstNames)
			var/lastnamer=pick(LastNames)
			I.realname="[namer] [lastnamer]"
			MaleFirstNames-=namer
			namedlist+=namer
		else
			if(uniform==0)
				I.icon='FemaleBase.dmi'
			else
				I.icon='RedFemaleBase.dmi'
			var/icon/e='FemaleEyes.dmi'
			e*=rgb(rand(10,60),rand(20,60),rand(10,60))
			I.overlays+=e
			var/namer=pick(FemaleFirstNames)
			var/lastnamer=pick(LastNames)
			I.realname="[namer] [lastnamer]"
			FemaleFirstNames-=namer
			namedlist+=namer
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
	if(gamemode=="Zombie")
		var/mob/I=pick(killerpopper)
		killerpopper-=I
		charpopper-=I
		if(I.chargender=="male")
			I.icon='Malezombiegrey.dmi'
		else
			I.icon='Femalezombiegrey.dmi'
		I.zombie=1
		I.portal=0
		I.frozen=0
		I.canattack=1
		I.currentrole="The Main Zombie"
		I.realname="Unknown"
		I.suffix=I.key
		I.alias="The Zombie"
		I.equipname="Axe"
		I.invisibility=0
		I.client.command_text="Say \""
		I.density=1
		I.playing=1
		I.name="The Zombie"
		I << "You are the Zombie! ... You have no goals in life as you are now, and the only thing you want to do is eat human flesh. Your goal as the zombie is to tryand turn every student in the school into a zombie."
		I.hp=375
		I.dead=0
		I.stamina=100
		I.AddHud()
		I.realkey=I.key
		I.verbs+=typesof(/mob/ingame/verb)
		I.verbs-=/mob/ingame/verb/Suicide
		I.verbs-=/mob/ingame/verb/Shout
		I.verbs-=/mob/ingame/verb/Whisper
		alivelist-=I
		zombielist+=I
		if(I.rpchat==1)I.new_chatbox()
	for(var/mob/A in charpopper)
		A.playing=1
		A.verbs+=typesof(/mob/ingame/verb)
		var/room=null
		roomer+=1
		Playerpick(A)
	//A1
		if(roomer==1)
			room=/obj/Spawns/One
			A.spawnedinroom="A1"
		else if(roomer==2)
			room=/obj/Spawns/Two
			A.spawnedinroom="A1"
	//B1
		else if(roomer==3)
			room=/obj/Spawns/Three
			A.spawnedinroom="B1"
		else if(roomer==4)
			room=/obj/Spawns/Four
			A.spawnedinroom="B1"
	//B2
		else if(roomer==5)
			room=/obj/Spawns/Five
			A.spawnedinroom="B2"
		else if(roomer==6)
			room=/obj/Spawns/Six
			A.spawnedinroom="B2"
	//C1
		else if(roomer==7)
			room=/obj/Spawns/Seven
			A.spawnedinroom="C1"
		else if(roomer==8)
			room=/obj/Spawns/Eight
			A.spawnedinroom="C1"

	//C2
		else if(roomer==9)
			room=/obj/Spawns/Nine
			A.spawnedinroom="C2"
		else if(roomer==10)
			room=/obj/Spawns/Ten
			A.spawnedinroom="C2"
	//D1
		else if(roomer==11)
			room=/obj/Spawns/Eleven
			A.spawnedinroom="D1"
		else if(roomer==12)
			room=/obj/Spawns/Twelve
			A.spawnedinroom="D1"
	//D2
		else if(roomer==13)
			room=/obj/Spawns/Thirteen
			A.spawnedinroom="D2"
		else if(roomer==14)
			room=/obj/Spawns/Fourteen
			A.spawnedinroom="D2"
	//A2
		else if(roomer==15)
			room=/obj/Spawns/Fifteen
			A.spawnedinroom="A2"
		else if(roomer==16)
			room=/obj/Spawns/Sixteen
			A.spawnedinroom="A2"
		else if(roomer==17)
			room=/obj/Spawns/Seventeen
			A.spawnedinroom="A2"
		else if(roomer==18)
			room=/obj/Spawns/Eighteen
			A.spawnedinroom="A1"
		else if(roomer==19)
			room=/obj/Spawns/Nineteen
			A.spawnedinroom="A2"
		else if(roomer==20)
			room=/obj/Spawns/Twenty
			A.spawnedinroom="B1"
		else if(roomer==21)
			room=/obj/Spawns/Twentyone
			A.spawnedinroom="B2"
		else if(roomer==22)
			room=/obj/Spawns/Twentytwo
			A.spawnedinroom="C1"
		var/obj/weapons/Fists/O = new/obj/weapons/Fists
		var/obj/Misc/PDA/N = new/obj/Misc/PDA
		N.number="[rand(100,900)]-[rand(1000,9000)]"
		A.contents+=N
		A.originalnum=N.number
		A.alias=A.name
		var/obj/P=locate(room)
		A.loc=P.loc
		if(A.shinigami==0)
			A.AddHud()
			A.HPHud()
		A.hp=100
		A.dead=0
		A.verbs+=typesof(/mob/ingame/verb)
		A.portal=0
		A.frozen=0
		A.stamina=100
		A.client.command_text="Say "
		//O.loc=A.contents
		A.contents+=O
		winset(A,"pdanum","text=\"PDA Number: [A.pdanumber]\"")
		A.equipped=O
		A.suffix=A.key
		A.updatehp()
		A.updatesp()
		O.suffix="Equipped"
		A.equipname="Fists"
		A.realkey=A.key
		givereq(A)
		if(A.rpchat==1)A.new_chatbox()
	if(gamemode=="Death Note Classic")
		//KIRA...
		var/mob/I=pick(killerpopper)
		killerpopper-=I
		charpopper-=I
		I.classickira=1
		I << " <b>You are Kira</b> ... You're not sure where you obtained this book but you know that it can kill with a name and face. You have killed the teacher with this magicial notebook."
		for(var/mob/n in world)
			if(n.key in Owner)
				n << "<font color=red>Admin Notice: [I]([I.key]) is the Kira(Classic)"
		var/obj/Misc/Death_Note2/b=new
		I.contents+=b
		//
		var/mob/p=pick(killerpopper)
		killerpopper-=p
		charpopper-=p
		p.classickira=1
		p << " <b>You are Shinigami Eyes</b> ... You're not sure where you got this ability but you can see the names of people over their heads, you also heard that Kira is located somewhere in the school."
		for(var/mob/n in world)
			if(n.key in Owner)
				n << "<font color=red>Admin Notice: [p]([p.key]) is the Shinigami Eyes(Classic)"
		p.addname()
	if(gamemode=="Ghost")
		for(var/mob/player/M in world)
			if(M.isGhost==1)
				var/obj/P=locate(/obj/Spawns/ShiniSpawn)
				M.loc=P.loc
				//do body stuff here.
				var/mob/corpse/A = new/mob/corpse
				A.realname=M.realname
				A.realkey=M.key
				A.alias=M.alias
				A.loc=M.loc
				A.chatavatar=M.chatavatar
				//A.toucheddn=0
				A.infected=0
				A.icon=M.icon
				A.suffix=M.key
				A.overlays=M.overlays
				A.name="[M.name]'s Corpse"
				A.icon_state="dead"
				M.HPHud()
		//killers role.
		var/mob/B=pick(killerpopper)
		killerpopper-=B
		charpopper-=B
		B.currentrole="The Killer"
		B.killer=1
		monitorhair=B.haircolor
		world << "<big><b><font color=red>Warning:</b></font> Two Dead bodies located on the premises. Simple program analysis highly suggest that it was murder or assisted suicide; saving video feed from just before the event. Facility has been locked down until This System's authorities can be reached."
		B << "<b>You are the killer!</b> ... But don't tell anyone. You killed the teacher and left her corpse in the courtyard, after killing the teacher you were caught by another student which you had to kill as well to keep quite, you didn't want them telling the other before you killed them as well. Your goal is simple, kill all other students without getting yourself caught."
		for(var/mob/n in world)
			if(n.key in Owner)
				n << "<font color=red>Admin Notice: [B]([B.key]) is the Killer"
		//Ghost Seer, no msg.
		var/mob/a=pick(killerpopper)
		killerpopper-=a
		charpopper-=a
		a.currentrole="The Ghost Whisperer"
		a.see_invisible=51
		for(var/mob/n in world)
			if(n.key in Owner)
				n << "<font color=red>Admin Notice: [a]([a.key]) is the Ghost Whisperer"
	if(gamemode=="Death Note")
		if(hidemsg==0)world << "<big><b><font color=red>Warning:</b></font> Dead body located on the premises. Simple program analysis highly suggest either murder or assisted suicide; saving video feed from just before the event. Facility has been locked down until This System's authorities can be reached."
		for(var/mob/player/M in world)
			if(M.shinigami==1)
				if(adder<2&&M.norole==1)goto end
				var/obj/P=locate(/obj/Spawns/ShiniSpawn)
				M.addname()
				M.shineyes=1
				M.loc=P.loc
				break
				:end
		//Detective...
		var/cc=rand(1,5)
		if(cc==1)
			var/mob/I=pick(killerpopper)
			killerpopper-=I
			charpopper-=I
			I.isL=1
			I << " <b>You are the Detective</b> ... You have come to this school to investigate the kira case going on around here."
			for(var/mob/n in world)
				if(n.key in Owner)
					n << "<font color=red>Admin Notice: [I]([I.key]) is the Detective"
			var/obj/Misc/Paper_Sheet/N=new
			var/sp=rand(1,40)
			N.writing="There is about a [sp]% chance that a teacher in this school is Kira.<BR>This note should remain confidential to prevent a panic or riot."
			I.contents+=N
		//Detective End.
		//KIRA...
		var/kirarand=rand(1,2)
		if(kirarand==1)goto nokira
		var/mob/a=pick(killerpopper)
		killerpopper-=a
		charpopper-=a
		a.kira=1
		a << " <b>You are the Kira</b> ... You found this notebook laying randomly on the ground outside of the school earlier today, I wonder what it does?."
		for(var/mob/n in world)
			if(n.key in Owner)
				n << "<font color=red>Admin Notice: [a]([a.key]) is the Second Kira"
		var/obj/Misc/Death_Note2/b=new
		a.contents+=b
		:nokira
		//KIRA End.
	world << sound(null)
	doornumber="[rand(1,9)][rand(1,9)][rand(1,9)]"
	world << sound('audio/alarm.wav')
	////
	///
	GameStarting=0
	if(gamemode=="Vampire")
		var/mob/B=pick(killerpopper)
		killerpopper-=B
		charpopper-=B
		B.vampire=1
		B << "<b>You're</b> the Fallen True Ancestor who succumbed to their blood thirst and became a threat both to humans and the Ancestors themselves."
		B << "Be sure not to get too thirsty or else, well, you know, you will die of hunger."

		var/mob/N=pick(killerpopper)
		killerpopper-=N
		charpopper-=N
		var/obj/weapons/NanatsuYoru/O=new/obj/weapons/NanatsuYoru
		var/obj/Misc/Glasses_Case/H=new/obj/Misc/Glasses_Case
		N.contents+=O
		N.contents+=H
		N << "<b>You're a Nanaya</b> ... Nanaya is a clan of \"Demon Hunting Assasins\" who hunt down Fallen True Ancestor or in other words Vampires whom are the enemy."
		//sleep(1)

		world << "<big><b><font color=red>Warning:</b></font> Dead body located on the premises. Advanced program analysis highly suggest that the culprit drained the blood from the body, leaving behind marks on their neck."
	else if(gamemode=="Normal")
		var/mob/B=pick(killerpopper)
		killerpopper-=B
		charpopper-=B
		var/obj/weapons/Knife/K=new/obj/weapons/Knife
		B.currentrole="The Killer"
		B.killer=1
		B.contents+=K
		monitorhair=B.haircolor
		var/chancer=rand(1,4)
		if(chancer>1)world << "<big><b><font color=red>Warning:</b></font> Dead body located on the premises. Simple program analysis highly suggest either murder or assisted suicide; saving video feed from just before the event. Facility has been locked down until This System's authorities can be reached."
		B << "<b>You are the killer!</b> ... But don't tell anyone. You've killed one of the faculty members and left her body in the main courtyard, heh. Your role in this game is to kill every other player, while surviving yourself. Therefore, it isn't a great idea to tell everyone that you're the killer. Use your wits and various tools around the school to help in this goal."
		for(var/mob/n in world)
			if(n.key in Owner)
				n << "<font color=red>Admin Notice: [B]([B.key]) is the Killer"
		if(chancer==1&&playersjoined<2)
			suspectuse=1
			var/mob/P=pick(killerpopper)
			killerpopper-=P
			charpopper-=P
			P.suspect=1
			P.currentrole="The Suspect"
			charpopper-=P
			var/gnr=P.chargender
			if(gnr=="neuter")
				gnr="female"
			var/obj/N=new/obj/colorbox
			var/icon/I=new(N:icon)
			if(P.charhaircolor !=null)I.Blend(P.charhaircolor)
			world << "<big><b><font color=red>Warning:</b></font> Dead body located on the premises. After advanced program analysis the suspect is a [gnr] with the possible hair color \icon[I], and is believed to be associated with the killing of the teacher. Facility has been locked down until This System's authorities can be reached."
			P << "<b>You are the Suspect!</b> You are accused of being the killer whom slaughtered the teacher. Whether you are innocent or not, no one actually knows. However, given the current circumstances, it may be appropriate to keep an extremely low profile, if possible."
			for(var/mob/n in world)
				if(n.key in Owner)
					n << "<font color=red>Admin Notice: [P]([P.key]) is the Suspect"
	else if(gamemode=="Doppelganger")
		var/mob/B=pick(killerpopper)
		killerpopper-=B
		charpopper-=B
		B.currentrole="The Doppelganger"
		B.hp=200
		//B.origname=B.
		monitorhair="an unknown"
		world << "<big><b><font color=red>Warning:</b></font> Dead body located on the premises. Simple program analysis highly suggest either murder or assisted suicide; saving video feed from just before the event. Facility has been locked down until This System's authorities can be reached."
		B << "<b>You are the Doppelganger!</b> ... But let's not tell anyon that, this face you currently have on was stolen from a student after you violently murdered the teacher, her corpse is in the court yard. Your goal is to kill people, take their bodies as a cover up, or even toy with others. Murdering the whole school is your main goal."
		for(var/mob/n in world)
			if(n.key in Owner)
				n << "<font color=red>Admin Notice: [B]([B.key]) is the Doppelganger"
	else if(gamemode=="Death Note Classic")
		if(hidemsg==0)world << "<big><b><font color=red>Warning:</b></font> Dead body located on the premises. Simple program analysis highly suggest either murder or assisted suicide; saving video feed from just before the event. Facility has been locked down until This System's authorities can be reached."
		//Detective...
		var/cc=rand(1,5)
		if(cc==1)
			var/mob/I=pick(killerpopper)
			killerpopper-=I
			charpopper-=I
			I.isL=1
			I << " <b>You are the Detective</b> ... You have come to this school to investigate the kira case going on around here."
			for(var/mob/n in world)
				if(n.key in Owner)
					n << "<font color=red>Admin Notice: [I]([I.key]) is the Detective"
			var/obj/Misc/Paper_Sheet/N=new
			var/sp=rand(1,40)
			N.writing="There is about a [sp]% chance that a teacher in this school is Kira.<BR>This note should remain confidential to prevent a panic or riot."
			I.contents+=N
		//Detective End.
		//KIRA...
		var/kirarand=rand(1,2)
		if(kirarand==1)goto nokira
		var/mob/a=pick(killerpopper)
		killerpopper-=a
		charpopper-=a
		a.kira=1
		a << " <b>You are the Kira</b> ... You found this notebook laying randomly on the ground outside of the school earlier today, I wonder what it does?."
		for(var/mob/n in world)
			if(n.key in Owner)
				n << "<font color=red>Admin Notice: [a]([a.key]) is the Second Kira"
		var/obj/Misc/Death_Note2/b=new
		a.contents+=b
		:nokira
		//KIRA End.
		world << sound(null)
		doornumber="[rand(1,9)][rand(1,9)][rand(1,9)]"
		world << sound('audio/alarm.wav')
		////
		///
		GameStarting=0
	else if(gamemode=="Extended")
		world << "<big><b><font color=red>Warning:</b></font> Lockdown Malfunction: Facility has been locked down until This System's authorities can be reached. Simple program analysis indicates that a teacher died from stress."
	else if(gamemode=="Witch")
		var/mob/I=pick(killerpopper)
		killerpopper-=I
		charpopper-=I
		I.beatrice=1
		I.currentrole="The Witch"
		/*var/obj/weapons/Witches_Pipe/O=new Tentative regimen of aggressive commenting to move witch powers to witch and away from pipe.
		I.contents+=O*/
		/*var/blh=rand(1,2)
		if(blh==1)O.butterflies=1
		if(blh==2)O.butterflies=0*/
		if(hidemsg==0)world << "<big><b><font color=red>Warning:</b></font> Dead body located on the premises. Simple program analysis highly suggest either murder or assisted suicide. Facility has been locked down until This System's authorities can be reached."
		I << " <b>You are the Witch</b> ...After living for over a thousand years, you are taking your boredom out on playing a ruthless game that involves killing everyone in the area. Try not to be noticed, and maybe, try and have fun with your 'classmates'.  If too many people are in the area, the anti-magic toxins won't allow you to use your magic power. Be warned!"
	else if(gamemode=="Zombie")
		if(hidemsg==0)world << "<font size=3><b><font color=red>Warning:</font></b> Dead body located on the premises. After advanced program analysis the body appeared to have scratch and bite marks all on it. Facility has been locked down until This System's authorities can be reached"
		for(var/mob/player/M in world)
			if(M.zombie==1)
				var/obj/P=locate(/obj/Spawns/ShiniSpawn)
				M.loc=P.loc
				M.HPHud()
				break
	if(vents=="Off")
		for(var/turf/VoidWallsFake/O in world)
			O.density=1
	if(hidemsg==1)
		oldmode="Secret"
	killerpopper=new/list()
	Rosterrandomizer()
	updateworld()
	StartingLight()

var/oldmode=null
proc/StartingLight()
	if(world.maxz>12)
		sd_OutsideLight(1)
		ToggleHallLightsOn()
	else
		spawn(3)StartingLight()
proc/ticker(var/tickers)
	if(attackdelay=="5 Minutes")
		attackdelayer=1
		spawn(3000)
			if(timesplayed==tickers)
				goto good
			else
				return
			:good
			world<<"<font color=gray><font size=2>Attack delay is now off."
			attackdelayer=0
	if(attackdelay=="10 Minutes")
		attackdelayer=1
		spawn(6000)
			if(timesplayed==tickers)
				goto good
			else
				return
			:good
			world<<"<font color=gray><font size=2>Attack delay is now off."
			attackdelayer=0
	if(attackdelay=="15 Minutes")
		attackdelayer=1
		spawn(9000)
			if(timesplayed==tickers)
				goto good
			else
				return
			:good
			world<<"<font color=gray><font size=2>Attack delay is now off."
			attackdelayer=0
	else return 0
proc/ticker2(var/tickers)
	if(hoarddelay=="5 Minutes")
		hoarddelayer=1
		spawn(3000)
			if(timesplayed==tickers)
				goto good
			else
				return
			:good
			world<<"<font color=gray><font size=2>Hoard delay is now off."
			hoarddelayer=0
	if(hoarddelay=="10 Minutes")
		hoarddelayer=1
		spawn(6000)
			if(timesplayed==tickers)
				goto good
			else
				return
			:good
			world<<"<font color=gray><font size=2>Hoard delay is now off."
			hoarddelayer=0
	if(hoarddelay=="15 Minutes")
		hoarddelayer=1
		spawn(9000)
			if(timesplayed==tickers)
				goto good
			else
				return
			:good
			world<<"<font color=gray><font size=2>Hoard delay is now off."
			hoarddelayer=0
	else return 0

var/timesplayed=0
var/clockercounter=0
obj
	Clock
		icon='clock.dmi'
		icon_state="6"
proc
	TimeTick(var/tickers)
//		if(timeleft>0)return
		if(timesplayed==tickers)
			goto good
		else
			return
		:good
		spawn(gamesleephours)
			if(timesplayed==tickers)
				goto good2
			else
				return
			:good2
			gamehour+=1
			clockercounter+=1
			timeleft-=1
			if(gamehour==13)
				gamehour=1
			if(gamehour==12)
				if(ampm=="PM")
					gamehour=12
					ampm="AM"
			if(clockercounter==3)
				beatricesee+=1
				clockercounter=0
			if(gamemode=="Ghost")
				var/randd=rand(1,3)
				if(randd==1)
					for(var/mob/M in world)
						if(M.playing==1&&M.see_invisible==1&&M.killer==0)
							M.see_invisible=50
			for(var/obj/Clock/O in world)
				O.icon_state="[gamehour]"
			if(gamehour==6&&ampm=="AM")
				EndGame()
				return
			CheckKira()
			CheckGame()
			spawn() TimeTick(tickers)

proc
	EndGame()
		if(GameOver==1)return
		world << "<font size=4 color=red><b>The game is over!</b></font>"
		timesplayed+=1
		GameOver=1
		sleep(10)
		world << "<b>Results:</b>"
		Endingcredits()
		if(gamemode=="Vampire")
			goto ends:
		world << "List of players:"
		for(var/mob/B in alivelist)
			world << "[B.alias] / [B.realname] ([B.key])"
		for(var/mob/escaped/B in world)
			world << "[B.alias] / [B.realname] ([B.realkey]) <font color=blue>Escaped!"
		for(var/mob/corpse/B in world)
			world << "[B.alias] / [B.realname] ([B.realkey]) <font color=red>Died!"
		if(gamemode=="Zombie")
			for(var/mob/B in zombielist)
				world << "[B.alias] / [B.realname] ([B.key]) <font color=red>Infected!"
		:ends
		for(var/mob/player/M in world)
			//M.ResetVars()
			M.HideHud()
		sleep(30)
		boot_up()

var/const/Light_Laughing='light_laughing.ogg'
var/const/Title_Normal='title.ogg'
var/const/Title_Zombie='howling.ogg'
var/const/Title_Witch='title_witch.ogg'
var/const/Title_Nanaya='title_Vampire.ogg'
var/const/Title_DN='title_shin.ogg'
var/list/malecharacters=list("Glasses","Headphones","Goggles","Blue","Black","Silver","Red","Purple","Orange","Amber","Blonde","Green","Gray","Brown")
var/list/femalecharacters=list("Ribbon","Blue","Black","Silver","Red","Purple","Orange","Blonde","Pink","Green","Gray","Brown")
var/list/femalehairspick=list('BrownGirlHair2.dmi','BlackGirlHair.dmi','BlackGirlHair2.dmi','SilverGirlHair2.dmi','femalehair6.dmi','PurpleGirlHair.dmi','PurpleGirlHair2.dmi','RedGirlHair.dmi','drills.dmi')
var/list/malehairspick=list('RedBoyHair.dmi','RedBoyHair2.dmi','RedBoyHair3.dmi','malehair1.dmi','malehair3.dmi','malehair6.dmi','malehair8.dmi','BlueBoyHair.dmi','BlueBoyHair3.dmi','BrownBoyHair.dmi')
proc
	Playerpick(mob/A)
		if(classiccharacterpick==1)
			//A.realname=A.charname
			if(A.chargender=="male")
				if(uniform==0)
					A.icon='MaleBase.dmi'
				else
					A.icon='RedMaleBase.dmi'
				var/icon/e='MaleEyes.dmi'
				e*=rgb(rand(10,60),rand(20,60),rand(10,60))
				var/hc=pick(malecharacters)
				malecharacters-=hc
				var/icon/g=pick(malehairspick)
				var/acc=0
				if(hc=="Red")
					var/icon/B=new(g)
					malecharacters-="Red"
					B.Blend("#990000")
					A.overlays+=B
					A.name="The Creepy Red Haired Boy"
					malehairspick-=B
					acc=1

				if(hc=="Blue")
					malecharacters-="Blue"
					var/icon/B=new(g)
					B.Blend("#000099")
					A.overlays+=B
					malehairspick-=B
				if(hc=="Black")
					var/icon/B=new(g)
					malecharacters-="Black"
					B.Blend("#000000")
					A.overlays+=B
					malehairspick-=B
				if(hc=="Green")
					var/icon/B=new(g)
					malecharacters-="Green"
					B.Blend("#008000")
					A.overlays+=B
					malehairspick-=B
				if(hc=="Brown")
					var/icon/B=new(g)
					malecharacters-="Brown"

					B.Blend("#993300")
					A.overlays+=B
					malehairspick-=B
				if(hc=="Purple")
					var/icon/B=new(g)
					malecharacters-="Purple"
					B.Blend("#6600CC")
					A.overlays+=B
					malehairspick-=B
				if(hc=="Silver")
					var/icon/B=new(g)
					malecharacters-="Silver"
					B.Blend("#E6E6E6")
					A.overlays+=B
					malehairspick-=B
				if(hc=="Gray")
					var/icon/B=new(g)
					malecharacters-="Gray"
					B.Blend("#E6E6E6")
					A.overlays+=B
					malehairspick-=B
				if(hc=="Orange")
					var/icon/B=new(g)
					malecharacters-="Silver"
					B.Blend("#FF9900")
					A.overlays+=B
					malehairspick-=B
				if(hc=="Amber")
					var/icon/B=new(g)
					malecharacters-="Amber"
					B.Blend("#FF9900")
					A.overlays+=B
					malehairspick-=B
				if(hc=="White")
					var/icon/B=new(g)
					malecharacters-="White"
					B.Blend("#FAFAFA")
					A.overlays+=B
					malehairspick-=B
				if(hc=="Pink")
					var/icon/B=new(g)
					malecharacters-="Pink"

					B.Blend("#FF00FF")
					A.overlays+=B
					malehairspick-=B
				if(hc=="Blonde")
					var/icon/B=new(g)
					malecharacters-="Blonde"

					B.Blend("#FF9933")
					A.overlays+=B
					malehairspick-=B
				if(hc=="Headphones")
					var/icon/B=new(g)
					malecharacters-="Headphones"
					A.name="The Boy With Headphones"
					B.Blend("#660033")
					A.overlays+=B
					A.overlays+='headphones.dmi'
					acc=1
					malehairspick-=B
				if(hc=="Goggles")
					var/icon/B=new(g)
					malecharacters-="Goggles"
					A.name="The Boy With Goggles"
					B.Blend("#993366")
					A.overlays+=B
					A.overlays+='goggles.dmi'
					acc=1
					malehairspick-=B
				if(hc=="Glasses")
					var/icon/B=new(g)
					malecharacters-="Glasses"
					A.name="The Boy With Glasses"
					B.Blend("#993366")
					A.overlays+='glasses.dmi'
					A.overlays+=B
					acc=1
					malehairspick-=B
				if(acc==0)
					A.name="The [hc] Haired Boy"

				var/namer=pick(MaleFirstNames)
				var/lastnamer=pick(LastNames)
				A.realname="[namer] [lastnamer]"
				MaleFirstNames-=namer
				namedlist+=namer
			else
				if(uniform==0)
					A.icon='FemaleBase.dmi'
				else
					A.icon='RedFemaleBase.dmi'
				var/icon/e='FemaleEyes.dmi'
				e*=rgb(rand(10,60),rand(20,60),rand(10,60))
				var/hc=pick(femalecharacters)
				femalecharacters-=hc
				var/icon/g=pick(femalehairspick)
				var/acc=0
				if(hc=="Red")
					var/icon/B=new(g)
					femalecharacters-="Red"
					B.Blend("#990000")
					A.overlays+=B
					femalehairspick-=B
					world << "kkkk"
				if(hc=="Blue")
					femalecharacters-="Blue"
					var/icon/B=new(g)
					B.Blend("#000099")
					A.overlays+=B
					femalehairspick-=B
				if(hc=="Black")
					var/icon/B=new(g)
					femalecharacters-="Black"
					B.Blend("#000000")
					A.overlays+=B
					femalehairspick-=B
				if(hc=="Green")
					var/icon/B=new(g)
					femalecharacters-="Green"
					B.Blend("#008000")
					A.overlays+=B
					femalehairspick-=B
				if(hc=="Brown")
					var/icon/B=new(g)
					femalecharacters-="Brown"

					B.Blend("#993300")
					A.overlays+=B
					femalehairspick-=B
				if(hc=="Purple")
					var/icon/B=new(g)
					femalecharacters-="Purple"
					B.Blend("#6600CC")
					A.overlays+=B
					femalehairspick-=B
				if(hc=="Silver")
					var/icon/B=new(g)
					femalecharacters-="Silver"
					B.Blend("#E6E6E6")
					A.overlays+=B
					femalehairspick-=B
				if(hc=="Gray")
					var/icon/B=new(g)
					femalecharacters-="Gray"
					B.Blend("#E6E6E6")
					A.overlays+=B
					femalehairspick-=B
				if(hc=="Orange")
					var/icon/B=new(g)
					femalecharacters-="Silver"
					B.Blend("#FF9900")
					A.overlays+=B
					femalehairspick-=B
				if(hc=="White")
					var/icon/B=new(g)
					femalecharacters-="White"
					B.Blend("#FAFAFA")
					A.overlays+=B
					femalehairspick-=B
				if(hc=="Pink")
					var/icon/B=new(g)
					femalecharacters-="Pink"

					B.Blend("#FF00FF")
					A.overlays+=B
					femalehairspick-=B
				if(hc=="Blonde")
					var/icon/B=new(g)
					femalecharacters-="Blonde"

					B.Blend("#FF9933")
					A.overlays+=B
					femalehairspick-=B
				if(hc=="Ribbon")
					var/icon/B=new(g)
					femalecharacters-="Ribbon"

					B.Blend("#5f5f5f")
					A.overlays+=B
					A.overlays+='ribbon.dmi'
					femalehairspick-=B
					acc=1
					A.name="The Girl With Ribbons"
				//A.overlays+=e
				if(acc==0)
					A.name="The [hc] Haired Girl"
				var/namer=pick(FemaleFirstNames)
				var/lastnamer=pick(LastNames)
				A.realname="[namer] [lastnamer]"
				FemaleFirstNames-=namer
				namedlist+=namer
			//var/icon/I=icon(A.charhair:icon)
			//I.layer=MOB_LAYER
			//if(A.charhaircolor != null)I.Blend(A.charhaircolor)
			//A.overlays+=I
			A.chatavatar='speech.dmi'
		else
			A.name=A.charname
			if(A.chargender=="male")
				if(uniform==0)
					A.icon='MaleBase.dmi'
				else
					A.icon='RedMaleBase.dmi'
				var/icon/e='MaleEyes.dmi'
				e*=rgb(rand(10,60),rand(20,60),rand(10,60))
				//A.overlays+=e
				var/namer=pick(MaleFirstNames)
				var/lastnamer=pick(LastNames)
				A.realname="[namer] [lastnamer]"
				MaleFirstNames-=namer
				namedlist+=namer
			else
				if(uniform==0)
					A.icon='FemaleBase.dmi'
				else
					A.icon='RedFemaleBase.dmi'
				var/icon/e='FemaleEyes.dmi'
				e*=rgb(rand(10,60),rand(20,60),rand(10,60))
				//A.overlays+=e
				var/namer=pick(FemaleFirstNames)
				var/lastnamer=pick(LastNames)
				A.realname="[namer] [lastnamer]"
				FemaleFirstNames-=namer
				namedlist+=namer
			var/icon/I=icon(A.charhair:icon)
			//I.layer=MOB_LAYER
			if(A.charhaircolor != null)I.Blend(A.charhaircolor)
			A.overlays+=I
			A.chatavatar='speech.dmi'
	Chatbubble(mob/A)
		var/icon/I=A.chatavatar
		if(A.charhaircolor != null)I.Blend(A.charhaircolor)
		//A.chatavatar=I
/*		var/gen="male"
		var/picked=null
		if(A.gender=="male")
			picked=pick(malecharacters)
			malecharacters-=picked
			var/namer=pick(MaleFirstNames)
			var/lastnamer=pick(LastNames)
			A.realname="[namer] [lastnamer]"
			MaleFirstNames-=namer
			namedlist+=namer
			if(uniform==0)
				A.icon='MaleBase.dmi'
			else
				A.icon='RedMaleBase.dmi'
			var/icon/I='MaleEyes.dmi'
			I*=rgb(rand(10,60),rand(20,60),rand(10,60))
			A.overlays+=I
			namedlist2+=lastnamer
			gen="male"
		else
			picked=pick(femalecharacters)
			femalecharacters-=picked
			var/namer=pick(FemaleFirstNames)
			var/lastnamer=pick(LastNames)
			A.realname="[namer] [lastnamer]"
			FemaleFirstNames-=namer
			namedlist+=namer
			if(uniform==0)
				A.icon='FemaleBase.dmi'
			else
				A.icon='RedFemaleBase.dmi'
			var/icon/I='FemaleEyes.dmi'
			I*=rgb(rand(10,60),rand(20,60),rand(10,60))
			A.overlays+=I
			namedlist2+=lastnamer
			gen="female"
		if(picked=="Blue")
			if(gen=="male")
				A.haircolor="Blue"
				var/icon/B=pick(blueboyicons)
				A.overlays+=B
				A.hairtype=B
				A.name="The Blue Haired Boy"
			else
				A.haircolor="Blue"
				var/icon/B=pick(bluegirlicons)
				A.overlays+=B
				A.hairtype=B
				A.name="The Blue Haired Girl"
		if(picked=="Red")
			if(gen=="male")
				A.haircolor="Red"
				var/icon/B=pick(redboyicons)
				A.overlays+=B
				A.hairtype=B
				A.name="The Creepy Red Haired Boy"
			else
				A.haircolor="Red"
				var/icon/B=pick(redgirlicons)
				A.overlays+=B
				A.hairtype=B
				A.name="The Red Haired Girl"
		if(picked=="Gray")
			if(gen=="male")
				A.haircolor="White"
				var/icon/B=pick(grayboyicons)
				A.overlays+=B
				A.hairtype=B
				A.name="The Gray Haired Boy"
			else
				A.haircolor="White"
				var/icon/B=pick(whitehariedgirlicons)
				A.overlays+=B
				A.hairtype=B
				A.name="The White Haired Girl"
		if(picked=="Black")
			if(gen=="male")
				A.haircolor="Black"
				var/icon/B=pick(blackboyicons)
				A.overlays+=B
				A.hairtype=B
				A.name="The Black Haired Boy"
			else
				A.haircolor="Black"
				var/icon/B=pick(blackgirlicons)
				A.overlays+=B
				A.hairtype=B
				A.name="The Black Haired Girl"
		if(picked=="Silver")
			if(gen=="male")
				A.haircolor="Silver"
				var/icon/B=pick(silverboyicons)
				A.overlays+=B
				A.hairtype=B
				A.name="The Silver Haired Boy"
			else
				A.haircolor="Silver"
				var/icon/B=pick(silvergirlicons)
				A.overlays+=B
				A.hairtype=B
				A.name="The Silver Haired Girl"
		if(picked=="Purple")
			if(gen=="male")
				A.haircolor="Purple"
				var/icon/B=pick(purpleboyicons)
				A.overlays+=B
				A.hairtype=B
				A.name="The Purple Haired Boy"
			else
				A.haircolor="Purple"
				var/icon/B=pick(purplegirlicons)
				A.overlays+=B
				A.hairtype=B
				A.name="The Purple Haired Girl"
		if(picked=="Green")
			if(gen=="male")
				A.haircolor="Green"
				var/icon/B=pick(greenboyicons)
				A.overlays+=B
				A.hairtype=B
				A.name="The Green Haired Boy"
			else
				A.haircolor="Green"
				var/icon/B=pick(greengirlicons)
				A.overlays+=B
				A.hairtype=B
				A.name="The Green Haired Girl"
		if(picked=="Orange")
			if(gen=="male")
				A.haircolor="Orange"
				var/icon/B=pick(orangeboyicons)
				A.overlays+=B
				A.hairtype=B
				A.name="The Orange Haired Boy"
			else
				A.haircolor="Orange"
				var/icon/B=pick(orangegirlicons)
				A.overlays+=B
				A.hairtype=B
				A.name="The Orange Haired Girl"
		if(picked=="Blonde")
			if(gen=="male")
				A.haircolor="Blonde"
				var/icon/B=pick(goggleboyicons)
				A.overlays+=B
				A.hairtype=B
				A.name="The Boy With Goggles"
			else
				A.haircolor="Blonde"
				var/icon/B=pick(blondegirlicons)
				A.overlays+=B
				A.hairtype=B
				A.name="The Blonde Haired Girl"
		if(picked=="Brown")
			if(gen=="male")
				A.haircolor="Brown"
				var/icon/B=pick(brownboyicons)
				A.overlays+=B
				A.hairtype=B
				A.name="The Brown Haired Boy"
			else
				A.haircolor="Brown"
				var/icon/B=pick(browngirlicons)
				A.overlays+=B
				A.hairtype=B
				A.name="The Brown Haired Girl"
		if(picked=="Pink")
			A.haircolor="Pink"
			var/icon/B=pick(pinkgirlicons)
			A.overlays+=B
			A.hairtype=B
			A.name="The Pink Haired Girl"
		if(picked=="Amber")
			A.haircolor="Amber"
			var/icon/B=pick(sunglassesicon)
			A.overlays+=B
			A.hairtype=B
			A.name="The Boy With Sunglasses"
		Chatbubble(A,A.haircolor)
	Chatbubble(mob/A,var/B)
		var/icon/I='speech.dmi'
		if(B=="Blonde")
			I*=rgb(255,255,128)
		if(B=="Green")
			I*=rgb(0,128,0)
		if(B=="Purple")
			I*=rgb(128,0,128)
		if(B=="Silver")
			I*=rgb(128,128,128)
		if(B=="Blue")
			I*=rgb(0,0,128)
		if(B=="Orange")
			I*=rgb(255,128,64)
		if(B=="Red")
			I*=rgb(128,0,0)
		if(B=="Pink")
			I*=rgb(255,128,255)
		if(B=="Black")
			I*=rgb(114,114,114)
		if(B=="Brown")
			I*=rgb(132,108,64)
		if(B=="Amber")
			I*=rgb(255,128,64)
		A.chatavatar=I*/