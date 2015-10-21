var/adminlog=null
obj/var/dex=60

/*obj
	FirstSpawn
		icon='fakebuttons.dmi'
		icon_state="options"
		invisibility=101
		layer=4*/
turf
	Teleport_Doors
		Door_Way
			name="Door"
			icon='school.dmi'
			icon_state="doorway"


turf/
	VoidWalls
		icon='Void.dmi'
		name="Wall"
		density=1
		opacity=1

	VoidWallsFake
		icon='Void.dmi'
		name="Wall"
//		layer=TURF_LAYER
		density=0
		opacity=1

		//layer=3
	Stone_Path
		icon='school.dmi'
		Stone_Path_Light
			icon_state="stonel"
			name="Stone"
		Stone_Path_Dark
			icon_state="stoned"
			name="Stone"
turf
	Title
		name="Title Screen - Normal Mode"
		icon='gfx/titlescreen.png'
		density=1
		layer=30
	TitleSlender
	TitleNanaya
		name="Title Screen - Vampire Mode"
		icon='gfx/titlenanaya.png'
		density=1
		layer=30
	TitleArtist
	TitleZ
		name="Title Screen - Zombie Mode"
		icon='gfx/titlez.png'
		density=1
		layer=30
	TitleDN
		name="Title Screen - Death Note Mode"
		icon='gfx/titleDN.png'
		density=1
		layer=30
	TitleWitch
		name="Title Screen - Witch Mode"
		icon='gfx/title_witch.png'
		density=1
		layer=30
	TitleGhost
		name="Title Screen - Ghost Mode"
		icon='gfx/ghost.png'
		density=1
		layer=30
	TitleDoppelganger
		name="Title Screen - Doppelganger Mode"
		icon='gfx/title_dg.png'
		density=1
		layer=30
	TitleJM
	TitleSecret
		name="Title Screen - Secret Mode"
		icon='gfx/secret.png'
		density=1
		layer=30
	Locations
		Title
		TitleZ
		TitleJM
		TitleSlender
		TitleN
		TitleWitch
		TitleSecret
		TitleNanaya
		TitleDoppel
		TitleDN
		TitleArt
		Title_Ghost
	School_Floors
		School_Floor
			name="School Floor"
			icon='school.dmi'
			icon_state="regular floor"
		Bathroom_Floor
			name="Bathroom Floor"
			icon='school.dmi'
			icon_state="bathroom floor"
		Gym_Floor
			name="Gym Floor"
			icon='school.dmi'
			icon_state="gym"
	School_Walls
		White_Wall_Floor
			icon='school.dmi'
			icon_state="regular wall floor"
			name="Wall"
		Court_Yard_Wall_Floor
			name="Wall"
			icon='school.dmi'
			icon_state="court"
		Solid_Wall_Top
			name="Wall"
			icon='school.dmi'
			density=1
			icon_state="solidwall top"
		Solid_Wall_Middle
			name="Wall"
			density=1
			icon='school.dmi'
			icon_state="solidwall middle"
		White_Wall_Top
			name="Wall"
			icon='school.dmi'
			icon_state="regular wall top"
			density=1
		Short_White_Wall_Top
			name="Wall"
			icon='school.dmi'
			icon_state="short wall"
			density=1
		White_Wall_Middle
			name="Wall"
			icon='school.dmi'
			icon_state="regular wall"
			density=1
		Gym_Wall_Floor
			name="Wall"
			icon='school.dmi'
			icon_state="gymfloorwall"
		Gym_Wall_Floor_Red
			name="Wall"
			icon='school.dmi'
			icon_state="gymfloorwall2"
		Red_Wall
			icon = 'school.dmi'
			density = 1
			icon_state = "red wall"
			name="Wall"
		Red_Wall_Floor
			icon = 'school.dmi'
			density = 0
			icon_state = "red wall floor"
			name="Wall"
		Red_Wall_Top
			icon = 'school.dmi'
			density = 1
			icon_state = "red wall top"
			name="Wall"
	Rugs
		Rug
			icon='school.dmi'
			icon_state="rug"
		BLEFT
			icon='school.dmi'
			icon_state="blrug"
		BREFT
			icon='school.dmi'
			icon_state="brrug"
		TLEFT
			icon='school.dmi'
			icon_state="tlrug"
		TRIGHT
			icon='school.dmi'
			icon_state="trrug"
		Right
			icon='school.dmi'
			icon_state="rrug"
		Left
			icon='school.dmi'
			icon_state="lrug"
		Bottom
			icon='school.dmi'
			icon_state="rugbottom"
		Top
			icon='school.dmi'
			icon_state="rugtop"
	Staris_up
		name="Stairs"
		icon='turfstairs.dmi'
		icon_state="stairs up"
	Staris_down
		name="Stairs"
		icon='turfstairs.dmi'
		icon_state="stairs down"
	Staris_upleft
		name="Stairs"
		icon='turfstairs.dmi'
		icon_state="stairs up left"
	Staris_downleft
		name="Stairs"
		icon='turfstairs.dmi'
		icon_state="stairs down left"
	Staris_upright
		name="Stairs"
		icon='turfstairs.dmi'
		icon_state="stairs right"
	Staris_middle
		name="Stairs"
		icon='turfstairs.dmi'
		icon_state="stairs up middle"
	Staris_downright
		name="Stairs"
		icon='turfstairs.dmi'
		icon_state="stairs down middle"
	Staris_downmiddle
		name="Stairs"
		icon='turfstairs.dmi'
		icon_state="stairs down right"
	Bathroom_Walls
		Bathroom_Wall_Floor
			name="Bathroom Floor"
			icon='school.dmi'
			icon_state="bathroom wall floor"
		Bathroom_Wall_Middle
			name="Bathroom Wall"
			icon='school.dmi'
			icon_state="bathroom wall"
			density=1
		Bathroom_Wall_Middle_Top
			name="Bathroom Wall"
			icon='school.dmi'
			icon_state="bathroom wall top"
			density=1
	Court_Yard
		Grass
			icon='turfcourtyard.dmi'
			icon_state="grass"
		Wall_Floor_Grass
			name="Wall"
			icon='turfcourtyard.dmi'
			icon_state="regular wall floor"
	Basement
		Basement_Wall_Floor
			name="Basement Wall"
			icon='turfbasement.dmi'
			icon_state="floor 2 wall"
		Basement_Wall_Middle
			name="Basement Wall"
			icon='turfbasement.dmi'
			icon_state="wall"
			density=1
		Basement_Wall_Top
			name="Basement Wall"
			icon='turfbasement.dmi'
			icon_state="wall top"
			density=1
		Basement_Floor
			icon='turfbasement.dmi'
			icon_state="floor"
		Basement_Floor2
			name="Basement Floor"
			icon='turfbasement.dmi'
			icon_state="floor 2"
		Basement_Floor3
			name="Basement Floor"
			icon='turfbasement.dmi'
			icon_state="floor 3"
	Lounge
		Wall
			icon='turflongue.dmi'
			icon_state="regular wall"
			density=1
		Wall_Top
			name="Wall"
			icon='turflongue.dmi'
			icon_state="regular wall top"
			density=1
		Wall_Floor
			name="Wall"
			icon='turflongue.dmi'
			icon_state="regular wall floor"
		Floor
			name="Floor"
			icon='turflongue.dmi'
			icon_state="floor"
	Freezer
		Wall
			icon='turffreezer.dmi'
			icon_state="regular wall"
			density=1
		Wall_Top
			name="Wall"
			icon='turffreezer.dmi'
			icon_state="regular wall top"
			density=1
		Wall_Floor
			name="Wall"
			icon='turffreezer.dmi'
			icon_state="regular wall floor"
	Office
		Wall
			icon='turfoffice.dmi'
			icon_state="wall"
			density=1
		Wall_Top
			name="Wall"
			icon='turfoffice.dmi'
			icon_state="wall top"
			density=1
		Wall_Floor
			name="Wall"
			icon='turfoffice.dmi'
			icon_state="floor wall"
		Floor
			name="Floor"
			icon='turfoffice.dmi'
			icon_state="floor"
obj
	Spawns
		One
			icon='fakebuttons.dmi'
			icon_state="options"
			invisibility=101
		Two
			icon='fakebuttons.dmi'
			icon_state="options"
			invisibility=101
		Three
			icon='fakebuttons.dmi'
			icon_state="options"
			invisibility=101
		Four
			icon='fakebuttons.dmi'
			icon_state="options"
			invisibility=101
		Five
			icon='fakebuttons.dmi'
			icon_state="options"
			invisibility=101
		Six
			icon='fakebuttons.dmi'
			icon_state="options"
			invisibility=101
		Seven
			icon='fakebuttons.dmi'
			icon_state="options"
			invisibility=101
		Eight
			icon='fakebuttons.dmi'
			icon_state="options"
			invisibility=101
		Nine
			icon='fakebuttons.dmi'
			icon_state="options"
			invisibility=101
		Ten
			icon='fakebuttons.dmi'
			icon_state="options"
			invisibility=101
		Eleven
			icon='fakebuttons.dmi'
			icon_state="options"
			invisibility=101
		Twelve
			icon='fakebuttons.dmi'
			icon_state="options"
			invisibility=101
		Thirteen
			icon='fakebuttons.dmi'
			icon_state="options"
			invisibility=101
		Fourteen
			icon='fakebuttons.dmi'
			icon_state="options"
			invisibility=101
		Fifteen
			icon='fakebuttons.dmi'
			icon_state="options"
			invisibility=101
		Sixteen
			icon='fakebuttons.dmi'
			icon_state="options"
			invisibility=101
		Seventeen
			icon='fakebuttons.dmi'
			icon_state="options"
			invisibility=101
		Eighteen
			icon='fakebuttons.dmi'
			icon_state="options"
			invisibility=101

		Nineteen
			icon='fakebuttons.dmi'
			icon_state="options"
			invisibility=101
		Twenty
			icon='fakebuttons.dmi'
			icon_state="options"
			invisibility=101
		Twentyone
			icon='fakebuttons.dmi'
			icon_state="options"
			invisibility=101
		Twentytwo
			icon='fakebuttons.dmi'
			icon_state="options"
			invisibility=101
		Watcher
			icon='fakebuttons.dmi'
			icon_state="options"
			invisibility=101
		ShiniSpawn
			icon='fakebuttons.dmi'
			icon_state="options"
			invisibility=101
		EscapedSpawn
			icon='fakebuttons.dmi'
			icon_state="options"
			invisibility=101
	Zombie_Spawn
		name=""
		icon='fakebuttons.dmi'
		icon_state="options"
		invisibility=101
	Court_Yard_Glass
		name="Grass"
		icon='GFX/courtyardglass.png'
		name=""


area
	AlwaysDark
		luminosity=0
	Hallways
obj/SmokeOverlay
	name=""
	icon='smokey.dmi'
	layer=10
obj
	Left_Side_Bench
		name="Bench"
		icon='placeables.dmi'
		icon_state="bench 1"
	Right_Side_Bench
		name="Bench"
		icon='placeables.dmi'
		icon_state="bench 2"
	Court_Yard_Glass
		icon='GFX/courtyardglass.png'
		name=""
mob/proc/Blindme()
	src << "You're blinded by the strange flash"
	src.sight |= BLIND
	sleep(30)
	src.sight &= ~BLIND
turf/
	VoidWalls
		icon='Void.dmi'
		name=""
		density=1
		opacity=1
	VoidWallsFake
		icon='Void.dmi'
		name=""
		layer=7
		density=0
		opacity=1
