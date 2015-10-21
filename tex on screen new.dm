obj/HUD/OnScreenText
	icon='hud.dmi'
	layer=91
	New(mob/M,var/SX,var/SY,var/IS)
		src.icon_state=IS
		screen_loc = "[SX],[SY]"
		M.client.screen+=src
	CharacterG
		icon='alphabet.dmi'
		var/ID=0
		New(var/newx,var/newxo,var/newy,var/newyo,var/letter)
			src.icon_state="[letter]"
			var/LowerOffset=0
			if(LowLetter(letter))	LowerOffset=2
			src.screen_loc="[newx]:[newxo+9],[newy]:[newyo+1-LowerOffset]"
	CustBG
		icon='ChatBG.dmi'
		layer=90
		New(var/xp,var/yp,var/IS)
			src.icon_state="[IS]"
			src.screen_loc="[xp+1],[yp+1]"
	ChatBG
		icon='ChatBG.png'
		layer=90
		New(var/xp,var/yp)
			if(!xp||!yp)	return
			src.icon_state="[xp-5],[yp-6]"
			src.screen_loc="[xp+1],[yp+1]"
	Next
		//NextBUTTON
		icon_state="Next"
		mouse_opacity=0
		New(mob/M)
			src.screen_loc="3,7"
			M.client.screen+=src
		Click()
			for(var/obj/HUD/OnScreenText/O in usr.client.screen)
				if(O.name=="CharacterW")	continue
				if(O!=src)	usr.client.screen-=O
			usr.Chatting=0
			usr.client.screen-=src
	BG

mob/proc/ShowBG()
	for(var/obj/HUD/OnScreenText/ChatBG/CBG in src.client.screen)	del CBG
	src.CustBG(5,6,13,14);return

mob/proc/CustBG(var/FromX,var/FromY,var/EndX,var/EndY)
	var/CurX=FromX;var/CurY=FromY
	while(CurX<=EndX)
		var/IS="MM"
		if(CurX==FromX)	IS="ML"
		if(CurX==EndX)	IS="MR"
		if(CurY==FromY)	IS="BM"
		if(CurY==EndY)	IS="TM"
		if(CurX==FromX && CurY==FromY)	IS="BL"
		if(CurX==FromX && CurY==EndY)	IS="TL"
		if(CurX==EndX && CurY==FromY)	IS="BR"
		if(CurX==EndX && CurY==EndY)	IS="TR"
		src.client.screen+=new/obj/HUD/OnScreenText/CustBG(CurX,CurY,IS)
		CurX+=1;if(CurX>EndX && CurY<EndY)	{CurX=FromX;CurY+=1}

mob/proc/ShowChoice(var/Choice,var/Slot)
	src.CustChoice(Choice,Slot,5,6);return
mob/proc/CustChoice(var/Choice,var/Slot,var/X,var/Y,var/EndX)
	X+=1;Y+=1
	var/obj/PO
	if(length(Choice)>6)
		PO=new/obj/HUD/OnScreenText/ChoiceSelectBG
		PO.pixel_x=(length(Choice)-5)*-6
	if(Slot==1)
		src.client.screen+=new/obj/HUD/OnScreenText/ChoiceSelect(X,16,Y,16,,Choice)
		src.client.screen+=new/obj/HUD/OnScreenText/ChoiceSelect(X+1,16,Y,16,"ChoiceBGR",Choice,PO)
		src.WriteLine(X,26,Y,28,"Choice","[Choice]",0)
	if(Slot==2)
		src.client.screen+=new/obj/HUD/OnScreenText/ChoiceSelect(X+3,16,Y,16,,Choice)
		src.client.screen+=new/obj/HUD/OnScreenText/ChoiceSelect(X+4,16,Y,16,"ChoiceBGR",Choice,PO)
		src.WriteLine(X+3,26,Y,28,"Choice","[Choice]",0)
	if(Slot==3)
		src.client.screen+=new/obj/HUD/OnScreenText/ChoiceSelect(min(X+6,EndX-1),16,Y,16,,Choice)
		src.client.screen+=new/obj/HUD/OnScreenText/ChoiceSelect(min(X+7,EndX),16,Y,16,"ChoiceBGR",Choice,PO)
		src.WriteLine(min(X+6,EndX-1),26,Y,28,"Choice","[Choice]",0)

