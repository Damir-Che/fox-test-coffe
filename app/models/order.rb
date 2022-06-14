# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :telegram_user
  belongs_to :product
end
