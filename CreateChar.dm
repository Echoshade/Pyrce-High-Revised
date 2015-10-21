mob/var
	charname=null
	charhair=null
	charhaircolor=null
	chargender="male"
	splittercolor=null
	tabcolor=null
	tabtextcolor=null
	inputboxcolor=null
	inputboxtextcolor=null
	chatboxcolor=null
mob/verb/.splittercolor()
	set hidden=1
	var/cc=input(usr,"Pick the color to use.") as color
	winset(usr,"mainwin","background-color=[cc]")
	winset(usr,"paner","background-color=[cc]")
	usr.splittercolor=cc
	//usr.save()
mob/verb/.tabbgcolor()
	set hidden=1
	var/cc=input(usr,"Pick the color to use.") as color
	winset(usr,"infopaner","tab-background-color=[cc]")
	winset(usr,"infopaner","background-color=[cc]")
	usr.tabcolor=cc
	//usr.save()
mob/verb/.tabtextcolor()
	set hidden=1
	var/cc=input(usr,"Pick the color to use.") as color
	winset(usr,"infopaner","tab-text-color=[cc]")
	winset(usr,"infopaner","text-color=[cc]")
	usr.tabtextcolor=cc
	//usr.save()
mob/verb/.inputboxcolor()
	set hidden=1
	var/cc=input(usr,"Pick the color to use.") as color
	winset(usr,"input","background-color=[cc]")
	alert(usr,"Now set the text color for that box.")
	var/cc2=input(usr,"Pick the color to use.") as color
	winset(usr,"input","text-color=[cc2]")
	usr.inputboxcolor=cc
	usr.inputboxtextcolor=cc2
	//usr.save()
mob/verb/.chatboxbgcolor()
	set hidden=1
	var/cc=input(usr,"Pick the color to use.") as color
	winset(usr,"output1","background-color=[cc]")
	usr.chatboxcolor=cc
	//usr.save()
mob/verb/.imageswitcher(F as file)
	set hidden=1
	winset(usr,"rightpanel.label1","image=[F]")
mob/verb/.skinmodify()
	set hidden=1
	winshow(usr,"skinmodify",1)
mob/verb
	.changegndr()
		set hidden=1
		if(usr.playing==1)return
		var/sx=winget(usr,"mgndr","is-checked")
		if(sx=="true")
			usr.chargender="male"
		else
			usr.chargender="female"
		winshow(usr,"charcreation",0)
		usr.charhair=null
		usr.custcharacter()
		usr.save()
	.custcharacter()
		set hidden=1
		if(usr.playing==1)return
		if(usr.chargender=="male")
			winset(usr,"mgndr","is-checked=true")
		else
			winset(usr,"fmgndr","is-checked=true")
		winshow(usr,"charcreation",1)
		winset(src,"charcreation","size=240x240")
		winset(usr,"usrname","Text=\"Name: [usr.charname]\"")
		var/jutsus = 0
		//usr << output(null, "HairList:0,0")
		//winset(usr,"HairList","cells=0x0")
		//usr << output(O, "HairList:[++jutsus]")
		if(usr.chargender=="male")
			for(var/obj/Hairs/O in Hairs)
				usr << output(O, "HairList:[++jutsus]")
			winset(usr, "HairList", "cells=1x[jutsus]")
		else
			for(var/obj/Hairs/O in GirlHairs)
				usr << output(O, "HairList:[++jutsus]")
			winset(usr, "HairList", "cells=1x[jutsus]")
		if(usr.chrslotted==1)
			winset(usr,"charslt1","is-checked=true")
		else if(usr.chrslotted==1)
			winset(usr,"charslt2","is-checked=true")
		else
			winset(usr,"charslt3","is-checked=true")
		usr.UpdatePreview()
	.setcharname()
		set hidden=1
		if(usr.playing==1)return
		var/name=input(usr,"Please choose a name for your character.")
		if(length(name)<6)
			usr << "Please make your name over 5 characters long, but no more than 14."
			return
		if(length(name)>18)
			usr << "Please make sure your name is no more than 18 characters long."
			return
		usr.charname=name
		winset(usr,"usrname","Text=\"Name: [usr.charname]\"")
		//usr.name=name
	.changehaircolor()
		set hidden=1
		if(usr.playing==1)return
		usr.charhaircolor=input(usr,"Choose the color you wish to blend your hair with.","Hair Color",usr.charhaircolor)as color
		usr.UpdatePreview()
	.exitcc()
		set hidden=1
		winshow(usr,"charcreation",0)
		usr.save()


