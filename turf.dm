turf
	Teleport_Doors
		Bottom_Door1
			name="Door"
			icon='school.dmi'
			icon_state="regular wall floor door"
		Middle_Door1
			name="Door"
			icon='school.dmi'
			icon_state="regular wall door"
		Top_Door1
			name="Door"
			icon='school.dmi'
			icon_state="regular wall top door"
		Bottom_Door2
			name="Door"
			icon='school.dmi'
			icon_state="regular wall floor door"
		Middle_Door2
			name="Door"
			icon='school.dmi'
			icon_state="regular wall door"
		Top_Door3
			name="Door"
			icon='school.dmi'
			icon_state="regular wall top door"

turf
  start
    icon = 'start.dmi'
  theaterfloor
    icon = 'theaterfloor.dmi'
    density = 0
  recarpet
    icon = 'redcarpet.dmi'
    density = 0
  tearoomwall
    icon = 'tearoomwall.dmi'
    density = 0
  tearoomwall2
    icon = 'tearoomwall2.dmi'
    density = 1
  janitorsfloor
    icon = 'janitorsfloor.dmi'
    density = 0
  grass
    icon = 'grass.dmi'
    density = 0
  stairs
    icon = 'stairs.dmi'
    density = 0
  wall2top
    icon = 'wall2top.dmi'
    density = 1
  wall3
    icon = 'wall3.dmi'
    density = 1
  wall3top
    icon = 'wall3top.dmi'
    density = 1
  wall3floor
    icon = 'wall3floor.dmi'
    density = 0
  fakewall
    icon = 'fakewall.dmi'
    density = 0
    opacity = 1
  stonepath3
    icon = 'stonepath.dmi'
    density = 0
obj
	Machines
		vending1
		icon = 'vending1.dmi'
		name="Soda Machine"
		density = 1
		verb
			Use_Machine()
				set category=null
				set src in oview(1)
				for(var/obj/Misc/Yen/O in usr)
					if(O.curamount<100)
						usr << "You don't have enough Yen, you need 100."
						return
					else
						var/obj/Misc/Soda/N=new
						usr.contents+=N
						usr << "The machine pops out the soda."
						if(O.curamount>100)
							O.curamount-=100
							O.suffix="[O.curamount]"
						else
							del O
						return
obj
  platform
    icon = 'platform.dmi'
    density = 0
  phone
    icon = 'phone.dmi'
    density = 0
  drawers2
    icon = 'drawers2.dmi'
    density = 1
  table3
    icon = 'table3.dmi'
    density = 1
  chairleft
    icon = 'chairleft.dmi'
    density = 0
  blueboxes
    icon = 'blueboxes.dmi'
    density = 1
  table
    icon = 'table.dmi'
    density = 1
  keylocker
    icon = 'keylocker.dmi'
    density = 0
  statue2
    icon = 'statue2.dmi'
    density = 1
  statue1
    icon = 'statue1.dmi'
    density = 1
  statue4
    icon = 'statue4.dmi'
    density = 0
  statue3
    icon = 'statue3.dmi'
    density = 0
  cushion
    icon = 'cushion.dmi'
    density = 0
  switches
    icon = 'switches.dmi'
    density = 0
  generator4
    icon = 'generator4.dmi'
    density = 1
  generator3
    icon = 'generator3.dmi'
    density = 1
  generator2
    icon = 'generator2.dmi'
    density = 1
  generator1
    icon = 'generator1.dmi'
    density = 1
  pipe6
    icon = 'pipe6.dmi'
    density = 1
  pipe5
    icon = 'pipe5.dmi'
    density = 1
  pipe4
    icon = 'pipe4.dmi'
    density = 1
  pipe3
    icon = 'pipe3.dmi'
    density = 1
  pipe2
    icon = 'pipe2.dmi'
    density = 1
  metalcrate
    icon = 'metalcrate.dmi'
    density = 1
  poster3
    icon = 'poster3.dmi'
    density = 0
  poster2
    icon = 'poster2.dmi'
    density = 0
  poster1
    icon = 'poster1.dmi'
    density = 0
  tower
    icon = 'tower.dmi'
    density = 1
  coffee
    icon = 'coffee.dmi'
    density = 0
  meatchute2
    icon = 'meatchute2.dmi'
    density = 1
  meatchute
    icon = 'meatchute.dmi'
    density = 0
  kitchen4
    icon = 'kitchen4.dmi'
    density = 1
  kitchen3
    icon = 'kitchen3.dmi'
    density = 1
  kitchen2
    icon = 'kitchen2.dmi'
    density = 1
  kitchen1
    icon = 'kitchen1.dmi'
    density = 1
  cafeteriatable4
    icon = 'cafeteriatable4.dmi'
    density = 0
  coatrack
    icon = 'coatrack.dmi'
    density = 0
  logo
    icon = 'logo.dmi'
    density = 0
  computer
    icon = 'PC.dmi'
    density = 0
  copier
    icon = 'photocopier.dmi'
    density = 1
  clothesrack
    icon = 'clothesrack.dmi'
    density = 1
  chair
    icon = 'chair.dmi'
    density = 0
  costumewardrobe
    icon = 'wardrobe.dmi'
    density = 1
  mirror
    icon = 'mirror.dmi'
    density = 1
  dresser
    icon = 'dresser.dmi'
    density = 1
  noticeboard
    icon = 'notice.dmi'
    density = 0
  railing
    icon = 'railing.dmi'
    density = 0
  curtaintwo
    icon = 'curtaintwo.dmi'
    density = 0
  curtainone
    icon = 'curtainone.dmi'
    density = 0
  pipe1
    icon = 'pipe.dmi'
    density = 1
  stagefront
    icon = 'stagefront.dmi'
    density = 1
  frontdesk1
    icon = 'frontdesk1.dmi'
    density = 1
  vending3
    icon = 'vending3.dmi'
    density = 1
  vending2
    icon = 'vending2.dmi'
    density = 1
  crate
    icon = 'crate.dmi'
    density = 1
  hoop
    icon = 'hoop.dmi'
    density = 0
  basketball
    icon = 'basketball.dmi'
    name="Lines"
    density = 0
    layer = TURF_LAYER
  grate
    icon = 'grate.dmi'
    density = 0
  shower1
    icon = 'shower1.dmi'
    density = 0
  shower
    icon = 'shower.dmi'
    density = 0
  drawers
    icon = 'drawers.dmi'
    density = 1
  desk
    icon = 'desk.dmi'
    density = 1
  tdesk
    icon = 'tdesk.dmi'
    density = 1
obj
  Clock
    icon = 'clock.dmi'
    icon_state="6"
    density=1

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
		Nineteen
			icon='fakebuttons.dmi'
			icon_state="options"
			invisibility=101
		Twenty
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

