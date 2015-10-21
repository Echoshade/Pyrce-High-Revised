var/list/mutelist=new/list()
mob/verb/.delag()
	set name=".delag"
	winset(usr,null,"command='.configure delay 0'")
	usr << "Network delay set to 0."
mob/verb
	ShiftNorth()
		set hidden = 1
		if(usr.frozen==1)return
		usr.dir=NORTH
	ShiftSouth()
		set hidden = 1
		if(usr.frozen==1)return
		usr.dir=SOUTH
	ShiftWest()
		set hidden = 1
		if(usr.frozen==1)return
		usr.dir=WEST
	ShiftEast()
		set hidden = 1
		if(usr.frozen==1)return
		usr.dir=EAST
mob/verb/viewmotd()
	set hidden = 1
	usr<<browse(motd,"window=Motd;size=320x420;can_close=1;can_resize=1;can_minimize=1")
mob/verb/usepda()
	set hidden = 1
	if(usr.playing==0||usr.shinigami==1||usr.shinigami==1)return
	for(var/obj/Misc/PDA/O in usr)
		if(O in usr)
			if(usr.pdaing==0)
				O.Use()
			else
				winshow(usr,"pdawin",0)
				usr.pdaing=0
		else
			return
client/script = "<STYLE>IMG.icon {width: 13px; height: 13px}</STYLE>"
mob/ingame/verb
	Say(T as text)
		//if(usr.shinigami==1)return
		if(usr.playing==0)return
		if(T=="")return
		if(usr.beatrice==1&&usr.icon_state=="butterfly")return
		if(usr.zombie==1)
			var/rander=rand(1,2)
			if(rander==1)
				range(8,usr) << html_encode("[usr] says, \" Groan... \"")
				return
			else
				range(8,usr) << html_encode("[usr] says, \" Brains....... \"")
				return
		var/len=length(T)
		if(len>500)
			T=copytext(T,1,500)
		T=html_encode(T)
		var/icon/s=GenerateIcon(usr)
		for(var/mob/M in range(8,usr))
			if(M.rpchat==0||M.watching==1)
				M << "\icon[usr.chatavatar][usr] says, \" [T] \""
			//var/icon/s=GenerateIcon(usr)
			_message(M, "\icon[s]<font color=[usr.charhaircolor]>[usr]<font color=[M.rpchatcolor]> says: [T]")
		for(var/mob/N in range(8,usr))
			for(var/mob/B in N.contents)
				if(usr==N)goto nop

				if(B.watching==1) B << "\icon[usr.chatavatar][usr] says, \" [T] \""
				:nop
	Whisper(T as text)
		//if(usr.shinigami==1)return
		if(usr.beatrice==1&&usr.icon_state=="butterfly")return
		if(usr.playing==0)return
		var/len=length(T)
		if(len>500)
			T=copytext(T,1,500)
		T=html_encode(T)
		T=FilterString2(T)
		var/icon/s=GenerateIcon(usr)
		for(var/mob/A in view(4,usr))
			if(A.rpchat==0||A.watching==1)
				A << "\icon[usr.chatavatar][usr] whispers, \" <i>[T]</i> \""
			_message(A, "\icon[s]<i><font color=[usr.charhaircolor]>[usr]<font color=[A.rpchatcolor]> whispers: [T]</i>")
		for(var/mob/N in range(3,usr))
			for(var/mob/B in N.contents)
				if(usr==N)goto nop
				if(B.watching==1) B << "\icon[usr.chatavatar][usr] whispers, \" <i>[T]</i> \""
				:nop
		for(var/mob/A in range(4,usr))
			if(A.playing==0)
				A << "\icon[usr.chatavatar][usr] whispers, \" <i>[T]</i> \""
	Suicide()
		if(usr.playing==0)return
		if(usr.shinigami==1)return
		if(usr.isGhost==1)return
		if(Resetting==1)return
		if(usr.slender==1)
			usr << "Oh come on, you really want to ruin the round for every one else?"
			return
		var/s1=ShowAlert(usr,"Do you really want to kill yourself?",list("Yes","No"))
		if(s1=="Yes")
			if(usr.playing==0)return
			if(Resetting==1)return
			var/s2=ShowAlert(usr,"Are you really sure you want to kill yourself?> You better think about this first before doing soemthing you cannot undo.",list("Yep","No"))
			if(s2=="Yep")
				if(usr.playing==0)return
				if(Resetting==1)return
				var/s4=ShowAlert(usr,"Last chance to change your mind.",list("Kill me!","Nevermind"))
				if(s4=="Kill me!")
					if(usr.playing==0)return
					if(Resetting==1)return
					usr.Suicided("Knife")
				else
					usr << "You have decided to continue living."
	Emote(T as text)
		//if(usr.shinigami==1)return
		if(usr.playing==0)return
		if(usr.beatrice==1&&usr.icon_state=="butterfly")return
		T=html_encode(T)
		T=FilterString2(T)
		var/len=length(T)
		if(len>500)
			T=copytext(T,1,500)

		var/icon/s=GenerateIcon(usr)
		for(var/mob/A in view(8,usr))
			if(A.rpchat==0||A.watching==1)
				A << "\icon[usr.chatavatar]<i>[usr]  [T]</i>"
			_message(A, "\icon[s]<i><font color=[usr.charhaircolor]>[usr]<font color=[A.rpchatcolor]> [T]</i>")
		for(var/mob/N in range(8,usr))
			for(var/mob/B in N.contents)
				if(usr==N)goto nop
				if(B.watching==1)
					B << "\icon[usr.chatavatar]<i>[usr]  [T]</i>"
					//_message(B, "<i><font color=[usr.charhaircolor]>[usr]<font color=white> [T]</i>")
				:nop
		for(var/mob/A in range(8,usr))
			if(A.playing==0)
				A << "\icon[usr.chatavatar]<i>[usr]  [T]</i>"
				//_message(A, "<i><font color=[usr.charhaircolor]>[usr]<font color=white> [T]</i>")
	Shout(T as text)
		//if(usr.shinigami==1)return
		if(usr.playing==0)return
		if(usr.zombie==1)return
		if(usr.slender==1)return
		if(usr.beatrice==1&&usr.icon_state=="butterfly")return
		T=html_encode(T)
		T=FilterString2(T)
		var/len=length(T)
		if(len>500)
			T=copytext(T,1,500)
		var/icon/s=GenerateIcon(usr)
		for(var/mob/A in range(35,usr))
			if(A.rpchat==0||A.watching==1)
				A << "\icon[usr.chatavatar][usr] shouts, <b>\" [T]</b> \""
			_message(A, "\icon[s]<b><font color=[usr.charhaircolor]>[usr]<font color=[A.rpchatcolor]> shouts: [T]<b>")
		for(var/mob/N in range(35,usr))
			for(var/mob/B in N.contents)
				if(usr==N)goto nop
				if(B.watching==1) B << "\icon[usr.chatavatar][usr] shouts: <b>\" [T]</b> \""
				:nop
	Search()
		set src in oview(1)
		if(usr.playing==0)return
		if(usr.shinigami==1)return
		if(usr.isGhost==1)return
		if(usr.slender==1)return
		if(usr.beatrice==1&&usr.icon_state=="butterfly")return
		if(src.Chatting==1)
			usr << "[src] seems to be busy at the momment."
			return
		if(src.dead==0&&src.koed==0)
			var/pp2=CustAlert(src,"[usr] would like to search you, will you let them check through all of your items?",list("Yes","No"),11,0,16,4)
			if(pp2=="Yes")
				usr << "[src]'s items:"
				for(var/obj/O in src)
					if(istype(O,/mob))goto enddd
					usr << O
					:enddd
			else
				usr << "[src] has declined to be searched."
	View_Profile()
		set category=null
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
mob/verb/SaveProf()
	set hidden=1
	if(usr.playing==1)return
	usr.setprofile=winget(usr,"charprof","Text")
	usr.save()