obj/Hairs
	var/hairgn="male"
	BlackBoyHair
		icon='BlackBoyHair.dmi'
		name=""
		hairgn="male"
	BlueBoyHair
		icon='BlueBoyHair.dmi'
		name=""
		hairgn="male"
	BlueBoyHair2
		icon='BlueBoyHair2.dmi'
		name=""
		hairgn="male"
	BrownBoyHair
		icon='BrownBoyHair.dmi'
		name=""
		hairgn="male"
	GogglesHair
		icon='GoggleHair.dmi'
		name=""
		hairgn="male"
	OrangeBoyHair
		icon='OrangeBoyHair.dmi'
		name=""
		hairgn="male"

	RedBoyHair
		icon='RedBoyHair.dmi'
		name=""
		hairgn="male"
	RedBoyHair2
		icon='RedBoyHair2.dmi'
		name=""
		hairgn="male"
	RedBoyHair3
		icon='RedBoyHair3.dmi'
		name=""
		hairgn="male"
	RedBoyHair
		icon='RedBoyHair.dmi'
		name=""
		hairgn="male"
	MaleHair1
		icon='malehair1.dmi'
		name=""
		hairgn="male"
	MaleHair2
		icon='malehair2.dmi'
		name=""
		hairgn="male"
	MaleHair3
		icon='malehair3.dmi'
		name=""
		hairgn="male"
	MaleHair4
		icon='malehair4.dmi'
		name=""
		hairgn="male"
	MaleHair5
		icon='malehair5.dmi'
		name=""
		hairgn="male"
	MaleHair6
		icon='malehair6.dmi'
		name=""
		hairgn="male"
	MaleHair7
		icon='malehair7.dmi'
		name=""
		hairgn="male"
	MaleHair8
		icon='malehair8.dmi'
		name=""
		hairgn="male"
	SilverBoyHair
		icon='SilverBoyHair.dmi'
		name=""
		hairgn="male"

	GreenBoyHair
		icon='GreenBoyHair.dmi'
		name=""
		hairgn="male"

	PurpleBoyHair
		icon='PurpleBoyHair.dmi'
		name=""
		hairgn="male"

	GrayBoyHair
		icon='GrayBoyHair.dmi'
		name=""
		hairgn="male"

	//females
	BlackGirlHair
		icon='BlackGirlHair.dmi'
		name=""
		hairgn="female"

	BlackGirlHair2
		icon='BlackGirlHair2.dmi'
		name=""
		hairgn="female"

	BlondeGirlHair
		icon='BlondeGirlHair.dmi'
		name=""
		hairgn="female"
	BlondeGirlHair2
		icon='BlondeGirlHair2.dmi'
		name=""
		hairgn="female"
	BlueGirlHair
		icon='BlueGirlHair.dmi'
		name=""
		hairgn="female"
	BlueGirlHair2
		icon='BlueGirlHair2.dmi'
		name=""
		hairgn="female"
	OrangeGirlHair
		icon='OrangeGirlHair.dmi'
		name=""
		hairgn="female"
	BrownGirlHair
		icon='BrownGirlHair.dmi'
		name=""
		hairgn="female"
	BrownGirlHair2
		icon='BrownGirlHair2.dmi'
		name=""
		hairgn="female"
	GreenGirlHair
		icon='GreenGirlHair.dmi'
		name=""
		hairgn="female"

	GreenGirlHair2
		icon='GreenGirlHair2.dmi'
		name=""
		hairgn="female"

	PinkGirlHair
		icon='PinkGirlHair.dmi'
		name=""
		hairgn="female"
	Drills
		icon='drills.dmi'
		name=""
		hairgn="female"
	PinkGirlHair2
		icon='PinkGirlHair2.dmi'
		name=""
		hairgn="female"
	FemaleHair1
		icon='femalehair1.dmi'
		name=""
		hairgn="female"
	FemaleHair2
		icon='femalehair2.dmi'
		name=""
		hairgn="female"
	FemaleHair3
		icon='femalehair3.dmi'
		name=""
		hairgn="female"
	FemaleHair4
		icon='femalehair4.dmi'
		name=""
		hairgn="female"
	FemaleHair5
		icon='femalehair5.dmi'
		name=""
		hairgn="female"
	FemaleHair6
		icon='femalehair6.dmi'
		name=""
		hairgn="female"
	FemaleHair7
		icon='femalehair7.dmi'
		name=""
		hairgn="female"
	FemaleHair8
		icon='femalehair8.dmi'
		name=""
		hairgn="female"
	PurpleGirlHair
		icon='PurpleGirlHair.dmi'
		name=""
		hairgn="female"
	PurpleGirlHair2
		icon='PurpleGirlHair2.dmi'
		name=""
		hairgn="female"
	RedGirlHair
		icon='RedGirlHair.dmi'
		name=""
		hairgn="female"
	RedGirlHair3
		icon='RedGirlHair3.dmi'
		name=""
		hairgn="female"
	WhiteGirlHair
		icon='WhiteGirlHair.dmi'
		name=""
		hairgn="female"
	WhiteGirlHair2
		icon='WhiteGirlHair2.dmi'
		name=""
		hairgn="female"
	WhiteGirlHair3
		icon='WhiteGirlHair3.dmi'
		name=""
		hairgn="female"
	WhiteGirlHair4
		icon='WhiteHairGirl4.dmi'
		name=""
		hairgn="female"
	SilverGirlHair
		icon='SilverGirlHair.dmi'
		name=""
		hairgn="female"
	SilverGirlHair2
		icon='SilverGirlHair2.dmi'
		name=""
		hairgn="female"
	SilverGirlHair3
		icon='SilverGirlHair3.dmi'
		name=""
		hairgn="female"
	Bald
		icon='baldhead.dmi'
		icon_state="bald"
		name=""
	Click()
		//if(src in Hairs)
		usr.charhair=icon(src:icon)
		usr.UpdatePreview()
