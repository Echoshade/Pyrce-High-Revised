mob/premium/verb
	Change_Icon(f as file)
		set category = "Special"
		if(usr.playing==1)return
		if(usr.cooltime==1)
			usr << "Please wait before preforming this action again."
			return
		if(GameOn==0)return
		var/list/staters=new/list()
		staters+="Default"
		for(var/b in icon_states(f))
			staters+=b

		var/state=input(usr,"Please choose an icon state") in staters
		var/icon/I = icon(f, state)
		var/Hi=I.Height()
		var/Wid=I.Width()
		if(Hi>42)
			usr << "The icon may only be 42x42."
			return
		if(Wid>42)
			usr << "The icon may only be 42x42."
			return
		usr.cooltime=1
		spawn(20)
			usr.cooltime=0
		if(usr.playing==1)return
		usr.icon=I
	Add_Overlay(f as file)
		set category = "Special"
		if(usr.playing==1)return
		if(GameOn==0)return
		var/list/staters=new/list()
		staters+="Default"
		for(var/b in icon_states(f))
			staters+=b
		var/state=input(usr,"Please choose an icon state") in staters
		var/icon/I = icon(f, state)
		var/Hi=I.Height()
		var/Wid=I.Width()
		if(Hi>42)
			usr << "The icon may only be 42x42."
			return
		if(Wid>42)
			usr << "The icon may only be 42x42."
			return
		//var/mob/M=input(usr,"Pick a player in the world, this verb isn't meant for abusing, though.") in world
		usr.overlays+=f
	Remove_Overlays()
		set name = "Remove Overlays"
		set category = "Special"
		if(GameOn==0)return
		if(usr.playing==1)return
		usr.overlays=null
	Name_Color()
		set category = "Special"
		usr.chatcolor=input(usr,"Choose a color to use.")as color
		usr << "<font color=[usr.chatcolor]>Your name color has changed to this."
		usr.save()
mob/proc
	HostColorChange()
		set category = null
		if(src.cooltime==1)
			usr << "Please wait at least one minute between changing color."
			return
		//var/list/nocolor = list( "#000000", "font size", "font face", "ttfenglish size", "mini", "body bgcolor" )
		var/color=input(src,"What color, don't forget include the # and use HTML color charts if you want to find a specific color.")
		var/blah=FilterString(color)
		if(blah==color) goto next
		else
			usr << "You're not allowed to do this."
			return
		:next
		var/len=length(color)
		if(len>7)
			usr << "You're not allowed to do this."
			return
		hostedcolor="[color]"
		src.cooltime=1
		spawn(60)
			src.cooltime=0
		src << "<font color=[src.chatcolor]>World State color on the hub will appear in this color."
		worldsave()
var/list/namedlist=new/list()
var/list/namedlist2=new/list()
var/list/corpsed=list("'s Corpse")
var/list/bloodlist=list("Bloody")
var/list/CurseWords=list("#000000", "font size", "font face", "ttfenglish size", "mini", "body bgcolor"," ","<",">")
var/list/DNTimes=list("","1:00 AM","1:00 PM","2:00 PM","2:00 AM","3:00 AM","3:00 PM","4:00 PM","4:00 AM","5:00 AM","5:00 PM","6:00 PM","6:00 AM","7:00 PM","7:00 AM","8:00 PM","8:00 AM","9:00 PM","9:00 AM","10:00 PM","10:00 AM","11:00 PM","11:00 AM","12:00 PM","12:00 AM")
var/list/nocolor = list( "#000000", "font size", "font face", "ttfenglish size", "mini", "body bgcolor" )
var/list/emotez = list(":)", "lol")
var/list/noword=list("\n")
proc
	FilterString2(msg as text)
	{
		var/i
		var/pos
		var/CurseLen
		if(noword.len)
			for(i = 1,i < noword.len + 1,i++)
				pos = findtext(msg,noword[i])
				while(pos)
					CurseLen = length(noword[i])
					msg = copytext(msg,1,pos) + GenSymbols(CurseLen) + copytext(msg,pos+CurseLen,0)
					pos = findtext(msg,noword[i])
		return msg
	}
	emotefilter(msg as text)
	{
		var/i
		var/pos
		var/CurseLen
		if(emotez.len)
			for(i = 1,i < emotez.len + 1,i++)
				pos = findtext(msg,emotez[i])
				while(pos)
					CurseLen = length(emotez[i])
					msg = copytext(msg,1,pos) + GenSymbols2(CurseLen) + copytext(msg,pos+CurseLen,0)
					pos = findtext(msg,emotez[i])
					//if(msg==":)") world << "Lol"
		return msg
	}
	FilterString(msg as text)
	{
		var/i
		var/pos
		var/CurseLen
		if(CurseWords.len)
			for(i = 1,i < CurseWords.len + 1,i++)
				pos = findtext(msg,CurseWords[i])
				while(pos)
					CurseLen = length(CurseWords[i])
					msg = copytext(msg,1,pos) + GenSymbols(CurseLen) + copytext(msg,pos+CurseLen,0)
					pos = findtext(msg,CurseWords[i])
		return msg
	}
	Filternames(msg as text, mob/A)
	{
		var/i
		var/pos
		var/CurseLen
		if(namedlist.len)
			for(i = 1,i < namedlist.len + 1,i++)
				pos = findtext(msg,namedlist[i])
				while(pos)
					CurseLen = length(namedlist[i])
					msg = copytext(msg,1,pos) + GenSymbols3(CurseLen) + copytext(msg,pos+CurseLen,0)
					pos = findtext(msg,namedlist[i])
					ShinigamiDie(A)
		return msg
	}
	FilterCorpse(msg as text, mob/A)
	{
		var/i
		var/pos
		var/CurseLen
		if(corpsed.len)
			for(i = 1,i < corpsed.len + 1,i++)
				pos = findtext(msg,corpsed[i])
				while(pos)
					CurseLen = length(corpsed[i])
					msg = copytext(msg,1,pos) + GenSymbols2(CurseLen) + copytext(msg,pos+CurseLen,0)
					pos = findtext(msg,corpsed[i])
		return msg
	}
	filterbloody(msg as text)
	{
		var/i
		var/pos
		var/CurseLen
		if(bloodlist.len)
			for(i = 1,i < bloodlist.len + 1,i++)
				pos = findtext(msg,bloodlist[i])
				while(pos)
					CurseLen = length(bloodlist[i])
					msg = copytext(msg,1,pos) + GenSymbols2(CurseLen) + copytext(msg,pos+CurseLen,0)
					pos = findtext(msg,bloodlist[i])
		return msg
	}
	Filternames2(msg as text, mob/A)
	{
		var/i
		var/pos
		var/CurseLen
		if(namedlist2.len)
			for(i = 1,i < namedlist2.len + 1,i++)
				pos = findtext(msg,namedlist2[i])
				while(pos)
					CurseLen = length(namedlist2[i])
					msg = copytext(msg,1,pos) + GenSymbols3(CurseLen) + copytext(msg,pos+CurseLen,0)
					pos = findtext(msg,namedlist2[i])
					ShinigamiDie(A)
		return msg
	}
	GenSymbols(length as num)
	{
		var/T
		var/i
		for(i = 0,i < length,i++)
			T += pick(" / ")

		return T
	}
	GenSymbols2(length as num)
	{
		var/T
		var/i
		for(i = 0,i < length,i++)
			T += pick("")

		return T
	}
	GenSymbols3(length as num)
	{
		var/T
		var/i
		for(i = 0,i < length,i++)
			T += pick("#","*","!","@")

		return T
	}