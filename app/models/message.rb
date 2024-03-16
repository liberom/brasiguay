class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
  has_rich_text :content

  # enum status: {
  #   unread: 0,
  #   read: 1
  # }
end
