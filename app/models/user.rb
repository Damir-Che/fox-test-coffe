# frozen_string_literal: true

class User < ApplicationRecord
  has_many :messages, as: :author
  has_many :orders
  has_many :products, through: :orders
end
