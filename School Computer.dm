var/A1class=""
var/A2class=""
var/B1class=""
var/B2class=""
var/C1class=""
var/C2class=""
var/D1class=""
var/D2class=""
var/E1class=""
var/E2class=""
var/list/haircolors=list("Red","Black","White","Green","Purple","Orange","Amber","Blonde","Pink","Blue")
var/list/eyecolors=list("Green","Purple","Green","Gray","Blue")
	/*	if(A.gender=="male")
			name="[pick(FemaleFirstNames)] [pick(LastNames)]"
			hair=pick(haircolors),
		else
			name="[pick(FemaleFirstNames)] [pick(LastNames)]"*/
proc
	Rosterrandomizer()
		var/living=0
		var/A1=12
		var/A2=12
		var/B1=12
		var/B2=12
		var/C1=12
		var/C2=12
		var/D1=12
		var/D2=12
		var/list/A1hairs=new/list()
		var/list/A2hairs=new/list()
		var/list/B1hairs=new/list()
		var/list/B2hairs=new/list()
		var/list/C1hairs=new/list()
		var/list/C2hairs=new/list()
		var/list/D1hairs=new/list()
		var/list/D2hairs=new/list()
		for(var/mob/M in alivelist)
			living+=1
			if(M.spawnedinroom=="A1")
				if(M.gender=="male")
					A1class+="Name: [M.realname]<BR>Sex: Male<BR>Hair color: [M.haircolor]<BR>PDA Number: [M.originalnum]<BR><BR>"
				else
					A1class+="Name: [M.realname]<BR>Sex: Female<BR>Hair color: [M.haircolor]<BR>PDA Number: [M.originalnum]<BR><BR>"
				A1-=1
				A1hairs+=M.haircolor
			if(M.spawnedinroom=="A2")
				if(M.gender=="male")
					A2class+="Name: [M.realname]<BR>Sex: Male<BR>Hair color: [M.haircolor]<BR>PDA Number: [M.originalnum]<BR><BR>"
				else
					A2class+="Name: [M.realname]<BR>Sex: Female<BR>Hair color: [M.haircolor]<BR>PDA Number: [M.originalnum]<BR><BR>"
				A2-=1
				A2hairs+=M.haircolor
			if(M.spawnedinroom=="B1")
				if(M.gender=="male")
					B1class+="Name: [M.realname]<BR>Sex: Male<BR>Hair color: [M.haircolor]<BR>PDA Number: [M.originalnum]<BR><BR>"
				else
					B1class+="Name: [M.realname]<BR>Sex: Female<BR>Hair color: [M.haircolor]<BR>PDA Number: [M.originalnum]<BR><BR>"
				B1-=1
				B1hairs+=M.haircolor
			if(M.spawnedinroom=="B2")
				if(M.gender=="male")
					B2class+="Name: [M.realname]<BR>Sex: Male<BR>Hair color: [M.haircolor]<BR>PDA Number: [M.originalnum]<BR><BR>"
				else
					B2class+="Name: [M.realname]<BR>Sex: Female<BR>Hair color: [M.haircolor]<BR>PDA Number: [M.originalnum]<BR><BR>"
				B2-=1
				B2hairs+=M.haircolor
			if(M.spawnedinroom=="C1")
				if(M.gender=="male")
					C1class+="Name: [M.realname]<BR>Sex: Male<BR>Hair color: [M.haircolor]<BR>PDA Number: [M.originalnum]<BR><BR>"
				else
					C1class+="Name: [M.realname]<BR>Sex: Female<BR>Hair color: [M.haircolor]<BR>PDA Number: [M.originalnum]<BR><BR>"
				C1-=1
				C1hairs+=M.haircolor
			if(M.spawnedinroom=="C2")
				if(M.gender=="male")
					C2class+="Name: [M.realname]<BR>Sex: Male<BR>Hair color: [M.haircolor]<BR>PDA Number: [M.originalnum]<BR><BR>"
				else
					C2class+="Name: [M.realname]<BR>Sex: Female<BR>Hair color: [M.haircolor]<BR>PDA Number: [M.originalnum]<BR><BR>"
				C2-=1
				C2hairs+=M.haircolor
			if(M.spawnedinroom=="D1")
				if(M.gender=="male")
					D1class+="Name: [M.realname]<BR>Sex: Male<BR>Hair color: [M.haircolor]<BR>PDA Number: [M.originalnum]<BR><BR>"
				else
					D1class+="Name: [M.realname]<BR>Sex: Female<BR>Hair color: [M.haircolor]<BR>PDA Number: [M.originalnum]<BR><BR>"
				D1-=1
				D1hairs+=M.haircolor
			if(M.spawnedinroom=="D2")
				if(M.gender=="male")
					D2class+="Name: [M.realname]<BR>Sex: Male<BR>Hair color: [M.haircolor]<BR>PDA Number: [M.originalnum]<BR><BR>"
				else
					D2class+="Name: [M.realname]<BR>Sex: Female<BR>Hair color: [M.haircolor]<BR>PDA Number: [M.originalnum]<BR><BR>"
				D2-=1
				D2hairs+=M.haircolor
		while(A1>0)
			var/rander=rand(1,2)
			var/list/haircolors=list("Blue","Red","Purple","Black","Silver","White","Amber","Orange","Pink")
			for(var/v in haircolors)
				if(v in A1hairs)
					haircolors-=v
			if(rander==1)
				A1class+="Name: [pick(MaleFirstNames)] [pick(LastNames)]<BR>Sex: Male<BR>Hair color: [pick(haircolors)]<BR>PDA Number: [rand(100,500)]-[rand(1000,9999)]<BR><BR>"
			else
				A1class+="Name: [pick(MaleFirstNames)] [pick(LastNames)]<BR>Sex: Female<BR>Hair color: [pick(haircolors)]<BR>PDA Number: [rand(100,500)]-[rand(1000,9999)]<BR><BR>"
			A1-=1
		while(A2>0)
			var/rander=rand(1,2)
			var/list/haircolors=list("Blue","Red","Purple","Black","Silver","White","Amber","Orange","Pink")
			for(var/v in haircolors)
				if(v in A2hairs)
					haircolors-=v
			if(rander==1)
				A2class+="Name: [pick(MaleFirstNames)] [pick(LastNames)]<BR>Sex: Male<BR>Hair color: [pick(haircolors)]<BR>PDA Number: [rand(100,500)]-[rand(1000,9999)]<BR><BR>"
			else
				A2class+="Name: [pick(MaleFirstNames)] [pick(LastNames)]<BR>Sex: Female<BR>Hair color: [pick(haircolors)]<BR>PDA Number: [rand(100,500)]-[rand(1000,9999)]<BR><BR>"
			A2-=1
		while(B1>0)
			var/rander=rand(1,2)
			var/list/haircolors=list("Blue","Red","Purple","Black","Silver","White","Amber","Orange","Pink")
			for(var/v in haircolors)
				if(v in B1hairs)
					haircolors-=v
			if(rander==1)
				B1class+="Name: [pick(MaleFirstNames)] [pick(LastNames)]<BR>Sex: Male<BR>Hair color: [pick(haircolors)]<BR>PDA Number: [rand(100,500)]-[rand(1000,9999)]<BR><BR>"
			else
				B1class+="Name: [pick(MaleFirstNames)] [pick(LastNames)]<BR>Sex: Female<BR>Hair color: [pick(haircolors)]<BR>PDA Number: [rand(100,500)]-[rand(1000,9999)]<BR><BR>"
			B1-=1
		while(B2>0)
			var/rander=rand(1,2)
			var/list/haircolors=list("Blue","Red","Purple","Black","Silver","White","Amber","Orange","Pink")
			for(var/v in haircolors)
				if(v in B2hairs)
					haircolors-=v
			if(rander==1)
				B2class+="Name: [pick(MaleFirstNames)] [pick(LastNames)]<BR>Sex: Male<BR>Hair color: [pick(haircolors)]<BR>PDA Number: [rand(100,500)]-[rand(1000,9999)]<BR><BR>"
			else
				B2class+="Name: [pick(MaleFirstNames)] [pick(LastNames)]<BR>Sex: Female<BR>Hair color: [pick(haircolors)]<BR>PDA Number: [rand(100,500)]-[rand(1000,9999)]<BR><BR>"
			B2-=1
		while(C1>0)
			var/rander=rand(1,2)
			var/list/haircolors=list("Blue","Red","Purple","Black","Silver","White","Amber","Orange","Pink")
			for(var/v in haircolors)
				if(v in C1hairs)
					haircolors-=v
			if(rander==1)
				C1class+="Name: [pick(MaleFirstNames)] [pick(LastNames)]<BR>Sex: Male<BR>Hair color: [pick(haircolors)]<BR>PDA Number: [rand(100,500)]-[rand(1000,9999)]<BR><BR>"
			else
				C1class+="Name: [pick(MaleFirstNames)] [pick(LastNames)]<BR>Sex: Female<BR>Hair color: [pick(haircolors)]<BR>PDA Number: [rand(100,500)]-[rand(1000,9999)]<BR><BR>"
			C1-=1
		while(C2>0)
			var/rander=rand(1,2)
			var/list/haircolors=list("Blue","Red","Purple","Black","Silver","White","Amber","Orange","Pink")
			for(var/v in haircolors)
				if(v in C2hairs)
					haircolors-=v
			if(rander==1)
				C2class+="Name: [pick(MaleFirstNames)] [pick(LastNames)]<BR>Sex: Male<BR>Hair color: [pick(haircolors)]<BR>PDA Number: [rand(100,500)]-[rand(1000,9999)]<BR><BR>"
			else
				C2class+="Name: [pick(MaleFirstNames)] [pick(LastNames)]<BR>Sex: Female<BR>Hair color: [pick(haircolors)]<BR>PDA Number: [rand(100,500)]-[rand(1000,9999)]<BR><BR>"
			C2-=1
		while(D1>0)
			var/rander=rand(1,2)
			var/list/haircolors=list("Blue","Red","Purple","Black","Silver","White","Amber","Orange","Pink")
			for(var/v in haircolors)
				if(v in D1hairs)
					haircolors-=v
			if(rander==1)
				D1class+="Name: [pick(MaleFirstNames)] [pick(LastNames)]<BR>Sex: Male<BR>Hair color: [pick(haircolors)]<BR>PDA Number: [rand(100,500)]-[rand(1000,9999)]<BR><BR>"
			else
				D1class+="Name: [pick(MaleFirstNames)] [pick(LastNames)]<BR>Sex: Female<BR>Hair color: [pick(haircolors)]<BR>PDA Number: [rand(100,500)]-[rand(1000,9999)]<BR><BR>"
			D1-=1
		while(D2>0)
			var/rander=rand(1,2)
			var/list/haircolors=list("Blue","Red","Purple","Black","Silver","White","Amber","Orange","Pink")
			for(var/v in haircolors)
				if(v in D2hairs)
					haircolors-=v
			if(rander==1)
				D2class+="Name: [pick(MaleFirstNames)] [pick(LastNames)]<BR>Sex: Male<BR>Hair color: [pick(haircolors)]<BR>PDA Number: [rand(100,500)]-[rand(1000,9999)]<BR><BR>"
			else
				D2class+="Name: [pick(MaleFirstNames)] [pick(LastNames)]<BR>Sex: Female<BR>Hair color: [pick(haircolors)]<BR>PDA Number: [rand(100,500)]-[rand(1000,9999)]<BR><BR>"
			D2-=1
		/*var/hair=null
		var/name=null
		var/rander=rand(1,2)
		if(rander==1)
			name="[pick(FemaleFirstNames)] [pick(LastNames)]"
			//name=pick(FemaleFirstNames)
			hair=pick(haircolors)
		else
			name="[pick(FemaleFirstNames)] [pick(LastNames)]"
			//name=pick(FemaleFirstNames)
			hair=pick(haircolors)
		if(B=="A1")
			var/randd=rand(1,2)
			if(randd==1)
				A1class+="Name: [name]<BR>Sex: Male<BR>Hair color: [hair]<BR><BR>"
			else
				A1class+="Name: [name]<BR>Sex: Female<BR>Hair color: [hair]<BR><BR>"
		else if(B=="A2")
			var/randd=rand(1,2)
			if(randd==1)
				A2class+="Name: [name]<BR>Sex: Male<BR>Hair color: [hair]<BR><BR>"
			else
				A2class+="Name: [name]<BR>Sex: Female<BR>Hair color: [hair]<BR><BR>"
		else if(B=="B1")
			var/randd=rand(1,2)
			if(randd==1)
				B1class+="Name: [name]<BR>Sex: Male<BR>Hair color: [hair]<BR><BR>"
			else
				B1class+="Name: [name]<BR>Sex: Female<BR>Hair color: [hair]<BR><BR>"
		else if(B=="B2")
			var/randd=rand(1,2)
			if(randd==1)
				B2class+="Name: [name]<BR>Sex: Male<BR>Hair color: [hair]<BR><BR>"
			else
				B2class+="Name: [name]<BR>Sex: Female<BR>Hair color: [hair]<BR><BR>"
		else if(B=="C1")
			var/randd=rand(1,2)
			if(randd==1)
				C1class+="Name: [name]<BR>Sex: Male<BR>Hair color: [hair]<BR><BR>"
			else
				C1class+="Name: [name]<BR>Sex: Female<BR>Hair color: [hair]<BR><BR>"
		else if(B=="C2")
			var/randd=rand(1,2)
			if(randd==1)
				C2class+="Name: [name]<BR>Sex: Male<BR>Hair color: [hair]<BR><BR>"
			else
				C2class+="Name: [name]<BR>Sex: Female<BR>Hair color: [hair]<BR><BR>"
		else if(B=="D1")
			var/randd=rand(1,2)
			if(randd==1)
				D1class+="Name: [name]<BR>Sex: Male<BR>Hair color: [hair]<BR><BR>"
			else
				D1class+="Name: [name]<BR>Sex: Female<BR>Hair color: [hair]<BR><BR>"
		else if(B=="D2")
			var/randd=rand(1,2)
			if(randd==1)
				D2class+="Name: [name]<BR>Sex: Male<BR>Hair color: [hair]<BR><BR>"
			else
				D2class+="Name: [name]<BR>Sex: Female<BR>Hair color: [hair]<BR><BR>"
		else if(B=="E1")
			var/randd=rand(1,2)
			if(randd==1)
				E1class+="Name: [name]<BR>Sex: Male<BR>Hair color: [hair]<BR><BR>"
			else
				E1class+="Name: [name]<BR>Sex: Female<BR>Hair color: [hair]<BR><BR>"
		else if(B=="E2")
			var/randd=rand(1,2)
			if(randd==1)
				E2class+="Name: [name]<BR>Sex: Male<BR>Hair color: [hair]<BR><BR>"
			else
				E2class+="Name: [name]<BR>Sex: Female<BR>Hair color: [hair]<BR><BR>"*/
