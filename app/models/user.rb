# frozen_string_literal: true

class User < ApplicationRecord
  has_many :messages, as: :author
end
