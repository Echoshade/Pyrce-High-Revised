obj
	Containers
		Drawers
			icon='containers.dmi'
			icon_state="drawers"
			density=1
		Book_Shelf
			icon='containers.dmi'
			icon_state="bookshelf 1"
			density=1
		Drawers2
			name="Drawers"
			icon='containers.dmi'
			icon_state="drawers 1"
			density=1
		Wooden_Box
			icon='containers.dmi'
			icon_state="large wooden box"
			density=1
		Trash_Can
			icon='containers.dmi'
			icon_state="trash can"
			density=1
		Storage_Container
			icon='containers.dmi'
			icon_state="storage 1"
			density=1
		School_Desk
			icon='containers.dmi'
			icon_state="school desk 2"
			density=1
		Teachers_Desk
			icon='containers.dmi'
			icon_state="teacherdesk1"
			density=1
		Bat_Bin
			icon='containers.dmi'
			icon_state="bat bin"
			density=1
		verb/Look_In()
			set src in oview(1)
			if(usr.shinigami==1)return
			if(hoarddelayer==1)return
			if(usr.zombie==1)return
			if(usr.playing==0)return
			usr.looking=src
			usr.client.statpanel="[src]"
		verb/Store()
			set src in oview(1)
			if(usr.shinigami==1)return
			if(hoarddelayer==1)return
			if(usr.playing==0)return
			var/obj/fisthold=null
			var/list/storage = new/list()
			for(var/obj/O in usr)
				storage+=O
				if(O.name=="Fists")
					storage-=O
					fisthold=O
				if(O.name=="Glasses Case")
					storage-=O
					fisthold=O
				if(O.name=="Nanatsu-Yoru")
					storage-=O
					fisthold=O
				storage+="Cancel"

			var/obj/O=input(usr,"What would you like to store?",storage) in storage
			if(O=="Cancel")return
			if(src in oview(1))
				if(O==usr.equipped)
					WeaponEquip(usr,fisthold)
				//src.contents+=O
				//CheckWeight2(usr,O)
				//usr.contents-=O
				//src.contents+=O
				for(var/obj/A in usr)
					if(A==O)
						usr.contents-=A
						src.contents+=A
		verb/Push()
			set src = oview(1)
			if(usr.playing==0)return
			if(usr.shinigami==1)return
			if(usr.isGhost==1)return
			if(usr.beatrice==1&&usr.icon=='butterfly.dmi')return
			for(var/mob/M in get_step(usr,usr.dir))
				if(M.playing==1)
					step(M,usr.dir)
					range(6,usr) << "[usr] shoves [src]"
					return
			for(src in get_step(usr,usr.dir))
				step(src,usr.dir,"Speed=0")
				range(6,usr) << "[usr] shoves the [src]"
				break

		verb/Pull()
			set name="Drag / Stop"
			set src in oview(1)
			if(usr.playing==0)return
			if(usr.beatrice==1&&usr.icon_state=="butterfly")return
			if(usr.shinigami==1)return
			if(usr.pulling&&usr.pulling==src)
				usr.pulling=null
				usr << "You stop dragging the [src]"
				return
			else if(usr.pulling)
				for(var/mob/M in oview(3,usr))
					if(M.pulling==src)
						var/rander=rand(1,3)
						if(rander==1)
							M.pulling=null
							M << "[usr] pulls the [src] away from you."
						else
							usr << "You failed to pull the [src] away from [M]."
							M << "[usr] tries to pull the [src] away from you"
							return
				usr.pulling=src
				usr << "You begin dragging the [src]"
				return
			else
				for(var/mob/M in oview(3,usr))
					if(M.pulling==src)
						var/rander=rand(1,3)
						if(rander==1)
							M.pulling=null
							M << "[usr] pulls the [src] away from you."
						else
							usr << "You failed to pull the [src] away from [M]."
							M << "[usr] tries to pull the [src] away from you"
							return
				usr.pulling=src
				usr << "You begin dragging the [src]"
		Click()
			if(src in oview(1,usr))
				if(usr.shinigami==1)return
				if(hoarddelayer==1)return
				if(usr.playing==0)return
				if(istype(src, /obj/Containers))
					usr.looking=src
					usr.client.statpanel="[src]"
				return