proc/CustAlert(var/mob/M,var/text2show,var/list/Choices=list("OK"),var/StartX,var/StartY,var/EndX,var/EndY)
	if(!M || M.Chatting)	return
	M.Chatting=1
	M.Chosen=null
	M.CustBG(StartX,StartY,EndX,EndY)//puts up BG behind text
	WriteMessage(M,text2show,StartX,EndX,EndY)
	if(Choices.len==1)	M.CustChoice(Choices[1],2,StartX,StartY,EndX)
	if(Choices.len==2)	{M.CustChoice(Choices[1],1,StartX,StartY,EndX);M.CustChoice(Choices[2],3,StartX,StartY,EndX)}
	if(Choices.len==3)
		M.CustChoice(Choices[1],1,StartX,StartY,EndX)
		M.CustChoice(Choices[2],2,StartX,StartY,EndX);M.CustChoice(Choices[3],3,StartX,StartY,EndX)
	while(!M.Chosen)
		sleep(1);if(!M)	return
	return M.Chosen

proc/WriteMessage(mob/M,var/text2show,var/StartX,var/EndX,var/StartY)
	var/ThisView=EndX+1;StartX+=1	//Determines when word-wrap should kick in
	var/PixelSpace=7	//sets the spacing between each letter
	var/hudx=StartX	//The begining X in the message, used for resetting on next lines
	var/hudxo=-PixelSpace	//Preps the pixel_x for the loop
	var/hudy=StartY+1	//Begining y
	var/hudyo=12	//Begining pixel_y
	var/CurPos=0	//Which letter position its currently on in the message
	var/LastPos=0	//Goes back to the begining of the last word when wrapping
	var/WordCount=0	//Used to remove the pre-wrapped letters
	var/WordWrapProtection=0	//Automaticaly Breaks on Continual Text
	while(M)
		CurPos+=1;hudxo+=PixelSpace
		var/letter=copytext(text2show,CurPos,CurPos+1)
		if(!letter)	return
		if(letter==" ")	//skips to next word on spaces
			WordCount+=1;LastPos=CurPos;continue
		if(letter==">")	//force to next line
			WordCount+=1;hudx=ThisView;LastPos=CurPos+1
		if(hudx>=ThisView)	//word wrappage!
			hudyo-=12;hudx=StartX;hudxo=-PixelSpace
			if(hudyo==-96)	//only drop the actual y every 3 offsets
				hudy-=3;hudyo=0
			if(WordWrapProtection==WordCount)
				hudxo+=PixelSpace
				WordCount+=1;CurPos+=1
				WordWrapProtection=WordCount
			else
				for(var/obj/HUD/OnScreenText/CharacterG/C1 in M.client.screen)
					if(C1.ID==WordCount)	del C1
				CurPos=LastPos;WordWrapProtection=WordCount;continue
		if(hudxo>=32)	{hudx+=1;hudxo-=32}	//moves to next x and resets x offset
		var/obj/HUD/OnScreenText/CharacterG/C=new/obj/HUD/OnScreenText/CharacterG(hudx,hudxo,hudy,hudyo,letter)
		if(SlimLetter(letter))	hudxo-=4
		C.ID=WordCount;M.client.screen+=C

proc/LowLetter(var/L)
	if(L=="g"||L=="j"||L=="p"||L=="q"||L=="y"||L==",")	return 1
	else	return 0

proc/SlimLetter(var/L)
	if(L=="i"||L=="l"||L==","||L=="."||L=="'"||L=="!"||L==":")	return 1
	else	return 0

