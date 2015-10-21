var/list/votedusers=new/list()
mob/verb
	votenormal()
		set hidden = 1
		if(usr.key in votedusers)return
		nm+=1
		votedusers+=usr.key
		winshow(usr,"votingsys",0)
	votedoppelganger()
		set hidden = 1
		if(usr.key in votedusers)return
		dgm+=1
		votedusers+=usr.key
		winshow(usr,"votingsys",0)
	votesecret()
		set hidden = 1
		if(usr.key in votedusers)return
		secret+=1
		votedusers+=usr.key
		winshow(usr,"votingsys",0)
	votewitch()
		set hidden = 1
		if(usr.key in votedusers)return
		wm+=1
		votedusers+=usr.key
		winshow(usr,"votingsys",0)
	votezombie()
		set hidden = 1
		if(usr.key in votedusers)return
		zm+=1
		votedusers+=usr.key
		winshow(usr,"votingsys",0)
	voteVampire()
		set hidden = 1
		if(usr.key in votedusers)return
		tsu+=1
		votedusers+=usr.key
		winshow(usr,"votingsys",0)
	votedeathnote()
		set hidden = 1
		if(usr.key in votedusers)return
		dnc+=1 //Temporary fix. Revert to dn+=1 at a later time.
		votedusers+=usr.key
		winshow(usr,"votingsys",0)
	voteghost()
		set hidden = 1
		if(usr.key in votedusers)return
		ghostmode+=1
		votedusers+=usr.key
		winshow(usr,"votingsys",0)
var/leadmode=null
var/leadmode2=null
var/leadmode3=null
proc/GameModePoll()
	if(GameOn==1)return
	world << "<b><small><font color = #330066>Poll Bot</b></font><small>: Poll started, you have exactly [pollshowdelay] seconds to vote."
	for(var/mob/M in world)
		winshow(M,"votingsys",1)
		winset(M,"votingsys","size=256x188")
	spawn(polldelay)GameModePollEnd()
proc/GameModePollEnd()
	if(GameOn==1)
		dnc=0
		dn=0
		ghostmode=0
		wm=0
		sm=0
		nm=0
		zm=0
		tsu=0
		secret=0
		dgm=0
		jm=0
		am=0
		slndr=0
		return
	leadmode="None"
	leadmode2="None"
	leadmode3="None"
	votedusers=new/list()
	for(var/mob/M in world)
		winshow(M,"votingsys",0)
	world << "<b><small><font color = #330066>Poll Bot</b></font><small>: Results:"
	world << "<b><small><font color = #330066>Poll Bot</b></font><small>: Normal had: [nm] votes."
	world << "<b><small><font color = #330066>Poll Bot</b></font><small>: Doppelganger had: [dgm] votes."
	world << "<b><small><font color = #330066>Poll Bot</b></font><small>: Death Note had: [dnc] votes."
	world << "<b><small><font color = #330066>Poll Bot</b></font><small>: Ghost had: [ghostmode] votes."
	world << "<b><small><font color = #330066>Poll Bot</b></font><small>: Secret had: [secret] votes."
	world << "<b><small><font color = #330066>Poll Bot</b></font><small>: Vampire had: [tsu] votes."
	world << "<b><small><font color = #330066>Poll Bot</b></font><small>: Witch had: [wm] votes."
	world << "<b><small><font color = #330066>Poll Bot</b></font><small>: Zombie had: [zm] votes."
	var/weiner=max(dgm,ghostmode,wm,nm,zm,secret,dnc,tsu)
	if(weiner==nm)
		if(leadmode=="None")
			leadmode="Normal"
		else if(leadmode2=="None")
			leadmode2="Normal"
		else
			leadmode3="Normal"
	if(weiner==ghostmode)
		if(leadmode=="None")
			leadmode="Ghost"
		else if(leadmode2=="None")
			leadmode2="Ghost"
		else
			leadmode3="Ghost"
	if(weiner==dgm)
		if(leadmode=="None")
			leadmode="Doppelganger"
		else if(leadmode2=="None")
			leadmode2="Doppelganger"
		else
			leadmode3="Doppelganger"
	if(weiner==dnc)
		if(leadmode=="None")
			leadmode="Death Note Classic" //Formerly "Death Note"
		else if(leadmode2=="None")
			leadmode2="Death Note Classic" //Formerly "Death Note"
		else
			leadmode3="Death Note Classic" //Formerly "Death Note"
	if(weiner==zm)
		if(leadmode=="None")
			leadmode="Zombie"
		else if(leadmode2=="None")
			leadmode2="Zombie"
		else
			leadmode3="Zombie"
	if(weiner==wm)
		if(leadmode=="None")
			leadmode="Witch"
		else if(leadmode2=="None")
			leadmode2="Witch"
		else
			leadmode3="Witch"
	if(weiner==secret)
		if(leadmode=="None")
			leadmode="Secret"
		else if(leadmode2=="None")
			leadmode2="Secret"
		else
			leadmode3="Secret"
	if(weiner==tsu)
		if(leadmode=="None")
			leadmode="Vampire"
		else if(leadmode2=="None")
			leadmode2="Vampire"
		else
			leadmode3="Vampire"
	if(leadmode2=="None")
		world << "<b><small><font color = #330066>Poll Bot</b></font><small>: Game Mode has changed to the winning mode: [leadmode]"
		goto done
	else if(leadmode3=="None")
		world << "<b><small><font color = #330066>Poll Bot</b></font><small>: It was a tie between [leadmode] and [leadmode2]"
		sleep(20)
		var/list/randommode=new/list()
		randommode+=leadmode
		randommode+=leadmode2
		if(leadmode3=="None")
			goto nop
		else
			randommode+=leadmode3
		:nop
		leadmode=pick(randommode)
		world << "<b><small><font color = #330066>Poll Bot</b></font><small>: Game mode has changed to the random winning mode: [leadmode]"
	else if (dnc==0&&dn==0&&ghostmode==0&&wm==0&&sm==0&&nm==0&&zm==0&&tsu==0&&secret==0&&dgm==0&&jm==0&&am==0&&slndr)
		if(leadmode=="None")
			leadmode="Extended"
		else if(leadmode2=="None")
			leadmode2="Extended"
		else
			leadmode3="Extended"
	else if (leadmode=="None"&&leadmode2=="None"&&leadmode3=="None")
		leadmode="Extended"
	else
		world << "<b><small><font color = #330066>Poll Bot</b></font><small>: It was a tie between [leadmode], [leadmode2] and [leadmode3]"
		sleep(20)
		var/list/randommode=new/list()
		randommode+=leadmode
		randommode+=leadmode2
		randommode+=leadmode3
		leadmode=pick(randommode)
		world << "<b><small><font color = #330066>Poll Bot</b></font><small>: Game mode has changed to the random winning mode: [leadmode]"
	:done
	votedusers=new/list()
	gamemode=leadmode
	dnc=0
	dgm=0
	dn=0
	wm=0
	sm=0
	jm=0
	nm=0
	ghostmode=0
	zm=0
	zim=0
	secret=0
	tsu=0
	am=0
	slndr=0
	if(gamemode==null) gamemode="Normal"
	for(var/mob/A in world)
		if(A.ai==0)
			A.GameTitle()