obj/Refigorator_Top
		name="Refridgerator"
		icon='containers.dmi'
		icon_state="fridge 2"
		density=1
obj
	Containers_Stationed
		Key_Locker
			icon='containers.dmi'
			icon_state="key locker"
			density=1
		Knife_Rack
			icon='containers.dmi'
			icon_state="knife rack"
			density=1
		Nurses_Closet
			icon='containers.dmi'
			icon_state="nurse closet"
			density=1
		Nurses_Closet2
			name="Nurses Closet"
			icon='containers.dmi'
			icon_state="nurse closet"
			density=1
		Refigorator_Bottom
			name="Refridgerator"
			icon='containers.dmi'
			icon_state="refigerator 1"
			density=1
		Cabinet
			icon='containers.dmi'
			icon_state="cabinet"
			density=1
		Office_Desk
			icon='containers.dmi'
			icon_state="desk 1"
			density=1
		Tool_Box
			icon='containers.dmi'
			icon_state="toolbox"
			density=1
		Counter
			icon='turfcafe.dmi'
			icon_state="counter"
			density=1
		Oven
			icon='turfcafe.dmi'
			icon_state="oven"
			density=1
		Locker
			icon = 'locker1.dmi'
			density=1
		verb/Look_In()
			set src in oview(1)
			if(usr.playing==0)return
			if(usr.beatrice==1&&usr.icon_state=="butterfly")return
			if(hoarddelayer==1)return
			if(usr.zombie==1)return
			usr.looking=src
			usr.client.statpanel="[src]"
		verb/Store()
			set src in oview(1)
			if(usr.shinigami==1)return
			if(hoarddelayer==1)return
			if(usr.playing==0)return
			var/obj/fisthold=null
			var/list/storage = new/list()
			for(var/obj/O in usr)
				storage+=O
				if(O.name=="Fists")
					storage-=O
					fisthold=O
				if(O.name=="Glasses Case")
					storage-=O
					fisthold=O
				if(O.name=="Nanatsu-Yoru")
					storage-=O
					fisthold=O
				storage+="Cancel"

			var/obj/O=input(usr,"What would you like to store?",storage) in storage
			if(O=="Cancel")return
			if(src in oview(1))
				if(O==usr.equipped)
					WeaponEquip(usr,fisthold)
				//src.contents+=O
				//CheckWeight2(usr,O)
				//usr.contents-=O
				//src.contents+=O
				for(var/obj/A in usr)
					if(A==O)
						usr.contents-=A
						src.contents+=A
		Click()
			if(src in oview(1,usr))
				if(usr.shinigami==1)return
				if(hoarddelayer==1)return
				if(usr.zombie==1)return
				if(usr.playing==0)return
				if(istype(src, /obj/Containers_Stationed))
					usr.looking=src
					usr.client.statpanel="[src]"
obj/colorbox
	icon='colorbox.dmi'
obj
	paintings
		die
			icon='paintings.dmi'
			icon_state="word: die"
			layer=TURF_LAYER
		cross
			icon='paintings.dmi'
			icon_state="cross"
			layer=TURF_LAYER
		pentagram
			icon='paintings.dmi'
			icon_state="pentagram"
			layer=TURF_LAYER
		circle
			icon='paintings.dmi'
			icon_state="circle"
			layer=TURF_LAYER
		circle9
			icon='paintings.dmi'
			icon_state="circle 9"
			layer=TURF_LAYER
		triangle
			icon='paintings.dmi'
			icon_state="triangle"
			layer=TURF_LAYER
		square
			icon='paintings.dmi'
			icon_state="square"
			layer=TURF_LAYER
		cross
			icon='paintings.dmi'
			icon_state="cross"
			layer=TURF_LAYER
		peacesign
			icon='paintings.dmi'
			icon_state="peace sign"
			layer=TURF_LAYER