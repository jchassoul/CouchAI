
-- can i use my libs?

local discordia = require("discordia")
local client = discordia.Client()

local sqlite3 = require('lsqlite3')

print(sqlite3.version())


client:on("ready", function() -- bot is ready
	print("Logged in as " .. client.user.username)
end)

client:on("messageCreate", function(message)

	local content = message.content

	if content == "!ping" then
		message:reply("Pong!")
	elseif content == "!pong" then
		message:reply("Ping!")
	end

end)

client:run("Bot " .. os.getenv("DISCORD_TOKEN"))