mob/verb
	ChrSlot1()
		set category = null
		if(usr.playing==1)return
		if(usr.chrslotted==1)return
		if(usr.chrslotted==2)
			usr.chrslot2hair=usr.charhair
			usr.chrslot2haircolor=usr.charhaircolor
			usr.chrslot2gender=usr.chargender
			usr.chrslot2name=usr.charname
		if(usr.chrslotted==3)
			usr.chrslot3hair=usr.charhair
			usr.chrslot3haircolor=usr.charhaircolor
			usr.chrslot3gender=usr.chargender
			usr.chrslot3name=usr.charname
		usr.chrslotted=1
		usr.charhair=usr.chrslot1hair
		usr.charhaircolor=usr.chrslot1haircolor
		usr.chargender=usr.chrslot1gender
		usr.charname=usr.chrslot1name
		if(usr.chargender=="male")
			winset(usr,"mgndr","is-checked=true")
		else
			winset(usr,"fmgndr","is-checked=true")
		usr.save()
		usr.UpdatePreview()
	ChrSlot2()
		set category = null
		if(usr.playing==1)return
		if(usr.chrslotted==2)return
		if(usr.chrslotted==1)
			usr.chrslot1hair=usr.charhair
			usr.chrslot1haircolor=usr.charhaircolor
			usr.chrslot1gender=usr.chargender
			usr.chrslot1name=usr.charname
		if(usr.chrslotted==3)
			usr.chrslot3hair=usr.charhair
			usr.chrslot3haircolor=usr.charhaircolor
			usr.chrslot3gender=usr.chargender
			usr.chrslot3name=usr.charname
		usr.chrslotted=2
		usr.charhair=usr.chrslot2hair
		usr.charhaircolor=usr.chrslot2haircolor
		usr.chargender=usr.chrslot2gender
		usr.charname=usr.chrslot2name
		if(usr.chargender=="male")
			winset(usr,"mgndr","is-checked=true")
		else
			winset(usr,"fmgndr","is-checked=true")
		usr.save()
		usr.UpdatePreview()
	ChrSlot3()
		set category = null
		if(usr.playing==1)return
		if(usr.chrslotted==3)return
		if(usr.chrslotted==1)
			usr.chrslot1hair=usr.charhair
			usr.chrslot1haircolor=usr.charhaircolor
			usr.chrslot1gender=usr.chargender
			usr.chrslot1name=usr.charname
		if(usr.chrslotted==2)
			usr.chrslot2hair=usr.charhair
			usr.chrslot2haircolor=usr.charhaircolor
			usr.chrslot2gender=usr.chargender
			usr.chrslot2name=usr.charname
		usr.chrslotted=3
		usr.charhair=usr.chrslot3hair
		usr.charhaircolor=usr.chrslot3haircolor
		usr.chargender=usr.chrslot3gender
		usr.charname=usr.chrslot3name
		if(usr.chargender=="male")
			winset(usr,"mgndr","is-checked=true")
		else
			winset(usr,"fmgndr","is-checked=true")
		usr.save()
		usr.UpdatePreview()

