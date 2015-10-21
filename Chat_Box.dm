
proc
	_ftext(text="",color,face)
		if(color||face)
			text="<font[color ? " color='[color]'" : ][face ? " face='[face]'" : ]>[text]</font>"
			//text="<font color=red>[text]</font>"
		return text

	_message(recipient,msg,color,face)
		if(!recipient)
			return // early escape
		if(istype(recipient,/mob))
			if(!recipient:client) // no client
				return // early escape
			_message(recipient:client,msg,color,face)
			return
		if(istype(recipient,/client))
			var/client/client = recipient
			if(!client._chatbox) // no chatbox
				return // early escape
			var/chatbox_msg/chatbox_msg = msg
			if(!istype(msg,/chatbox_msg))
				chatbox_msg = new/chatbox_msg(msg,color,face)
			client._chatbox._enter(chatbox_msg)
			client.chatlog_record(chatbox_msg.text)
			return
		if(istype(recipient,/list))
			if(!length(recipient)) // empty list
				return // early escape
			if(!istype(msg,/chatbox_msg))
				msg = new/chatbox_msg(msg,color,face)
			for(var/mob/mob in recipient)
				if(mob.client)
					_message(mob.client,msg)
			for(var/client/client in recipient)
				_message(client,msg)
			return
		if(istype(recipient,world))
			if(!istype(msg,/chatbox_msg))
				msg = new/chatbox_msg(msg,color,face)
			for(var/client/client)
				_message(client,msg)
			return
//

_defaults/chatbox
	parent_type = /atom/movable
	icon = null
	screen_loc = "1:16,1:16"
	maptext_height = 128
	maptext_width = 256
	layer = FLY_LAYER+1
	mouse_opacity = 0

	var
		maxlines = 8
		chatlines = 8

		font_family
		font_color
		font_size

		text_shadow

chatbox
	parent_type = /_defaults/chatbox

	var
	// dont touch
		chatbox_msgs/_msgs
		_pageup = 0
		_updates = 0
		_active = 0

	proc
		_clear()
			_msgs.Clear()
			_pageup = 0
			_update()

		_pagestart()
			_pageup = _msgs&&(_msgs.len-1)
			_update()
		_pageup()
			_pageup = min(_pageup+1,_msgs&&(_msgs.len-1))
			_update()

		_pagedown()
			_pageup = max(_pageup-1,0)
			_update()

		_pageend()
			_pageup = 0
			_update()

		_update()
			if(_active)
				_updates++
				return
			_active = 1
			spawn(-1)
				_updates=0
				do
					var/tag = "chatmsg[rand(1000)]"
					var/text = _getlog(tag)
					var/default = "<style>body {font-family: '[font_family]'; font-size: [font_size||"2"]; color: [font_color||"black"];}</style>"
					maptext = default + "<style>[tag] {color: inherit;}</style>" + text
					//_shadow.maptext = text_shadow ? default + "<style>[tag] {color: [text_shadow] ! important;}</style>" + text : null
					sleep(world.tick_lag)
				while(_got_updates())
				_active = 0

		_enter(chatbox_msg/msg)
			if(!msg)
				return
			if(!_msgs)
				_msgs = new(maxlines)
			_msgs.Add(msg)
			_update()

		_getlog(tag)
			if(!_msgs || !_msgs.len)
				return null
			var/fulltext
			var/lines = 0
			for(var/i = _msgs.len - _pageup , i>0 && lines<chatlines , i--)
				var/chatbox_msg/msg = _msgs.Get(i)
				fulltext = "\n<[tag]>[msg.text]</[tag]>[fulltext]"
				lines++
			return fulltext

		_got_updates()
			.=_updates
			_updates=0

	var/chatbox/shadow/_shadow

	New()
		_shadow = new

	shadow
		mouse_opacity = 0

		New()
			var/global
				original_screen_loc
				new_screen_loc

			if(original_screen_loc!=screen_loc)
				var
					separator = findtext(screen_loc,",")
					screen_x = copytext(screen_loc,1,separator)
					screen_y = copytext(screen_loc,separator+1)
					map
					screen_px
					screen_py
					i

				i = findtext(screen_x,":")
				if(i)
					map = copytext(screen_x,1,i)
					if(findtext(screen_x,":",i+1))
						screen_x = copytext(screen_x,i+1)
					else
						switch(uppertext(map))
							if("NORTH","SOUTH","EAST","WEST","CENTER")
								map = null
							else
								if( !_number(map) )
									screen_x = copytext(screen_x,i+1)
								else
									map = null

				i = findtext(screen_x,":")
				screen_px = ( i && text2num(copytext(screen_x,i+1,0)) ) + 1
				screen_x = copytext(screen_x,1,i)

				i = findtext(screen_y,":")
				screen_py = ( i && text2num(copytext(screen_y,i+1,0)) ) - 1
				screen_y = copytext(screen_y,1,i)

				original_screen_loc = screen_loc
				new_screen_loc = "[map?"[map]:" :][screen_x]:[screen_px],[screen_y]:[screen_py]"

			screen_loc = new_screen_loc


		proc
			_number(text)
				for(var/i in 1 to lentext(text))
					switch(text2ascii(text,i))
						if(48 to 57)
						else
							return FALSE
				return TRUE
