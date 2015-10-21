//mob/verb/Convert(filename as file)
//	dmp2swapmap(filename)

mob/proc/poofoption()
	if(src.client)
		for(var/obj/HUD/OnScreenText/O in src.client.screen)
			src.Chatting=0
			src.client.screen-=O
		for(var/obj/HUD/OnScreenText/ChoiceSelect/O in src.client.screen)
			src.Chatting=0
			src.client.screen-=O

mob/verb/Takethatthing()
	set hidden = 1
	var/obj/HUD/OnScreenText/ChoiceSelect/M
	for(M in usr.client.screen)
		if(M:Choice == "Take")
			M.Click()
			..()
		else
			return
mob/proc/CheckWeighter()
	if(src.client)
		src.weight=0
		var/coiners=0
		var/stickers=0
		for(var/obj/O in src)
			src.weight+=O.iweight
			if(istype(O,/obj/Misc/Mystia_Coin))
				coiners+=1
		if(coiners>src.coins)
			src.see_in_dark+=2
			src.coins+=1
		if(coiners<src.coins&&!src.coins==0)
			src.coins-=1
			src.see_in_dark-=2
		for(var/obj/O in src)
			if(istype(O,/obj/Misc/Glow_Stick))
				stickers+=1
		if(stickers>src.gsticks)
			var/llum=src.luminosity+2
			src.sd_SetLuminosity(llum)
			src.gsticks+=1
		if(stickers<src.gsticks&&!src.gsticks==0)
			src.gsticks-=1
			var/llum=src.luminosity-2
			src.sd_SetLuminosity(llum)
//	if(src.see_in_dark>bright
		//else return
obj
	kotimer
		icon='timer.dmi'
		name=""
		layer = MOB_LAYER+56
		screen_loc = "17,8"
		pixel_y = 16
		//var/position = 0
		New(client/C,num_position)
			//position = num_position
			screen_loc = "5,2"
			//screen_loc="12,11"
			//C.screen+=src