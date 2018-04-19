require 'rubygems'
require 'telegram/bot'

secret = JSON.load(File.read('config/token.rb'))

Telegram::Bot::Client.run(secret['Token']) do |bot|
	myip = %x[curl http://ip.42.pl/raw]
	msg = "Your server is rebooting.\nNew ip address is : " + myip + "\n"
	
	chat_id = 127839468
	bot.api.send_message(chat_id: chat_id, text: msg)
end