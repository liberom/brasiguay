class Article < ApplicationRecord
  has_many :scores, as: :scorable
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
end
