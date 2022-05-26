module Messages
  class CreateService < ::ApplicationService
    attr_accessor :chat, :text
    attr_writer :author

    def process
      @result = create_message
    end

    private

    def create_message
      ::Message.create(author: author, body: text, tg_chat_id: chat['id'])
    end

    def author
      @author ||= ::TelegramUsers::CreateService.call(chat: chat).result
    end
  end
end