mob/verb
	Shove()
		set name = "Push"
		set src = oview(1)
		if(usr.playing==0)return
		if(src.playing==0)return
		if(usr.isGhost==1)return
		if(usr.beatrice==1&&usr.icon_state=="butterfly")return
		for(src in get_step(usr,usr.dir))
			if(src.watching==0)
				step(src,usr.dir,"Speed=0")
				range(6,usr) << "[usr] shoves the [src]"
		return 0


mob/verb
	reqr()
		set hidden=1
		if(src.playing==0)return
		if(voting==1)
			src << "There is already a request, be patient."
			return
		if(src.shinigami==1)return
		if(usr.isGhost==1)return
		if(src.voted>2)
			src << "You have tried to do this too many times during this game."
			return
		voting=1
		var/yes=1
		var/no=0
		var/people=1
		src.voted+=1
		for(var/mob/M in world)
			if(M==src)goto ender
			if(M.playing==0)goto ender
			if(src.logged==1)goto ender
			people+=1
			var/ss=CustAlert(M,"[src.key] would like to end the game prematurely. Do you wish to accept and end the game now? Everyone must vote yes for it to end",list("Yes","No"),11,0,16,4)
			if(ss=="Yes")
				yes+=1
				src << "[M] has accepted to end the game"
			else
				no+=1
			:ender
		voting=0
		if(no==0)
			world << "<font color=gray>Every one has voted to end the game."
			EndGame()
		else
			src << "There was [yes] votes to end the round and [no] against it, looks like you're gonna have to wait."
mob/proc
	removeyes()
		for(var/image/X as anything in src.client.images)
			src.client.images-=X
		src.client.images=null

mob/proc
	AddHud()
		if(src.client)
		//var/st2=winget(A,"mapper","right")
			winshow(src,"hp",1)
			winshow(src,"hud",1)
			winshow(src,"SP",1)
			winshow(src,"healthnum",1)
			winshow(src,"staminanum",1)
			//winset(A,"worder","right=words")
			//if(st2=="")
			winset(src,"mapper","right=ingame")
			winshow(src,"words",1)
			src.updatehp()
		else return 0
	HideHud()
		if(src.client)
			winshow(src,"hp",0)
			winshow(src,"hud",0)
			winshow(src,"SP",0)
			winshow(src,"healthnum",0)
			winshow(src,"staminanum",0)
			winset(src,"worder","right=null")
			winset(src,"ingame.Slot1","text=\"Slot 1\"")
			winset(src,"ingame.Slot2","text=\"Slot 2\"")
			winset(src,"ingame.Slot3","text=\"Slot 3\"")
			winset(src,"ingame.Slot4","text=\"Slot 4\"")
			winset(src,"ingame.Slot5","text=\"Slot 5\"")
			//if(st2=="ingame")
			winset(src,"mapper","right=")
		else return 0
