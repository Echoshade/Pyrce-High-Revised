
proc/browse_link(url,recipient,browse_options)
    recipient << browse(\
"<html><head></head><body onLoad=\"parent.location='[url]'\">\
</body></html>",browse_options)