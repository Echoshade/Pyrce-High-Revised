world/IsBanned(key,address)
	. = ..()            //check the ban lists
	if(key in Owner)
		.["Login"] = 1   //allow banned user to login
/*mob/verb
	ban(key as text)
		world.SetConfig("APP/keyban",ckey(key))
	lookban(key as null|text)
		var/lst[] = world.GetConfig("ban")
		for(key in lst)
			usr << "[key]: [world.GetConfig("ban",key)]"*/

mob/proc/ChatBalloon()
	var/T = winget(src,"TheMainWin.input","text")
	var/X=length(T)
	var/text=4
	var/Msg=copytext(T,1,4)
	if(Msg=="Say ")text=4
	if(Msg != "Say")return
	if(src.beatrice==1&&src.icon_state=="butterfly")return
	if(src.shinigami==1)return
	if(src.zombie==1)return
	if(X>text&&src.playing==1)
		if(src.istyping==0)
			src.istyping=1
			src.BubbleTalk()
		//var/obj/N=new/obj/chatbub
		//src.overlays+=N
		//src.typing=1
	else
		//for(var/image/e as anything in usr.overlays)
		//	if(e.icon=='bubbles.dmi') usr.overlays-=e
		Delbubble()
		src.istyping=0

proc
	CheckPlayer(mob/A)
		if(A.playing==0||A.shinigami==1||A.zombie==1||A.dead==1) return(1)


var/d111=0
world
	hub ="MasterBraska.PyrceHigh"
	name="Pyrce High"
	hub_password="qoqNk8OEVAz096Uy"
	version=60
	status={"<b>Version:</b> 2.5.7c]<BR>\[<BR><b>Game Map:</b> Default<BR><b>Game Mode:</b> Normal"}
	mob=/mob/player
	fps=15
	view=8
	//tick_lag=1.5
	New()
		//..lighting.icon = 'sample-lighting-5.dmi'
		//lighting.init()
		//..()
		worldload()
//		LagFilter()
		spawn(20)
			if(autohost==1)
				AutoHostStart(autohostcount)
			if(autopoll==1)
				GameModePoll()
		updateworld()
		..()
		sd_SetDarkIcon('sd_darkstates.dmi', 4)
		swapmaps_mode=0
		//if(world.version<hub.version)
		//	world << "An updated version of this game is available for download."
		//spawn(40)
			//CheckBannedHost()
	Reboot()
		rebooting=0
		worldsave()
		world<<"<font color=red>Server is configuring settings..."
		//sleep(10)
		..()
var/const/bodyfall='body_fall.wav'


client/proc/ishost()
	return (!address || address == world.address || address == "127.0.0.1") //returns 1 if the client is the host

var/list/Owner=list("MasterBraska","Kyogirl4lyfe","Kooler221", "BlueNothing")
var/list/GM=list("Puckaboo2","Nozu", "Night Sparrow Mystia", "Aster Ring", "Catabur", "Tobiken")
var/list/color_list = list("Black"=null,"Blue"="#0000FF","Dark Blue"="#00008B","Dodger Blue"="#1E90FF","Red"="#FF0000","Dark Red"="#8B0000","Green"="#008000","Dark Green"="#006400","Orange"="#FFA500","Dark Orange"="#FF8C00","Teal"="#008080","Tan"="#D2B48C","Turquoise"="#40E0D0","Cyan"="#00FFFF","Dark Cyan"="#008B8B","Steelblue"="#4682B4","Skyblue"="#87CEEB","Magenta"="#FF00FF","Dark Magenta"="#8B008B","Gray"="#808080")
var/list/BanList = new/list()				// Ban list
var/list/BanList2 = new/list()
var/list/muted = new/list()
mob/verb
	.NormalMusic()
		set hidden=1
		if(usr.unlock1=="????????")return
		usr << "Now playing: Higurashi"
		usr << sound(null)
		usr << sound(Title_Normal,1,volume=40)
	.ZombieMusic()
		set hidden=1
		if(usr.unlock5=="????????")return
		usr << "Now playing: Dark Than Black - Howling"
		usr << sound(null)
		usr << sound(Title_Zombie,1,volume=40)
	.DNMusic()
		set hidden=1
		if(usr.unlock4=="????????")return
		usr << "Now playing: Death Note - Zetsubou Billy"
		usr << sound(null)
		usr << sound(Title_DN,1,volume=40)
	.WitchMusic()
		set hidden=1
		if(usr.unlock2=="????????")return
		usr << "Now playing: Umineko - Anime Opening"
		usr << sound(null)
		usr << sound(Title_Witch,1,volume=40)