proc/StaminaRegen()
	for(var/mob/M in world)
		if(M.playing==1&&M.stamina<100)
			M.stamina+=1
/*mob/proc
	updatesp()
		if(src.client)
			if(src.playing==0)return
			var/hper=round(src.stamina/100*100)
			winset(src,"SP","value=[hper]")
			winset(src,"staminanum","text=\"Stamina: [src.stamina]%\"")*/
mob/verb/.seenames()
	set hidden=1
	src.undername()
mob/verb/.seenames2()
	set hidden=1
	for(var/image/X as anything in usr.client.images)
		if(X.icon=='alphabet.dmi')
			usr.client.images-=X
mob/proc
	undername()
		for(var/mob/player/M in view(src))
			if(M.client)
				var/text=lowertext(M.name)
				if(M.playing==1)
					//var/leftspot=round((length(M.realname)/2)*-3.65)
					var/leftspot=round((length(text)/1)*-2.75)
					for(var/i=1,i<=length(text),i++)
						var/obj/N=new/obj/namez
						//N.Blend(color1)
						N.pixel_x=leftspot
						var/thing=-1
						N.pixel_y=thing
						N.icon_state="[copytext(text,i,i+1)]"
						leftspot+=10
						//icon.Blend(M.charhaircolor)
						var/image/I = image(N,M)
						src.client.images += I
			//:ender
mob/proc
	addname()
		for(var/mob/player/M in world)
			if(M.client)
				if(M.shinigami==1)goto ender
				var/text=lowertext(M.realname)
				if(M.playing==1&&M.kira==0)
					//var/leftspot=round((length(M.realname)/2)*-3.65)
					var/leftspot=round((length(text)/1)*-3.65)
					for(var/i=1,i<=length(text),i++)
						var/obj/N=new/obj/name
						//N.Blend(color1)
						N.pixel_x=leftspot
						var/thing=13
						N.pixel_y=thing
						N.icon_state="[copytext(text,i,i+1)]"
						leftspot+=10
						var/image/I = image(N,M)
						src.client.images += I
			:ender
	addnamer()
		var/text=lowertext(src.realname)
		if(src.playing==1&&src.kira==0&&src.client)
			//var/leftspot=round((length(M.realname)/2)*-3.65)
			var/leftspot=round((length(text)/1)*-3.65)
			for(var/i=1,i<=length(text),i++)
				var/obj/N=new/obj/name
				//N.Blend(color1)
				N.pixel_x=leftspot
				var/thing=13
				N.pixel_y=thing
				N.icon_state="[copytext(text,i,i+1)]"
				leftspot+=10
				var/image/I = image(N,src)
				src.client.images += I
