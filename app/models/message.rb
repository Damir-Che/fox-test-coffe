class Message < ApplicationRecord
  belongs_to :author, polymorphic: true
end