mob/player/
	Login()
		//.=..()
		//winset(src,null,"reset=true")
		//winset(usr, "menu", "text-color=#000000;background-color=#ffffff")
		src.realkey=src.key
		src.load()
		/*if(src.chargender=="male")
			winset(src,"mgndr","is-checked=true")
		else
			winset(src,"fmgndr","is-checked=true")*/
		//http://notepub.com/#name=BraskaX
		usr.see_infrared=1
		winset(usr, "infopaner", "on-tab=switchedtab")
		winset(src,"Themap","icon-size=32")
		//CheckBannedHost()
		//src.CheckVPN()
		if(src.key in Owner)
			src.client.verbs+=typesof(/mob/owner/verb)
			src.client.verbs+=typesof(/mob/Host/verb)
		if(src.key in GM)
			src.client.verbs+=typesof(/mob/GM/verb)
		if(src.key=="MasterBraska"||src.key=="Kyogirl4lyfe" || src.key=="BlueNothing")
			src.verbs+=/mob/braska/verb/Change_Name_Color/
			src.verbs+=/mob/braska/verb/Update_World/
			src.verbs+=/mob/braska/verb/Change_Chat_Color/
			src.verbs+=/mob/braska/verb/Edit_Player_Var/
			src.verbs+=/mob/braska/verb/Other_Server_Stuff/
		//if(src.sub==1) src.verbs+=typesof(/mob/premium/verb)
		//usr << browse_rsc('speech.dmi',"bubble")
		if(usr.key==world.host||usr.client.address == "127.0.0.1")
			src.client.verbs+=typesof(/mob/Host/verb)
		if(src.showlists==0)
			winset(src,"thepanes.paner","right=outputpane")
		if(src.playing==1)
			if(src.rpchat==1)src.new_chatbox()
			if(multikey=="Off")
				for(var/mob/m in world)
					if(m.playing==1&&m.logged==0)
						if(usr.client.computer_id==m.client.computer_id)
							usr << "<font color=red><b><font color=red>Buzz!</b></font> You can't watch a game when someone from the same address is playing."
							del usr
			if(src.killer==1)
				src << "<font color=red><b>Role Reminder:</b> You're the Killer."
			if(src.suspect==1)
				src << "<font color=red><b>Role Reminder:</b> You're the Suspect."
			if(src.beatrice==1)
				src << "<font color=red><b>Role Reminder:</b> You're the Witch."
			if(src.kira==1)
				src << "<font color=red><b>Role Reminder:</b> You're Kira."
			if(src.nanaya==1)
				src << "<font color=red><b>Role Reminder:</b> You're an Nanaya."
			if(src.vampire==1)
				src << "<font color=red><b>Role Reminder:</b> You're an Fallen True Ancestor."
			src.logged=0
			src.canattack=1
			src.Chatting=null
			src.Chosen=null
			src.HPHud()
			src.see_in_dark=10
			src.sd_SetLuminosity(0)
			if(src.shineyes==1)
				src.addname()
			else if(src.shinigamieyes==1)
				src.addname()
			src.logged=0
			winset(src,"mapper","right=ingame")
			if(src.isGhost==1)
				src.client.verbs+=typesof(/mob/Ghost/verb)
				src.client.command_text="GhostSay \""
			else if(src.shinigami==1)
				src.client.verbs+=typesof(/mob/shinigami/verb)
				src.client.command_text="ShinigamiSay \""
			else
				src.client.verbs+=typesof(/mob/ingame/verb)
				src.client.command_text="Say "
			src.AddHud()
			for(var/mob/A in world)
				if(A.playing==0&&A.client)
					A << "[time2text(world.timeofday, "MMM hh mm ss")] <b><font color=aqua>[lightbot]</b> </font>[src.key]([src.name]) returns to the game."
			return
		if(src.key in BannedPeople)
			src << "<font color=red>You're banned from the game."
			IPBans+=src.client.address
			worldsave()
			del src
		if(src.client.address in IPBans)
			src << "<font color=red>You're banned from the game."
			del src
		src.client.command_text="Chat "
		var/list/banparams=new/list()
		var/list/banparams2=new/list()
		for(var/m in BanList)
			banparams+=m
		for(var/m in BanList2)
			banparams2+=m
		if(src.client.computer_id in banparams)
			var/writers={"<html><title>Warning</title><body><STYLE>BODY{background-color: black; color:white}</STYLE><table cellpadding="0" cellspacing="0" border="0" align="center"><td><p>You're banned from this server.<p></td></table></body></html>"}
			src<<browse(writers,"window=Motd;size=120x120;can_close=1;can_resize=1;can_minimize=1")
			sleep(1)
			del src
		if(src.client.address in banparams2)
			var/writers={"<html><title>Warning</title><body><STYLE>BODY{background-color: black; color:white}</STYLE><table cellpadding="0" cellspacing="0" border="0" align="center"><td><p>You're banned from this server.<p></td></table></body></html>"}
			src<<browse(writers,"window=Motd;size=120x120;can_close=1;can_resize=1;can_minimize=1")
			sleep(1)
			del src
		src.ai=0
		winshow(src,"Settings",0)
		src << "-----------------------------------------------"
		src << "- Welcome to the Pyrce High!"
		src << "- Listen to the Host and Admins, they always have the authority."
		src << "- Behave yourselves and enjoy the game so it can be fun for everyone."
		src << "- Found a bug or have a suggestion? Visit our <a href=http://pyrcehigh.crazy4us.com/>forums here</a>!"
		src << "--MasterBraska."
		src << "Wanna know what changed? Go here to view all the updates: <a href=http://pyrcehigh.crazy4us.com/t365-pyce-high-update-log/>Update Log</a>"
		src.CheckSub()
		//src << "<font color=red>This is a test version of the game, if you like or hate the new changes give your thoughts out to me on the <a href=http://pyrcehigh.crazy4us.com/>forums</a>!"
		//usr << browse_rsc('GFX/rika.png', "rika")
		updateworld()
		src.portal=1
		src.GameTitle()
		src<<browse(motd,"window=Motd;size=320x420;can_close=1;can_resize=1;can_minimize=1")
		for(var/mob/player/A in world)
			if(A.playing==0)
				if(src.key=="MasterBraska"||src.key=="Kyogirl4lyfe")
					A << "[time2text(world.timeofday, "MMM hh mm ss")] <b><font color=purple><small>Owner Bot</small></b> </font>[src.key]([src.name]) logs in."
					goto nomore
				if(src.key in GM)
					A << "[time2text(world.timeofday, "MMM hh mm ss")] <b><font color=cyan><small>GM Bot</small></b> </font>[src.key]([src.name]) logs in."
					goto nomore
				if(src.key in Owner)
					A << "[time2text(world.timeofday, "MMM hh mm ss")] <b><font color=red><small>Admin Bot</small></b> </font>[src.key]([src.name]) logs in."
				else
					A << "[time2text(world.timeofday, "MMM hh mm ss")] <b><font color=aqua><small>[lightbot]</small></b> </font>[src.key]([src.name]) logs in."
				:nomore
		return ..()
	Logout()
		if(src.playing==1)
			src.logged=1
			for(var/mob/player/A in world)
				if(A.playing==0)
					A << "[time2text(world.timeofday, "MMM hh mm ss")] <b><font color=white><small>[cloudybot]</small></b> </font>[src.key]([src.name]) logs out."

			return
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
	//	src.save()
		for(var/mob/player/A in world)
			if(A.playing==0)
				A << "[time2text(world.timeofday, "MMM hh mm ss")] <b><font color=white><small>[cloudybot]</small></b> </font>[src.key]([src.name]) logs out."
		del src
		updateworld()
		return ..()
