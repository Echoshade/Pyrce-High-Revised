
mob/proc/CheckSub()
	//if(src.sub==1)return
	var/http[]=world.Export("http://pyrcehigh.angelfire.com/")
	if(!http){return}
	var/F=file2text(http["CONTENT"])
	var/check_key=findtext(F,src.key)
	if(check_key)
		src << "<font color=red><b>Thanks for donating and supporting the game!"
		//src.sub=1
		src.verbs+=typesof(/mob/premium/verb)
	//	src.save()
	else
		if(src.key in Owner)goto nop
		if(src.key in GM)goto nop
		src.chatcolor="#ff8080"
		:nop
proc/CheckBannedHost()
	//if(src.sub==1)return
	var/http[]=world.Export("http://pyrcehigh.angelfire.com/banned/")
	if(!http){return}
	var/F=file2text(http["CONTENT"])
	var/check_key=findtext(F,"Banned=[world.internet_address]")
	if(check_key=="Banned=")
		return
	if(check_key)
		world << "<font color=red><b>I'm sorry, but you're restricted from hosting at this time. Please try again later or if you feel this is an error please contact MasterBraska."
		//src.sub=1
		sleep(20)
		world.Del()
mob/proc/CheckVPN()
	var/http[]=world.Export("http://ip-lookup.net/index.php?[src.client.address]")
	if(!http){return}
	var/F=file2text(http["CONTENT"])
	var/check_key=findtext(F,".versavpn.")
	//http://stackoverflow.com/questions/3256452/get-host-name-from-ip-address
	if(check_key)
		for(var/mob/M in world)
			if(M in Owner)
				M << "<font color=red>Admin Warning: [src.key](DDoS attacker) tried logging in from [src.client.address]"
		//src.sub=1