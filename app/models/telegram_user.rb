class TelegramUser < ApplicationRecord
  has_many :messages, as: :author
  has_many :orders
  has_many :products, through: :orders
end