obj/Misc
	Flash_Light
		icon='items_miscellaneous.dmi'
		icon_state="flashlight"
		verb
			Pick_Up()
				set src in oview(1)
				var/Y=CheckPlayer(usr)
				if(Y==1)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				//if(src==usr.equipped)return
				Move(usr.loc,src)
			Use()
	Glasses_Case
		icon='items_miscellaneous.dmi'
		icon_state="glasses case"
		verb
			Wear()
				set name="Wear / Put Away"
				var/Y=CheckPlayer(usr)
				if(Y==1)return
				if(usr.glassesoff==0)
					usr.glassesoff=1
					usr.addlines()
					usr << "You take off your glasses, the Mystic Eyes of Death Perception begin to show allowing you to cut them."
				else
					usr.glassesoff=0
					usr.remlines()
					usr << "You put your glasses back on, the Mystic Lines fade away."

	Black_Feather
		icon='items_miscellaneous.dmi'
		icon_state="feather inventory"
		verb
			Pick_Up()
				set src in oview(1)
				var/Y=CheckPlayer(usr)
				if(Y==1)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				//if(src==usr.equipped)return
				Move(usr.loc,src)
			Use()
				set src in usr
				set category = null
				var/Y=CheckPlayer(usr)
				if(Y==1)return
				usr.Dragon_Shoot()
		MouseDrag()
			if(src in usr)
				var/icon/I = new(src.icon,src.icon_state)
				mouse_drag_pointer = I

		MouseDrop(over_object=src,src_location,over_location, src_control,over_control,params)
			if(over_control == "ingame.Slot1")
				usr.slot1=src
				winset(usr,"ingame.Slot1","text=\"Press 1 for [src.name]\"")
			else if(over_control == "ingame.Slot2")
				usr.slot2=src
				winset(usr,"ingame.Slot2","text=\"Press 2 for [src.name]\"")
			else if(over_control == "ingame.Slot3")
				usr.slot3=src
				winset(usr,"ingame.Slot3","text=\"Press 3 for [src.name]\"")
			else if(over_control == "ingame.Slot4")
				usr.slot4=src
				winset(usr,"ingame.Slot4","text=\"Press 4 for [src.name]\"")
			else if(over_control == "ingame.Slot5")
				usr.slot5=src
				winset(usr,"ingame.Slot5","text=\"Press 5 for [src.name]\"")
	Poppers
		name="Poppers"
		icon='items_miscellaneous.dmi'
		icon_state="poppers"
		idesc="Poppers, set them as a trap or simply just scare others with its loud popping sound!"
		var/popped=0
		verb
			Pick_Up()
				set src in oview(1)
				var/Y=CheckPlayer(usr)
				if(Y==1)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				//if(src==usr.equipped)return
				Move(usr.loc,src)
	Tape
		name="Tape"
		icon='items_miscellaneous.dmi'
		icon_state="tape inv"
		idesc="Tape, this may have an interesting use if used with the right items.."
		//idesc="Poppers, set them as a trap or simply just scare others with its loud popping sound!"
		verb
			Pick_Up()
				set src in oview(1)
				var/Y=CheckPlayer(usr)
				if(Y==1)return
				icon_state="tape inv"
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				//if(src==usr.equipped)return
				icon_state="tape"
				Move(usr.loc,src)
			Use()
				set src in usr
				set category = null
				if(usr.playing==null)return
				var/obj/goods=null
				var/obj/goods2=null
				for(var/obj/O in usr)
					if(istype(O,/obj/weapons/Knife))
						goods=O
					if(istype(O,/obj/weapons/Mop))
						goods2=O
				if(goods&&goods2)
					var/yn=input(usr,"Looks like you have the knife and mop to use the tape on, do you want to try and craft a spear with it?") in list("Yes","No")
					if(yn=="No")return
					else
						var/check1=0
						var/check2=0
						for(var/obj/O in usr)
							if(istype(O,/obj/weapons/Knife))
								check1=1
							if(istype(O,/obj/weapons/Mop))
								check2=1
						if(check1==1&&check2==1)
							del goods
							del goods2
							usr.frozen=1
							usr << "You begin to craft a spear using the knife, tape and mop."
							sleep(50)
							usr.frozen=0
							var/rnd=rand(1,2)
							if(rnd==1)
								usr << "You crafted the spear successfully!"
								var/obj/weapons/Spear/I=new
								usr.contents+=I
								del src
							else
								usr << "You failed to make the spear, losing all the items you had..."
								del src
	Smoke_Bomb
		name="Smoke Bomb"
		icon='items_miscellaneous.dmi'
		icon_state="smoke bomb"
		idesc="A smoke bomb, these are fun to play ninja with!"
		var/popped=0
		verb
			Pick_Up()
				set src in oview(1)
				var/Y=CheckPlayer(usr)
				if(Y==1)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				//if(src==usr.equipped)return
				Move(usr.loc,src)
			Use()
				set src in usr
				set category = null
				if(usr.playing==null)return
				var/rander=rand(1,15)
				if(rander==1)
					usr.SmokeBomb()
				else
					usr.SmokeBomb2()
	Med_Kit
		name="First-Aid Kit"
		icon='items_miscellaneous.dmi'
		icon_state="first aid kit"
		idesc="A first-aid kit, you can patch yourself up if you're wounded, or someone else too!"
		iweight=4
		verb
			Pick_Up()
				set src in oview(1)
				var/Y=CheckPlayer(usr)
				if(Y==1)return
				if(hoardlimit=="On")
					var/kits=0
					for(var/obj/O in usr)
						if(O.type==src.type)
							kits+=1
					if(kits>2)
						usr << "You seem to be carrying enough First-Aid Kit's at the present time."
						return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				//if(src==usr.equipped)return
				Move(usr.loc,src)
			Use()
				set src in usr
				set category = null
				var/Y=CheckPlayer(usr)
				if(Y==1)return
				var/counter=0
				for(var/mob/A in view(1))
					counter+=1
				if(counter>0)
					var/pp2=ShowAlert(usr,"Medical Kit will patch you up if you're badly wounded. < < Would you like you use it on yourself or another?",list("Self","Other","X"))
					if(pp2=="Self")
						if(usr.hp>99)
							usr << "You don't seem to be hurt..."
							return
						var/hper=100-usr.hp
						var/hper2=hper/2
						usr << "You patch yourself up."
						usr.hp+=round(hper2)
						usr.updatehp()
						del src
						if(usr.hp>100)
							usr.hp=100
					else if(pp2=="Other")
						var/list/medder=new/list()
						for(var/mob/player/A in oview(1))
							medder+=A
						var/mob/M=input(usr,"Who do you want to patch up?","First Aid Kit") in medder
						if(M.hp>99)
							usr << "They seem to be hurt..."
							return
						var/hper=100-M.hp
						var/hper2=hper/2
						usr << "You patched up [M]."
						M << "You have been patched up by [usr]."
						M.hp+=round(hper2)
						if(M.hp>100)
							M.hp=100
						M.updatehp()
						del src
	Syringe
		name="Empty Syringe"
		icon='items_miscellaneous.dmi'
		icon_state="syringe empty"
		idesc="A syringe, it can be filled with viles of medicines"
		var/inside=null
		iweight=0.5
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.playing==0||usr.shinigami==1)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				//if(src==usr.equipped)return
				Move(usr.loc,src)
			Use()
				set src in usr
				if(usr.shinigami==1||usr.zombie==1)return
				var/peeps=0
				for(var/mob/M in oview(1,usr))
					peeps+=1
				if(inside!=null)
					var/list/choo=list("Inject Self","Inject Other","Cancel")
					if(peeps==0)choo-="Other"
					var/yn=input(usr,"What do you want to do?") in choo
					if(yn=="Inject Self")
						if(inside=="Cure")
							usr.infected=0
							usr.infection=0
							inside=null
							usr << "Your humanity begins to return as the drug slowly flows threw your veins."
							suffix=""
							name="Empty Syringe"
						else if(inside=="Regenerative")
							usr.hp+=rand(1,50)
							if(usr.hp>100)usr.hp=100
							usr.updatehp()
							usr << "Your body heats up as the wounds on your body quietly fade away."
							inside=null
							suffix=""
							name="Empty Syringe"
						else if(inside=="Sedetive")
							usr << "Ouch, something was wrong with that injection!"
							var/orig=usr.move_speed
							usr.move_speed=9
							inside=null
							name="Empty Syringe"
							spawn(100)usr.move_speed=orig
					if(yn=="Inject Other")
						var/list/peoples=new/list()
						for(var/mob/M in oview(1,usr))
							if(M.client)
								peoples+=M
							peoples+="Cancel"
						var/mob/A=input(usr,"Who do you want to inject with the [inside]?") in peoples
						if(A=="Cancel")return
						if(inside=="Cure")
							A.infected=0
							A.infection=0
							inside=null
							A << "Ouch! [usr] has injected you with something."
							suffix=""
							name="Empty Syringe"
						else if(inside=="Regenerative")
							A.hp+=rand(1,50)
							if(A.hp>100)A.hp=100
							A.updatehp()
							A << "Ouch! [usr] has injected you with something."
							inside=null
							suffix=""
							name="Empty Syringe"
						else if(inside=="Sedetive")
							var/orig=A.move_speed
							A << "Ouch! [usr] has injected you with something."
							A.move_speed=9
							spawn(100)A.move_speed=orig
							name="Empty Syringe"
							inside=null
					else return
	Infection_Cure
		name="Cure"
		icon='items_miscellaneous.dmi'
		icon_state="vial green"
		idesc="Medicine labeled 'Cure', how lucky."
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.playing==0)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				//if(src==usr.equipped)return
				Move(usr.loc,src)
			Use()
				set src in usr
				set category = null
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				if(usr.zombie==1)return
				var/counter=0
				for(var/obj/Misc/Syringe/O in usr)
					if(O.suffix==null||O.inside==null)
						if(counter>1)return
						O.suffix="Cure"
						O.name="Filled Syringe"
						O.inside="Cure"
						counter+=1
						del src
						return
						break

				usr << "If only you had an empty syringe..."
				return
	Soda
		icon='soda.dmi'
		idesc="A nice cold soda, sounds refreshing, right?"
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.playing==0)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				//if(src==usr.equipped)return
				Move(usr.loc,src)
			Drink()
				set src in usr
				set category = null
				if(usr.playing==0)return
				usr << "You drink the soda, feeling much more energized."
				usr.stamina+=rand(10,60)
				if(usr.stamina>99)usr.stamina=100
				usr.updatesp()
				del src
	Yen
		icon='money.dmi'
		curamount=25
		idesc="Oh wow, if you get enough of these you could probably buy a soda, or something."
		verb
			Pick_Up()
				set src in oview(1)
				var/Y=CheckPlayer(usr)
				if(Y==1)return
				//Move(usr,src)
				for(var/obj/O in usr)
					if(O.type==/obj/Misc/Yen)
						O.curamount+=src.curamount
						O.suffix="[O.curamount]"
						del src
						break
					else
						Move(usr,src)
						src.suffix="[curamount]"
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				//if(src==usr.equipped)return
				Move(usr.loc,src)
	Super_Regenerative
		name="Super Regenerative"
		iweight=0.1
		icon='items_miscellaneous.dmi'
		idesc="A Regenerative, looks like it may help you if you're wounded, you need a syringe to use it"
		icon_state="vial blue"
		verb
			Pick_Up()
				set src in oview(1)
				var/Y=CheckPlayer(usr)
				if(Y==1)return
				Move(usr,src)

			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				//if(src==usr.equipped)return
				Move(usr.loc,src)
			Use()
				set src in usr
				set category = null
				var/Y=CheckPlayer(usr)
				if(Y==1)return
				var/counter=0
				for(var/obj/Misc/Syringe/O in usr)
					if(O.suffix==null||O.inside==null)
						if(counter>1)return
						O.suffix="Super Regenerative"
						O.name="Filled Syringe"
						O.inside="Regenerative"
						counter+=1
						del src
						return
						break
				usr << "If only you had an empty syringe..."
				return
	Mild_Sedetive
		icon='items_miscellaneous.dmi'
		icon_state="vial green"
		idesc="A sedetive, if you fill a syringe with it I think you can inject someone with it!"
		verb
			Pick_Up()
				set src in oview(1)
				var/Y=CheckPlayer(usr)
				if(Y==1)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				var/Y=CheckPlayer(usr)
				if(Y==1)return
				//if(src==usr.equipped)return
				Move(usr.loc,src)
			Use()
				set src in usr
				set category = null
				var/Y=CheckPlayer(usr)
				if(Y==1)return
				var/counter=0
				for(var/obj/Misc/Syringe/O in usr)
					if(O.suffix==null||O.inside==null)
						if(counter>1)return
						O.suffix="Sedetive"
						O.name="Filled Syringe"
						O.inside="Sedetive"
						counter+=1
						del src
						return
						break
				usr << "If only you had an empty syringe..."
				return
	Death_Note2
		name="Death Note"
		icon='items_miscellaneous.dmi'
		icon_state="death note"
		idesc="A book with the words 'Death Note' written across it in english, this book gives me the creeps just looking at it"
		var/names=null
		var/msg=null
		iweight=2
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.playing==0)return
				Move(usr,src)
				for(var/mob/A in world)
					if(A.isL==1)
						for(var/obj/Misc/PDA/O in A)
							if(A==usr&&O.number==A.originalnum&&A.LContacted==0)
								var/rpt=alert(usr,"Would you like to report finding this strange book back to head-quarters?") in list("Yes","No")
								if(rpt=="Yes")
									range(5,O) << sound('cellphone_answer.wav')
									A << "<B>Incoming text message from an unknown number."
									O.msg+="Message from: ????,    Hello, this notebook seems to be what is causing the deaths? Hold on to this until we can get back up there for you, it should be around 6AM!"
									return
								else
									return
							if(O.number==A.originalnum&&A.LContacted==0)
								var/rnf=rand(1,2)
								var/ccol="Blue"
								var/wr=0
								var/ppb=rand(1,20)
								if(rnf==1)
									ccol=usr.haircolor
									wr=1
								else
									ccol=pick("Blue","Pink","Red","Silver","White","Green")
								A.LContacted=1
								range(5,O) << sound('cellphone_answer.wav')
								A << "<B>Incoming text message from an unknown number."
								O.msg+="Message from: ????,    Hello, after further investigation of this case I am fairly sure that the culprit has [ccol] colored hair with the probability of [ppb]%."
								DetectiveStuff(A,wr)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				winshow(usr,"deathnote",0)
				Move(usr.loc,src)
			Open()
				set src in usr
				set category = null
				var/Y=CheckPlayer(usr)
				if(Y==1)return
				winshow(usr,"deathnote",1)
				winshow(usr,"writename",0)
				winshow(usr,"dnpage",0)
			WriteName()
				set src in usr
				set hidden = 1
				set category=null
				var/Y=CheckPlayer(usr)
				if(Y==1)return
				var/good=0
				var/good2=0
				for(var/obj/O in usr)
					if(O.type==/obj/Misc/Death_Note2)
						good2=1
						break
				for(var/obj/O in usr)
					if(O.type==/obj/Misc/Pencil)
						good=1
						break
					else if(usr.bloody>0)
						good=1
				if(good2==0)
					usr << "Where is that Death Note.."
					return
				if(good==0)
					usr << "If only you had a pencil.."
					return
				winshow(usr,"DeathNoteWin",1)
			Submitdn()
				set hidden=1
				set category=null
				winshow(usr,"DeathNoteWin",0)
				var/Y=CheckPlayer(usr)
				if(Y==1)return
//				winshow(usr,"writename",0)
//				winshow(usr,"dnpage",0)
				var/good2=0
				var/good=0
				for(var/obj/O in usr)
					if(O.type==/obj/Misc/Death_Note2)
						good2=1
						break
				for(var/obj/O in usr)
					if(O.type==/obj/Misc/Pencil)
						good=1
						break
					else if(usr.bloody>0)
						good=1
				if(good2==0)
					usr << "Where is that Death Note.."
					return
				if(good==0)
					usr << "If only you had a pencil.."
					return
				var/target=winget(usr, "named", "text")
				var/msg=winget(usr, "cod", "text")
				var/times=winget(usr, "tod", "text")
				times=uppertext(times)
				if(times in DNTimes)
					goto goodtime
				else
					return
				:goodtime
				//else
				winset(usr, "named","text=")
				winset(usr, "cod","text=")
				winset(usr, "tod","text=")
				if(target=="God Of Death")return
				if(target=="Shinigami")return
				//for(var/obj/Misc/Death_Note2/O in usr)
				names+="[target] [msg] [times]<BR>"
				msg+="[msg]<BR>"
				usr << output("[target] [msg] [times]","dnpage")
				range(6,usr) << sound('audio/writing.wav')
				target=lowertext(target)
				if(target=="god of death")return
				if(target=="shinigami")return
				if(times=="")
					for(var/mob/player/A in alivelist)
						if(A.playing==0)return
						spawn(400)
							if(A.playing==0)return
							if(lowertext(A.realname)==target)
								if(target=="god of death")return
								if(target=="shinigami")return
								if(msg=="")
									if(A.playing==0)return
									A << "<i>There is an amazingly tight knot in your chest."
									if(A.playing==0)return
									sleep(50)
									range(8,A) << "<i>[A] grabs at their chest, collapsing to the ground."
									if(A.playing==0)return
									A.DeathNoted()
									usr << sound(bodyfall,volume=30)
									return
								else
									if(A.playing==0)return
									A << "<i>There is something wrong with you...."
									if(A.playing==0)return
									sleep(50)
									range(8,A) << "<i>[A] [msg]"
									A.DeathNoted()
									return
				else
					for(var/mob/player/A in alivelist)
						if(lowertext(A.realname)==target)
							if(target=="god of death")return
							if(target=="shinigami")return
							if(A.playing==0)return
							kiradie+=params2list("[A.realname]=[times]")
