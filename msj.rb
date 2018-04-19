require 'rubygems'
require 'telegram/bot'

token = '555210897:AAGW4L1TyDQYZfDpzzLoLC0ILvQhzmhx154'
chat = []
Telegram::Bot::Client.run(token) do |bot|
	myip = %x[curl http://ip.42.pl/raw]
	msg = 'Your server is rebooting.\nNew ip address is :' + myip + '\n'
	
	# chat_id = 127839460
	chat = ['163009424', '127839460']
	chat.each do |chat_id|
		bot.api.send_message(chat_id: chat_id.to_i, text: msg)
	end
end