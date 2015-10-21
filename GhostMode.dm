mob/var/isGhost=0
mob/Ghost/verb
	GhostSay(T as text)
		//if(usr.shinigami==0)return
		if(T=="")return
		var/len=length(T)
		if(len>500)
			T=copytext(T,1,500)
		T=html_encode(T)
		for(var/mob/A in range(8,usr))
			if(A.see_invisible>40)
			//	A << "\icon[usr.chatavatar][usr] says, \" [T] \""
		//	if(A.watching==1)
				if(A.rpchat==0||A.watching==1)
					A << "\icon[usr.chatavatar][usr] says, \" [T] \""
				_message(A, "<font color=[usr.charhaircolor]>[usr]<font color=[A.rpchatcolor]> says: [T]")
	GhostEmote(T as text)
		//if(usr.shinigami==0)return
		if(T=="")return
		var/len=length(T)
		if(len>500)
			T=copytext(T,1,500)
		T=html_encode(T)
		for(var/mob/A in range(8,usr))
			if(A.see_invisible>40)
				if(A.rpchat==0||A.watching==1)
					A << "\icon[usr.chatavatar]<i>[usr] [T]</i>"
				_message(A, "<i><font color=[usr.charhaircolor]>[usr]<font color=[A.rpchatcolor]> [T]</i>")
			//if(A.watching==1)
			//	A << "\icon[usr.chatavatar]<i>[usr] [T]</i>"