class TelegramMailer < ApplicationMailer

  def send_massage(text_massage)
    api_key = '5356889131:AAEY-Esd6c2u6kK8Z8iq_jTL0PehQ3BWI1w'
    chat_id = 1424694609
    response = HTTP.post("https://api.telegram.org/bot#{api_key}/sendMessage?chat_id=#{chat_id}&text=#{text_massage}")
  end
end
