class User < ApplicationRecord
  has_many :messages, as: :author
end