/*	Shini_Death_Note
		name="Death Note"
		icon='items_miscellaneous.dmi'
		icon_state="death note"
		idesc="A book with the words 'Death Note' written across it in english, this book gives me the creeps just looking at it"
		var/names=null
		var/msg=null
		iweight=2
		verb
			Open()
				set src in usr
				set category = null
				var/Y=CheckPlayer(usr)
				if(Y==1)return
				winshow(usr,"deathnote",1)
				winshow(usr,"writename",0)
				winshow(usr,"dnpage",0)
			WriteName()
				set src in usr
				set hidden = 1
				set category=null
				var/Y=CheckPlayer(usr)
				if(Y==1)return
				winshow(usr,"DeathNoteWin",1)
			Submitdn()
				set hidden=1
				set category=null
				winshow(usr,"DeathNoteWin",0)
				var/Y=CheckPlayer(usr)
				if(Y==1)return
//				winshow(usr,"writename",0)
//				winshow(usr,"dnpage",0)
				var/target=winget(usr, "named", "text")
				var/msg=winget(usr, "cod", "text")
				var/times=winget(usr, "tod", "text")
				times=uppertext(times)
				if(times in DNTimes)
					goto goodtime
				else
					return
				:goodtime
				//else
				winset(usr, "named","text=")
				winset(usr, "cod","text=")
				winset(usr, "tod","text=")
				if(target=="God Of Death")return
				if(target=="Shinigami")return
				for(var/obj/Misc/Death_Note2/O in usr)
					O.names+="[target] [msg] [times]<BR>"
					O.msg+="[msg]<BR>"
				usr << output("[target] [msg] [times]","dnpage")
				range(6,usr) << sound('audio/writing.wav')
				target=lowertext(target)
				if(target=="god of death")return
				if(target=="shinigami")return
				if(times=="")
					for(var/mob/player/A in alivelist)
						if(A.playing==0)return
						spawn(400)
							if(A.playing==0)return
							if(lowertext(A.realname)==target)
								if(target=="god of death")return
								if(target=="shinigami")return
								if(msg=="")
									if(A.playing==0)return
									A << "<i>There is an amazingly tight knot in your chest."
									if(A.playing==0)return
									sleep(50)
									range(8,A) << "<i>[A] grabs at their chest, collapsing to the ground."
									if(A.playing==0)return
									A.DeathNoted()
									usr << sound(bodyfall,volume=30)
									return
								else
									if(A.playing==0)return
									A << "<i>There is something wrong with you...."
									if(A.playing==0)return
									sleep(50)
									range(8,A) << "<i>[A] [msg]"
									A.DeathNoted()
									return
				else
					for(var/mob/player/A in alivelist)
						if(lowertext(A.realname)==target)
							if(target=="god of death")return
							if(target=="shinigami")return
							if(A.playing==0)return
							kiradie+=params2list("[A.realname]=[times]")*/
	Death_Note
		icon='items_miscellaneous.dmi'
		icon_state="death note"
		idesc="A book with the words 'Death Note' written across it, this book gives me the creeps just looking at it"
		var/names=null
		var/msg=null
		var/shiniwrote=0
		iweight=2
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.playing==0)return
				Move(usr,src)
				usr.toucheddn=1
				usr.see_invisible=50
				for(var/mob/A in world)
					if(A.shinigami==1)
						A.addnamer(src)
					if(A.isL==1)
						for(var/obj/Misc/PDA/O in A)
							if(A==usr&&O.number==A.originalnum&&A.LContacted==0)
								var/rpt=alert(usr,"Would you like to report finding this strange book back to head-quarters?") in list("Yes","No")
								if(rpt=="Yes")
									range(5,O) << sound('cellphone_answer.wav')
									A << "<B>Incoming text message from an unknown number."
									O.msg+="Message from: ????,    Hello, this notebook seems to be what is causing the deaths? Hold on to this until we can get back up there for you, it should be around 6AM!"
									return
								else
									return
							if(O.number==A.originalnum&&A.LContacted==0)
								var/rnf=rand(1,2)
								var/ccol="Blue"
								var/wr=0
								var/ppb=rand(1,20)
								if(rnf==1)
									ccol=usr.haircolor
									wr=1
								else
									ccol=pick("Blue","Pink","Red","Silver","White","Green")
								A.LContacted=1
								range(5,O) << sound('cellphone_answer.wav')
								A << "<B>Incoming text message from an unknown number."
								O.msg+="Message from: ????,    Hello, after further investigation of this case I am fairly sure that the culprit has [ccol] colored hair with the probability of [ppb]%."
								DetectiveStuff(A,wr)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				winshow(usr,"deathnote",0)
				Move(usr.loc,src)
			Open()
				set src in usr
				set category = null
				if(usr.playing==0)return
				//if(usr.shinigami==1)return
				if(usr.zombie==1)return
				winshow(usr,"deathnote",1)
				winshow(usr,"writename",0)
				winshow(usr,"dnpage",0)
			WriteName()
				set src in usr
				set hidden = 1
				set category=null
				var/Y=CheckPlayer(usr)
				if(Y==1)return
				var/good=0
				var/good2=0
				for(var/obj/O in usr)
					if(O.type==/obj/Misc/Death_Note)
						good2=1
						break
				for(var/obj/O in usr)
					if(O.type==/obj/Misc/Pencil)
						good=1
						break
					else if(usr.bloody>0)
						good=1
				if(good2==0)
					usr << "Where is that Death Note.."
					return
				if(good==0)
					usr << "If only you had a pencil.."
					return
				winshow(usr,"DeathNoteWin",1)
			Submitdn()
				set hidden=1
				set category=null
				winshow(usr,"DeathNoteWin",0)
				if(usr.shinigami==1)goto shiner
				var/Y=CheckPlayer(usr)
				if(Y==1)return
				var/good2=0
				var/good=0
				for(var/obj/O in usr)
					if(O.type==/obj/Misc/Death_Note)
						good2=1
						break
				for(var/obj/O in usr)
					if(O.type==/obj/Misc/Pencil)
						good=1
						break
					else if(usr.bloody>0)
						good=1
				if(good2==0)
					usr << "Where is that Death Note.."
					return
				if(good==0)
					usr << "If only you had a pencil.."
					return
				:shiner
				var/target=winget(usr, "named", "text")
				var/msg=winget(usr, "cod", "text")
				var/times=winget(usr, "tod", "text")
				times=uppertext(times)
				if(times in DNTimes)
					goto goodtime
				else
					return
				:goodtime
				//else
				winset(usr, "named","text=")
				winset(usr, "cod","text=")
				winset(usr, "tod","text=")
				if(target=="God Of Death")return
				if(target=="Shinigami")return
				for(var/obj/Misc/Death_Note/O in usr)
					O.names+="[target] [msg] [times]<BR>"
					O.msg+="[msg]<BR>"
				usr << output("[target] [msg] [times]","dnpage")
				range(6,usr) << sound('audio/writing.wav')
				target=lowertext(target)
				if(usr.shinigami&&shiniwrote==1)return
				if(usr.shinigami==1)shiniwrote=1
				if(target=="god of death")return
				if(target=="shinigami")return
				if(times=="")
					for(var/mob/player/A in alivelist)
						//if(A.playing==0)return
						if(usr.shinigami==1)
							shiniwrote=1
							ShinigamiDie(usr)
						if(lowertext(A.realname)==target)
							spawn(400)
								if(target=="god of death")return
								if(target=="shinigami")return
								if(msg=="")
									if(A.playing==0)return
									A << "<i>There is an amazingly tight knot in your chest."
									sleep(50)
									if(A.playing==0)return
									range(8,A) << "<i>[A] grabs at their chest, collapsing to the ground."
									if(A.playing==0)return
									A.DeathNoted()
									usr << sound(bodyfall,volume=30)
									return
								else
									if(A.playing==0)return
									sleep(50)
									A << "<i>There is something wrong with you...."
									if(A.playing==0)return
									range(8,A) << "<i>[A] [msg]"
									A.DeathNoted()
									return
				else
					for(var/mob/player/A in alivelist)
						if(lowertext(A.realname)==target)
							if(target=="god of death")return
							if(target=="shinigami")return
							if(A.playing==0)return
							kiradie+=params2list("[A.realname]=[times]")
			Tear_Page()
				set src in usr
				set category=null
				var/torn=0
				if(usr.shinigami==1&&torn>2)
					usr << "You shouldn't tear too many more of the pages out."
					return
				if(torn>4)
					usr << "Afraid your pages are limited now, you shouldn't tear anymore out."
					return
				var/obj/Misc/DN_Paper_Sheet/O = new/obj/Misc/DN_Paper_Sheet
				torn+=1
				usr.weight+=1
				usr.contents+=O
	School_Computer
		icon='placeables.dmi'
		icon_state="computer"
		var/names=null
		var/msg=null
		verb
			Use()
				set src in oview(1)
				var/Y=CheckPlayer(usr)
				if(Y==1)return
				if(computeruse=="On")
					for(var/obj/Switch_For_Lights/O in world)
						if(O.tag=="Principal's Office")
							if(O.power=="Off")
								usr << "The power seems to be off."
								return
					usr << browse_rsc('GFX/folder.png', "blah")
					usr << browse(sotcdb,"window=Roster;can_close=1")
					usr.computer=1
				else
					usr << "It doesn't seem to be responding.."
	Pencil
		icon='items_miscellaneous.dmi'
		icon_state="pencil"
		idesc="Look's like an average pencil to write things with"
		var/names=null
		var/msg=null
		iweight=1
		verb
			Pick_Up()
				set src in oview(1)
				var/Y=CheckPlayer(usr)
				if(Y==1)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				var/Y=CheckPlayer(usr)
				if(Y==1)return
				//if(src==usr.equipped)return
				Move(usr.loc,src)
	Nails
		icon='items_miscellaneous.dmi'
		icon_state="nails"
		idesc="If you had a hammer and other tools, this could probably be handy"
		var/names=null
		var/msg=null
		iweight=0.1
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				//if(src==usr.equipped)return
				Move(usr.loc,src)
			Use()
				set src in usr
				set category = null
				if(usr.playing==0)return
				var/good=0
				var/good2=0
				for(var/obj/O in usr)
					if(O.type==/obj/weapons/Wooden_Bat)
						if(usr.equipped==O)
							usr << "Unequip it first."
							return
						good=1
					if(O.type==/obj/weapons/Hammer)
						good2=1
				if(good==1&&good2==1)
					var/pp2=CustAlert(usr,"Would you like to use the nails on your wooden bat?",list("Yes","No"),5,4,13,7)
					if(pp2=="Yes")
						soundmob(usr, 7, 'audio/nailing.ogg', TRUE)
						usr.frozen=1
						sleep(30)
						usr.frozen=0
						var/rander=rand(1,15)
						if(rander==1)
							usr << "You failed at hammering the nails in correctly and destroyed the Wooden Bat."
							for(var/obj/weapons/O in usr)
								if(O.type==/obj/weapons/Wooden_Bat)
									del O
									break
							del src
						else
							for(var/obj/O in usr)
								if(O.type==/obj/weapons/Wooden_Bat)
									del O
									break
							usr << "You hammer the nails into the bat"
							var/obj/weapons/Nailed_Bat/A=new
							usr.contents+=A
							del src
	Mystia_Coin
		icon='items_miscellaneous.dmi'
		icon_state="sparrow coin inventory"
		var/names=null
		var/msg=null
		iweight=0.1
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				//if(src==usr.equipped)return
				Move(usr.loc,src)
	Glow_Stick
		icon='glowstick.dmi'
		icon_state="glowstick"
		idesc="Looks like a toy glow stick that goes around your neck or wrist"
		var/names=null
		var/msg=null
		iweight=0.1
		New()
			..()
			spawn(25)src.sd_SetLuminosity(2)
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				//if(src==usr.equipped)return
				Move(usr.loc,src)
	Key_Card1
		name="Key Card"
		icon='items_miscellaneous.dmi'
		icon_state="keycard inventory"
		var/names=null
		var/msg=null
		iweight=0.1
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.shinigami==1)return
				if(usr.playing==0)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				//if(src==usr.equipped)return
				Move(usr.loc,src)
	Key_Card
		name="Key Card"
		icon='items_miscellaneous.dmi'
		icon_state="keycard inventory2"
		idesc="Lucky! This is one of the only two key cards in the entire school!"
		var/names=null
		var/msg=null
		iweight=0.1
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				icon_state="keycard2"
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				icon_state="keycard inventory2"
				//if(src==usr.equipped)return
				Move(usr.loc,src)
	Door_Code
		name="???"
		icon='items_miscellaneous.dmi'
		icon_state="notepaper"
		idesc="?????????"
		var/writing=null
		var/names=null
		var/msg=null
		iweight=0.1
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				Move(usr.loc,src)
			View()
				set name="Read"
				set src in usr
				set category = null
				var/writer={"<html><title>???</title><body><STYLE>BODY{background-color: black; color:white}</STYLE><table cellpadding="0" cellspacing="0" border="0" align="center"><td><p>[doornumber]<p></td></table></body></html>"}
				usr<<browse(writer,"window=Motd;size=320x420;can_close=1;can_resize=1;can_minimize=1")
	Strange_Paper_Sheet
		icon='items_miscellaneous.dmi'
		icon_state="paper sheet inventory2"
		var/writing=null
		var/names=null
		var/msg=null
		var/airplane=0
		iweight=1
		idesc="A piece of paper, you can probably write on this."

	Paper_Sheet
		icon='items_miscellaneous.dmi'
		icon_state="paper sheet inventory"
		var/writing=null
		var/names=null
		var/msg=null
		var/airplane=0
		iweight=1
		idesc="A piece of paper, you can probably write on this."
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				icon_state="paper sheet inventory"
				Move(usr,src)
				if(airplane==1)
					icon='items_miscellaneous.dmi'
					icon_state="paper sheet inventory"
					airplane=0
					usr << "You unfold the paper airplane back into a Sheet Paper."
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				icon_state="paper sheet"
				Move(usr.loc,src)
			Write_On()
				set name="Write"
				set src in usr
				var/good=0
				set category = null
				if(usr.zombie==1)return
				for(var/obj/O in usr)
					if(O.type==/obj/Misc/Pencil)
						good=1
						break
					else if(usr.bloody>0)
						good=1
				if(good==0)
					usr << "If only you had a pencil.."
					return
				var/writer=input(usr,"What do you want to write?")as null|message
				writer=html_encode(writer)
				range(6,usr) << sound('audio/writing.wav')
				src.writing+="[writer]<BR>"
				adminlog+="<font color=red>[usr.key]([usr]) wrote [writer] on the paper sheet<BR>"
			View()
				set name="Read"
				set src in usr
				set category = null
				if(usr.zombie==1)return
				usr << browse_rsc('GFX/pagetest.png', "bleh")
				var/writer={"<html><title>Paper Sheet</title><body><STYLE>BODY{background: url("bleh");background-color: black; color:white}</STYLE><table cellpadding="0" cellspacing="0" border="0" align="center"><td><p><font color=black>[writing]<p></td></table></body></html>"}
				usr<<browse(writer,"window=Motd;size=320x420;can_close=1;can_resize=1;can_minimize=1")
			Make_Paper_Airplane()
				set src in usr
				set category=null
				if(usr.frozen==1)return
				//var/obj/Paperplane/T = new // Define the object T to be the trail
				usr.frozen=1
				usr.weight-=src.iweight
				usr<<"You begin folding the paper"
				sleep(30)
				range(4,usr)<<"<i>[usr] throws a paper airplane</i>"
				usr.frozen=0
				icon='paperplane.dmi'
				airplane=1
				//var/X = turn(src.dir,180) // Define X to be 180 turn of the source's direction
				src.loc = usr.loc // Spawn it behind the src
				src.dir = usr.dir // Give them same direction
				src.density=1
				walk(src, src.dir,2)
		Bump(atom/O)
			..()
			if(istype(O,/mob))
				var/mob/M=O
				var/rander=rand(1,25)
				if(rander==1)
					if(M.dir==SOUTH&&src.dir==NORTH||M.dir==NORTH&&src.dir==SOUTH||M.dir==WEST&&src.dir==EAST||M.dir==EAST&&src.dir==WEST)
						M << "Ouch! That paper plane hit you right in the eye..."
						M.hp-=1
						M.DeathCheck()
				else
					M << "You get hit by the paper airplane"
			walk(src,0)
			src.density=0
		//	del src
	DN_Paper_Sheet
		name="Paper Sheet"
		icon='items_miscellaneous.dmi'
		icon_state="paper sheet inventory"
		var/writing=null
		var/names=null
		var/msg=null
		iweight=1
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.playing==0)return
				//if(usr.shinigami==1)return
				icon_state="paper sheet inventory"
				Move(usr,src)
				usr.toucheddn=1
				usr.see_invisible=50
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				//if(usr.shinigami==1)return
				icon_state="paper sheet"
				Move(usr.loc,src)
			Write_On()
				set name="Write"
				set src in usr
				set category = null
				var/good=0
				if(usr.zombie==1)return
				if(usr.shinigami==1)return
				for(var/obj/O in usr)
					if(O.type==/obj/Misc/Pencil)
						good=1
						break
					else if(usr.bloody>0)
						good=1
				if(good==0)
					usr << "If only you had a pencil.."
					return
				var/writer=input(usr,"What do you want to write?")as null|message
				if(writer=="God Of Death")return
				if(writer=="Shinigami")return
				range(6,usr) << sound('audio/writing.wav')
				writer=html_decode(writer)
				src.writing+="[writer]<BR>"
				range(6,usr) << sound('audio/writing.wav')
				for(var/mob/player/A in alivelist)
					if(lowertext(A.realname)==lowertext(writer))
						spawn(400)
							range(8,A) << "[A] grabs at their chest, collapsing to the ground."
							A.DeathNoted()
			View()
				set name="Read"
				set src in usr
				set category = null
				usr << browse_rsc('GFX/pagetest.png', "bleh")
				var/writer={"<html><title>Paper Sheet</title><body><STYLE>BODY{background: url("bleh");background-color: black; color:red}</STYLE><table cellpadding="0" cellspacing="0" border="0" align="center"><td><p><font color=black>[writing]<p></td></table></body></html>"}
				usr<<browse(writer,"window=Motd;size=320x420;can_close=1;can_resize=1;can_minimize=1")
			Examine()
				//set name="Read"
				set src in usr
				set category = null
				CustAlert(usr,"A piece of paper, it appears to be roughly torn out from a notebook.",list("Okay"),5,7,10,11)

	PDA
		icon='items_miscellaneous.dmi'
		icon_state="pda inventory"
		var/number=""
		var/msg=null
		var/list/friendlist=new/list()
		var/dial=null
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				icon_state="pda inventory"
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				icon_state="pda"
				Move(usr.loc,src)
				usr << output(null,"pdaout")
				//winshow(usr,"pdawin",0)
				var/checkk=winget(usr,"paner","left")
				if(checkk=="pdawin")
					winset(usr,"paner","left=")
				usr.pdaing=0
			Use()
				set src in usr
				set category=null
				if(usr.zombie==1)return
				//winshow(usr,"pdawin",1)
				winset(usr,"pdanum","text=\"PDA Number: [src.number]\"")
				usr << output(null,"pdaout")
				usr << output(src.msg,"pdaout")
				winset(usr,"paner","left=pdawin")

				usr.pdaing=1
			PDARead()
				set hidden = 1
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				if(src.msg)
					usr << output(src.msg,"pdaout")
				else
					usr << output("No messages","pdaout")
			pdapress1()
				set hidden = 1
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				dial+="1"
				usr << output(null,"pdadial")
				usr << output(dial,"pdadial")
			pdapress2()
				set hidden = 1
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				dial+="2"
				usr << output(null,"pdadial")
				usr << output(dial,"pdadial")
			pdapress3()
				set hidden = 1
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				dial+="3"
				usr << output(null,"pdadial")
				usr << output(dial,"pdadial")
			pdapress4()
				set hidden = 1
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				dial+="4"
				usr << output(null,"pdadial")
				usr << output(dial,"pdadial")
			pdapress5()
				set hidden = 1
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				dial+="5"
				usr << output(null,"pdadial")
				usr << output(dial,"pdadial")
			pdapress6()
				set hidden = 1
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				dial+="6"
				usr << output(null,"pdadial")
				usr << output(dial,"pdadial")
			pdapress7()
				set hidden = 1
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				dial+="7"
				usr << output(null,"pdadial")
				usr << output(dial,"pdadial")
			pdapress8()
				set hidden = 1
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				dial+="8"
				usr << output(null,"pdadial")
				usr << output(dial,"pdadial")
			pdapress9()
				set hidden = 1
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				dial+="9"
				usr << output(null,"pdadial")
				usr << output(dial,"pdadial")
			pdapress0()
				set hidden = 1
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				dial+="0"
				usr << output(null,"pdadial")
				usr << output(dial,"pdadial")
			cleardialed()
				set hidden = 1
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				dial=""
				usr << output(null,"pdadial")
			pdafriendlist()
				set hidden = 1
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				if(friendlist.len==0)return
				var/list/whom=new/list()
				for(var/v in friendlist)
					whom+=v
				whom+="Cancel"
				var/numb=input(usr,"Which friend do you wish to send a text to?") in whom
				if(numb=="Cancel")return
				dial=numb
				pdapresssend()
			pdapresssend()
				set hidden = 1
				if(usr.playing==0)return
				if(usr.shinigami==1)return