mob/proc
	UpdatePreview()
		usr << output(null, "GPreview:1,1")
		if(src.playing==1)return
		var/obj/O=new/obj
		var/obj/O1=new/obj
		var/obj/O2=new/obj
		var/obj/O3=new/obj
		if(src.chargender=="male")
			O.icon='MaleBase.dmi'
			O1.icon='MaleBase.dmi'
			O2.icon='MaleBase.dmi'
			O3.icon='MaleBase.dmi'
		else
			O.icon='FemaleBase.dmi'
			O1.icon='FemaleBase.dmi'
			O2.icon='FemaleBase.dmi'
			O3.icon='FemaleBase.dmi'
		if(src.charhair!=null)
			var/icon/I=new(src.charhair:icon)
			//I.icon-=rgb(1,1,1)
			if(src.charhaircolor !=null)I.Blend(src.charhaircolor)
			//I.icon += rgb(src.charhaircolor)
			O.overlays+=I
			O1.overlays+=I
			O2.overlays+=I
			O3.overlays+=I
		O.dir=SOUTH
		src << output(O, "GPreview:1,1")
		O1.dir=EAST
		src << output(O1, "GPreview:2,1")
		O2.dir=NORTH
		src << output(O2, "GPreview:3,1")
		O3.dir=WEST
		src << output(O3, "GPreview:4,1")
		var/jutsus=0
		if(src.chargender=="male")
			for(var/obj/Hairs/f in Hairs)
				src << output(f, "HairList:[++jutsus]")
			winset(src, "HairList", "cells=1x[jutsus]")
		else
			for(var/obj/Hairs/f in GirlHairs)
				src << output(f, "HairList:[++jutsus]")
			winset(src, "HairList", "cells=1x[jutsus]")
		winset(src,"usrname","Text=\"Name: [src.charname]\"")
var/list/GirlHairs=list(new /obj/Hairs/BlackGirlHair,new /obj/Hairs/BlackGirlHair2,new /obj/Hairs/BlondeGirlHair,new /obj/Hairs/BlondeGirlHair2,new /obj/Hairs/BlueGirlHair,new /obj/Hairs/BlueGirlHair2,new /obj/Hairs/BrownGirlHair,new /obj/Hairs/BrownGirlHair2,new /obj/Hairs/PinkGirlHair,new /obj/Hairs/PinkGirlHair2,new /obj/Hairs/PurpleGirlHair,new /obj/Hairs/PurpleGirlHair2,new /obj/Hairs/RedGirlHair,new /obj/Hairs/GreenGirlHair,new /obj/Hairs/GreenGirlHair2,new /obj/Hairs/WhiteGirlHair,new /obj/Hairs/WhiteGirlHair2,new /obj/Hairs/SilverGirlHair,new /obj/Hairs/SilverGirlHair2,new /obj/Hairs/OrangeGirlHair,new /obj/Hairs/FemaleHair1,new /obj/Hairs/FemaleHair2,new /obj/Hairs/Drills,new /obj/Hairs/FemaleHair3,new /obj/Hairs/FemaleHair4,new /obj/Hairs/FemaleHair5,new /obj/Hairs/FemaleHair6,new /obj/Hairs/FemaleHair7,new /obj/Hairs/FemaleHair8,new /obj/Hairs/WhiteGirlHair3,new /obj/Hairs/WhiteGirlHair4,new /obj/Hairs/SilverGirlHair3,new /obj/Hairs/RedGirlHair3)
var/list/Hairs=list(new /obj/Hairs/BlackBoyHair,new /obj/Hairs/BlueBoyHair,new /obj/Hairs/SilverBoyHair,new /obj/Hairs/GreenBoyHair,new /obj/Hairs/RedBoyHair,new /obj/Hairs/RedBoyHair2,,new /obj/Hairs/OrangeBoyHair,new /obj/Hairs/GogglesHair,,new /obj/Hairs/BlueBoyHair2,new /obj/Hairs/BrownBoyHair,new /obj/Hairs/PurpleBoyHair,new /obj/Hairs/GrayBoyHair,new /obj/Hairs/BlueBoyHair2,new /obj/Hairs/MaleHair1,new /obj/Hairs/MaleHair2,new /obj/Hairs/MaleHair3,new /obj/Hairs/MaleHair4,new /obj/Hairs/MaleHair5,new /obj/Hairs/MaleHair6,new /obj/Hairs/MaleHair7,new /obj/Hairs/MaleHair8,new /obj/Hairs/RedBoyHair3, new /obj/Hairs/Bald)