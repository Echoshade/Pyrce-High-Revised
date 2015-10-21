mob/proc/Approach(mob/m)
	walk(src,0)
	walk_towards(src,m,6,0)
mob/proc/Approach2(mob/m)
	walk(src,0)
	walk_to(src,m)
mob/Zombie
	icon='Slender.dmi'
	name="Slender Man Zombie"
	zombie=1
	Click()
		if(usr.playing==0)return
		if(usr.shinigami==1)return
		if(usr.canattack==0)return
		var/obj/N=usr.equipped
		if(usr.zombie==1)
			return
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
		if(src.hp<1)
			range(5,usr) << "The Zombie falls to the ground"
			FakeCorpse(src)
			del(src)
	Bump(atom/A)
		if(istype(A,/mob))
			//world << "blah"
			ZombieAttack(src,A)
		if(istype(A,/obj/Containers))
			//var/oloc=locate(A.loc)
			//A.x=src.x
			sleep(10)
			src.loc=A.loc
		else if(istype(A,/obj/Door))
			soundmob(usr, 8, 'audio/slamming_against.wav', TRUE)
			range(5,usr) << "<b>WHAM!!!!!!</b> The sound of something slamming against the door is heard!"
			var/obj/Shattered_Door/c = new
			c.loc=A.loc
			del A
		else if(istype(A,/obj/Lockable_Door))
			var/obj/Lockable_Door/D
			soundmob(usr, 8, 'audio/slamming_against.wav', TRUE)
			range(5,usr) << "<b>WHAM!!!!!!</b> The sound of something slamming against the door is heard!"
			D.hits-=1
			if(D.hits<1)
				var/obj/Shattered_Door/c = new
				c.loc=A.loc
				del src
		else if(istype(A,/obj/Lockable_Door_Updown))
			var/obj/Lockable_Door/D
			soundmob(usr, 8, 'audio/slamming_against.wav', TRUE)
			range(5,usr) << "<b>WHAM!!!!!!</b> The sound of something slamming against the door is heard!"
			D.hits-=1
			if(D.hits<1)
				var/obj/Shattered_Door/c = new
				c.loc=A.loc
				del src
		else
			src.Approach2(src.target)
		if(istype(A,/turf))
			src.Approach2(src.target)
	New()
		walk_rand(src,0)
mob
    proc
        ZAI()
            set background=1
            var/allset=0
            //for(var/mob/P in oview(10))
            //  if(P)
            if(!src)return
            for(var/mob/D in world)
                if(D.z==src.z)
                    if(D.client&&D.dead==0)
                        var/ax=src.x-16
                        var/dx=src.x+16
                        var/ay=src.y-16
                        var/dy=src.y+16
                        if(D.x>=ax&&D.x<=dx&&D.y>=ay&&D.y<=dy)
                            allset=1
                        if(D in oview(src))
                            allset=2
            if(allset)
                for(var/mob/m in oview(16,src))
                    if(m in oview(16,src))
                        if(m.playing==1&&m.dead==0&&m.zombie==0)
                        //if(src.follow==m)
                            src.target=m
                            src.Approach(m)
                    else
                        for(var/mob/b in world)
                            if(b.playing==1&&b.dead==0&&m.zombie==0)
                                src.target=b
                                src.Approach2(b)
            else
                for(var/mob/m in world)
                    if(m.playing==1&&m.dead==0&&m.zombie==0)
                        if(m==src)goto nop
                        //if(src.follow==m)
                        src.target=m
                        src.Approach2(m)
                        :nop
            spawn(50)src.ZAI()
            //else
                //src.activated=0
              //  return