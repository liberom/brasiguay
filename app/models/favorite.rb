class Favorite < ApplicationRecord
  belongs_to :favorable, polymorphic: true
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
end