//				if(num==src.number)return
				var/text=input(usr,"Please enter your message.","PDA")as null|message
				for(var/obj/Misc/PDA/O in world)
					if(dial==O.number)
						O.msg+="[text] from [src.number]-[gamehour]:00[ampm]<BR>"
						range(5,O) << sound('cellphone_answer.wav')
						usr << output("Your message has been sent to [O.number].", "pdaout")
						if(dial in friendlist)
							goto nonum
						var/I=input(usr,"The person isn't added to your friends list, would you like to add them?") in list("Yes","No")
						if(I=="Yes")
							friendlist+=dial
						:nonum
						dial=""
						goto sent
						break
				usr << output("Your message could not be delivered.", "pdaout")
				dial=""
				:sent
			pdapressdash()
				set hidden = 1
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				dial+="-"
				usr << output(null,"pdadial")
				usr << output(dial,"pdadial")
	Click()
		if(!usr.looking==0)
			if(usr.playing==0)return
			if(usr.shinigami==1)return
			var/obj/O=usr.looking
			//var/descp=src.idesc
			var/obj/I=src
			//descp=I.desc
			if(I.name=="Glasses Case")return
			if(I.name=="Nanatsu-Yoru")return
			if(src in O)
				var/pp2=CustAlert(usr,"[src.idesc]",list("Take","Leave"),5,4,13,7)
				if(pp2=="Take")
					if(usr.looking==0)return
					if(hoardlimit=="On")
						var/kits=0
						if(src.type==/obj/Misc/Med_Kit||src.type==/obj/key)
							for(var/obj/B in usr)
								if(B.type==/obj/key)
									kits+=1
						if(kits>1)
							usr << "You seem to be carrying enough at the present time."
							return
					Move(usr,src)
					if(usr.bodysearch==1)
						CheckWeight(usr,src)
						var/mob/M=usr.looking
						//if(src.name==
						CheckWeight2(M,src)
					if(usr.bodysearch==2)
						CheckWeight(usr,src)
						var/mob/M=usr.looking
						CheckWeight2(M,src)
					return
		if(src in oview(1))
			if(usr.playing==0)return
			if(usr.shinigami==1)return
			if(istype(src,/obj/Misc/School_Computer))return
			Move(usr,src)
			src.icon=src
var/knifespawn=12
var/axespawn=5
var/pipespawn=6
var/billhookspawn=12
var/alonditespawn=25
var/paperspawn=2
var/pencilspawn=3
var/batspawn=2
var/medspawn=3
var/Bokkenspawn=3
var/metalbatspawn=3
var/blackfeatherspawn=10
var/taserspawn=5
var/mystiaspawn=22
var/hammerspawn=3
proc
	SpawnRate(A)
		if(A=="Normal")
			knifespawn=12
			axespawn=5
			pipespawn=6
			billhookspawn=12
			alonditespawn=25
			paperspawn=2
			pencilspawn=3
			batspawn=2
			medspawn=3
			Bokkenspawn=3
			metalbatspawn=3
			blackfeatherspawn=10
			taserspawn=5
			mystiaspawn=22
			hammerspawn=3
		else if(A=="Low")
			knifespawn=15
			axespawn=11
			pipespawn=9
			billhookspawn=15
			alonditespawn=25
			paperspawn=2
			pencilspawn=3
			batspawn=5
			medspawn=5
			Bokkenspawn=5
			metalbatspawn=6
			blackfeatherspawn=13
			taserspawn=14
			mystiaspawn=16
			hammerspawn=6
		else if(A=="Very Low")
			knifespawn=18
			axespawn=17
			pipespawn=13
			billhookspawn=18
			alonditespawn=25
			paperspawn=5
			pencilspawn=6
			batspawn=9
			medspawn=11
			Bokkenspawn=13
			metalbatspawn=14
			blackfeatherspawn=16
			taserspawn=11
			mystiaspawn=26
			hammerspawn=12
		else if(A=="High")
			knifespawn=8
			axespawn=4
			pipespawn=4
			billhookspawn=8
			alonditespawn=25
			batspawn=2
			medspawn=2
			Bokkenspawn=2
			metalbatspawn=2
			blackfeatherspawn=7
			taserspawn=4
			mystiaspawn=16
			hammerspawn=2
		else if(A=="Very High")
			knifespawn=4
			axespawn=3
			pipespawn=3
			billhookspawn=8
			alonditespawn=25
			batspawn=2
			medspawn=1
			Bokkenspawn=2
			metalbatspawn=2
			blackfeatherspawn=5
			taserspawn=4
			mystiaspawn=13
			hammerspawn=2

	ItemSpawner()
		if(spawnrate=="None")goto noitems
		for(var/obj/Containers_Stationed/Tool_Box/O in world)
			var/rander=rand(1,hammerspawn)
			if(rander==1)
				var/obj/weapons/Hammer/I = new/obj/weapons/Hammer
				O.contents+=I
		for(var/obj/Containers_Stationed/Counter/O in world)
			var/rander=rand(1,5)
			if(rander==1)
				var/obj/weapons/Ladel/I = new/obj/weapons/Ladel
				O.contents+=I
		for(var/obj/Containers_Stationed/Tool_Box/O in world)
			var/rander=rand(1,3)
			if(rander==1)
				var/obj/Misc/Nails/I = new/obj/Misc/Nails
				O.contents+=I
		for(var/obj/Containers/Drawers/O in world)
			var/rander=rand(1,paperspawn)
			var/rander2=rand(1,blackfeatherspawn)
			if(rander==1)
				var/obj/Misc/Paper_Sheet/I = new/obj/Misc/Paper_Sheet
				O.contents+=I
			if(rander2==1)
				var/obj/Misc/Black_Feather/I = new/obj/Misc/Black_Feather
				O.contents+=I
		for(var/obj/Containers_Stationed/O in world)
			var/randr=rand(1,20)
			if(randr==1)
				var/obj/Misc/Yen/I=new
				I.curamount=rand(18,30)
				O.contents+=I
		for(var/obj/Containers/O in world)
			var/randr=rand(1,20)
			if(randr==1)
				var/obj/Misc/Yen/I=new
				I.curamount=rand(18,30)
				O.contents+=I
		var/cards=0
		var/alonspawned=1
		if(gamemode=="Zombie")
			for(var/obj/Containers/O in world)
				var/rander=rand(1,25)
				if(rander==1)
					var/obj/Misc/Infection_Cure/I = new
					O.contents+=I
		var/list/Containers4storage=new/list()
		for(var/obj/Containers/O in world)
			Containers4storage+=O
		//var/randerz=rand(1,5)
		if(cards<2)
			//if(randerz==1)
			cards+=1
			var/obj/Misc/Key_Card/I = new
			var/obj/O=pick(Containers4storage)
			O.contents+=I
		for(var/obj/Containers/Teachers_Desk/O in world)
			var/rander=rand(1,taserspawn)
			if(rander==1)
				var/obj/weapons/Taser/I = new/obj/weapons/Taser
				I.painter=1
				O.contents+=I
		for(var/obj/Containers_Stationed/Knife_Rack/O in world)
			O.contents+=new/obj/weapons/Knife
			O.contents+=new/obj/weapons/Knife
			O.contents+=new/obj/weapons/Knife
			O.contents+=new/obj/weapons/Knife
			O.contents+=new/obj/weapons/Knife
		for(var/obj/Containers_Stationed/Cabinet/O in world)
			var/obj/weapons/Green_Paint/I=new
			I.pcolor1=rand(10,80)
			I.pcolor2=rand(10,90)
			I.pcolor3=rand(10,90)
			I.icon+=rgb(I.pcolor1,I.pcolor2,I.pcolor3)
			O.contents+=I

			var/obj/weapons/Green_Paint/I1=new
			I1.pcolor1=rand(1,80)
			I1.pcolor2=rand(10,70)
			I1.pcolor3=rand(10,90)
			I1.icon+=rgb(I1.pcolor1,I1.pcolor2,I1.pcolor3)
			O.contents+=I1

			var/obj/weapons/Green_Paint/I2=new
			I2.pcolor1=rand(10,100)
			I2.pcolor2=rand(10,100)
			I2.pcolor3=rand(10,100)
			I2.icon+=rgb(I2.pcolor1,I2.pcolor2,I2.pcolor3)
			O.contents+=I2

			var/obj/weapons/Green_Paint/I3=new
			I3.pcolor1=rand(10,80)
			I3.pcolor2=rand(10,90)
			I3.pcolor3=rand(10,90)
			I3.icon+=rgb(I3.pcolor1,I3.pcolor2,I3.pcolor3)
			O.contents+=I3

			var/obj/weapons/Green_Paint/I4=new
			I4.pcolor1=rand(1,80)
			I4.pcolor2=rand(10,70)
			I4.pcolor3=rand(10,90)
			I4.icon+=rgb(I4.pcolor1,I4.pcolor2,I4.pcolor3)
			O.contents+=I4

			var/obj/weapons/Green_Paint/I5=new
			I5.pcolor1=rand(10,100)
			I5.pcolor2=rand(10,100)
			I5.pcolor3=rand(10,100)
			I5.icon+=rgb(I5.pcolor1,I5.pcolor2,I5.pcolor3)
			O.contents+=I5

			var/obj/weapons/Green_Paint/I6=new
			I6.pcolor1=rand(1,40)
			I6.pcolor2=rand(1,30)
			I6.pcolor3=rand(1,20)
			I6.icon+=rgb(I6.pcolor1,I6.pcolor2,I6.pcolor3)
			O.contents+=I6
		for(var/obj/Containers_Stationed/Nurses_Closet/O in world)
			var/rander=rand(1,medspawn)
			var/rander2=rand(1,medspawn)
			var/rander3=rand(1,medspawn)
			var/rander4=rand(1,medspawn)
			var/rander5=rand(1,7)
			if(rander==1)
				var/obj/Misc/Med_Kit/I = new/obj/Misc/Med_Kit
				O.contents+=I
			if(rander==1)
				var/obj/Misc/Med_Kit/I = new/obj/Misc/Med_Kit
				O.contents+=I
			if(rander2==1)
				var/obj/Misc/Med_Kit/I = new/obj/Misc/Med_Kit
				O.contents+=I
			if(rander3==1)
				var/obj/Misc/Med_Kit/I = new/obj/Misc/Med_Kit
				O.contents+=I
			if(rander4==1)
				var/obj/Misc/Med_Kit/I = new/obj/Misc/Med_Kit
				O.contents+=I
			if(rander5==1)
				var/obj/Misc/Super_Regenerative/I = new/obj/Misc/Super_Regenerative
				O.contents+=I
		for(var/obj/Containers_Stationed/Nurses_Closet2/O in world)
			var/rander=rand(1,medspawn)
			var/rander2=rand(1,medspawn)
			var/rander3=rand(1,medspawn)
			var/rander4=rand(1,medspawn)
			var/rander5=rand(1,8)
			if(rander==1)
				var/obj/Misc/Med_Kit/I = new/obj/Misc/Med_Kit
				O.contents+=I
			if(rander==1)
				var/obj/Misc/Med_Kit/I = new/obj/Misc/Med_Kit
				O.contents+=I
			if(rander2==1)
				var/obj/Misc/Med_Kit/I = new/obj/Misc/Med_Kit
				O.contents+=I
			if(rander3==1)
				var/obj/Misc/Med_Kit/I = new/obj/Misc/Med_Kit
				O.contents+=I
			if(rander4==1)
				var/obj/Misc/Med_Kit/I = new/obj/Misc/Med_Kit
				O.contents+=I
			if(rander5==1)
				var/obj/Misc/Super_Regenerative/I = new/obj/Misc/Super_Regenerative
				O.contents+=I
		for(var/obj/Containers/Trash_Can/O in world)
			var/rander=rand(1,billhookspawn)
			var/rander2=rand(1,blackfeatherspawn)
			var/rander3=rand(1,15)
			if(rander==1)
				var/obj/weapons/Billhook/I = new/obj/weapons/Billhook
				O.contents+=I
			if(rander2==1)
				var/obj/Misc/Black_Feather/I = new/obj/Misc/Black_Feather
				O.contents+=I
			if(rander3==1)
				var/obj/Misc/Syringe/I = new/obj/Misc/Syringe
				O.contents+=I

		for(var/obj/Containers/School_Desk/O in world)
			var/rander=rand(1,knifespawn)
			var/rander2=rand(1,pencilspawn)
			var/rander3=rand(1,paperspawn)
			var/rander4=rand(1,20)
			var/rander5=rand(1,15)
			var/rander6=rand(1,13)
			var/rander7=rand(1,13)
			var/done=0
			if(rander==1)
				var/obj/weapons/Knife/I = new/obj/weapons/Knife
				O.contents+=I
			if(rander2==1)
				var/obj/Misc/Pencil/I = new/obj/Misc/Pencil
				O.contents+=I
			if(rander3==1)
				var/obj/Misc/Paper_Sheet/I = new/obj/Misc/Paper_Sheet
				O.contents+=I
				done+=1
			if(rander4==1)
				var/obj/Misc/Mystia_Coin/I = new/obj/Misc/Mystia_Coin
				O.contents+=I
			if(rander5==rand(1,5))
				var/obj/Misc/Glow_Stick/I = new/obj/Misc/Glow_Stick
				O.contents+=I
			if(rander6==rand(1,5))
				var/obj/Misc/Poppers/I = new/obj/Misc/Poppers
				O.contents+=I
			if(rander7==rand(1,5))
				var/obj/Misc/Smoke_Bomb/I = new/obj/Misc/Smoke_Bomb
				O.contents+=I
		var/obj/J=pick(Containers4storage)
		var/obj/Misc/Door_Code/Kk = new/obj/Misc/Door_Code
		J.contents+=Kk

		for(var/obj/Containers_Stationed/Locker/O in world)
			var/rander2=rand(1,30)
			var/rander3=rand(1,25)
			var/done=0
			if(rander2==1)
				var/obj/Misc/Pencil/I = new/obj/Misc/Pencil
				O.contents+=I
			if(rander3==1)
				var/obj/Misc/Paper_Sheet/I = new/obj/Misc/Paper_Sheet
				O.contents+=I
				done+=1


		for(var/obj/Containers/Bat_Bin/O in world)
			var/rander=rand(1,batspawn)
			var/rander2=rand(1,metalbatspawn)
			if(rander==1)
				var/obj/weapons/Wooden_Bat/I = new/obj/weapons/Wooden_Bat
				O.contents+=I
			if(rander2==1)
				var/obj/weapons/Metal_Bat/I = new/obj/weapons/Metal_Bat
				O.contents+=I
		for(var/obj/Containers/Wooden_Box/O in world)
			var/rander=rand(1,Bokkenspawn)
			if(rander==1)
				var/obj/weapons/Bokken/I = new/obj/weapons/Bokken
				O.contents+=I
		var/list/ccountainers2=new/list()
		for(var/obj/Containers/Storage_Container/O in world)
			ccountainers2+=O
		//var/randerz3=rand(1,10)
		var/randerz3=1
		var/obj/Oa=pick(ccountainers2)
		if(randerz3==1)
			var/obj/weapons/Alondite/I = new/obj/weapons/Alondite
			alonspawned+=1
			Oa.contents+=I
		for(var/obj/Containers/Storage_Container/O in world)
			var/rander=rand(1,axespawn)
			var/rander2=rand(1,pipespawn)
			var/rander5=rand(1,6)
			var/rander6=rand(1,9)
			var/rander7=rand(1,11)
			var/rander8=rand(1,16)
			if(rander==1)
				var/obj/weapons/Axe/I = new/obj/weapons/Axe
				O.contents+=I
			if(rander8==1)
				var/obj/Misc/Tape/I = new/obj/Misc/Tape
				O.contents+=I
			if(rander2==1)
				var/obj/weapons/Metal_Pipe/I = new/obj/weapons/Metal_Pipe
				O.contents+=I
			if(rander5==1)
				var/obj/Misc/Syringe/I = new/obj/Misc/Syringe
				O.contents+=I
			if(rander6==1)
				var/obj/Misc/Super_Regenerative/I = new/obj/Misc/Super_Regenerative
				O.contents+=I
			if(rander7==1)
				var/obj/Misc/Mild_Sedetive/I = new/obj/Misc/Mild_Sedetive
				O.contents+=I
		:noitems
		if(mapp=="Default"||mapp=="Default 2")
			for(var/obj/Containers_Stationed/Key_Locker/O in world)
				var/obj/key/I=new
				I.tag="office"
				I.name="Office Key"
				O.contents+=I
				var/obj/key/A=new
				A.tag="nurses"
				A.name="Nurses Room Key"
				O.contents+=A
				var/obj/key/B=new
				B.tag="lounge"
				B.name="Lounge Room Key"
				O.contents+=B
				var/obj/key/M=new
				M.tag="anime"
				M.name="Anime Room Key"
				O.contents+=M
				var/obj/key/K=new
				K.tag="gym"
				K.name="Gym Room Key"
				O.contents+=K
				var/obj/key/N=new
				N.tag="music"
				N.name="Music Room Key"
				O.contents+=N
	//	for(var/obj/Containers_Stationed/Key_Locker/O in world)
		//	O.contents+=new/obj/Misc/Office_Key
		//	O.contents+=new/obj/Misc/Gym_Key
		//	O.contents+=new/obj/Misc/Nurses_Office_Key
		//	O.contents+=new/obj/Misc/Lounge_Key

