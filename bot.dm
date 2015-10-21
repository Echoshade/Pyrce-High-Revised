Pandorabot
	var
		name = "CBot"
		id = "da1557a04e345433"
		keyword = "Pandorabot"
		phpScript = null

	New(name as text, id as text, keyword as text, phpScript as text)
		src.name = name
		src.id = id
		src.keyword = keyword
		src.phpScript = phpScript
		return ..()

	proc
		getName()
			return src.name

		chat(personName as text,msg as text)
			personName = html_encode(personName)
			msg = html_encode(msg)
			var/personID = md5("[src.keyword][personName]")
			return getReply(personID,msg)

		getReply(id as text,msg as text)
			if(!phpScript) return "PHP Script URL missing"
			id = html_encode(id)
			msg = html_encode(msg)
			var/http[] = world.Export("[src.phpScript]?msg=[msg]&id=[id]&keyword=[src.keyword]")
			if(!http) return "Don't talk to me."
			var/F = http["CONTENT"]
			if(!F)return "I'm sorry, I don't know what you mean."
			return file2text(F)

var/Pandorabot/bot = new("LightBot","da1557a04e345433","Light Bot","http://pyrcehigh.site11.com/pandorabotConnector.php")

/*/mob
	verb
		say(msg as text)
			world << "[key]: [msg]"
			spawn() world << "[bot.name]: [bot.chat(src.key,msg)]"*/