//
_defaults/chatbox_gui
	parent_type = /atom/movable
	icon = null
	layer = FLY_LAYER


chatbox_gui
	parent_type = /_defaults/chatbox_gui

	Click()
		..()
		if(istype(usr,/mob))
			_onclick(usr:client)

	proc
		_onclick(client/client)

	background

	start
		_onclick(client/client)
			if(client&&client._chatbox)
				client._chatbox._pagestart()

	up
		_onclick(client/client)
			if(client&&client._chatbox)
				client._chatbox._pageup()

	down
		_onclick(client/client)
			if(client&&client._chatbox)
				client._chatbox._pagedown()

	end
		_onclick(client/client)
			if(client&&client._chatbox)
				client._chatbox._pageend()

//

chatbox_msg
	var
		text

	New(text="",color,face)
		src.text = _format(text,color,face)

	proc
		_format(text="",color,face)
			return "<font[color ? " color='[color]'" : ][face ? " face='[face]'" : ]>[_parse(text)]</font>"

		_parse(text)
			text = "[text]"||" "
			if(lentext(text)>1 && copytext(text,-2)=="\c")
				text = copytext(text,1,-2)
			return text

chatbox_msgs
	var
		len = 0
		start = 0
		list/list

	New(x)
		list = new( isnum(x) && x )

	proc
		Add(chatbox_msg/msg)
			if(list.len)
				var/pos = pos(start+len+1)
				list[pos] = msg
				if(len < list.len)
					len++
				else
					start = pos(start+1)

		Get(pos)
			return list[ pos(start+pos) ]

		Clear()
			for(var/i in 1 to list.len)
				list[i] = null
			len = 0

		pos(pos)
			return pos%list.len || list.len
//

client
	var/tmp/chatlog

	// don't touch
	var/tmp/chatbox/_chatbox

	proc
		chatbox_build()
			chatbox_remove()
			var/wide=mob.rpboxwidth
			_chatbox = new
			//screen += _chatbox._shadow
			//var/mob/A=client
			_chatbox.maptext_width=wide*28
			screen += _chatbox
			for(var/gui in typesof(/chatbox_gui))
				switch(gui)
					if(/chatbox_gui)
					else
						var/chatbox_gui/bkg=new/chatbox_gui/background
						bkg.screen_loc="2:16,1:16 to [wide]:15,4"

						var/chatbox_gui/s=new/chatbox_gui/start
						s.screen_loc="[wide]+1:16,5"
						var/chatbox_gui/u=new/chatbox_gui/up
						u.screen_loc="[wide]+1:16,4:16"
						var/chatbox_gui/d=new/chatbox_gui/down
						d.screen_loc="[wide]+1:16,2"
						var/chatbox_gui/e=new/chatbox_gui/end
						e.screen_loc="[wide]+1:16,1:16"
						screen+=bkg
						screen+=s
						screen+=u
						screen+=d
						screen+=e
						.//screen += new gui

		chatbox_remove()
			if(_chatbox)
				if(_chatbox._shadow)
					del _chatbox._shadow
				del _chatbox
			for(var/chatbox_gui/extra in screen)
				del extra

		chatbox_clear()
			if(_chatbox)
				_chatbox._clear()

		chatbox_show(setting=TRUE)
			if(_chatbox)
				_chatbox.invisibility = setting ? 0 : 101
				if(_chatbox._shadow)
					_chatbox._shadow.invisibility = setting ? 0 : 101
			for(var/chatbox_gui/extra in screen)
				extra.invisibility = setting ? 0 : 101

		chatlog_record(str)
			if(chatlog)
				src << output("[str]",chatlog)

		chatlog_clear()
			if(chatlog)
				src << output(null,chatlog)