obj
	Placeables
		Bench
			icon = 'school.dmi'
			icon_state="bench"
			density = 0
		Desk1
			icon='turfentrance.dmi'
			icon_state="desk 1"
			name="Desk"
			density=1
		Desk2
			icon='turfentrance.dmi'
			icon_state="desk 2"
			name="Desk"
			density=1
		Desk3
			icon='turfentrance.dmi'
			icon_state="desk 3"
			name="Desk"
			density=1
		Desk4
			icon='turfentrance.dmi'
			icon_state="desk 4"
			name="Desk"
			density=1
		Desk5
			icon='turfentrance.dmi'
			icon_state="desk 5"
			name="Desk"
			density=1
		Ceremony_Table
			icon='placeables.dmi'
			icon_state="ceremony table"
			density=1
		Ceremony_Table_
			icon='placeables.dmi'
			icon_state="ctable2"
			density=1
		Ceremony_Table__
			icon='placeables.dmi'
			icon_state="ctable3"
			density=1
		Wall_Scroll
			icon='turftearoom.dmi'
			icon_state="wall panel"
		Wall_Scroll_
			icon='turftearoom.dmi'
			icon_state="wall panel 2"
		Small_Table
			icon='turftearoom.dmi'
			icon_state="small table"
			density=1
		Water_Boiler
			icon='turftearoom.dmi'
			icon_state="heater"
		Tea_Set_
			icon='turftearoom.dmi'
			icon_state="teaset"
		Lamp
			icon='turftearoom.dmi'
			icon_state="lamp"
			layer=7
		Meat_Chute
			icon='turfcafe.dmi'
			icon_state="shute start"
			density=1
		Meat_Chute_
			icon='turfcafe.dmi'
			icon_state="shute end"
		Butcher_Table
			icon='turffreezer.dmi'
			icon_state="butcher table"
			density=1
		Chain
			icon='turffreezer.dmi'
			icon_state="chain"
			layer=7
		Cold
			icon='turffreezer.dmi'
			icon_state="cold"
			layer=7
		Teddy_Bear
			icon='placeables.dmi'
			icon_state="teddy bear"
			layer=OBJ_LAYER
			var/wearing=0
			verb
				Pick_Up()
					set src in oview(1)
					if(usr.playing==0)return
					if(usr.shinigami==1)return
					Move(usr,src)
				//	usr.overlays+='teddy overlay.dmi'
				Drop()
					set src in usr
					set category = null
					if(usr.playing==0)return
					if(usr.shinigami==1)return
				//	usr.overlays-='teddy overlay.dmi'
					Move(usr.loc,src)
			Click()
				if(!usr.looking==0)
					if(src in usr)return
					var/obj/O=usr.looking
					var/descp=src.idesc
					var/obj/I=src
					if(I.name=="Teddy Bear")
						descp="A little bear that can be held, how cute."
					if(src in O)
						if(I.name=="Fists")return
						var/pp2=CustAlert(usr,"[descp]",list("Take","Leave"),5,4,13,7)
						if(pp2=="Take")
							if(usr.looking==0)return
							Move(usr,src)
		Bunny_Doll
			icon='rabit.dmi'
			//icon_state="teddy bear"
			layer=OBJ_LAYER
			var/wearing=0
			verb
				Pick_Up()
					set src in oview(1)
					if(usr.playing==0)return
					if(usr.shinigami==1)return
					Move(usr,src)
				//	usr.overlays+='teddy overlay.dmi'
				Drop()
					set src in usr
					set category = null
					if(usr.playing==0)return
					if(usr.shinigami==1)return
				//	usr.overlays-='teddy overlay.dmi'
					Move(usr.loc,src)
			Click()
				if(!usr.looking==0)
					if(src in usr)return
					var/obj/O=usr.looking
					var/descp=src.idesc
					var/obj/I=src
					if(I.name=="Bunny Doll")
						descp="Looks like a cute little bunny!"
					if(src in O)
						if(I.name=="Fists")return
						var/pp2=CustAlert(usr,"[descp]",list("Take","Leave"),5,4,13,7)
						if(pp2=="Take")
							if(usr.looking==0)return
							Move(usr,src)

		Tea_Set
			icon='placeables.dmi'
			icon_state="teaset"
			layer=7
		Telivision
			icon='placeables.dmi'
			icon_state="tv3"
			name="Television"
		Monitor
			icon='placeables.dmi'
			icon_state="tv monitor"
		Phone
			icon='placeables.dmi'
			icon_state="phone"
		Calender
			icon='placeables.dmi'
			icon_state="calender"
		Sink
			icon='placeables.dmi'
			icon_state="sink end 1"
		Air_Unit
			icon='placeables.dmi'
			icon_state="air unit"
			layer=7
			name="Air_Conditioner"
		Generator
			icon='turfbasement.dmi'
			icon_state="gen 1"
			density=1
		Generator_
			icon='turfbasement.dmi'
			icon_state="gen 2"
			density=1
		Generator__
			icon='turfbasement.dmi'
			icon_state="gen 3"
		Generator____
			icon='turfbasement.dmi'
			icon_state="gen 4"
		Pipes
			icon='turfbasement.dmi'
			icon_state="pipe 1"
			density=1
		Pipes_
			icon='turfbasement.dmi'
			icon_state="pipe 2"
			density=1
		Pipes__
			icon='turfbasement.dmi'
			icon_state="pipe 6"
			density=1
		Notice_Board
			icon='placeables.dmi'
			icon_state="notice board"
		Toilet
			icon='placeables.dmi'
			icon_state="toilet"
		Pay_Phone
			icon='placeables.dmi'
			icon_state="phone 2"
			verb/Use()
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				usr << "The phone is dead.."