mob/verb
	changesay()
		set hidden = 1
		if(usr.playing==0)return
		if(usr.shinigami==1)return
		if(usr.isGhost==1)return
		usr.client.command_text="Say "
	changeemote()
		set hidden = 1
		if(usr.playing==0)return
		if(usr.shinigami==1)return
		if(usr.isGhost==1)return
		usr.client.command_text="Emote "
	changeshout()
		set hidden = 1
		if(usr.playing==0)return
		if(usr.shinigami==1)return
		if(usr.isGhost==1)return
		usr.client.command_text="Shout "
	changewhisper()
		set hidden = 1
		if(usr.playing==0)return
		if(usr.shinigami==1)return
		if(usr.isGhost==1)return
		usr.client.command_text="Whisper "
	changewatcher()
		set hidden = 1
		usr.client.command_text="Watcher "
	changechatter()
		set hidden = 1
		usr.client.command_text="Chat "
	padbutton1()
		set hidden = 1
		usr << output("1","padout")
		if(usr.numberhold=="none")
			usr.numberhold=1
		else if(!usr.numberhold=="none"||usr.numberhold2=="none")
			usr.numberhold2=1
		else
			usr.numberhold3=1
			usr.padenter()
			usr.numberhold="none"
			usr.numberhold2="none"
			usr.numberhold3="none"
	padbutton2()
		set hidden = 1
		usr << output("2","padout")
		if(usr.numberhold=="none")
			usr.numberhold=2
		else if(!usr.numberhold=="none"||usr.numberhold2=="none")
			usr.numberhold2=2
		else
			usr.numberhold3=2
			usr.padenter()
			usr.numberhold="none"
			usr.numberhold2="none"
			usr.numberhold3="none"
	padbutton3()
		set hidden = 1
		usr << output("3","padout")
		if(usr.numberhold=="none")
			usr.numberhold=3
		else if(!usr.numberhold=="none"||usr.numberhold2=="none")
			usr.numberhold2=3
		else
			usr.numberhold3=3
			usr.padenter()
			usr.numberhold="none"
			usr.numberhold2="none"
			usr.numberhold3="none"
	padbutton4()
		set hidden = 1
		usr << output("4","padout")
		if(usr.numberhold=="none")
			usr.numberhold=4
		else if(!usr.numberhold=="none"||usr.numberhold2=="none")
			usr.numberhold2=4
		else
			usr.numberhold3=4
			usr.padenter()
			usr.numberhold="none"
			usr.numberhold2="none"
			usr.numberhold3="none"
	padbutton5()
		set hidden = 1
		usr << output("5","padout")
		if(usr.numberhold=="none")
			usr.numberhold=5
		else if(!usr.numberhold=="none"||usr.numberhold2=="none")
			usr.numberhold2=5
		else
			usr.numberhold3=5
			usr.padenter()
			usr.numberhold="none"
			usr.numberhold2="none"
			usr.numberhold3="none"
	padbutton6()
		set hidden = 1
		usr << output("6","padout")
		if(usr.numberhold=="none")
			usr.numberhold=6
		else if(!usr.numberhold=="none"||usr.numberhold2=="none")
			usr.numberhold2=6
		else
			usr.numberhold3=6
			usr.padenter()
			usr.numberhold="none"
			usr.numberhold2="none"
			usr.numberhold3="none"
	padbutton7()
		set hidden = 1
		usr << output("7","padout")
		if(usr.numberhold=="none")
			usr.numberhold=7
		else if(!usr.numberhold=="none"||usr.numberhold2=="none")
			usr.numberhold2=7
		else
			usr.numberhold3=7
			usr.padenter()
			usr.numberhold="none"
			usr.numberhold2="none"
			usr.numberhold3="none"
	padbutton8()
		set hidden = 1
		usr << output("8","padout")
		if(usr.numberhold=="none")
			usr.numberhold=8
		else if(!usr.numberhold=="none"||usr.numberhold2=="none")
			usr.numberhold2=8
		else
			usr.numberhold3=8
			usr.padenter()
			usr.numberhold="none"
			usr.numberhold2="none"
			usr.numberhold3="none"
	padbutton9()
		set hidden = 1
		usr << output("9","padout")
		if(usr.numberhold=="none")
			usr.numberhold=9
		else if(!usr.numberhold=="none"||usr.numberhold2=="none")
			usr.numberhold2=9
		else
			usr.numberhold3=9
			usr.padenter()
			usr.numberhold="none"
			usr.numberhold2="none"
			usr.numberhold3="none"
	padenter()
		set hidden = 1
		usr << output(null,"padout")
		var/numbers="[usr.numberhold][usr.numberhold2][usr.numberhold3]"
		var/coder="[doornumber]"
		if(numbers==coder)
			usr << output("You have entered the correct password.","padout")
			for(var/obj/Door/Strong_Door/O in view(3))
				O.open=1
				O.icon_state="open strong door"
				O.density=0
				O.pixel_x-=30
				O.opacity=0
			usr.padding=0
			usr.numberhold=0
			usr << output(null,"padout")
			winshow(usr,"keypad",0)
			usr.numberhold=0
		else
			usr << output("Access denied.","padout")
			usr.numberhold=0
	CheckTime()
		set hidden = 1
		if(usr.playing==0)return
		if(usr.shinigami==1)return
		usr << output("The time is: [gamehour]:00 [ampm]", "pdaout")
	Textbutton()
		set hidden=1
		winset(usr,"paner","left=")
	Infobutton()
		set hidden=1
		winset(usr,"paner","left=infoer")
	browsehelp()
		set hidden=1
		winset(usr,"paner","left=browserpane")
		browse_link("http://pyrcehigh.wikidot.com/",usr)
	TurnPage()
		set hidden = 1
		winshow(usr,"dnpage",1)
		usr << output(null,"dnpage")
		soundmob(usr, 10, 'page_turn_1.ogg', TRUE)
		for(var/obj/Misc/Death_Note/O in usr)
			usr << output(O.names,"dnpage")
		winshow(usr,"writename",1)
	BackPage()
		set hidden = 1
		winshow(usr,"dnpage",0)
		soundmob(usr, 10, 'page_turn_1.ogg', TRUE)
	stopmusic()
		set hidden = 1
		usr << sound(null)
		usr << "Music stopped"
		usr.playi=null
	Chat(T as text)
		//set name="Chat:"
		if(usr.key in mutelist)
			usr << "You're muted, sorry."
			return
		if(hushchat==1)
			if(usr.key in Owner)
				goto talker
			else if(usr.key in GM)
				goto talker
			else
				usr << "World chat is currently disabled."
				return
		:talker
		if(T=="")return
		var/len=length(T)