/*mob
	var/tmp/chatbox/_chatbox
	proc
		chatbox_build()
			src.chatbox_remove()
			_chatbox = new
			screen += _chatbox._shadow
			var/mob/A=client
			src.screen += _chatbox
			var/wide=src.rpboxwidth
			for(var/gui in typesof(/chatbox_gui))
				switch(gui)
					if(/chatbox_gui)
					else
						var/chatbox_gui/bkg=new/chatbox_gui/background
						bkg.screen_loc="2:16,1:16 to [wide]:15,4"
						src.screen+=bkg
						.screen += new gui*/
chatbox
	screen_loc = "2:19,1:17"
	maptext_height = 128
	maptext_width = 250

	maxlines = 40
	chatlines = 9

	font_family = "Franklin Gothic Medium"
	font_color = "#FFFFFF"

	text_shadow = "#222d"
/*chatbox_mini
	icon = 'chatbox_gui.dmi'
	icon_state = "up"
	screen_loc = "2,2"*/
chatbox_gui
	icon = 'chatbox_gui.dmi'
	var/right=16
	background
		icon = 'chatbox_bg.dmi'
		//screen_loc = "1:16,1:16 to 8:15,4"
		screen_loc = "2:16,1:16 to 15:15,4"
		mouse_opacity = 0
		layer=MOB_LAYER+1

	start
		icon_state = "start"
		screen_loc = "16:16,5"
		layer=MOB_LAYER+1

	up
		icon_state = "up"
		screen_loc = "16:16,4:16"
		layer=MOB_LAYER+1

	down
		icon_state = "down"
		screen_loc = "16:16,2"
		layer=MOB_LAYER+1

	end
		icon_state = "end"
		screen_loc = "16:16,1:16"
		layer=MOB_LAYER+1


mob
	proc

	// chat examples

		chat_pm(mob/mob as mob, txt as text)
			if(istype(mob))
				_message(src, "\[to: [mob.name]\] [txt]", "#ffa000")
				_message(mob, "\[from: [name]\] [txt]", "#ffa000")

		chat_say(txt as text)
			_message(view(src,6), "[name]: [txt]")

		chat_world(txt as text)
			_message(world, "[name]: [txt]", rgb(50,250,100))

		chat_colored(txt as text,color as color)
			chat_say(_ftext(txt,color))

	// chatbox

		clear_chatbox()
			//set category = "chatbox"
			if(client)
				client.chatbox_clear()

		hide_chatbox()
			//set category = "chatbox"
			if(client)
				client.chatbox_show(0)

		show_chatbox()
			//set category = "chatbox"
			if(client)
				client.chatbox_show()
		new_chatbox()
			//set category = "chatbox"
			if(client)
				client.chatbox_build() // build the chatbox
				//client.chatlog = "outputwindow.output" // set chatlog
				//client.chatlog_record("\b\[ This is your chatlog ]") // enter a text into your chatlog
				//_message(world, "[name] has logged in.", "yellow") // notify world
proc/GenerateIcon(mob/M)
	var/icon/s=new(M.charhairavatar)
	if(M.charhairavatarcolor==null)goto nop
	s.Blend(M.charhairavatarcolor)
	:nop
	s.Scale(10, 10)
	return s