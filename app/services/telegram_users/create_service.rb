# frozen_string_literal: true

module TelegramUsers
  class CreateService < ::ApplicationService
    attr_accessor :chat

    def process
      @result = create_or_find_tg_user
    end

    private

    def create_or_find_tg_user
      ::TelegramUser.find_or_create_by(tg_chat_id: chat['id']) do |tg_user|
        tg_user.first_name = chat['first_name']
        tg_user.username = chat['username']
      end
    end
  end
end