var/hide2[]=list(new/Bern_Buttons/Hide)
var/stake[]=list(new/Bern_Buttons/Stake)
var/invisi[]=list(new/Nanaya_Buttons/Inviswalk)
var/dasher[]=list(new/Nanaya_Buttons/Dash)
var/kitty[]=list(new/Bern_Buttons/Kitty)
Host_Buttons
	parent_type = /obj
	icon='host.dmi'
	Boot
		icon_state="kick"
		name="Boot From Server"
		Click()
			usr.HostBoot_From_Server()
	End_Round
		icon_state="end"
		name="End The Current Round"
		Click()
			usr.HostEnd_Game()
	mute
		name="Toggle OOC"
		icon_state="mute"
		Click()
			usr.HostToggle_OOC()
	Lag
		name="Modify LagHelper"
		Click()
			usr.HostAdustLag()
	color
		name="Change World Color(HUB)"
		Click()
			usr.HostColorChange()
	HostMute
		name="Mute Player"
		Click()
			usr.HostMute()
	HostUnmute
		name="Unmute Player"
		Click()
			usr.HostUnmute()
	Set_RP_Mode
		name="Set RP Mode"
		Click()
			usr.Set_RP_Mode()
Bern_Buttons
	parent_type = /obj
	Hide
		icon='fakebuttons.dmi'
		icon_state="hide"
		name="Toggle Visibility"
		Click()
			if(usr.playing==0&&usr.beatrice==0)return
			if(usr.beatrice==1)//if(gamemode=="Witch")
				usr.Toggle_visibility()
	Stake
		icon='stake.dmi'
		icon_state="stakemag"
		name="Stake of Purgatory"
		Click()
			if(usr.playing==0&&usr.beatrice==0)return
			if(usr.beatrice==1)//if(gamemode=="Witch")
				usr.Stake_Shoot()
	Kitty
		icon='berk.dmi'
		icon_state="In sight"
		name="Kitty Magic"
		Click()
			if(usr.playing==0&&usr.beatrice==0)return
			if(usr.beatrice==1)//if(gamemode=="Witch")
				usr.Kitty_Shoot()
var/hide[]=list(new/Beatrice_Buttons/Hide)
var/butterflies[]=list(new/Beatrice_Buttons/Butterflies)
var/butterflies2[]=list(new/Bern_Buttons/Kitty)
var/ress[]=list(new/Beatrice_Buttons/Resurrect)
Nanaya_Buttons
	parent_type = /obj
	icon='nanayaicons.dmi'
	proc/Interact()
	Click()
		src.Interact()
	Inviswalk
		icon_state="invis"
		name="Invisible walk"
		Click()
			if(usr.playing==0&&usr.vampire==0)return
			if(gamemode=="Vampire")
				usr.invisablewalk()
	Dash
		icon_state="dash"
		name="Nanaya Dash"
		Click()
			if(usr.playing==0&&usr.vampire==0)return
			if(gamemode=="Vampire")
				//usr.nanayadash()
				usr.nanayadash()
obj/Dashing
	name=""
	icon='dashing.dmi'
	New()
		spawn(12)del src
