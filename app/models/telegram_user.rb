class TelegramUser < ApplicationRecord
  has_many :messages, as: :author
end