obj/
	Classroom_Signs
		icon='classroommarkers.dmi'
		name=""
		layer=7
		A1
			icon_state="1"
		A11
			icon_state="11"
		A2
			icon_state="2"
		A22
			icon_state="22"
		B1
			icon_state="3"
		B11
			icon_state="33"
		B2
			icon_state="4"
		B22
			icon_state="44"
		C1
			icon_state="5"
		C11
			icon_state="55"
		C2
			icon_state="6"
		C22
			icon_state="66"
		D1
			icon_state="7"
		DD1
			icon_state="77"
		D2
			icon_state="8"
		D22
			icon_state="88"
		Girls
			icon_state="girls"
		Girls2
			icon_state="girls2"
		Boys
			icon_state="boys"
		Boys2
			icon_state="boys2"

	Posters
		Courtyard
			icon='GFX/schoolposter.png'
			name="Anime Advertisement"
	ChalkBoard
		a
			icon='placeables.dmi'
			name="Chalkboard"
			icon_state="chalkboard1"
			density=1
		b
			name="Chalkboard"
			icon='placeables.dmi'
			icon_state="chalkboard2"
			density=1
		c
			name="Chalkboard"
			icon='placeables.dmi'
			icon_state="chalkboard3"
		d
			name="Chalkboard"
			icon='placeables.dmi'
			icon_state="chalkboard4"
		e
			name="Chalkboard"
			icon='placeables.dmi'
			icon_state="chalkboard5"
			density=1
		f
			name="Chalkboard"
			icon='placeables.dmi'
			icon_state="chalkboard6"
	Bathroom_Sink
		icon='school.dmi'
		icon_state="sink"
		name="Sink"
		density=1
		verb/Wash()
			set src in oview(1)
			set name = "Wash"
			set category=null
			if(usr.playing==0)return
			if(usr.washing==1)return
			var/pp=ShowAlert(usr,"What would you like to wash?",list("Self","Weapon","X"))
			if(pp=="Self")
				WashSelf(usr)
			else if(pp=="Weapon")
				WashWeapon(usr)
	Bathroom_Sink2
		icon='school.dmi'
		icon_state="sink pipe"
		name="Sink"
		density=0
	Escape_Door
		icon='school.dmi'
		icon_state="front door"
		name="Steel Door"
		density=1
		layer=5
		var/open=0
		opacity=1
		verb/Open()
			set src in oview(1)
			set category=null
			set name = "Open Door"
			if(usr.playing==0)return
			if(usr.shinigami==1)return
			if(usr.zombie==1)return
			if(keycardfunction=="Off")
				usr << "The door doesn't seem to be responding."
				return
			var/good=0
			for(var/obj/Misc/Key_Card/O in usr)
				if(O in usr)
					good=1
				else
					good=0
			if(good==1)
				var/pp=ShowAlert(usr,"Are you sure you want to leave Pyrce High? If you're not the killer, you don't really need to ask; but in case you ARE the killer, I'll remind you that leaving the school means that there are people still alive, which means you automatically lose. < < So, I ask you; Are you sure you want to leave?",list("Yes","No"))
				if(pp=="Yes")
					if(src in view(1,usr))
						goto good2
					else
						return
					:good2
					var/gooder=0
					for(var/obj/Misc/Key_Card/O in usr)
						if(O in usr)
							gooder=1
					if(gooder==0)
						usr << "What.. Where did that Key Card go, you're not trying to cheat are you?"
						return
					else
						world << "<b>Someone has escaped!</b> ... as evidenced by the ridiculously loud front doors."
						world << sound('doormetal.wav')
						usr.loc=src.loc
						FakeEscape(usr)
						usr.name=usr.key
						usr.toucheddn=0
						usr.playing=0
						usr.Watchit()
						alivelist-=usr
						if(usr.unlock5!="Successful Escape!")
							usr.unlock5="Successful Escape!"
							usr << "<font color=red>Unlocked: Successful Escape!"
							usr.save()
						//escapelist+=usr
						CheckGame()
			else if(good==0)
				usr << "I thought it was made clear? This door ain't opening, no way, no how. Unless you manage to get your hands on one of the Security Clearance Cards"


	//INSIDE BATHROOM DOOR.
	Doors
		Toilet_Door
			icon='school.dmi'
			icon_state="privacy door closed"
			name="Privacy Door"
			density=0
			density=1
			var/open=0
			//opacity=1
			verb/Open()
				set src in oview(1)
				set name = "Open / Close"
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				if(usr.isGhost==1)return
				if(open==0)
					open=1
					sd_SetOpacity(0)
					//src.x-=1
					density=0
					icon_state="privacy door open"
				else
					for(var/atom/A in oview(1,src))
						if(A.loc==src.loc)
							var/mob/B=A
							if(istype(A,/mob)&&B.playing==1&&B.shinigami==0)return
							else if(istype(A,/blooddrip))break
							else if(istype(A,/obj/bloodsplat))break
							else if(istype(A,/obj/Custom_Placeable))break
							else if(istype(A,/obj/bloodstep))break
							else if(istype(A,/obj/paintings))break
							else if(istype(A,/mob)&&A.invisibility>40)break
							else if(istype(A,/turf))
								break
							else
								return
					open=0
					//src.x+=1
					sd_SetOpacity(1)
					density=1
					icon_state="privacy door closed"
	//END BATHROOM DOORS FOR TOILETS
	Regular_Sink
		icon='placeables.dmi'
		icon_state="sink2"
		density=1
		name="Sink"
		verb/Wash()
			set src in oview(1)
			set name = "Wash"
			set category=null
			if(usr.playing==0)return
			if(usr.washing==1)return
			var/pp=ShowAlert(usr,"What would you like to wash?",list("Self","Weapon","X"))
			if(pp=="Self")
				WashSelf(usr)
			else if(pp=="Weapon")
				WashWeapon(usr)
	Regular_Sink_End
		icon='placeables.dmi'
		density=1
		icon_state="sink end 2"
		name="Sink"
	Vent_Sink
		icon='placeables.dmi'
		icon_state="vert sink"
		density=1
		name="Sink"
		verb/Wash()
			set src in oview(1)
			set name = "Wash"
			set category=null
			if(usr.playing==0)return
			if(usr.washing==1)return
			var/pp=ShowAlert(usr,"What would you like to wash?",list("Self","Weapon","X"))
			if(pp=="Self")
				WashSelf(usr)
			else if(pp=="Weapon")
				WashWeapon(usr)
	Counter_Sink
		icon='turfcafe.dmi'
		icon_state="sink"
		name="Sink"
		density=1
		verb/Wash()
			set src in oview(1)
			set name = "Wash"
			set category=null
			if(usr.playing==0)return
			if(usr.washing==1)return
			var/pp=ShowAlert(usr,"What would you like to wash?",list("Self","Weapon","X"))
			if(pp=="Self")
				WashSelf(usr)
			else if(pp=="Weapon")
				WashWeapon(usr)
	Door
		Strong_Door
			icon='school.dmi'
			icon_state="strong door"
			name="Door"
			density=1
			var/open=0
			opacity=1
			verb/Open()
				set src in oview(1)
				set name = "Open / Close"
				if(usr.playing==0)return
				if(open==0)
					if(get_dir(src,usr)==WEST)
						winshow(usr,"keypad",1)
						usr.padding=1
					else if(get_dir(src,usr)==NORTHWEST)
						winshow(usr,"keypad",1)
						usr.padding=1
					else if(get_dir(src,usr)==SOUTHWEST)
						winshow(usr,"keypad",1)
						usr.padding=1
					else
						for(var/obj/Door/Strong_Door/O in view(3))
							O.open=1
							O.icon_state="open strong door"
							O.density=0
							O.pixel_x-=30
							O.sd_SetOpacity(0)
				else
					for(var/atom/A in oview(1,src))
						if(A.loc==src.loc)
							var/mob/B=A
							if(istype(A,/mob)&&B.playing==1&&B.shinigami==0)return
							else if(istype(A,/blooddrip))break
							else if(istype(A,/obj/bloodsplat))break
							else if(istype(A,/obj/bloodspot))break
							else if(istype(A,/obj/bloodstep))break
							else if(istype(A,/obj/Custom_Placeable))break
							else if(istype(A,/obj/paintings))break
							else if(istype(A,/mob)&&A.invisibility>40)break
							else if(istype(A,/turf))
								break
							else
								return
					open=0
					pixel_x=0
					//src.icon_state="blank"
					sd_SetOpacity(1)
					density=1
					icon_state="strong door"
			DblClick()
				if(src in oview(1,usr))
					if(istype(src, /obj/Door))
						src.Open()
						return

		Door_Freezer
			name="Freezer Door"
			icon='turffreezer.dmi'
			icon_state="door"
			density=1
			opacity=1
			var/open=0
			verb/Open()
				set src in oview(1)
				set name = "Open / Close"
				if(get_dir(src,usr)==NORTHWEST)return
				else if(get_dir(src,usr)==WEST)return
				else if(get_dir(src,usr)==SOUTHWEST)return
				if(usr.playing==0)return
				if(open==0)
					open=1
					src.icon_state="open door"
					density=0
					pixel_x-=30
					sd_SetOpacity(0)
				else
					for(var/atom/A in oview(1,src))
						if(A.loc==src.loc)
							var/mob/B=A
							if(istype(A,/mob)&&B.playing==1&&B.shinigami==0)return
							else if(istype(A,/blooddrip))break
							else if(istype(A,/obj/bloodsplat))break
							else if(istype(A,/obj/Custom_Placeable))break
							else if(istype(A,/obj/bloodspot))break
							else if(istype(A,/obj/bloodstep))break
							else if(istype(A,/obj/paintings))break
							else if(istype(A,/mob)&&A.invisibility>40)break
							else if(istype(A,/turf))
								break
							else
								return
					open=0
					pixel_x=0
					//src.icon_state="blank"
					sd_SetOpacity(1)
					density=1
					icon_state="door"
			DblClick()
				if(src in oview(1,usr))
					if(istype(src, /obj/Door))
						src.Open()
						return

		Door_Open_Up
			icon='school.dmi'
			icon_state="door2"
			name="Door"
			density=1
			var/open=0
			opacity=1

			verb/Open()
				set src in oview(1)
				set name = "Open / Close"
				if(usr.playing==0)return
				if(usr.isGhost==1)return
				if(open==0)
					open=1
					src.icon_state="open out"
					density=0
					pixel_y-=30
					//sd_SetOpacity(0)
					opacity=0
				else
					for(var/atom/A in oview(1,src))
						if(A.loc==src.loc)
							var/mob/B=A
							if(istype(A,/mob)&&B.playing==1&&B.shinigami==0)return
							else if(istype(A,/blooddrip))break
							else if(istype(A,/obj/bloodsplat))break
							else if(istype(A,/obj/bloodspot))break
							else if(istype(A,/obj/Custom_Placeable))break
							else if(istype(A,/obj/bloodstep))break
							else if(istype(A,/obj/paintings))break
							else if(istype(A,/mob)&&A.invisibility>40)break
							else if(istype(A,/turf))break
							else
								return
					open=0
					pixel_y=0
					//src.icon_state="blank"
					//sd_SetOpacity(1)
					opacity=1
					density=1
					icon_state="door2"
			DblClick()
				if(src in oview(1,usr))
					if(istype(src, /obj/Door))
						src.Open()
						return

		Door_Open_Right
			icon='school.dmi'
			icon_state="door"
			name="Door"
			density=1
			var/open=0
			opacity=1

			verb/Open()
				set src in oview(1)
				set name = "Open / Close"
				if(usr.playing==0)return
				if(usr.isGhost==1)return
				if(open==0)
					open=1
					src.icon_state="open door"
					density=0
					pixel_x+=30
					sd_SetOpacity(0)
					//opacity=0
				else
					for(var/atom/A in oview(1,src))
						if(A.loc==src.loc)
							var/mob/B=A
							if(istype(A,/mob)&&B.playing==1&&B.shinigami==0)return
							else if(istype(A,/blooddrip))break
							else if(istype(A,/obj/bloodsplat))break
							else if(istype(A,/obj/bloodspot))break
							else if(istype(A,/obj/Custom_Placeable))break
							else if(istype(A,/obj/bloodstep))break
							else if(istype(A,/obj/paintings))break
							else if(istype(A,/mob)&&A.invisibility>40)break
							else if(istype(A,/turf))
								break
							else
								return
					open=0
					pixel_x=0
					//src.icon_state="blank"
					sd_SetOpacity(1)
					//opacity=1
					density=1
					icon_state="door"
			DblClick()
				if(src in oview(1,usr))
					if(istype(src, /obj/Door))
						src.Open()
						return
	Shattered_Door
		icon='school.dmi'
		icon_state="shattered door"
	Door

		DoorBath1
			icon='school.dmi'
			icon_state="male bathroom"
			name="Bathroom Door"
			density=1
			var/open=0
			opacity=1
			verb/Open()
				set src in oview(1)
				set name = "Open / Close"
				if(usr.playing==0)return
				if(open==0)
					open=1
					opacity=0
					//src.x-=1
					density=0
					icon_state="open bathroom door"
				else
					for(var/atom/A in oview(1,src))
						if(A.loc==src.loc)
							var/mob/B=A
							if(istype(A,/mob)&&B.playing==1&&B.shinigami==0)return
							else if(istype(A,/blooddrip))break
							else if(istype(A,/obj/bloodsplat))break
							else if(istype(A,/obj/bloodspot))break
							else if(istype(A,/obj/Custom_Placeable))break
							else if(istype(A,/obj/bloodstep))break
							else if(istype(A,/obj/paintings))break
							else if(istype(A,/mob)&&A.invisibility==100)break
							else if(istype(A,/turf))
								break
							else
								return
					open=0
					//src.x+=1
					opacity=1
					density=1
					icon_state="male bathroom"
			DblClick()
				if(src in oview(1,usr))
					if(istype(src, /obj/Door))
						src.Open()
						return

		DoorBath2
			icon='school.dmi'
			icon_state="female bathroom"
			name="Bathroom Door"
			density=1
			var/open=0
			opacity=1
			verb/Open()
				set src in oview(1)
				set name = "Open / Close"
				if(usr.playing==0)return
				if(open==0)
					open=1
					opacity=0
					//src.x-=1
					density=0
					icon_state="open bathroom door"
				else
					for(var/atom/A in oview(1,src))
						if(A.loc==src.loc)
							var/mob/B=A
							if(istype(A,/mob)&&B.playing==1&&B.shinigami==0)return
							else if(istype(A,/blooddrip))break
							else if(istype(A,/obj/bloodsplat))break
							else if(istype(A,/obj/bloodspot))break
							else if(istype(A,/obj/Custom_Placeable))break
							else if(istype(A,/obj/bloodstep))break
							else if(istype(A,/obj/paintings))break
							else if(istype(A,/mob)&&A.invisibility==100)break
							else if(istype(A,/turf))
								break
							else
								return
					open=0
					//src.x+=1
					opacity=1
					density=1
					icon_state="female bathroom"
			DblClick()
				if(src in oview(1,usr))
					if(istype(src, /obj/Door))
						src.Open()
						return
		Tea_Room_Door
			icon='turftearoom.dmi'
			icon_state="door"
			name="Door"
			density=1
			var/open=0
			opacity=1

			verb/Open()
				set src in oview(1)
				set name = "Open / Close"
				if(usr.playing==0)return
				if(open==0)
					open=1
					sd_SetOpacity(0)
					//src.x-=1
					density=0
					icon_state="door open"
					flick("door open anim",src)
				else
					for(var/atom/A in oview(1,src))
						if(A.loc==src.loc)
							var/mob/B=A
							if(istype(A,/mob)&&B.playing==1&&B.shinigami==0)return
							else if(istype(A,/blooddrip))break
							else if(istype(A,/obj/bloodsplat))break
							else if(istype(A,/obj/bloodspot))break
							else if(istype(A,/obj/Custom_Placeable))break
							else if(istype(A,/obj/bloodstep))break
							else if(istype(A,/obj/paintings))break
							else if(istype(A,/mob)&&A.invisibility==100)break

							else if(istype(A,/turf))
								break
							else
								return
					open=0
					//src.x+=1
					sd_SetOpacity(1)
					density=1
					icon_state="door"
			DblClick()
				if(src in oview(1,usr))
					if(istype(src, /obj/Door))
						src.Open()
						return
		Door2
			icon='doors.dmi'
			icon_state="closed door front"
			name="Door"
			density=1
			var/open=0
			opacity=1

			verb/Open()
				set src in oview(1)
				set name = "Open / Close"
				if(usr.playing==0)return
				if(usr.isGhost==1)return
				if(open==0)
					open=1
					sd_SetOpacity(0)
					//src.x-=1
					density=0
					icon_state="open door front"
				else
					for(var/atom/A in oview(1,src))
						if(A.loc==src.loc)
							var/mob/B=A
							if(istype(A,/mob)&&B.playing==1&&B.shinigami==0)return
							else if(istype(A,/blooddrip))break
							else if(istype(A,/obj/bloodsplat))break
							else if(istype(A,/obj/bloodspot))break
							else if(istype(A,/obj/Custom_Placeable))break
							else if(istype(A,/obj/bloodstep))break
							else if(istype(A,/obj/paintings))break
							else if(istype(A,/mob)&&A.invisibility>40)break

							else if(istype(A,/turf))
								break
							else
								return
					open=0
					//src.x+=1
					sd_SetOpacity(1)
					density=1
					icon_state="closed door front"
			DblClick()
				if(src in oview(1,usr))
					if(istype(src, /obj/Door))
						src.Open()
						return
mob/Bump(mob/A)
	if(istype(A,/mob)&&A.isGhost==1)
		src.loc=A.loc
	..()
mob/Bump(atom/A)
	var/thingy=0
	if(src.isGhost==1&&!istype(A,/turf)&&!istype(A,/mob))
		src.loc=A.loc
		return
	if(src.pulling&&src.pulling==A)
		if(istype(A,/obj))
			var/obj/O=src.pulling
			for(var/mob/M in O.loc)
				thingy=1
			if(thingy==1)
				O.loc=src.loc
			else
				src.loc=O.loc
		else if(istype(A,/mob))
			var/mob/O=src.pulling
			for(var/mob/M in O.loc)
				thingy=1
			if(thingy==1)
				O.loc=src.loc
			else
				src.loc=O.loc
	else if(src.pulling)
		var/obj/O=src.pulling
		O.loc=src.loc
	..()
mob/var/move_speed=2
mob/Move()
	if(src.barrier==1)return 0
	if(src.playing==1)
		if("[rand(1,9)]"=="[rand(1,14)]"&&src.invisibility==0)
			soundmob(src, 10, 'footsteps.wav', TRUE)
		if(src.koed==0)
			for(var/mob/A in view())
				if(A.pulling==src)
					A.pulling=null
			src.pulled=0
		if(src.weight>20)
			src.frozen=1
			sleep(11)
			src.frozen=0
		else if(!src.pulling==0)
			var/obj/O=src.pulling
			var/last_loc = src.loc
			src.frozen=1
			..()
			O.Move(last_loc)
			sleep(9)
			src.frozen=0
		if(src.computer==1)
			winshow(src,"Roster",0)
			winshow(src,"scotdb",0)
			src.computer=0
		if(src.hp<20&&src.invisibility==0)
			var/image/I=new/blooddrip
			I.loc=src.loc
		if(!src.looking==0)
			src.looking=0
			src.bodysearch=0
		//if(src.hp<20)
		else if(src.usingcamera==1)
			src.client:perspective = MOB_PERSPECTIVE
			src.client.eye = src
			src.usingcamera=0
		else if(src.padding==1)
			winset(src,"keypad",0)
			src.padding=0
		else if(src.usingswitchbox==1)
			winshow(src,"switchbox",0)
			src.usingswitchbox=0
		if(src.stamina<1&&src.running==1)
			if(src.zombie==1)return
			src << "You're not able to run anymore..."
			return
		for(var/obj/bloodspot/O in src.loc)
			if(src.loc==O.loc&&O.stepped==1&&src.invisibility==0)
				O.icon_state="smear"
				src.bloodstepper=5
				O.stepped=1
			else
				O.stepped=1
		if(bloodstepper>0)
			src.bloodstepper-=1
			var/image/o=new/obj/bloodstep
			o.loc=src.loc
			o.dir=src.dir
	if(src.running&&src.move_speed>3)
		src.frozen=1
		spawn(src.move_speed)src.frozen=0
	if(!src.running&&src.zombie==0)
		src.frozen=1
		spawn(src.move_speed)src.frozen=0
	else if(src.zombie==1)
		src.frozen=1
		spawn(3)src.frozen=0
	else
		src.stamina-=1
	return ..()
obj/var/bloodweapon=0
proc
	WeaponEquip(var/mob/A,var/obj/weapons/I)
		if(A.shinigami==1||A.isGhost==1)return
		if(A.zombie==1)return
		if(A.equipped)
			var/obj/N=A.equipped
			N.suffix=""
		A.underlays=null
		for(var/image/X as anything in A.overlays)
			if(X.icon=='Spear.dmi') A.overlays-=X
			if(X.icon=='Mop.dmi') A.overlays-=X
		if(A.teddy==1)
			A.overlays-='teddy overlay.dmi'
		if(A.rabbit==1)
			A.overlays-='rabbit overlay.dmi'
		//var/obj/I="[O]"
		I.suffix="Equipped"
		if(I.type==/obj/weapons/Seventh_Holy_Scripture)
			A.overlays+='bloodyknife.dmi'
			A.equipped=I
			A.equipname="Seventh Holy Scripture"
		if(I.type==/obj/weapons/Knife)
			if(I.bloodweapon==1)
				A.underlays+='bloodyknife.dmi'
			else
				A.underlays+='knife.dmi'
			A.equipped=I
			A.equipname="Knife"
		if(I.type==/obj/weapons/Axe)
			if(I.bloodweapon==1)
				A.underlays+='bloodyaxe.dmi'
			else
				A.underlays+='axe.dmi'
			A.equipped=I
			A.equipname="Axe"
		if(I.type==/obj/weapons/Billhook)
			if(I.bloodweapon==1)
				A.underlays+='bloodybillhook.dmi'
			else
				A.underlays+='billhook.dmi'
			A.equipped=I
			A.equipname="Billhook"
		if(I.type==/obj/weapons/Metal_Bat)
			if(I.bloodweapon==1)
				A.underlays+='bloodymetalbat.dmi'
			else
				A.underlays+='metalbat.dmi'
			A.equipped=I
			A.equipname="Metal Bat"
		if(I.type==/obj/weapons/Wooden_Bat)
			A.underlays+='woodbat.dmi'
			A.equipped=I
			A.equipname="Wooden Bat"
		if(I.type==/obj/weapons/Nailed_Bat)
			if(I.bloodweapon==1)
				A.underlays+='nailedwoodbat.dmi'
			else
				A.underlays+='bloodynailedbat.dmi'
			A.equipname="Nailed Bat"
			A.equipped=I
		if(I.type==/obj/weapons/:Ladel)
			A.underlays+='ladel.dmi'
			A.equipped=I
			A.equipname="Ladel"
		if(I.type==/obj/weapons/Alondite)
			if(I.bloodweapon==0)
				A.underlays+='alondite.dmi'
			else
				A.underlays+='bloodyalondite.dmi'
			A.equipped=I
			A.equipname="Alondite"
		if(I.type==/obj/weapons/Metal_Pipe)
			if(I.bloodweapon==0)
				A.underlays+='metalpipe.dmi'
			else
				A.underlays+='bloodypipe.dmi'
			A.equipped=I
			A.equipname="Metal Pipe"
		if(I.type==/obj/weapons/Hammer)
			if(I.bloodweapon==1)
				A.underlays+='bloodyhammer.dmi'
			else
				A.underlays+='hammer.dmi'
			A.equipped=I
			A.equipname="Hammer"
		if(I.type==/obj/weapons/NanatsuYoru)
			if(I.bloodweapon==1)
				A.underlays+='bloodyknife.dmi'
			else
				A.underlays+='knife.dmi'
			A.equipped=I
			A.equipname="Nanatsu-Yoru"
		if(I.type==/obj/weapons/Taser)
			A.underlays+='taser.dmi'
			A.equipped=I
			A.equipname="Taser"
		if(I.type==/obj/weapons/Bokken)
			A.underlays+='boken.dmi'
			A.equipped=I
			A.equipname="Bokken"
		if(I.type==/obj/weapons/Mop)
			A.overlays+='Mop.dmi'
			A.equipped=I
			A.equipname="Mop"
		if(I.type==/obj/weapons/Spear)
			A.overlays+='Spear.dmi'
			A.equipped=I
			A.equipname="Spear"