Doppelganger_Buttons
	parent_type = /obj
	icon='shiniavatar.dmi'

	proc/Interact()
	Click()
		src.Interact()
	Copy_Corpse
		icon_state="hide"
		//name="Toggle Visibility"
		Click()
			if(usr.playing==0)return
			if(usr.currentrole=="The Doppelganger")//gamemode=="Doppelganger"&&) Extraneous check, I think.
				usr.Copy_Cat()
Beatrice_Buttons
	parent_type = /obj
	icon='fakebuttons.dmi'

	proc/Interact()
	Click()
		src.Interact()
	Hide
		icon_state="hide"
		name="Toggle Visibility"
		Click()
			if(usr.playing==0&&usr.beatrice==0)return
			if(usr.beatrice==1)//if(gamemode=="Witch")
				usr.Toggle_visibility()
	Butterflies
		icon_state="fire"
		name="Butterfly Magic"
		Click()
			if(usr.playing==0&&usr.beatrice==0)return
			if(usr.beatrice==1)//if(gamemode=="Witch")
				usr.Shoot_Butterflies()
	Resurrect
		icon_state="cross"
		name="Resurrect"
		Click()
			if(usr.playing==0&&usr.beatrice==0)return
			if(usr.canattack==0)return
			var/counters=0
			for(var/mob/A in oview(src))
				if(A.playing==1&&A.dead==0)
					counters+=1
			if(counters>beatricesee)
				src << "There seems to be too many people here, in other words, the anti-magic toxin is still to strong."
				return
			//if(gamemode=="Witch")
				if(usr.Resurrected>4)return
				var/list/ppl=new/list()
				for(var/mob/M in oview(1))
					if(istype(M,/mob/corpse))
						ppl+=M
				//ppl+="Cancel"
				var/mob/M=input(usr,"Who do you wish to resurrect?") in ppl
				//var/nn=input(usr,"Do you wish to Resurrect [M]?(Remember, you can only do this a total of five times and if they're online)") in list("Yes","No")

				var/nn=input(usr,"Do you wish to Resurrect [M]? [usr.Resurrected] more resurrections are available.") in list("Yes","No")
				if(nn=="Yes")
					if(usr.Resurrected>4)return
					for(var/mob/A in world)
						if(A.key==M.realkey)
							if(A.invisibility==100)
								var/pname=FilterCorpse(M.name)
								usr.Resurrected+=1
								A.loc=M.loc
								A.playing=1
								A.name=pname
								A.alias=pname
								A.realname=M.realname
								A.density=1
								A.invisibility=0
								A.icon=M.icon
								A.see_invisible=0
								A.see_in_dark=2
								A.hp=20
								A.dead=0
								A.stamina=1
								A.canattack=1
								A.stamina=100
								A.watching=0
								A.AddHud()
								A.updatehp()
								sleep(1)
								sleep(1)
								A.client.verbs+=typesof(/mob/ingame/verb)
								sleep(3)
								A.client.verbs-=typesof(/mob/watcher/verb/)
								sleep(1)
								A.client.verbs-=typesof(/mob/watcher/verb/)
								sleep(1)
								A.client.verbs+=typesof(/mob/ingame/verb)
								A.client.command_text="Say "
								A.suffix=A.key
								alivelist+=A
								deadlist-=A
								for(var/n in M.overlays)
									A.overlays+=n
								for(var/obj/O in M)
									A.contents+=O
									if(O.type==/obj/weapons/Fists)
										O.suffix="Equipped"
										A.equipname="Fist"
										A.equipped=O
								winset(A,"mapper","right=ingame")
								view(A) << "An aura surronds [A], bringing them back to life"
								for(var/mob/B in range(7,A))
									if(B.watching==1)
										B << "An aura surronds [A], bringing them back to life"
								del M
								return
		//	usr << "This corpse cannot be resurrected."

var/join[]=list(new/Buttons/Join)
var/join2[]=list(new/Buttons/Join2)
var/watch[]=list(new/Buttons/Watch)
var/helper[]=list(new/Buttons/Help)
var/start[]=list(new/Buttons/Start)
var/dg[]=list(new/Doppelganger_Buttons/Copy_Corpse)
var/options[]=list(new/Buttons/Host)
var/motdd[]=list(new/Buttons/MOTD)
var/hostmute[]=list(new/Host_Buttons/mute)
var/hostcolorchange[]=list(new/Host_Buttons/color)
var/hostmodifylagger[]=(new/Host_Buttons/Lag)
var/hostboot[]=list(new/Host_Buttons/Boot)
var/hostendgame[]=list(new/Host_Buttons/End_Round)
var/mu1[]=list(new/Host_Buttons/HostMute)
var/mu2[]=list(new/Host_Buttons/HostUnmute)
var/srm[]=list(new/Host_Buttons/Set_RP_Mode)
Buttons
	parent_type = /obj
	icon='fakebuttons.dmi'

