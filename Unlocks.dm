mob/verb/setroleoption()
	set hidden = 1
	//var/checkerz=winget(usr, "main", "roleset;is-checked")
	var/checkerz=winget(usr, "roleset", "is-checked")
	if(checkerz=="false")
		usr << "<font color=red>Special roles are now enabled for you."
		usr.norole=0
	else
		usr << "<font color=red>Special roles have been disabled for you."
		usr.norole=1
mob/verb/noselfclicker()
	set hidden = 1
	//var/checkerz=winget(usr, "main", "noclckerself;is-checked")
	var/checkerz=winget(usr, "noclickerself", "is-checked")
	if(checkerz=="false")
		usr << "<font color=red>Enabled self clicking, you can now harm yourself."
		usr.noclickself=0
	else
		usr << "<font color=red>Disabled self clicking, you can no longer harm yourself."
		usr.noclickself=1
	usr.save()

var/medkitweight=3
var/worldmsg=null
mob/verb/.Unlockedlist()
	set hidden = 1
	var/writer={"<html><title>Unlocked List</title><body><SIZE=100><STYLE>BODY{background-color: black; color:white}</STYLE><table cellpadding="0" cellspacing="0" border="0" align="center"><td><p>
	  <font color=red>Unlocked List<font color=white><BR><BR>
	Unlock 1:[usr.unlock1]<BR>
	Unlock 2:[usr.unlock2]<BR>
	Unlock 3:[usr.unlock3]<BR>
	Unlock 4:[usr.unlock4]<BR>
	Unlock 5:[usr.unlock5]<BR>
	Unlock 6:[usr.unlock6]<BR>
	Unlock 7:[usr.unlock7]<BR>
	Unlock 8:[usr.unlock8]<BR>
	<p></td></table></body></html>"}
	usr << browse(writer,"window=sotcdb;can_close=1;size=200x250")
proc/updateworld()
	if(autohost==0)
		world.status={"<font color=[hostedcolor]>[worldstatus]<b>Version:</b> [gversion]]<br>RP Mode: <b>[rpmode]</b><br><b>Game Map:</b> [mapp]<BR><b>Game Mode:</b> [gamemode]<BR><b>Players:</b> [playersjoined]/[maxplayers]"}
	else
		world.status={"<font color=[hostedcolor]>[worldstatus]<b>Version:</b> [gversion]]<br>RP Mode: <b>[rpmode]</b><br><b>Game Map:</b> [mapp]<BR><b>Auto Hosting:</b> Enabled<BR><b>Game Mode:</b> [gamemode]<BR><b>Players:</b> [playersjoined]/[maxplayers]"}