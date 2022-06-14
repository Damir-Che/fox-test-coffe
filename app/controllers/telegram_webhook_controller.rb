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
    Messages::CreateService.call(chat: chat, text: message['text'])

  end

  def keyboard!(value = nil, *)
    if value
      p '-----111'
      respond_with :message, text: "Damir - #{value}"
    else
      p '-----222'
      # save_context :keyboard!
      respond_with :message, text: 'Damir2', reply_markup: {
        keyboard: [['Damir3']],
        resize_keyboard: true,
        one_time_keyboard: true,
        selective: true,
      }
    end
  end

  def inline_keyboard!(*)
    respond_with :message, text: 'Han', reply_markup: {
      inline_keyboard: [
        [
          {text: 'But1', callback_data: 'alert'},
          {text: 'But2', callback_data: 'no_alert'},
        ],
        [{text: 'But3', url: 'https://fox-coffe.herokuapp.com/posts/coffee_store'}],
      ],
    }
  end

  def callback_query(data)
    if data == 'alert'
      answer_callback_query 'aaaaa', show_alert: true
    else
      answer_callback_query 'sssss'
    end
  end

  def inline_query(query, _offset)
    query = query.first(10) # it's just an example, don't use large queries.
    t_description = 'asd'
    t_content = 'asd'
    results = Array.new(5) do |i|
      {
        type: :article,
        title: "#{query}-#{i}",
        id: "#{query}-#{i}",
        description: "#{t_description} #{i}",
        input_message_content: {
          message_text: "#{t_content} #{i}",
        },
      }
    end
    answer_inline_query results
  end

  # This basic methods receives commonly used params:
  #
  #   message(payload)
  #   inline_query(query, offset)
  #   chosen_inline_result(result_id, query)
  #   callback_query(data)

  def start!(data = nil, *)
    Rails.logger.info("-----------start #{data}")
    TelegramUsers::CreateService.call(chat: chat)
    # `reply_with` also sets `reply_to_message_id`:
    # reply_with :photo, photo: File.open('party.jpg')
  end

  def sn!(data = nil, *)
    Rails.logger.info("------------sn #{data}")
  end
end