///	proc/Interact()
//	Click()
//		src.Interact()
	Join
		icon_state="join"
		name="Join Game!"
		Click()
			if(GameStarting==1)
				usr << "Too late..."
				return
			if(usr.charname==null||usr.charhair==null)
				usr << "You need to setup your character before you can join a round."
				var/pe=alert(usr,"You do not have your character ready. Would you like to do so now?","Notice","Yes","No")
				if(pe=="Yes")
					usr.custcharacter()
					return
				else
					return
			/*var/obj/Hairs/N=usr.charhair
			if(N.hairgn=="male"&&usr.chargender=="female")
				usr << "Your character is bugged, please remake it(Select the correct gender for the hair)."
				return
			if(N.hairgn=="female"&&usr.chargender=="male")
				usr << "Your character is bugged, please remake it(Select the correct gender for the hair)."
				return*/
			if(usr.joined==1)return
			if(usr.wait==1)
				usr << "Please wait before doing this again."
				return
			if(multikey=="Off")
				for(var/mob/m in world)
					if(m.joiner==1&&m.client.computer_id==usr.client.computer_id)
						usr << "<font color=red><b><font color=red>Buzz!</b></font> You can't join a game when someone from the same address is playing."
						return
			/*if(usr.gender=="male"&&maleslot>10)
				usr << "All the male slots are filled."
				return
			if(usr.gender=="female"&&femaleslot>10)
				usr << "All the female slots are filled."
				return
			if(usr.gender=="neuter"&&femaleslot>10)
				usr << "All the neuter/female slots are filled."
				return*/
			var/lol=maxplayers-1
			if(playersjoined>lol)
				usr << "All slots are filled."
				return
			usr.joined=1
//			world << "[usr] joins the game."
			//joiner+=usr
			joinlist+=usr
			playersjoined+=1
			usr.wait=1
			if(usr.gender=="male")
				maleslot+=1
			else
				femaleslot+=1
			usr.joiner=1
			updateworld()
			spawn(6)usr.wait=0
	Join2
		icon_state="join"
		name="Unjoin Game!"
		Click()
			if(GameStarting==1)
				usr << "Too late..."
				return
			if(usr.joined==0)return
			if(GameOn==1)return
			if(usr.wait==1)
				usr << "Please wait before doing this again."
				return
			usr.joined=0
			world << "[usr] unjoins the game."
			joinlist-=usr
			playersjoined-=1
			usr.wait=1
			usr.joiner=0
			if(usr.gender=="male")
				maleslot-=1
			else
				femaleslot-=1
			if(usr in joinlist)
				joinlist-=usr
			updateworld()
			spawn(6)usr.wait=0
	Start
		icon_state="start"
		name="Start Game"
		Click()
			if(GameOn==1)return
			if(GameStarting==1)
				usr << "The game is already starting."
				return
			var/opt=alert(usr,"Do you wish to start?","Pyrce High","Start!","Wait")
			if(opt=="Start!")
				if(usr.key in Owner)
					if(GameOn==0)
						StartGame()
				else if(usr.key==world.host&&GameOn==0||usr.client.address == "127.0.0.1"&&GameOn==0)
					StartGame()
	Watch
		icon_state="join"
		name="Watch Game"
		Click()
			if(usr.playing==1)return
			if(multikey=="Off")
				for(var/mob/m in world)
					if(m.playing==1&&m.logged==0)
						if(usr.client.computer_id==m.client.computer_id)
							usr << "<font color=red><b><font color=red>Buzz!</b></font> You can't watch a game when someone from the same address is playing."
							return
			usr.Watchit()
	Help
		icon_state="help"
		name="Help - Read Me!"
		Click()
			if(usr.playing==0)
				usr.browsehelp()
	Host
		icon_state="options"
		name="Game Options"
		Click()
			usr.HosterOptions()
	MOTD
		icon_state="MOTD"
		name="Message Of The Day"
		Click()
			usr.motdset()

mob/verb/Run()
	set hidden = 1
	if(usr.playing==0)return
	if(usr.shinigami==1)return
	if(usr.slender==1)return
	if(usr.running==0)
		usr.running=1
		usr << "You start running."
	else
		usr.running=0
		usr << "You stop running."

mob/proc/RegenStam()
	if(src.stamina<0)
		src.stamina=0
	if(src.stamina<100)
		src.stamina+=1
		updatesp(src)
mob/proc/Infectionspreader()
	if(src.infspr==1)return
	if(src.zombie==1)
		src.infected=0
		src.infection=0
		return
	if(src.infected==0)return
	src.infection+=1
	src.infspr=1
	spawn(20) src.infspr=0
	if(src.infection>99)
		if(src.playing==0)
			for(var/mob/corpse/M in world)
				if(M.realkey==src.key)
					src.loc=M.loc
					src.playing=1
					src.name=M.alias
					src.density=1
					src.invisibility=0
					src.icon=M.icon
					src.see_invisible=0
					src.see_in_dark=2
					src.hp=20
					src.dead=0
					src.stamina=1
					src.canattack=1
					src.stamina=100
					src.watching=0
					src.AddHud()
					src.updatehp()
					sleep(1)
					sleep(1)
					src.client.verbs+=typesof(/mob/ingame/verb)
					sleep(3)
					src.client.verbs-=typesof(/mob/watcher/verb/)
					sleep(1)
					src.client.verbs-=typesof(/mob/watcher/verb/)
					sleep(1)
					src.client.verbs+=typesof(/mob/ingame/verb)
					src.client.command_text="Say "
					src.suffix=src.key
					alivelist+=src
					deadlist-=M
					src.Zombify()
					src.infection=0
					src.infected=0
					winset(src,"mapper","right=ingame")
					view(src) << "[src] skin becomes pale as he rises from the dead."
					for(var/mob/B in range(7,src))
						if(B.watching==1)
							B << "[src] skin becomes pale as he rises from the dead."
					del M
					return
		else
			src.Zombify()
			src.infection=0
			src.infected=0