obj/HUD/OnScreenText
	ChoiceSelectBG/**/
		layer=91
		icon='HUD.dmi'
		icon_state="ChoiceBGM"
		New()
			return
	ChoiceSelect/**/
		layer=91
		icon='HUD.dmi'
		mouse_opacity=2
		var/Choice
		New(var/xp,xo,yp,yo,IS="ChoiceBGL",Choicey,var/obj/Underlay)
			src.Choice=Choicey
			src.icon_state="[IS]"
			src.screen_loc="[xp]:[xo],[yp]:[yo]"
			if(Underlay)
				src.underlays+=Underlay
				src.screen_loc="[xp]:[xo-Underlay.pixel_x],[yp]:[yo]"
		Click()
			usr.Chosen=src.Choice
			usr.WriteLine(6,16,7,16,"Choice","",1)
			for(var/obj/HUD/OnScreenText/O in usr.client.screen)
				if(O.name=="CharacterW")	continue
				usr.client.screen-=O
			usr.Chatting=0

proc/ShowAlert(var/mob/M,var/text2show,var/list/Choices=list("OK"))
	return(CustAlert(M,text2show,Choices,5,6,13,14))

proc/ShowText(var/mob/M,var/text2show)
	if(!M)	return
	if(M.Chatting)	return
	M.Chatting=1
	for(var/obj/HUD/OnScreenText/O in M.client.screen)
		if(O.name=="CharacterW")	continue
		del O
	M.WriteLine(6,16,7,16,"Choice","",1)
	M.ShowBG()	//puts up BG behind texty!
	WriteMessage(M,text2show,5,13,14)
	sleep(5);if(!M)	return
	new/obj/HUD/OnScreenText/Next(M)
	while(M.Chatting==1)
		sleep(1);if(!M)	return


obj/HUD/OnScreenText
	icon='hud.dmi'
	layer=91
	mouse_opacity=0
	CharacterW
		icon='alphabet.dmi'
		var/ID="None"
		New(var/hudx,var/hudxpix,var/hudy,var/hudypix,var/IS,var/newID)
			src.ID=newID
			src.icon_state=IS
			var/LowerOffset=0;if(LowLetter(IS))	LowerOffset=2
			src.screen_loc = "[hudx]:[hudxpix],[hudy]:[hudypix-LowerOffset]"
mob/proc/WriteLine(var/hudx,var/hudxpix,var/hudy,var/hudypix,var/ID="None",var/word,var/ClearScreen=1)
	if(!src.client)	return
	if(ClearScreen)
		for(var/obj/HUD/OnScreenText/CharacterW/C in src.client.screen)	if(C.ID==ID)	src.client.screen-=C
	if(!word)	return
	var/PixelSpace=7
	var/CurPos=0
	while(src)
		CurPos+=1
		var/letter=copytext(word,CurPos,CurPos+1)
		if(!letter)	return
		if(letter==" ")
			hudxpix+=PixelSpace;continue
		src.client.screen+=new/obj/HUD/OnScreenText/CharacterW(hudx,hudxpix,hudy,hudypix,letter,"[ID]")
		if(SlimLetter(letter))	hudxpix-=4
		hudxpix+=PixelSpace
		if(hudxpix>=32)
			hudx+=1;hudxpix-=32

obj/HUD/OnScreenText
	CharacterM
		icon='alphabet.dmi'
		New(var/hudx,var/hudxpix,var/hudy,var/hudypix,var/hudz=2,var/IS)
			src.icon_state=IS
			src.loc=locate(hudx,hudy,hudz)
			var/LowerOffset=0;if(LowLetter(IS))	LowerOffset=2
			src.pixel_x=hudxpix;src.pixel_y=hudypix-LowerOffset
proc/WriteMapLine(var/hudx,var/hudxpix,var/hudy,var/hudypix,var/hudz,var/word)
	var/PixelSpace=7
	var/CurPos=0
	while(1)
		CurPos+=1
		var/letter=copytext(word,CurPos,CurPos+1)
		if(letter==" ")	{hudxpix+=PixelSpace;continue}
		if(!letter)	return
		var/obj/HUD/OnScreenText/CharacterM/CM=new(hudx,hudxpix,hudy,hudypix,hudz,letter)
		CM.layer=OBJ_LAYER
		if(SlimLetter(letter))	hudxpix-=4
		hudxpix+=PixelSpace
		if(hudxpix>=32)
			hudx+=1;hudxpix-=32