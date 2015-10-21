mob/proc/save()
	//set hidden = 1
	var/savefile/F = new()
	F["ITEMSDB"]<<src.key
	F["KKLOLOLKK1"]<<src.unlock1
	F["KKLOLOLKK2"]<<src.unlock2
	F["KKLOLOLKK3"]<<src.unlock3
	F["KKLOLOLKK4"]<<src.unlock4
	F["KKLOLOLKK5"]<<src.unlock5
	F["KKLOLOLKK6"]<<src.unlock6
	F["KKLOLOLKK7"]<<src.unlock7
	F["KKLOLOLKK8"]<<src.unlock8
	F["KKLOLOLKK33"]<<src.setage
	F["KKLOLOLKK34"]<<src.setprofile
	F["KKLOLOLKK10"]<<src.noclickself
	F["KKLOLOLKK9"]<<src.sub
	F["6GDGH$"]<<src.mastervolume
	F["KKLOLOLKK11"]<<src.norole
	F["9rjfne"] << src.fightfont
	F["kooler"] << src.chatcolor
	F["koolerz"] << src.chattercolor
	F["haircolor"] << src.charhaircolor
	F["hair"] << src.charhair
	F["charname"] << src.charname
	F["chargender"] << src.chargender
	F["IL"] << src.ignorelist
	F["ShowLists"] << src.showlists
	F["Music"] << src.mutemusic
	F["SFX"] << src.mutesfx
	F["rpchat"] << src.rpchat
	F["rpchatsize"] << src.rpboxwidth
	F["rpchatcoloe"] << src.rpchatcolor
	F["hairslot1"] << src.chrslot1hair
	F["hairslot2"] << src.chrslot2hair
	F["hairslot3"] << src.chrslot3hair
	F["haircolorslot3"] << src.chrslot3haircolor
	F["haircolorslot2"] << src.chrslot2haircolor
	F["haircolorslot1"] << src.chrslot1haircolor

	F["genderslot1"] << src.chrslot1gender
	F["genderslot2"] << src.chrslot2gender
	F["genderslot3"] << src.chrslot3gender

	F["nameslot1"] << src.chrslot1name
	F["nameslot2"] << src.chrslot2name
	F["nameslot3"] << src.chrslot3name
	F["slotcur"] << src.chrslotted
	//F["ghutz"] << src.premicon
	src.client.Export(F)

mob/proc/load()
	if(!src||!src.client)return
	var/client_file = src.client.Import()
	if(client_file)
		var/savefile/F = new(client_file)
		F["ITEMSDB"]>>mykey
		if(src.mykey==src.key)
			F["KKLOLOLKK1"]>>src.unlock1
			F["KKLOLOLKK2"]>>src.unlock2
			F["KKLOLOLKK3"]>>src.unlock3
			F["6GDGH$"]>>src.mastervolume
			F["KKLOLOLKK4"]>>src.unlock4
			F["KKLOLOLKK5"]>>src.unlock5
			F["KKLOLOLKK6"]>>src.unlock6
			F["KKLOLOLKK7"]>>src.unlock7
			F["KKLOLOLKK8"]>>src.unlock8
			F["KKLOLOLKK33"]>>src.setage
			F["KKLOLOLKK34"]>>src.setprofile
			F["KKLOLOLKK9"]>>src.sub
			F["KKLOLOLKK11"]>>src.norole
			F["KKLOLOLKK10"]>>src.noclickself
			F["kooler"] >> src.chatcolor
			F["koolerz"] >> src.chattercolor
			F["9rjfne"] >> src.fightfont
			F["haircolor"] >> src.charhaircolor
			F["hair"] >> src.charhair
			F["charname"] >> src.charname
			F["chargender"] >> src.chargender
			F["IL"] >> src.ignorelist
			F["ShowLists"] >> src.showlists
			F["Music"] >> src.mutemusic
			F["SFX"] >> src.mutesfx
			F["rpchat"] >> src.rpchat
			F["rpchatsize"] >> src.rpboxwidth
			F["rpchatcoloe"] >> src.rpchatcolor
			F["hairslot1"] >> src.chrslot1hair
			F["hairslot2"] >> src.chrslot2hair
			F["hairslot3"] >> src.chrslot3hair
			F["haircolorslot3"] >> src.chrslot3haircolor
			F["haircolorslot2"] >> src.chrslot2haircolor
			F["haircolorslot1"] >> src.chrslot1haircolor

			F["genderslot1"] >> src.chrslot1gender
			F["genderslot2"] >> src.chrslot2gender
			F["genderslot3"] >> src.chrslot3gender

			F["nameslot1"] >> src.chrslot1name
			F["nameslot2"] >> src.chrslot2name
			F["nameslot3"] >> src.chrslot3name
			F["slotcur"] >> src.chrslotted
			//F["grimmer"] >> src.premicon
			//F["zonic"] >> src.premiconed
		if(src.showlists==null)src.showlists=1
		if(src.rpchat==null)src.rpchat=1
		if(src.rpboxwidth==null)src.rpboxwidth=15
		if(src.rpchatcolor==null)src.rpchatcolor="#ff8080"
		if(src.rpchat==1)
			winset(src,"rpchatcheck","is-checked=true")
		else
			winset(src,"rpchatcheck","is-checked=false")
		if(src.ignorelist==null)src.ignorelist=new/list()
		if(src.chatcolor==null) src.chatcolor="#ff8080"
		if(src.chattercolor==null) src.chattercolor="#ff8080"
		winset(src,"charprof","Text=\"[src.setprofile]")
		if(src.fightfont==null) src.fightfont="<font face=Arial><b>"
		if(src.chargender=="male")
			winset(src,"mgndr","is-checked=true")
		else
			winset(src,"fmgndr","is-checked=true")
		if(src.norole==1)
			winset(src, "roleset","is-checked=true")
		else
			winset(src, "roleset","is-checked=false")
		if(src.noclickself==1)
			winset(src, "noclickerself", "is-checked=true")
		else
			winset(src, "noclickerself", "is-checked=false")
		if(src.mutesfx==1)
			winset(src, "sfxmuter", "is-checked=true")
		else
			winset(src, "sfxmuter", "is-checked=false")
		if(src.mutemusic==1)
			winset(src, "musicmuter", "is-checked=true")
		else
			winset(src, "musicmuter", "is-checked=false")
		if(src.showlists!=1)
			winset(src, "remtabs", "is-checked=true")
		else
			winset(src, "remtabs", "is-checked=false")
		winset(src,"musicer","value=[src.mastervolume]")
		src.musicstuff()
		src.UpdateIL()
	else
		return
mob/proc/musicstuff()
	winset(src, "Music", "parent=")
	winset(src, "Music.", "parent=")
	winset(src, "Music..", "parent=")
	winset(src, "Music...", "parent=")
	winset(src, "MusicZomb", "parent=")
	if(src.unlock1=="Successful Slaughter!")winset(src, "Music", "parent=unlock;name=\"Normal Music\";command=NormalMusic")
	if(src.unlock3=="Copy Cat!!")winset(src, "Music.", "parent=unlock;name=\"Doppelganger Music\";command=DGMusic")
	if(src.unlock2=="I know magic!")winset(src, "Music..", "parent=unlock;name=\"Witch Music\";command=WitchMusic")
	if(src.unlock4=="Just As Planned!")winset(src, "MusicZomb", "parent=unlock;name=\"Death Note Music\";command=DNMusic")
	//winset(src, "Music....", "parent=gopt;name=\"Suspect Music\";command=SuspectMusic")