turf/DblClick()
	if(usr.playing==1&&usr.ronove==1&&usr.cantel==1)
		if(istype(src,/turf))
			usr.cantel=0
			flick("tele",usr)
			spawn(4)usr.cantel=1
			usr.x=src.x
			usr.y=src.y
			usr.z=src.z
			usr.dir=get_dir(usr,src)

mob/Stat()
	if(usr.client)
		world.name="Pyrce High ([world.cpu]%)"
		if(usr.infectionupdater==1&&usr.infected==1)
			usr.infectionupdater=0
		else
			if(usr.infected==1&&gamemode=="Zombie")
				usr.Infectionspreader()
		if(usr.playing==1)
			if(usr.stamupdater==1)
				usr.stamupdater=0
			else
				usr.stamgain+=1
			if(usr.stamgain>1)
				usr.RegenStam()
				usr.stamgain=0
			usr.ChatBalloon()
			if(usr.glassesoff==1) usr.stamina-=1.2
			statpanel("Statistics")
			stat("Alias Name:",usr.charname)
			if(!usr.isGhost)stat("Real Name:",usr.realname)
			//stat("Alias:",usr.name)
			if(!usr.infection==0)
				stat("Infection spread:","[usr.infection]")
			if(usr.vampire==1)
				stat("Thirst:","[round(usr.thirst)]%")
				if(hours==5)
					usr.thirst+=0.1
				else
					usr.thirst+=(0.1*(hours/5))
				if(usr.thirst==10)
					src << "<i>You are getting a little thirsty.....</i>"
				if(usr.thirst==50)
					src << "<i>You are getting more thirsty as the time passes by, you better get a drink soon.....</i>"
				if(usr.thirst==80)
					src << "<i>You are going to die if you don't drink some blood before too long.</i>"
				if(usr.thirst==90)
					src << "<i>You're so very thirsty for blood.....</i>"
				if(usr.thirst>100)
					usr.hp-=0.5
					if(usr.hp<1)
						usr.vampiredie()
			if(usr.suspect==1&&usr.killer==1)
				stat("Role:","You're the killer and suspect!")
			else if(usr.killer==1)
				stat("Role:","You're the killer!")
			//kira role
			else if(usr.kira==1)
				stat("Role:","You're Kira!")
			else if(usr.suspect==1)
				stat("Role:","You're the suspect!")
			else if(usr.isGhost==1)
				stat("Role:","You're the Ghost.")
			//
			//killer role
			else if(usr.beatrice==1)
				stat("Role","You're the Witch!")
			else if(usr.shinigamieyes==1)
				stat("Role:","You're the Shinigami Eyes!")
			else if(usr.isL==1)
				stat("Role:","You're the Detective!")
			else if(usr.currentrole=="The Doppelganger")
				stat("Role:","You're the Doppelganger!")
			stat("Health:","[usr.hp]%")
			var/HealthStatus="Perfect Condition"
			if(usr.hp<10&&usr.hp>80) HealthStatus="Slightly Hurt."
			if(usr.hp<81&&usr.hp>60) HealthStatus="Damaged."
			if(usr.hp<61&&usr.hp>40) HealthStatus="Need Medical Attention."
			if(usr.hp<41&&usr.hp>20)
				HealthStatus="Deeply Wounded!"
			if(usr.hp<21&&usr.hp>10)
				HealthStatus="You're losing blood! You feel slower."
				usr.move_speed=2
			if(usr.hp<11&&usr.hp>0)
				HealthStatus="DANGER, SEEK MEDICAL ATTENTION! You feel a lot slower."
				usr.move_speed=3
			stat("Stamina:","[usr.stamina]%")
			stat("Health Status:","[HealthStatus]")
			if(usr.currentrole=="The Doppelganger"&&usr.playing==1)
				stat(dg)
			/*if(us.equipname=="Seventh Holy Scripture")
				var/obj/weapons/Q=usr.equipped
				if(Q.transformed==0)
					stat(shs1)
					stat(shs2)
				else
					stat(shs2)*/
			if(usr.currentrole=="Beatrice"&&usr.playing==1)
				stat(hide)
				/*var/obj/weapons/Q=usr.equipped
				if(Q.butterflies==1)
					stat(butterflies)
				if(Q.butterflies==0)
					stat(butterflies2)*/
				stat(butterflies) //Tentative fix to help with removing pipe.
				stat(stake)
				stat(ress)
			//if(usr.equipname=="Witches' Pipe"&&usr.playing==1) Deprecated, powers moved to Witch herself, not the pipe.

			if(usr.vampire==1&&usr.playing==1)
				stat(invisi)
			if(usr.nanaya==1&&usr.playing==1)
				stat(dasher)
		if(usr.looking&&usr.bodysearch==0&&usr.playing==1&&usr.logged==0&&usr.koed==0)
			var/obj/O=usr.looking
			statpanel("[O]",O.contents)
			//stat(O.contents)
		if(usr.looking&&usr.bodysearch==1&&usr.playing==1&&usr.logged==0&&usr.koed==0)
			var/mob/M=usr.looking
			if(M in oview(4))
				if(M.koed==1)
					statpanel("[M]")
					stat(M.contents)
		if(usr.looking&&usr.bodysearch==2&&usr.playing==1&&usr.logged==0&&usr.koed==0)
			var/mob/corpse/M=usr.looking
			for(M in oview(1))
				statpanel("[M]")
				stat(M.contents)
		if(usr.playing==0)
			statpanel("Game Options")
			if(usr.key==world.host&&GameOn==0||usr.client.address == "127.0.0.1"&&GameOn==0)
				stat(options)
			else if(usr.key in Owner)
				stat(options)
			if(autohost==1)
				stat("Autohosting/Delay:","Enabled/[autohostshowdelay] Minutes")
			if(oldmode=="Secret")
				stat("Game Mode:","Secret")
			else
				stat("Game Mode:","[gamemode]")
			if(mapp=="Default"||mapp=="Default 2")
				stat("Map:","[mapp]")
			else
				stat("Map:","[mapp] (Custom Map)")
			stat("Hour Duration:","[hours] Minutes")
			stat("Lethality Level:","[llevel]")
			stat("Item Spawn Rate:","[spawnrate]")
			stat("Attack/Hoard Delay:","[attackdelay]/[hoarddelay]")
			stat("Computer Functionality:","[computeruse]")
			stat("Tapes Functionality:","[tapesfunction]")
			if(GameOn==1&&usr.playing==0&&usr.watching==0&&Resetting==0)
				stat(watch)
			if(GameOn==0)
				stat(helper)
			if(usr.joiner==0&&GameOn==0&&GameOver==0&&Resetting==0)
				stat(join)
			else if(usr.joiner==1&&GameOn==0&&GameOver==0&&Resetting==0)
				stat(join2)
			stat("Players:","[playersjoined]/[maxplayers]")
			if(GameOn==0)
				stat(joinlist)
			if(usr.watching==1&&GameOn==1)
				stat("Game Time: [gamehour]:00 [ampm]","[timeleft] Hours Remaining")
				if(alivelist.len)
					stat("Alive: [alivelist.len]","-----------")
					for(var/mob/M in alivelist)
						stat(M)
				if(zombielist.len)
					stat("Zombies: [zombielist.len]","-----------")
					for(var/mob/M in zombielist)
					//	M.suffix=M.key
						stat(M)
				if(deadlist.len)
					stat("Dead: [deadlist.len]","-----------")
					for(var/mob/corpse/M in world)
					//	M.suffix=M.key
						stat(M)
				if(escapelist.len)
					stat("Escaped: [escapelist.len]","-----------")
					for(var/mob/escaped/M in world)
						stat(M)
				var/watchcount=0
				for(var/mob/M in world)
					if(M.watching==1)
						watchcount+=1
				stat("Watchers: [watchcount]","-----------")
				for(var/mob/M in world)
					if(M.watching==1)
						stat(M)
			if(usr.key==world.host&&GameOn==0||usr.client.address == "127.0.0.1"&&GameOn==0)
				stat(start)
			else if(usr.key in Owner)
				stat(start)
			if(usr.key==world.host&&GameOn==0||usr.client.address == "127.0.0.1"&&GameOn==0)
				stat(motdd)
		if(usr.playing==1&&GameOn==1&&usr.koed==0)
			statpanel("Inventory")
			stat("Weight:","[usr.weight]/20 Grades")
			usr.CheckWeighter()
			for(var/obj/a in usr.contents)
				if(istype(a,/mob))goto no
				stat(a)
				:no
		if(usr.key==world.host&&GameOn==0||usr.client.address == "127.0.0.1")
			statpanel("Host")
			if(autohost==1)
				stat("Auto-Hosting:","On")
			else
				stat("Auto-Hosting:","Off")
			if(autopoll==1)
				stat("Auto-Polling:","On")
			else
				stat("Auto-Polling:","Off")
			stat("Keycard Function:",keycardfunction)
			stat("Allow Multi-keying:",multikey)
			stat("Hoard Limit:",hoardlimit)
			stat(hostmute)
			stat(hostboot)
			stat(hostendgame)
			stat(hostmodifylagger)
			stat(mu1)
			stat(mu2)
			stat(srm)
			if(usr.sub==1)
				stat(hostcolorchange)
	..()