/*		if(I.type==/obj/weapons/Witches_Pipe) Tentatively deprecated. Shouldn't be needed.
			A.equipname="Witches' Pipe"
			A.equipped=I*/
/*		if(I.type==/obj/weapons/Blue_Paint)
			A.underlays+='bluepaintcan.dmi'
			A.equipped=I
			A.equipname="Painter"
		if(I.type==/obj/weapons/Red_Paint)
			A.underlays+='redpaintcan.dmi'
			A.equipped=I
			A.equipname="Painter"*/
		if(I.type==/obj/weapons/Green_Paint)
			var/obj/B=new/obj/paintcan
			B.icon+=rgb(I.pcolor1,I.pcolor2,I.pcolor3)
			A.underlays+=B
			A.equipped=I
			A.equipname="Painter"
		if(I.type==/obj/weapons/Custom_Weapon)
			I.icon_state="Equip"
			A.underlays+=I
			I.icon_state=""
			A.equipped=I
			A.equipname="Custom"
		if(I.type==/obj/weapons/Fists)
			A.equipped=I
			A.equipname="Fists"
			if(usr.teddy==1)
				usr.overlays+='teddy overlay.dmi'
			if(A.rabbit==1)
				usr.overlays+='rabbit overlay.dmi'
proc
	HotkeyEquip(var/mob/A,var/obj/weapons/O)
		if(usr.shinigami==1||usr.isGhost==1)return
		WeaponEquip(A,O)
obj/paintcan
	icon='greenpaintcan.dmi'
obj/var
	dmgtake=1
	stamtake=1
	lethal=0
	delaytake=20
	idesc=null
	msgtake="Whacks"
	disttake=1
	curamount=0
	bloodied=null
	pcolor1=20
	pcolor2=20
	pcolor3=20
	details=null
	butterflies=1
obj/weapons
	MouseDrag()
		if(src in usr)
			var/icon/I = new(src.icon,src.icon_state)
			mouse_drag_pointer = I

	MouseDrop(over_object=src,src_location,over_location, src_control,over_control,params)
		if(over_control == "ingame.Slot1")
			usr.slot1=null
			usr.slot1=src
			winset(usr,"ingame.Slot1","text=\"Press 1 for [src.name]\"")
		else if(over_control == "ingame.Slot2")
			usr.slot2=null
			usr.slot2=src
			winset(usr,"ingame.Slot2","text=\"Press 2 for [src.name]\"")
		else if(over_control == "ingame.Slot3")
			usr.slot3=src
			usr.slot3=src
			winset(usr,"ingame.Slot3","text=\"Press 3 for [src.name]\"")
		else if(over_control == "ingame.Slot4")
			usr.slot2=null
			usr.slot4=src
			winset(usr,"ingame.Slot4","text=\"Press 4 for [src.name]\"")
		else if(over_control == "ingame.Slot5")
			usr.slot2=null
			usr.slot5=src
			winset(usr,"ingame.Slot5","text=\"Press 5 for [src.name]\"")
	NanatsuYoru
		icon='inventoryweapons.dmi'
		icon_state="nanatsu"
		name="Nanatsu-Yoru"
		verb
			Equip()
				set category = null
				set src in usr.contents
				WeaponEquip(usr,src)
	Knife
		icon='inventoryweapons.dmi'
		icon_state="knife"
		msgtake="stabs"
		var/descp="A sharp knife, probably used for preparing food."
		bloodweapon=0
		dmgtake=8
		stamtake=6
		delaytake=10
		iweight=1
		lethal=1
		bloodied='bloodyknife.dmi'
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				if(src==usr.equipped)return
				Move(usr.loc,src)
			Equip()
				set category = null
				set src in usr.contents
				if(usr.isGhost==1)return
				WeaponEquip(usr,src)
	Seventh_Holy_Scripture
		icon='inventoryweapons.dmi'
		icon_state="seven"
		msgtake="stabs"
		var/descp="??????."
		bloodweapon=0
		dmgtake=8
		stamtake=6
		delaytake=10
		iweight=15
		lethal=1
		//bloodied='bloodyknife.dmi'
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				if(src==usr.equipped)return
				Move(usr.loc,src)
			Equip()
				set category = null
				set src in usr.contents
				if(usr.isGhost==1)return
				WeaponEquip(usr,src)
	Axe
		icon='inventoryweapons.dmi'
		icon_state="axe"
		msgtake="slashes"
		bloodied='bloodyaxe.dmi'
		bloodweapon=0
		iweight=10
		stamtake=16
		dmgtake=17
		delaytake=20
		lethal=1
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				if(src==usr.equipped)return
				Move(usr.loc,src)
			Equip()
				set category = null
				set src in usr.contents
				if(usr.isGhost==1)return
				WeaponEquip(usr,src)
	/*Witches_Pipe
		icon='witchespipe.dmi'
		msgtake="hits"
		iweight=1
		stamtake=5
		dmgtake=7
		verb
			Pick_Up()
				set src in oview(1)
				var/Y=CheckPlayer(usr)
				if(Y==1)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				if(usr.toggledflies==1)return
				if(src==usr.equipped)return
				//if(src==usr.equipped)return
				Move(usr.loc,src)
			Equip()
				set category = null
				set src in usr.contents
				if(usr.isGhost==1)return
				WeaponEquip(usr,src)*/
	Nailed_Bat
		icon='inventoryweapons.dmi'
		icon_state="nailed bat"
		msgtake="whacks"
		bloodied='bloodynailedbat.dmi'
		bloodweapon=0
		iweight=2
		stamtake=11
		dmgtake=13
		delaytake=15
		lethal=1
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				if(src==usr.equipped)return
				Move(usr.loc,src)
			Equip()
				set category = null
				set src in usr.contents
				if(usr.isGhost==1)return
				WeaponEquip(usr,src)
	Metal_Pipe
		icon='inventoryweapons.dmi'
		icon_state="pipe"
		msgtake="bashes"
		bloodied='bloodypipe.dmi'
		bloodweapon=0
		iweight=9
		dmgtake=10
		delaytake=15
		stamtake=10
		lethal=1
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				if(src==usr.equipped)return
				Move(usr.loc,src)
			Equip()
				set category = null
				set src in usr.contents
				if(usr.isGhost==1)return
				WeaponEquip(usr,src)
	Alondite
		icon='inventoryweapons.dmi'
		icon_state="alondite"
		msgtake="slashes"
		bloodied='bloodyalondite.dmi'
		bloodweapon=0
		lethal=1
		stamtake=16
		delaytake=25
		disttake=2
		dmgtake=17
		iweight=10
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				if(src==usr.equipped)return
				Move(usr.loc,src)
			Equip()
				set category = null
				set src in usr.contents
				if(usr.isGhost==1)return
				WeaponEquip(usr,src)
	Taser
		icon='inventoryweapons.dmi'
		icon_state="taser"
		msgtake="bashes"
		bloodied='taser.dmi'
		painter=1
		dmgtake=6
		stamtake=3
		lethal=3
		iweight=3
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				if(src==usr.equipped)return
				Move(usr.loc,src)
			Equip()
				set category = null
				set src in usr.contents
				if(usr.isGhost==1)return
				WeaponEquip(usr,src)
	Billhook
		icon='inventoryweapons.dmi'
		icon_state="billhook"
		msgtake="slashes"
		bloodweapon=0
		delaytake=15
		bloodied='bloodybillhook.dmi'
		iweight=7
		stamtake=10
		lethal=1
		dmgtake=12
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				if(src==usr.equipped)return
				Move(usr.loc,src)
			Equip()
				set category = null
				set src in usr.contents
				if(usr.isGhost==1)return
				WeaponEquip(usr,src)
	Custom_Weapon
		icon='inventoryweapons.dmi'
		icon_state=""
		bloodweapon=0
		lethal=1
		iweight=7
		dmgtake=1
		stamtake=2
		delaytake=25
		disttake=1
		msgtake="Whacks"
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				if(src==usr.equipped)return
				Move(usr.loc,src)
			Equip()
				set category = null
				set src in usr.contents
				if(usr.isGhost==1)return
				WeaponEquip(usr,src)
	Wooden_Bat
		icon='inventoryweapons.dmi'
		icon_state="bat"
		msgtake="bashes"
		bloodweapon=0
		iweight=2
		dmgtake=17
		stamtake=3
		details="A smooth wooden club used in the sport of baseball to hit the ball after it is thrown by the pitcher. It could also be used as a blunt weapon."
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				if(src==usr.equipped)return
				Move(usr.loc,src)
			Equip()
				set category = null
				set src in usr.contents
				if(usr.isGhost==1)return
				WeaponEquip(usr,src)
	Mop
		icon='inventoryweapons.dmi'
		icon_state="mop"
		msgtake="whacks"
		bloodweapon=0
		iweight=2
		dmgtake=8
		stamtake=2
		details="A mop, this doesn't seem like a very good defensive weapon, but hey, it's fun."
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				if(src==usr.equipped)return
				Move(usr.loc,src)
			Equip()
				set category = null
				set src in usr.contents
				if(usr.isGhost==1)return
				WeaponEquip(usr,src)
			/*Clean_Up_Blood()
				set category = null
				set src in usr.contents
				if(src!=usr.equipped)return
				for(var/obj/bloodspot/O in view(usr,2))
					usr << "You begin to mop up the mess"
					usr.frozen=1
					sleep(30)
					usr << "You cleaned up the blood."
					usr.frozen=0
					del(O)
					break*/
	Ladel
		icon='inventoryweapons.dmi'
		icon_state="ladel"
		msgtake="whacks"
		bloodweapon=0
		iweight=2
		dmgtake=12
		stamtake=9
		details="A long-handled spoon for deep bowls."
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				if(src==usr.equipped)return
				Move(usr.loc,src)
			Equip()
				set category = null
				set src in usr.contents
				if(usr.isGhost==1)return
				WeaponEquip(usr,src)
	Metal_Bat
		icon='inventoryweapons.dmi'
		icon_state="metal bat"
		msgtake="bashes"
		bloodied='bloodymetalbat.dmi'
		bloodweapon=0
		iweight=5
		dmgtake=11
		delaytake=15
		stamtake=9
		lethal=1
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				if(src==usr.equipped)return
				Move(usr.loc,src)
			Equip()
				set category = null
				set src in usr.contents
				if(usr.isGhost==1)return
				WeaponEquip(usr,src)
	Bokken
		icon='inventoryweapons.dmi'
		icon_state="boken"
		bloodweapon=0
		iweight=5
		dmgtake=12
		stamtake=9
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				if(src==usr.equipped)return
				Move(usr.loc,src)
			Equip()
				set category = null
				set src in usr.contents
				if(usr.isGhost==1)return
				WeaponEquip(usr,src)
/*	Blue_Paint
		icon='inventoryweapons.dmi'
		icon_state="blue paint"
		bloodweapon=0
		painter=8
		lethal=4
		iweight=1
		delaytake=15
		dmgtake=6
		stamtake=3
		paintcolor="Blue"
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				if(src==usr.equipped)return
				Move(usr.loc,src)
			Equip()
				set category = null
				set src in usr.contents
				if(usr.isGhost==1)return
				WeaponEquip(usr,src)
			Use()
				set category=null
				set src in usr
				if(usr.playing==0)return
				if(usr.isGhost==1)return
				if(src==usr.equipped)goto goodd
				else return
				:goodd
				if(painter==0)
					usr << "Seems it is out of paint.."
					return
				if(painter>0)
					usr.UsePaint(2,2,200)
					src.painter-=0.5
				if(src.painter<1)
					src.name="Empty Paint"
					usr << "<i>That seems to be the last of the paint..</i>"
	Red_Paint
		icon='inventoryweapons.dmi'
		icon_state="red paint"
		var/bloody=0
		painter=8
		iweight=1
		delaytake=15
		dmgtake=6
		stamtake=3
		lethal=4
		paintcolor="Red"
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				if(src==usr.equipped)return
				Move(usr.loc,src)
			Equip()
				set category = null
				set src in usr.contents
				if(usr.isGhost==1)return
				WeaponEquip(usr,src)
			Use()
				set category=null
				set src in usr.contents
				if(usr.playing==0)return
				if(usr.isGhost==1)return
				if(src==usr.equipped)goto goodd
				else return
				:goodd
				if(painter==0)
					usr << "Seems it is out of paint.."
					return
				if(painter>0)
					usr.UsePaint(200,2,2)
					src.painter-=0.5
				if(src.painter<1)
					src.name="Empty Paint"
					usr << "<i>That seems to be the last of the paint..</i>"*/
	Green_Paint
		icon='inventoryweapons.dmi'
		icon_state="green paint"
		name="Spray Paint"
		var/bloody=0
		painter=8
		lethal=4
		iweight=1
		dmgtake=6
		delaytake=15
		stamtake=3
		paintcolor="Green"
		pcolor1=200
		pcolor2=29
		pcolor3=12
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				if(src==usr.equipped)return
				if(usr.isGhost==1)return
				Move(usr.loc,src)
			Equip()
				set category = null
				set src in usr.contents
				WeaponEquip(usr,src)
			Use()
				set category=null
				set src in usr.contents
				if(usr.playing==0)return
				if(usr.isGhost==1)return
				if(src==usr.equipped)goto goodd
				else return
				:goodd
				if(painter==0)
					usr << "Seems it is out of paint.."
					src.lethal=0
					return
				if(painter>0)
					usr.UsePaint(pcolor1,pcolor2,pcolor3)
					src.painter-=0.5
				if(src.painter<1)
					src.name="Empty Paint"
					src.lethal=0
					usr << "<i>That seems to be the last of the paint..</i>"
	Hammer
		icon='inventoryweapons.dmi'
		icon_state="hammer"
		//equipstate='hammer.dmi'
		//bloody='bloodyhammer
		bloodweapon=0
		iweight=3
		dmgtake=9
		delaytake=14
		lethal=1
		bloodied='bloodyhammer.dmi'
		msgtake="bashes"
		stamtake=6
		iweight=5
		details="An ordinary work shop hammer, it could be used for multiple purposes."
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				if(src==usr.equipped)return
				Move(usr.loc,src)
			Equip()
				set category = null
				set src in usr.contents
				if(usr.isGhost==1)return
				WeaponEquip(usr,src)
	Spear
		icon='inventoryweapons.dmi'
		icon_state="spear"
		//equipstate='hammer.dmi'
		//bloody='bloodyhammer
		bloodweapon=0
		iweight=3
		dmgtake=16
		delaytake=24
		disttake=2
		lethal=1
		bloodied='spear.dmi'
		msgtake="pierces"
		stamtake=16
		iweight=5
		details="A Spear, a long, stabbing weapon for thrusting or throwing, consisting of a wooden mop, tape and a knife for a sharp-pointed head is attached."
		verb
			Pick_Up()
				set src in oview(1)
				if(usr.playing==0)return
				if(usr.shinigami==1)return
				Move(usr,src)
			Drop()
				set src in usr
				set category = null
				if(usr.playing==0)return
				if(src==usr.equipped)return
				Move(usr.loc,src)
			Equip()
				set category = null
				set src in usr.contents
				if(usr.isGhost==1)return
				WeaponEquip(usr,src)
	Fists
		icon='fist.dmi'
		var/bloody=0
		dmgtake=6
		stamtake=2
		delaytake=13
		msgtake="punches"
		details="Fists are blunt weapons which are gripped tightly and swung or jabbed at the enemy."
		verb
			Equip()
				set category = null
				set src in usr.contents
				WeaponEquip(usr,src)
	verb
		Examine()
			if(src.details)
				usr << src.details
	Click()
		if(!usr.looking==0)
			var/obj/O=usr.looking
			var/descp=src.idesc
			var/obj/I=src
			if(I.name=="Glasses Case")return
			if(I.name=="Nanatsu-Yoru")return
			if(src in O)
				if(I.name=="Fists")return
				var/mob/n=usr.looking
				if(I.suffix=="Equipped"&&n.playing==1)
					I.suffix=""
					for(var/obj/weapons/q in n)
						if(istype(q,/obj/weapons/Fists))
							WeaponEquip(n,q)
				var/pp2=CustAlert(usr,"[descp]",list("Take","Leave"),5,4,13,7)
				if(pp2=="Take")
					if(usr.looking==0)return
					src.suffix=""
					Move(usr,src)
					if(usr.bodysearch==1)
						CheckWeight(usr,src)
						var/mob/M=usr.looking
						CheckWeight2(M,src)
					if(usr.bodysearch==2)
						CheckWeight(usr,src)
						var/mob/M=usr.looking
						CheckWeight2(M,src)
					return
		if(src in usr.contents)
			if(usr.playing==0)return
			WeaponEquip(usr,src)
		if(src in oview(1))
			if(usr.playing==0)return
			if(usr.shinigami==1)return
			Move(usr,src)
			if(istype(src,/obj/weapons))
				WeaponEquip(usr,src)
