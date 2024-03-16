class Feedback < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :scores, as: :scorable
  has_rich_text :content
end