var
    Roster={"
        <html>
        <body>
        <STYLE>BODY{background-color: black; color:white}</STYLE><font size="+1">
        <center><a href=?A2>A2</A></center>
        <A HREF=?sotcdb>Home</A><center>Class of A1</center>
        [A1class]
        </body>
        </html>
        "}
    sotcdb={"
        <html>
        <body>
        <STYLE>BODY{background-color: black; color:blue}</STYLE><font size="+1">
        <center>School Computer</center><br>

        <A HREF=?ANN><img src=blah>Announcement System</A><br>

        <A HREF=?Roster><img src=blah>Roster</A><br>

        </body>
        </html>
        "}
client/Topic(href, h_l[])
    if(href=="Roster")
        usr<<browse(null)
        usr << browse_rsc('GFX/folder.png', "blah")
        usr << browse({"
        <html>
        <body>
        <STYLE>BODY{background-color: black; color:white}</STYLE><font size="+1">
        <center><a href=?E2>E2</A> <a href=?A2>A2</A></center>
        <A HREF=?sotcdb><img src=blah>Home</A><center>Class of A1</center>
        [A1class]
        </body>
        </html>
        "},"window=Roster;can_close=1")
        usr.sotcdbn=3
    if(href=="sotcdb")
        usr<<browse(null)
        usr << browse(sotcdb,"window=Roster;can_close=1")
        usr.sotcdbn=3
    if(href=="ANN")
        usr<<browse(null)
        var/i=input(usr,"What would you like to announce?")
        if(usr.computer==1)
            if(usr.playing==0)
                winshow(usr,"Roster",0)
                winshow(usr,"scotdb",0)
                return
            if(i=="")return
            if(i==" ")return
            world << "<b>The mechanical female voice of the Announcement System announces the following:</b> [i]"
        //usr.sotcdbn=3
    if(href=="A2")
        usr<<browse(null)
        usr << browse({"
        <html>
        <body>
        <STYLE>BODY{background-color: black; color:white}</STYLE><font size="+1">
        <center><a href=?Roster>A1</A> <a href=?B1>B1</A></center>
        <A HREF=?sotcdb><img src=blah>Home</A><center>Class of A2</center>
        [A2class]
        </body>
        </html>
        "},"window=Roster;can_close=1")
        usr.sotcdbn=3
    if(href=="B1")
        usr<<browse(null)
        usr << browse({"
        <html>
        <body>
        <STYLE>BODY{background-color: black; color:white}</STYLE><font size="+1">
        <center><a href=?A2>A2</A> <a href=?B2>B2</A></center>
        <A HREF=?sotcdb><img src=blah>Home</A><center>Class of B1</center>
        [B1class]
        </body>
        </html>
        "},"window=Roster;can_close=1")
        usr.sotcdbn=3
    if(href=="B2")
        usr<<browse(null)
        usr << browse({"
        <html>
        <body>
        <STYLE>BODY{background-color: black; color:white}</STYLE><font size="+1">
        <center><a href=?B1>B1</A> <a href=?C1>C1</A></center>
        <A HREF=?sotcdb><img src=blah>Home</A><center>Class of B2</center>
        [B2class]
        </body>
        </html>
        "},"window=Roster;can_close=1")
        usr.sotcdbn=3
    if(href=="C1")
        usr<<browse(null)
        usr << browse({"
        <html>
        <body>
        <STYLE>BODY{background-color: black; color:white}</STYLE><font size="+1">
        <center><a href=?B2>B2</A> <a href=?C2>C2</A></center>
        <A HREF=?sotcdb><img src=blah>Home</A><center>Class of C1</center>
        [C1class]
        </body>
        </html>
        "},"window=Roster;can_close=1")
        usr.sotcdbn=3
    if(href=="C2")
        usr<<browse(null)
        usr << browse({"
        <html>
        <body>
        <STYLE>BODY{background-color: black; color:white}</STYLE><font size="+1">
        <center><a href=?C1>C1</A> <a href=?D1>D1</A></center>
        <A HREF=?sotcdb><img src=blah>Home</A><center>Class of C2</center>
        [C2class]
        </body>
        </html>
        "},"window=Roster;can_close=1")
        usr.sotcdbn=3
    if(href=="D1")
        usr<<browse(null)
        usr << browse({"
        <html>
        <body>
        <STYLE>BODY{background-color: black; color:white}</STYLE><font size="+1">
        <center><a href=?C2>C2</A> <a href=?D2>D2</A></center>
        <A HREF=?sotcdb><img src=blah>Home</A><center>Class of D1</center>
        [D1class]
        </body>
        </html>
        "},"window=Roster;can_close=1")
        usr.sotcdbn=3
    if(href=="D2")
        usr<<browse(null)
        usr << browse({"
        <html>
        <body>
        <STYLE>BODY{background-color: black; color:white}</STYLE><font size="+1">
        <center><a href=?D1>D1</A> <a href=?A1>A1</A></center>
        <A HREF=?sotcdb><img src=blah>Home</A><center>Class of D2</center>
        [D2class]
        </body>
        </html>
        "},"window=Roster;can_close=1")
        usr.sotcdbn=3
    if(href=="Submit")
        var/lol=winget(src, "Options", "name;cod;time")
        world << lol
        winshow(src,"Options",0)

    if(href=="Cancel")
        if(usr.sotcdbn==2)
            usr<<browse(null)
            usr << browse(sotcdb,"window=sotcdb;can_close=0")
        else if(usr.sotcdbn==3)
            usr<<browse(null)
            usr << browse(sotcdb,"window=sotcdb;can_close=0")
        else
            usr<<browse(null)
    if(href=="poller")
        usr<<browse(null)
        usr << browse_rsc('GFX/folder.png', "blah")
        usr << browse({"
        <html>
        <body>
        <STYLE>BODY{background-color: black; color:white}</STYLE><font size="+1">
        </body>
        </html>
        "},"window=poller;can_close=1")
        usr.sotcdbn=3
    if(href=="votenormal")
        winshow(usr,"poller",0)
        nm+=1
    if(href=="votejm")
        winshow(usr,"poller",0)
        jm+=1
    if(href=="votedgm")
        winshow(usr,"poller",0)
        dgm+=1
    if(href=="votedn")
        winshow(usr,"poller",0)
        dnc+=1 //Should be dn+=1, but DN has glitches, DNC does not (AFAIK).
    if(href=="votednc")
        winshow(usr,"poller",0)
        dnc+=1
    if(href=="votewitch")
        winshow(usr,"poller",0)
        wm+=1
    if(href=="votesecret")
        winshow(usr,"poller",0)
        secret+=1
    if(href=="votezombie")
        winshow(usr,"poller",0)
        zm+=1
    if(href=="votezombieinvasion")
        winshow(usr,"poller",0)
        zim+=1
    if(href=="votetsu")
        winshow(usr,"poller",0)
        tsu+=1
    var/s = h_l["fuse"]
    if( s )
        s = url_decode(s)
        if( s in fuses )
            //s = fuses[s]
            if( s == "Hallways" )
                if( halllights == 1)
                    if(canturnonlights==0)
                        usr<<"Can't turn them back off yet."
                        return
                    halllights=0
                    ToggleHallLightsOff()
                    world << "<i>The hallway lights suddenly go out."
                    canturnonlights=0
                    spawn(450)canturnonlights=1
                    return
                if( halllights == 0)
                    halllights=1
                    ToggleHallLightsOn()
                    world << "<i>The hallway lights come back on."
                    return
            for(var/obj/Switch_For_Lights/A in world)
                if(A.tag==s&&A.power=="On")
                    A.power="Off"
                    A.icon_state="switch off"
                    TurnOffLights(s)
                else if(A.tag==s&&A.power=="Off")
                    A.power="On"
                    A.icon_state="switch on"
                    TurnOnLights(s)
                /*if(A.tag==s)
                    for(var/obj/Lights/B in world)
                        if(B.tag==A.tag)
                            if(A.power=="On")
                                B.luminosity=0
                                B.icon_state="none"
                                A.power="Off"
                                A.icon_state="switch off"
                                A.switched="Off"
                            else
                                B.luminosity=8
                                B.icon_state="lights"
                                A.power="On"
                                A.icon_state="switch on"
                                A.switched="On"*/
            fuses= new/list()
            for(var/obj/Switch_For_Lights/b in world)
                if(b.onlist==1)
                    fuses+="[b.tag]"
           //winset(src, "fboxgrid", "cells=2x[fuses.len+1]" )
            for( var/n=1 to fuses.len )
                var/k = fuses[n]
                usr << output( "<a href='?src=\ref[src];fuse=[url_encode(k)]'>[k]</a>", "fboxgrid:1,[n]" )
                for(var/obj/Switch_For_Lights/O in world)
                    if(O.onlist==1)
                        if(O.tag==k)
                            var/pow="On"
                            if(O.power=="On")
                                pow="<font color=green><font size=2>On</font>"
                            else
                                pow="<font color=red><font size=2>Off</font>"
                            usr << output( "[pow]", "fboxgrid:2,[n]" )
                                            //break

mob/var/sotcdbn=0
mob/proc/Updategrid()
	fuses= new/list()
	for(var/obj/Switch_For_Lights/A in world)
		fuses+="[A.tag]"
	winset(src, "fboxgrid", "cells=2x[fuses.len+1]" )
	var/i=1
	//for(var/obj/Switch_For_Lights/A in world)
	for( var/s=1 to fuses.len )
		var/k = fuses[s]
		src << output( "<a href='?src=\ref[src];fuse=[url_encode(k)]'>[k]</a>", "fboxgrid:1,[++i]" )
		for(var/obj/Switch_For_Lights/O in world)
			if(O.tag==k)
				src << output( "[O.power]", "fboxgrid:1,[++i]" )
				break