//			return
		T=html_encode(T)
		T=FilterString2(T)
		if("\n" in T)
			return
		if(len>450)
			T=copytext(T,1,450)
		if(usr.key in Owner)
			for(var/mob/M in world)
				M << "\<\icon[adminicon]<b><font color=[usr.chatcolor]>[usr.key]</font></b>><font color=[usr.chattercolor]> [T]"
			usr.CheckCommand(T)
			if(connectiontootherworld==1)
				T=html_decode(T)
				world.Export("[connectedtoworld]?action=chatterworld&person=[usr.key]&msg=[T]&chattype=all")
		else if(usr.key in GM)
			for(var/mob/M in world)
				M << "\<\icon[adminicon]<b><font color=[usr.chatcolor]>[usr.key]</font></b>><font color=[usr.chattercolor]> [T]"
			usr.CheckCommand(T)
			if(connectiontootherworld==1)
				T=html_decode(T)
				world.Export("[connectedtoworld]?action=chatterworld&person=[usr.key]&msg=[T]&chattype=all")
		else
			for(var/mob/M in world)
				M << "\<<b><font color=[usr.chatcolor]>[usr.key]</font></b>><font color=[usr.chattercolor]> [T]"
			if(connectiontootherworld==1)
				T=html_decode(T)
				world.Export("[connectedtoworld]?action=chatterworld&person=[usr.key]&msg=[T]&chattype=all")
	HosterOption()
		set hidden = 1
		if(GameOn==1)return
		var/opt=input(usr,"Wish option do you wish to change?") in list("Game Mode","Options","Cancel")
		if(opt=="Options")
			var/pp4=input(usr,"Pick an option to change.") in list("Autohost/Poll configuration","Change Map","Change Game Hours","Set Maximum Players","Lethality","Item Spawn Rate","Attack/Hoard Delays","Functions","Change School Uniform","Cancel") //list("Change School Uniform","Autohost","Autohost Wait Time","Change Map","Set Maximum Players","Auto Game Mode Poll","Poll Delay","Change Game Hours","Item Spawn Rate","Lethality","Functions","Cancel")
			if(pp4=="Change School Uniform")
				var/ppb=input(usr,"Which color do you want to use?") in list("Default","Red")
				if(ppb=="Red")
					uniform=1
				else
					uniform=0
			if(pp4=="Attack/Hoard Delays")
				var/pp8=input(usr,"Which one do you wish to configure?") in list("Attack Delay","Hoard Delay","Cancel")
				if(pp8=="Attack Delay")
					var/pp9=input(usr,"Which delay do you wish to use, note this only prevents them from attacking.") in list("Off","5 Minutes","10 Minutes","15 Minutes")
					attackdelay=pp9
				if(pp8=="Hoard Delay")
					var/pp9=input(usr,"Which delay do you wish to use, note this only prevents them from hoarding items/looking into stuff the whole time this is on.") in list("Off","5 Minutes","10 Minutes","15 Minutes")
					hoarddelay=pp9
			if(pp4=="Autohost/Poll configuration")
				var/pp77=input(usr,"Which do you wish to configure?") in list("Autohost","Autohost Wait Time","Auto Poll","Poll Delay","Cancel")
				if(pp77=="Autohost Wait Time")
					:tryagain
					var/pp5=input(usr,"Which delay do you wish to use for autohost to kick in? Input the minutes!","") as num
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
					AutoHoster(autohostcount)
				else if(pp77=="Autohost")
					if(autohost==0)
						var/pp6=input(usr,"Would you like to enable autohosting?") in list("Yes","No")
						if(pp6=="Yes")
							autohost=1
							world << "<b><font color=aqua>[lightbot]</b> Autohosting has been enabled."
							worldsave()
							updateworld()
							autohostcount+=1
							AutoHostStart(autohostcount)
					else
						var/pp7=input(usr,"Would you like to disable autohosting?") in list("Yes","No")
						if(pp7=="Yes")
							autohost=0
							worldsave()
							world << "<b><font color=aqua>[lightbot]</b> Autohosting has been disabled."
							updateworld()
							autohostcount+=1
				else if(pp77=="Poll Delay")
					:tryagain
					var/pp5=input(usr,"Delay of the poll? Input the SECONDS.","") as num
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
					worldsave()
				else if(pp77=="Auto Poll")
					var/pp5=input(usr,"Do you want to use auto-polling? This can go with Auto Hosting as well!") in list("Yes","No")
					if(pp5=="Yes")
						autopoll=1
						world << "<b><small><font color = #330066>Poll Bot</b></font><small>: Auto polling for the game mode will begin before each round."
						GameModePoll()
						return
					else
						autopoll=0
						world << "<b><small><font color = #330066>Poll Bot</b></font><small>: Auto polling disabled."
						for(var/mob/M in world)
							winshow(M,"voting",0)
						return
			if(pp4=="Change Game Hours")
				//var/pp5=input(usr,"Which game hour setting do you wish to use?") in list("3 Minute Hours","5 Minute Hours","7 Minute Hours","10 Minute Hours","15 Minute Hours","30 Minute Hours","1 Real Hour")
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
				/*if(pp5=="3 Minute Hours")
					hours="3 Minutes"
				if(pp5=="5 Minute Hours")
					hours="5 Minutes"
				else if(pp5=="7 Minute Hours")
					hours="7 Minutes"
				else if(pp5=="10 Minute Hours")
					hours="10 Minutes"
				else if(pp5=="15 Minute Hours")
					hours="15 Minutes"
				else if(pp5=="30 Minute Hours")
					hours="30 Minutes"
				else if(pp5=="1 Real Hour")
					hours="1 Hour"*/
			else if(pp4=="Lethality")
				var/pp=input(usr,"Which lethality level do you wish to use?") in list("One Hit One Kill","Very High","High","Above Normal","Normal","Low","Very Low")
				Lethality(pp)
				llevel=pp
			else if(pp4=="Item Spawn Rate")
				var/pp=input(usr,"Which item spawn rate do you wish to use?") in list("Very High","High","Normal","Low","Very Low","None")
				SpawnRate(pp)
				spawnrate=pp
			else if(pp4=="Set Maximum Players")
				var/nums=input(usr,"Select the player cap from 4-22") as num
				if(nums<4)
					usr << "Too low."
					return
				else if(nums>99)
					usr << "Woah man, I don't think this server can handle it."
					return
				else
					joinlist=new
					for(var/mob/M in world)
						if(M.joiner==1)
							M.joined=0
							M.joiner=0
					maleslot=0
					femaleslot=0
					playersjoined=0
					maxplayers=nums
					world << "<b><font color=aqua>[lightbot]</b> Maximum player slots moved to [nums]"
			else if(pp4=="Functions")
				var/pp8=input(usr,"Which functions would you like to adjust?") in list("Enable/Disable Computer","Tapes Function On/Off","Key Card Function On/Off","Multikey Function","Cancel")
				//if(pp5=="Enable/Disable Computer")
				if(pp8=="Tapes Function On/Off")
					var/pp5=ShowAlert(usr,"Do you want to enable or disable the tapes?",list("Enable","Disable"))
					if(pp5=="Enable")
						tapesfunction="On"
						usr << "Enabled key card usage"
					else
						tapesfunction="Off"
						usr << "Disabled key card usage"
				if(pp8=="Key Card Function On/Off")
					var/pp5=ShowAlert(usr,"Do you want to enable or disable the escape door? < Remember, these settings save, you have to toggle this hidden option back on or off later if you want to use/not use it.",list("Enable","Disable"))
					if(pp5=="Enable")
						keycardfunction="On"
						usr << "Key Cards will now function properly!"
					else
						keycardfunction="Off"
						usr << "Key Cards will no longer function."
				if(pp8=="Enable/Disable Vents")
					var/pp5=ShowAlert(usr,"Do you want to enable or disable the vents?",list("Enable","Disable"))
					if(pp5=="Enable")
						for(var/turf/VoidWallsFake/I in world)
							I.density=0
						vents="On"
					else if(pp5=="Disable")
						for(var/turf/VoidWallsFake/I in world)
							I.density=1
						vents="Off"
				if(pp8=="Enable/Disable Computer")
					var/pp5=ShowAlert(usr,"Do you want to enable or disable the computer?",list("Enable","Disable"))
					if(pp5=="Enable")
						computeruse="On"
					else
						computeruse="Off"
				if(pp8=="Multikey Function")
					var/pp5=ShowAlert(usr,"Enabling allows multi-keying, disabling turns it off. < Remember, anyone saying their 'sibling' needs to play is lying, this setting doesnt go by internet address but something else.",list("Enable","Disable"))
					if(pp5=="Enable")
						multikey="On"
						usr << "Multikeying enabled."
					else
						multikey="Off"
						usr << "Multikeying disabled."
		if(opt=="Game Mode")
			if(GameOn==1)return
			var/pp=input(usr,"Please choose a desired mode you wish to use.") in list("Normal","Death Note","Doppelganger","Secret","Vampire","Witch","Zombie", "Death Note Classic", "Extended")// "Slender")
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
obj/name
	icon='shinigamieyeletters.dmi'
	icon_state=""
	layer=MOB_LAYER+100
	pixel_y=-13
	Click()
		return
