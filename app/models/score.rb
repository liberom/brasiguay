class Score < ApplicationRecord
  belongs_to :scorable, polymorphic: true
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
end