obj/Boom_Box
	icon='radio.dmi'
	invisibility=90
	var/cooler=0
	verb/Play_Music(f as file)
		set src in oview(3)
		if(length(f)>135000)
			usr << "File is too large, keep it 135kbs and below."
			return
		if(cooler==1)
			usr << "Please wait a momment before trying this again."
			return
		cooler=1
		spawn(300)cooler=0
		for(var/mob/A in range(9,src))
			if(A.playing==0)
				A << sound(null)
				A << sound(f)
				A << "<font color=gray><i>[usr.key] plays [f] on the Boom Box"
	verb/Stop_Music()
		set src in oview(3)
		for(var/mob/A in range(9,src))
			if(A.playing==0)
				A << sound(null)
				A << "<font color=gray><i>[usr.key] turns off the Boom Box."
proc
	CheckWeight(var/mob/M, obj/O)
		var/obj/A="[O]"
		if(M.client)
			if(O=="Yen")
				for(var/obj/B in M)
					if(B.type==O.type)
						O.suffix="[O.curamount]"
						B.curamount+=O.curamount
						B.suffix="[B.curamount]"
						del O
						return
				O.suffix="[O.curamount]"
			else if(A=="Teddy Bear")
				M.overlays+='teddy overlay.dmi'
				M.teddy=1
			else if(A=="Bunny Doll")
				M.overlays+='rabbit overlay.dmi'
				M.rabbit=1
proc/
	CheckWeight2(var/mob/M, obj/O)
		if(M.client)


			if(istype(O,/obj/Placeables/Teddy_Bear))
				M.overlays-='teddy overlay.dmi'
				M.teddy=0
			if(istype(O,/obj/Placeables/Bunny_Doll))
				M.overlays-='rabbit overlay.dmi'
				M.rabbit=0
			if(istype(O,/obj/Misc/Death_Note))
				M.toucheddn=1
				M.see_invisible=50
mob
	Entered(obj/O)
		//if(usr.dead==1)return
		if(src.client||usr.client)
			//var/obj/A="[O]"
			if(istype(O,/obj/Misc/Yen))
				for(var/obj/B in usr)
					if(B.type==/obj/Misc/Yen&&O!=B)
						B.curamount+=O.curamount
						B.suffix="[B.curamount]"
						del O
						return
				O.suffix="[O.curamount]"
			if(istype(O,/obj/Placeables/Teddy_Bear))
				usr.overlays+='teddy overlay.dmi'
				usr.teddy=1
			if(istype(O,/obj/Placeables/Bunny_Doll))
				usr.overlays+='rabbit overlay.dmi'
				usr.rabbit=1
			if(istype(O,/obj/Misc/Death_Note))
				usr.toucheddn=1
				usr.see_invisible=50
	Exited(obj/O)
		//if(usr.dead==1)return
		if(src.client||usr.client)
			/*if(O==usr.slot1)
				winset(usr,"ingame.Slot1","text=\"Slot 1\"")
				usr.slot1=null
			if(O==usr.slot1)
				winset(usr,"ingame.Slot2","text=\"Slot 2\"")
				usr.slot2=null
			if(O==usr.slot3)
				winset(usr,"ingame.Slot3","text=\"Slot 3\"")
				usr.slot3=null
			if(O==usr.slot4)
				winset(usr,"ingame.Slot4","text=\"Slot 4\"")
				usr.slot4=null
			if(O==usr.slot5)
				winset(usr,"ingame.Slot5","text=\"Slot 5\"")
				usr.slot5=null*/
			//var/obj/A="[O]"
			if(istype(O,/obj/Placeables/Teddy_Bear))
				usr.overlays-='teddy overlay.dmi'
				usr.teddy=0
			if(istype(O,/obj/Placeables/Bunny_Doll))
				usr.overlays-='rabbit overlay.dmi'
				usr.rabbit=0
var
 taserweight=3
 hammerweight=3
var/axeweight=10
var/knifedmg=6
var/knifestam=2
var/axedmg=14
var/axestam=20
var/alonditedmg=14
var/alonditestam=20
var/pipedmg=9
var/pipestam=12
var/hammerdmg=8
var/hammerstam=5
var/billhookdmg=10
var/billhookstam=14
var/metalbatdmg=11
var/metalbatstam=10
var/woodenbatdmg=17
var/woodenbatstam=3
var/bokkendmg=12
var/bokkenstam=9
var/ladeldmg=8
var/ladelstam=4
obj
	Placeables
		Desk_again
			name="Desk"
			icon='placeables.dmi'
			icon_state="desk again dark"
			density=1
		Desk_again_white
			name="Desk"
			icon='placeables.dmi'
			icon_state="desk again"
			density=1
		Desk_end
			name="Desk"
			icon='placeables.dmi'
			icon_state="desk end"
		Bed_1
			name="Bed"
			icon='placeables.dmi'
			icon_state="bed 1"
		Bed_2
			name="Bed"
			icon='placeables.dmi'
			icon_state="bed2"
		Bench_3
			name="Bench"
			icon='placeables.dmi'
			icon_state="bench 3"
		Bench_4
			name="Bench"
			icon='placeables.dmi'
			icon_state="bench 4"
		Soda_Machine
			name="Soda Machine"
			icon='placeables.dmi'
			icon_state="drink machine"
			density=1
		Soda_Machine2
			name="Soda Machine"
			icon='placeables.dmi'
			icon_state="drink machine 2"
			density=1
		Soda_Machine3
			name="Soda Machine"
			icon='placeables.dmi'
			icon_state="drink machine 3"
			density=1
		Cafe_Table
			name="Table"
			icon='turfcafe.dmi'
			icon_state="table"
			density=1
		Cafe_Table2
			name="Table"
			icon='turfcafe.dmi'
			icon_state="table end"
		Cafe_Table3
			name="Table"
			icon='turfcafe.dmi'
			icon_state="table front end"
		Nurses_Top
			name="Nurses Closet"
			icon='placeables.dmi'
			icon_state="nurse closet overlay"
#define FILE_DIR icons

obj
	Table
		icon='table.dmi'
		density=1
	Table_left
		name="Table"
		icon='table.dmi'
		icon_state="2"
		density=1
	Table_middle
		name="Table"
		icon='table.dmi'
		icon_state="3"
		density=1
	TV1
		name="Television"
		icon='placeables.dmi'
		icon_state="tv1"
		density=1
	TV2
		name="Televison"
		icon='placeables.dmi'
		icon_state="tv2"
		density=1
	TV4
		name="Televison"
		icon='placeables.dmi'
		icon_state="tv3"
		density=1
		name="Televison"
		icon='placeables.dmi'
		icon_state="tv4"
		density=1
	Chair
		name="Chair"
		icon='placeables.dmi'
		icon_state="chair"
	Chair_right
		name="Chair"
		icon='placeables.dmi'
		icon_state="chair right"
	Notice_Board
		icon='placeables.dmi'
		icon_state="notice board"
	Phone
		icon='placeables.dmi'
		icon_state="phone"
	Calender
		icon='placeables.dmi'
		icon_state="calender"
	Privacy_Wall
		icon='school.dmi'
		icon_state="privacy wall 1"
		density=1
		opacity=0
	Privacy_Wall2
		icon='school.dmi'
		icon_state="privacy wall 2"
		density=1
		opacity=0
	Coat_Rack
		icon='placeables.dmi'
		icon_state="coat rack"
		density=1
	Coffee_Maker
		icon='placeables.dmi'
		icon_state="coffee maker"
	Copy_Machine
		icon='placeables.dmi'
		icon_state="copy machine"
		density=1
	Airconditioner
		icon='placeables.dmi'
		icon_state="air unit"
		layer=7
	Box_Top
		name="Boxes"
		icon='placeables.dmi'
		icon_state="boxtops"
		layer=7
	Box_Bottom
		name="Boxes"
		icon='placeables.dmi'
		icon_state="yellow boxes"
		layer=7
		density=1
	Table_1
		name="Table"
		icon='turflongue.dmi'
		icon_state="table 1"
		density=1
	Table_2
		name="Table"
		icon='turflongue.dmi'
		icon_state="table 2"
		density=1
	Table_Legs
		name="Table"
		icon='turflongue.dmi'
		icon_state="table legs"
		density=0
	Table_Legs2
		name="Table"
		icon='turflongue.dmi'
		icon_state="table legs 2"
	Tatami_panel1
		name="floor"
		icon='turftearoom.dmi'
		icon_state="panel 1"
	Tatami_panel2
		name="floor"
		icon='turftearoom.dmi'
		icon_state="panel 2"
turf/Tatami_Rooom
	Tatami_floor
		name="floor"
		icon='turftearoom.dmi'
		icon_state="tatami 1"
	Tatami_floor2
		name="floor"
		icon='turftearoom.dmi'
		icon_state="tatami 2"
	Tatami_wall_floor
		name=""
		icon='turftearoom.dmi'
		icon_state="regular wall floor"
	Tatami_wall
		name="Wall"
		icon='turftearoom.dmi'
		icon_state="regular wall"
	Tatami_wall_top
		name="floor"
		icon='turftearoom.dmi'
		icon_state="regular wall top"
	Tatami_wall_middle
		name="Wall"
		icon='turftearoom.dmi'
		icon_state="wall middle"
		density=1
	Tatami_wall_right
		name="Wall"
		icon='turftearoom.dmi'
		icon_state="wall right"
		density=1
	Tatami_wall_left
		name="Wall"
		icon='turftearoom.dmi'
		icon_state="wall left"
		density=1
	Tatami_wall_topright
		name="Wall"
		icon='turftearoom.dmi'
		icon_state="wall top right"
		density=1
	Tatami_wall_topleft
		name="Wall"
		icon='turftearoom.dmi'
		icon_state="wall left top"
		density=1
	Tatami_wall_middle2
		name="Wall"
		icon='turftearoom.dmi'
		icon_state="wall middle top"
		density=1
turf
	Vents
		icon='turfvents.dmi'
		Floor
			icon_state="floor"
		Drop_off
			name="Floor"
			icon_state="floor drop"
turf
	Floor_Turfs
		Purple
			icon='turfs.dmi'
			name="Floor"
			icon_state="purple floor"
obj
	Music_Room
		Piano
			Left
				name="Piano"
				icon='placeables.dmi'
				icon_state="piano 1"
				density=1
			Right
				name="Piano"
				icon='placeables.dmi'
				icon_state="piano 2"
				density=1
			Top_Left
				name="Piano"
				icon='placeables.dmi'
				icon_state="piano 3"
				density=1
			Top_Right
				name="Piano"
				icon='placeables.dmi'
				icon_state="piano 4"
				density=1
area/snoweffect
	icon='snow effect.dmi'
	layer=10
	mouse_opacity=0
area/raineffect
	icon='snow effect.dmi'
	icon_state="rain"
	layer=10
	mouse_opacity=0
area/fogeffect
	icon='snow effect.dmi'
	icon_state="fog"
	layer=10
	mouse_opacity=0
area/darkeffect
	icon='snow effect.dmi'
	icon_state="dark"
	layer=10
	mouse_opacity=0
area/clear
	icon='snow effect.dmi'
	icon_state="clear"
	layer=10
	mouse_opacity=0
obj
	Custom_Placeable
		icon='school.dmi'
		icon_state="custom"
obj
	Beatrice_Painting
		name="Painting"
		icon='beao.dmi'
obj/City
	icon='placeablescity.dmi'
	Traffic_Light_Top
		name="Traffic Light"
		layer=5
		icon_state="traffic light 1"
	Traffic_Light_Bottom
		name="Traffic Light"
		density=1
		icon_state="traffic light 2"
	Trash1
		icon_state="trash 1"
		name="Trash"
	Trash2
		icon_state="trash 2"
		name="Trash"
	Trash3
		icon_state="trash 3"
		name="Trash"
	Busted_Door
		icon_state="busted door"
		density=1
	Window
		icon_state="window 1"
		density=1
	Window2
		name="Window"
		density=1
		icon_state="window 2"
	TV
		icon_state="tv"
		density=1
	TV2
		name="TV"
		density=1
		icon_state="tv 2"
	Pay_Phone
		icon_state="pay phone"
		density=1
	Lamp
		icon_state="lamp"
		density=1
	Bed1
		name="Bed"
		icon_state="bed 1"
	Bed1_
		name="Bed"
		icon_state="bed 2"
	Chair
		name="Chair"
		icon_state="black chair"
	Chair2
		name="Chair"
		icon_state="yellow chair"
	Chair3
		name="Chair"
		icon_state="green chair"
	Plate
		icon_state="plate"
	Tub
		name="Tub"
		icon_state="bath 1"
	Tub2
		name="Tub"
		icon_state="bath 2"
	Couch
		name="Couch"
		icon_state="couch 1"
	Couch2
		name="Couch"
		icon_state="couch 2"
	Couch3
		name="Couch"
		icon_state="couch 3"
	Couch4
		name="Couch"
		icon_state="couch 4"
	Hydrant
		icon_state="hydrant"
turf
	Roof
		icon='RoofSet.dmi'
		Roof
			icon_state="1"
			name="Roof"
		Roof_
			icon_state="2"
			name="Roof"
		Roof__
			icon_state="3"
			name="Roof"
		Roof___
			icon_state="4"
			name="Roof"
		Roof____
			icon_state="5"
			name="Roof"
		Roof_____
			icon_state="6"
			name="Roof"
		Roof______
			icon_state="7"
			name="Roof"
		Roof_______
			icon_state="8"
			name="Roof"
		Roof________
			icon_state="9"
			name="Roof"
turf
	CityStuff
		icon='turfcity.dmi'
		Sidewalk
			name="Sidewalk"
			icon_state="sidewalk 1"
		Sidewalk2
			name="Sidewalk"
			icon_state="sidewalk 2"
		Sidewalk3
			name="Sidewalk"
			icon_state="sidewalk 3"
		Street
			name="Street"
			icon_state="street 1"
		Street2
			name="Street"
			icon_state="street 2"
		Street3
			name="Street"
			icon_state="street 3"
		Crossing
			name="Crossing"
			icon_state="crossing 1"
		Crossing2
			name="Crossing"
			icon_state="crossing 2"
		Grass
			name="Grass"
			icon_state="grass"
		Wood
			icon_state="wood"