obj/namez
	icon='alphabet.dmi'
	icon_state=""
	layer=MOB_LAYER+100
	pixel_y=-13
	Click()
		return
obj/chatbub
	icon='bubbles.dmi'
	icon_state="talk"
	layer=MOB_LAYER
	pixel_y=23
	pixel_x=15
var/dn=0
var/nm=0
var/dnc=0
var/sm=0
var/wm=0
var/zm=0
var/ghostmode=0
var/zim=0
var/am=0
var/secret=0
var/jm=0
var/tsu=0
var/dgm=0
var/slndr=0
var
	poller={"
		<html>
		<title>
		Polling System
		</title>
		<body>
		<STYLE>BODY{background: url("http://i389.photobucket.com/albums/oo337/babidibabidiboo/mysp/bloody.jpg");background-color: black; color:white}</STYLE><font size="+1">
		<center><font color=black>Vote for the mode you would like to use.<font color=white></center>
		<BR>
		<center><A HREF=?votenormal><font color=red>Normal</font></A> - <A HREF=?votejm><font color=red>Judgement</A></center><BR><BR>
		<center><A HREF=?votesecret><font color=red>Secret</A></font> - <A HREF=?votedgm><font color=red>Doppelganger</A></center><BR>
		<center><A HREF=?votezombie><font color=red>Zombie</font></A> - <A HREF=?votewitch><font color=red>Witch</A></center><BR>
		</body>
		</html>
		"}


mob/player
	Click()
		if(usr.playing==0)return
		if(attackdelayer==1)return
		if(usr==src&&usr.noclickself==1)return
		if(usr.beatrice==1&&usr.icon_state=="butterfly")return
		//if(usr==src)return
		if(usr.shinigami==1)return
		if(usr.isGhost==1)return
		if(src.isGhost==1)return
		if(src.shinigami==1)return
		if(usr.zombie&&src.zombie==1)return
		if(usr.canattack==0)return
		if(usr.slender==1)return
		var/obj/N=usr.equipped
		/*if(usr.superpower=="Stigma"&&src.Stigma==0)
			var/randd=rand(1,5)
			if(randd==1)
				src.Stigma=1
				src << "Your wounds seem to be worsening after periods of time..."*/
		if(usr.zombie==1)
			if(src in oview(1))
				ZombieAttack(usr,src)
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
	Attackdelayer(mob/A,obj/O)
		var/dly=20
		A.canattack=0
		if(O.type==/obj/weapons/Bokken)
			dly=26
		if(O.type==/obj/weapons/Ladel)
			dly=26
		if(O.type==/obj/weapons/Taser)
			if(O.name=="Dead Taser")
				dly=26
			else
				dly=15
		/*if(O.type==/obj/weapons/Red_Paint)
			if(O.name=="Empty Paint")
				dly=26
			else
				dly=12
		if(O.type==/obj/weapons/Blue_Paint)
			if(O.name=="Empty Paint")
				dly=26
			else
				dly=12*/
		if(O.type==/obj/weapons/Green_Paint)
			if(O.name=="Empty Paint")
				dly=26
			else
				dly=12
		if(O.type==/obj/weapons/Wooden_Bat)
			dly=18
		if(O.type==/obj/weapons/Fists)
			if(A.vampire==1)
				dly=26
			else
				dly=16
		if(O.type==/obj/weapons/Ladel)
			dly=26
		if(O.type==/obj/weapons/Metal_Bat)
			dly=18
		if(O.type==/obj/weapons/Hammer)
			dly=17
		if(O.type==/obj/weapons/Billhook)
			dly=26
		if(O.type==/obj/weapons/Axe)
			dly=26
		if(O.type==/obj/weapons/Alondite)
			dly=26
		if(O.type==/obj/weapons/Metal_Pipe)
			dly=25
		if(O.type==/obj/weapons/NanatsuYoru)
			dly=32
		if(O.type==/obj/weapons/Nailed_Bat)
			dly=27
		if(O.type==/obj/weapons/Knife)
			dly=17
		if(O.type==/obj/weapons/Custom_Weapon)
			var/obj/M=A.equipped
			dly=M.delaytake
		spawn(dly)
			A.canattack=1
mob
	verb
		Hotkey1()
			set hidden = 1
			if(usr.slot1==null)return
			if(usr.playing==0)return
			//usr.hotkeyuse=usr.slot1
			var/obj/O=usr.slot1
			if(O in usr)
				if(istype(O,/obj/Misc/Black_Feather))
					var/obj/Misc/Black_Feather/N=O
					N.Use()
					winset(usr,"ingame.Slot1","text=\"Slot 1\"")
				else
					HotkeyEquip(usr,O)
			else
				usr.slot1=null
		Hotkey2()
			set hidden = 1
			if(usr.slot2==null)return
			if(usr.playing==0)return
			//usr.hotkeyuse=usr.slot1
			var/obj/O=usr.slot2
			if(O in usr)
				if(istype(O,/obj/Misc/Black_Feather))
					var/obj/Misc/Black_Feather/N=O
					N.Use()
					winset(usr,"ingame.Slot2","text=\"Slot 2\"")
				else
					HotkeyEquip(usr,O)
			else
				usr.slot2=null
		Hotkey3()
			set hidden = 1
			if(usr.slot3==null)return
			if(usr.playing==0)return
			//usr.hotkeyuse=usr.slot1
			var/obj/O=usr.slot3
			if(O in usr)
				if(istype(O,/obj/Misc/Black_Feather))
					var/obj/Misc/Black_Feather/N=O
					N.Use()
					winset(usr,"ingame.Slot3","text=\"Slot 3\"")
				else
					HotkeyEquip(usr,O)
			else
				usr.slot3=null
		Hotkey4()
			set hidden = 1
			if(usr.slot4==null)return
			if(usr.playing==0)return
			//usr.hotkeyuse=usr.slot1
			var/obj/O=usr.slot4
			if(O in usr)
				if(istype(O,/obj/Misc/Black_Feather))
					var/obj/Misc/Black_Feather/N=O
					N.Use()
					winset(usr,"ingame.Slot4","text=\"Slot 4\"")
				else
					HotkeyEquip(usr,O)
			else
				usr.slot4=null
		Hotkey5()
			set hidden = 1
			if(usr.slot5==null)return
			if(usr.playing==0)return
			//usr.hotkeyuse=usr.slot1
			var/obj/O=usr.slot5
			if(O in usr)
				if(istype(O,/obj/Misc/Black_Feather))
					var/obj/Misc/Black_Feather/N=O
					N.Use()
					winset(usr,"ingame.Slot5","text=\"Slot 5\"")
				else
					HotkeyEquip(usr,O)
			else
				usr.slot5=null
mob/verb/.showabout()
	set hidden = 1
	winshow(usr,"about",1)
mob/verb/.showforums()
	set hidden = 1
	var/url2="http://pyrcehigh.crazy4us.com/"
	winshow(usr,"wbrowse",1)
	usr << browse(\
"<html><head></head><body onLoad=\"parent.location='[url2]'\">\
</body></html>","window=webbrowse")
mob/var/list/ignorelist=new/list()
mob/verb
	.AddIgnore()
		set hidden = 1
		var/list/ppl=new/list()
		if(usr.ignorelist==null)usr.ignorelist=new/list()
		for(var/mob/M in world)
			if(M.client)
				ppl+="[M.key]"
		ppl+="Cancel"
		ppl-=usr.key
		var/chs=input(usr,"Who do you wish to ignore?","Ignore someone.") in ppl
		//if(chs in usr.ignorelist)return
		if(chs in Owner)
			usr << "You cannot ignore Admins."
			return
		if(chs in GM)
			usr << "You cannot ignore GMs."
			return
		if(chs=="Cancel")return
		usr.ignorelist+=chs
		usr.UpdateIL()
		alert(usr,"[chs] was added to your ignore list.")
	.RemIgnore()
		set hidden = 1
		var/list/ppl=new/list()
		if(usr.ignorelist==null)usr.ignorelist=new/list()
		for(var/M in usr.ignorelist)
			ppl+=M
		ppl+="Cancel"
		var/chs=input(usr,"Who do you wish to unignore?","Unignore someone.") in ppl
		if(chs=="Cancel")return
		usr.ignorelist-=chs
		usr.UpdateIL()
		alert(usr,"[chs] was removed from your ignore list.")
mob/proc/UpdateIL()
	winset(src, "ignorelist", "cells=1x[src.ignorelist.len+1]" )
	var/i=1
	src << output(null, "ignorelisted" )
	winset(src,"ignorelisted","cells=0" )
	for( var/s=1 to src.ignorelist.len )
		var/k = src.ignorelist[s]
		src << output( "[k]", "ignorelisted:1,[++i]" )
mob/verb/DisableMusic()
	set hidden=1
	if(winget(usr,"musicmuter","is-checked")=="true")
		usr.mutemusic=1
	else
		usr.mutemusic=0
	usr.save()
mob/verb/DisableSFX()
	set hidden=1
	if(winget(usr,"sfxmuter","is-checked")=="true")
		usr.mutesfx=1
	else
		usr.mutesfx=0
	usr.save()
mob/verb/remtabs()
	set hidden=1
	if(winget(usr,"remtabs","is-checked")=="true")
		usr.showlists=0
		winset(usr,"thepanes.paner","right=outputpane")
	else
		usr.showlists=1
		winset(usr,"thepanes.paner","right=chatterpane")
	usr.save()
mob/verb/rpchattoggle()
	set hidden=1
	if(winget(usr,"rpchatcheck","is-checked")=="false")
		usr.rpchat=0
		usr.hide_chatbox()

	else
		usr.rpchat=1
		if(usr.playing==1)usr.new_chatbox()
	usr.save()
mob/verb/CustCombatColor()
	set hidden=1
	var/ff=input(usr,"Pick a color.")as color

	var/fu=winget(usr,"fightu","is-checked")
	var/fb=winget(usr,"fightb","is-checked")
	usr.fightfont="<font color=[ff]>"
	if(fb=="true")
		usr.fightfont+="<b>"
	if(fu=="true")
		usr.fightfont+="<u>"
	usr.save()
mob/verb/DefaultCombatColor()
	set hidden=1
	usr.fightfont="<font color=#ff8080>"
	var/fu=winget(usr,"fightu","is-checked")
	var/fb=winget(usr,"fightb","is-checked")
	if(fb=="true")
		usr.fightfont+="<b>"
	if(fu=="true")
		usr.fightfont+="<u>"
	usr.save()
mob/verb
	ChangeChatColor()
		set hidden = 1
		usr.rpchatcolor=input("Pick a color you wish to use.","",usr.rpchatcolor)as color
		usr.save()
	ChangeBoxSize()
		set hidden = 1
		var/wd=input(usr,"This will make the box wider or smaller.","",usr.rpboxwidth)as num
		if(wd<5)
			usr << "That's just too small..."
			return
		if(wd>30)
			usr << "That's just too big..."
			return
		usr.rpboxwidth=wd
		//var/tmp/chatbox/_chatbox
		for(var/gui in typesof(/chatbox_gui))
			switch(gui)
				if(/chatbox_gui)
					for(var/chatbox/I in usr.client.screen)
						I.maptext_width=wd*28
					for(var/chatbox_gui/G in usr.client.screen)
						if(G.type==/chatbox_gui/background)
							G.screen_loc="2:16,1:16 to [usr.rpboxwidth]:15,4"
						if(G.type==/chatbox_gui/start)
							G.screen_loc="[usr.rpboxwidth]+1:16,5"
						if(G.type==/chatbox_gui/up)
							G.screen_loc="[usr.rpboxwidth]+1:16,4:16"
						if(G.type==/chatbox_gui/down)
							G.screen_loc="[usr.rpboxwidth]+1:16,2"
						if(G.type==/chatbox_gui/end)
							G.screen_loc="[usr.rpboxwidth]+1:16,1:16"
		usr.save()
/*mob/proc/Updategrid()
	fuses= new/list()
	for(var/obj/Switch_For_Lights/A in world)
		fuses+="[A.tag]"
	winset(src, "fboxgrid", "cells=2x[fuses.len+1]" )
	var/i=1
	for( var/s=1 to ig.len )
		var/k = ig[s]
		src << output( "[k]", "fboxgrid:1,[++i]" )
	for(var/obj/Switch_For_Lights/A in world)
	for( var/s=1 to fuses.len )
		var/k = fuses[s]
		src << output( "<a href='?src=\ref[src];fuse=[url_encode(k)]'>[k]</a>", "fboxgrid:1,[++i]" )
		for(var/obj/Switch_For_Lights/O in world)
			if(O.tag==k)
				src << output( "[O.power]", "fboxgrid:1,[++i]" )
				break*/