# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :orders
  has_many :telegram_user, through: :orders
end
