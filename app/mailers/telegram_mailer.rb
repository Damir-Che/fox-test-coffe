class TelegramMailer < ApplicationMailer

  def send_massage(massage, tg_chat_id)
    Message.create!(body: massage, tg_chat_id: tg_chat_id, author: User.first)
    HTTP.post("https://api.telegram.org/bot#{ENV['TELEGRAM_BOT_TOKEN']}/sendMessage?chat_id=#{tg_chat_id}&text=#{massage}")
  end
end
