require 'rubygems'
require 'telegram/bot'

secret = JSON.load(File.read('config/token.rb'))

Telegram::Bot::Client.run(secret['Token']) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}!")
    when '/end'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}!")
    when '/id'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.id}!")
    when '/pwd'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{%x[pwd]}!")
    else
      bot.api.send_message(chat_id: message.chat.id, text: "I don't understand you :(")
    end
  end
end