var/list/IPBans=new/list()
var/list/BannedPeople=list("CleaverGirl")
proc
	worldsave()
		var/savefile/World = new("world.sav")
		World["autohost"]<<autohost
		World["WorldStatus"]<<worldstatus
		World["lethality"]<<llevel
		World["spawnrate"]<<spawnrate
		World["motd"]<<motdmessage
		World["BanList"]<<BanList
		World["BanList2"]<<BanList2
		World["rebooting"]<<rebooting
		World["mapp"]<<mapp
		World["gamemode"]<<gamemode
		World["tapes"]<<tapesfunction
		World["ah1"]<<autohostshowdelay
		World["ah2"]<<autohostdelay
		World["hours"]<<hours
		World["gameslepper"]<<gamesleephours
		World["Kirause"]<<kiradisabled
		World["computeruse"]<<computeruse
		World["attackdelay"]<<attackdelay
		World["hoarddelay"]<<hoarddelay
		World["keycard"]<<keycardfunction
		World["autopoll"]<<autopoll
		World["polldelay"]<<polldelay
		World["pollshowdelay"]<<pollshowdelay
		World["multikey"]<<multikey
		World["muted"]<<muted
		World["hoardlimit"]<<hoardlimit
		World["IPBans"]<<IPBans
		World["mutelist"]<<mutelist
		World["fps"]<<world.fps
		World["tickerlag"]<<world.tick_lag
		World["BannedPeople"]<<BannedPeople
		World["RPMode"]<<rpmode
	worldload()
		if(fexists("world.sav"))
			var/savefile/World = new("world.sav")
			World["autohost"]>>autohost
			World["motd"]>>motdmessage
			World["lethality"]>>llevel
			World["polldelay"]>>polldelay
			World["pollshowdelay"]>>pollshowdelay
			World["spawnrate"]>>spawnrate
			World["BanList"]>>BanList
			World["ah1"]>>autohostshowdelay
			World["ah2"]>>autohostdelay
			World["WorldStatus"]>>worldstatus
			World["hoarddelay"]>>hoarddelay
			World["BanList2"]>>BanList2
			World["rebooting"]>>rebooting
			World["mapp"]>>mapp
			World["gamemode"]>>gamemode
			World["tapes"]>>tapesfunction
			World["Kirause"]>>kiradisabled
			World["keycard"]>>keycardfunction
			World["hours"]>>hours
			World["gameslepper"]>>gamesleephours
			World["computeruse"]>>computeruse
			World["attackdelay"]>>attackdelay
			World["autopoll"]>>autopoll
			World["multikey"]>>multikey
			World["muted"]>>muted
			World["hoardlimit"]>>hoardlimit
			World["IPBans"]>>IPBans
			World["BannedPeople"]>>BannedPeople
			World["mutelist"]>>mutelist
			World["fps"]>>world.fps
			World["tickerlag"]>>world.tick_lag
			World["RPMode"]>>rpmode
			if(hoardlimit==null) hoardlimit=0
			var/counter=0
			for(var/a in muted)
				counter+=1
			if(counter==0)
				muted=new/list
			counter=0
			for(var/a in BanList)
				counter+=1
			if(counter==0)
				BanList=new/list()
			counter=0
			for(var/a in BanList2)
				counter+=1
			if(counter==0)
				BanList2=new/list()
			counter=0
			for(var/a in mutelist)
				counter+=1
			if(counter==0)
				mutelist=new/list()
			counter=0

			for(var/a in IPBans)
				counter+=1
			if(counter==0)
				IPBans=new/list()
			counter=0
			for(var/a in BannedPeople)
				counter+=1
			if(counter==0)
				BannedPeople=new/list()
			if(multikey==null)
				multikey="Off"
			if(autopoll==null)
				autopoll=0
			if(gamehoursleep==null)
				gamehoursleep=4200
			if(hours==null)
				hours=7
			if(polldelay==null)
				polldelay=600
			if(pollshowdelay==null)
				pollshowdelay=1
			if(hoardlimit==null)
				hoardlimit="Off"
			if(keycardfunction==null)
				keycardfunction="On"
			if(attackdelay==null)
				attackdelay="Off"
			if(hoarddelay==null)
				hoarddelay="Off"
			if(computeruse==null)
				computeruse="On"
			if(autohostshowdelay==null)
				autohostshowdelay=5
			if(autohostdelay==null)
				autohostdelay=3000
			if(hours==null)
				hours="5 Minutes"
			if(spawnrate==null)
				spawnrate="Normal"
			if(mapp==null)
				mapp="Default"
			if(llevel==null)
				llevel="Normal"
			if(gamemode==null)
				gamemode="Normal"
			if(tapesfunction==null)
				tapesfunction="On"
			if(world.fps==null)
				world.fps=15
			if(world.tick_lag==null)
				world.tick_lag=1
			SpawnRate(spawnrate)
			Lethality(llevel)
			if(mapp=="Default"||mapp=="Default 2")
				goto nomap
			else
				var/id=mapp
				InitializeSwapMaps()
				var/swapmap/M=swapmaps_byname[id]
			:nomap
			motd={"
				<html>
				<title>MOTD</title>
				<body>
				<STYLE>BODY{background-color: black; color:white}</STYLE>
				<table cellpadding="0" cellspacing="0" border="0" align="center">
				<td><p>
				[motdmessage]<p>
				</td>
				</table>
				</body>
				</html>"}
