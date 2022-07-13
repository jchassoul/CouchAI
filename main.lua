-- Unacceptable spamming zone

local discordia = require("discordia")
local client = discordia.Client()

client:on("ready", function()
	print("Logged in as " .. client.user.username)
end)

client:on("messageCreate", function(message)
	local author = message.guild:getMember(message.author.id)
	-- Confirm bot is actually able to ban users
	if not message.guild.me:hasPermission('banMembers') then
		message:reply('I am missing the `ban` permission')
		return
	end
	-- Confirm bot is able to ban the author 
	if #message.mentionedUsers >= 5 or message.mentionsEveryone then
		if message.guild.me.highestRole.position > author.highestRole.position then
			author:ban()
			message:delete()
			return
		end
	end
end)

client:run("Bot " .. os.getenv("DISCORD_TOKEN"))
