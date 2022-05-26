# rake telegram:bot:set_webhook RAILS_ENV=production
# https://github.com/telegram-bot-rb/telegram-bot/wiki/Deployment
class TelegramWebhookController < Telegram::Bot::UpdatesController
  # Every update can have one of: message, inline_query, chosen_inline_result,
  # callback_query, etc.
  # Define method with same name to respond to this updates.
  def message(message)
    # message can be also accessed via instance method
    message == self.payload # true
    Rails.logger.info("--------message #{message}")
    # store_message(message['text'])
  end

  # This basic methods receives commonly used params:
  #
  #   message(payload)
  #   inline_query(query, offset)
  #   chosen_inline_result(result_id, query)
  #   callback_query(data)

  def start!(data = nil, *)
    Rails.logger.info("-----------start #{data}")
    # `reply_with` also sets `reply_to_message_id`:
    # reply_with :photo, photo: File.open('party.jpg')
  end

  def sn!(data = nil, *)
    Rails.logger.info("------------sn #{data}")
  end
end