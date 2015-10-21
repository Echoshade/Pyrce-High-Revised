var/list/server_list=new/list()
var/lastmsgd=null
var/connectedtoworld=null
var/connectiontootherworld=0
world/OpenPort(t,tt,ttt)
    ..()
    world.Export("[lastmsgd]?action=regworld&address=[world.address]&port=[world.port]&msg=[t]")
world/Topic(T,Addr,Master,Key)
    ..()
    var/list/href_list = params2list(T)
    switch(href_list["action"])
        if("regworld")
            world << "<center><font color=white>.¤°¨°¤.¤.¤°¨°¤.</center>"
            world << "<center><font color=red>[href_list["msg"]]"
            world << "<center><font color=white>.¤°¨°¤.¤.¤°¨°¤.</center>"
            var/newaddress = href_list["address"]
            var/newport = href_list["port"]
            for(var/addy in server_list)
                if(addy == newaddress && server_list[addy] == newport)
                    return
            server_list += newaddress
            server_list[newaddress] = newport
        if("sdworld")
            world << "<center><font color=white>.¤°¨°¤.¤.¤°¨°¤.</center>"
            world << "<center><font color=red>This world is being closed."
            world << "<center><font color=white>.¤°¨°¤.¤.¤°¨°¤.</center>"
            world.Del()
        if("bhworld")
            for(var/mob/M in world)
                if(M.key==href_list["msg"])
                    BanList+=params2list("[M.client.computer_id]=[M.key]")
                    world << "<font color=red><font face=\"Segoe Print\">[M.key]([M]) has been banned from the game."
                    M.Del()
        if("chatterworld")
            if(connectiontootherworld==0)return
            var/namescolor = "white"
            var/chatscolor = "white"
            var/msgg=html_encode(href_list["msg"])
            if(href_list["chattype"]=="all")
                world << "<<b><font color=[namescolor]>[href_list["person"]]</b>> <font color=[chatscolor]>[msgg]"
            else
                for(var/mob/M in world)
                    if(M.playing==0)
                        M << "(Watcher)<<b><font color=[namescolor]>[href_list["person"]]</b>> <font color=[chatscolor]>[msgg]"
        if("gipworld")
            var/peepers=new/list()
            world << "sending info"
            for(var/mob/M in world)
                peepers+=params2list("[M.client.address]=[M.key]")
            world.Export("[href_list["address"]]:[href_list["port"]]?action=wipworld&address=[world.address]&port=[world.port]&person=[href_list["person"]]&peeps=[peepers]")
        if("connecttoworld")
            world << "<font color=red>The worlds have been connected."
            connectedtoworld="[href_list["address"]]:[href_list["port"]]"
            connectiontootherworld=1
        if("disconnecttoworld")
            connectiontootherworld=0
            connectedtoworld=null
            world << "<font color=red>The worlds connection has been terminated."