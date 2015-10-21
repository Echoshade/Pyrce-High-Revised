mob
	proc
		invisablewalk()
			if(src.dashing==1)return
			if(src.vampire==0)return
			if(src.koed==1)return
			if(src.stamina<10)
				src << "Your stamina has ran regrettably low."
				return
			src.dashing=1
			src.stamina-=10
			updatesp(src)
			src.invisibility=101
			soundmob(src, 15, nanaya_disappear, TRUE)
			spawn(15)
				src.invisibility=0
				soundmob(src, 15, nanaya_land, TRUE)
			spawn(50)
				src.dashing=0
var/const/Nanaya_Dash='quickdash.wav'
var/const/nanaya_disappear='nanaya_disappear.wav'
var/const/nanaya_land='nanaya_land.wav'
mob/proc/nanayadash()
	if(src.nanaya==0)return
	if(src.dashing==1)return
	if(src.koed==1)return
	if(src.stamina<7)
		src << "Your stamina has ran regrettably low."
		return
	if(src.pulling)
		//src << "Something seems to be holding you back"
		//return
		src.pulling=null
	//var/obj/Dashing/O=new(src.loc)
	src.dashing=1
	var/steeper=src.step_size
	src.step_size=256
	src.portal=1
	sleep(3)
	soundmob(src, 15, Nanaya_Dash, TRUE)
	step(src,src.dir)
	src.portal=0
	src.step_size=steeper
	src.stamina-=7
	spawn(50)
		src.dashing=0
	updatesp(src)


mob
	proc
		addlines()
			//screen_loc = "SOUTHWEST to NORTHEAST"
			var/obj/O=new/obj/Mystic_Lines
			src.client.screen += O
		remlines()
			//screen_loc = "SOUTHWEST to NORTHEAST"
			//var/obj/O=new/obj/Mystic_Lines
			//src.client.screen += O
			for(var/obj/Mystic_Lines/O in client.screen)
				src.client.screen -= O
obj
    Mystic_Lines
        icon='mysticeyes.dmi'
        layer = MOB_LAYER + 5
       // New(client/C)
        screen_loc = "SOUTHWEST to NORTHEAST"
           // C.screen+=src

